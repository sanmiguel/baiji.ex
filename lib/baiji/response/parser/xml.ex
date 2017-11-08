defmodule Baiji.Response.Parser.XML do
  @moduledoc """
  Parses responses from APIs that return XML
  """
  require Record
  alias Baiji.{
    Endpoint,
    Operation
  }
  require Logger

  Record.defrecord :xmlElement, Record.extract(:xmlElement, from_lib: "xmerl/include/xmerl.hrl")
  Record.defrecord :xmlText,    Record.extract(:xmlText, from_lib: "xmerl/include/xmerl.hrl")

  def value(xmlText(value: value)) do
    value
    |> :erlang.list_to_binary
    |> String.trim
  end

  @doc """
  If the result we're trying to parse is contained in a wrapper element, descend through the element tree until
  we've found one with a matching name and return it
  """
  def descend_to_wrapper(element, nil), do: element
  def descend_to_wrapper(xmlElement(name: name, content: content) = element, wrapper) do
    if Atom.to_string(name) == wrapper do
      element
    end
    case descend_to_wrapper(content, wrapper) do
      nil     -> element
      result  -> result
    end
  end
  def descend_to_wrapper(xml, wrapper) when is_list(xml) do
    Enum.find(xml, fn element -> descend_to_wrapper(element, wrapper) != nil end)
  end
  def descend_to_wrapper(_, _) do
    nil
  end

  @doc """
  Parse the XML output of an API call and generate a response in the form of a map
  """
  def parse(response, %Operation{endpoint: %Endpoint{shapes: shapes}, output_shape: shape, output_wrapper: wrapper} = op) do
    Operation.debug(op, "Decoding Response with XML Parser: #{response}, wrapper: #{wrapper}")    
    {xml, _}        = :xmerl_scan.string(:erlang.binary_to_list(response), [space: :normalize])
    try do
      {:ok, parse(descend_to_wrapper(xml, wrapper), shape, shapes)}
    catch
      e -> {:error, "The response format could not be correctly parsed: #{inspect e}"}
    rescue
      e -> {:error, "The response format could not be correctly parsed: #{inspect e}"}
    end
  end
  def parse!(response, %Operation{endpoint: %Endpoint{shapes: shapes}, output_shape: shape, output_wrapper: wrapper} = op) do
    Operation.debug(op, "Decoding Response with XML Parser: #{response}, wrapper: #{wrapper}")    
    {xml, _}        = :xmerl_scan.string(:erlang.binary_to_list(response), [space: :normalize])
    parse(descend_to_wrapper(xml, wrapper), shape, shapes)
  end

  def parse(xml, shape_name, shapes) when is_binary(shape_name) do
    parse(xml, shapes[shape_name], shapes)  
  end
  
  def parse(xmlElement(content: content), "String", shapes),        do: parse(content, "String", shapes)
  def parse(xmlElement(content: content), "Boolean", shapes),       do: parse(content, "Boolean", shapes)
  def parse(xmlElement(content: content), "Integer", shapes),       do: parse(content, "Integer", shapes)
  def parse(xmlElement(name: :member, content: content), %{"type" => "string"} = shape, shapes) do
    parse(content, shape, shapes)
  end
  def parse(xmlElement(name: :member, content: content), %{"type" => "boolean"} = shape, shapes) do
    parse(content, shape, shapes)
  end 
  def parse(xmlElement(name: :member, content: content), %{"type" => "integer"} = shape, shapes) do
    parse(content, shape, shapes)
  end 
  def parse(xmlElement(name: :member, content: content), %{"type" => "timestamp"} = shape, shapes) do
    parse(content, shape, shapes)
  end
  
  def parse(xmlText() = text, %{"type" => "string"}, _shapes),      do: value(text)
  def parse(xmlText() = text, %{"type" => "boolean"}, _shapes),     do: value(text) |> String.to_existing_atom
  def parse(xmlText() = text, %{"type" => "integer"}, _shapes),     do: value(text) |> String.to_integer
  def parse(xmlText() = text, %{"type" => "long"}, _shapes),        do: value(text) |> String.to_integer
  def parse(xmlText() = text, %{"type" => "timestamp"}, _shapes),   do: value(text) |> NaiveDateTime.from_iso8601!
  def parse([xmlText() = text], %{"type" => "string"}, _shapes),    do: value(text)
  def parse([xmlText() = text], %{"type" => "boolean"}, _shapes),   do: value(text) |> String.to_existing_atom
  def parse([xmlText() = text], %{"type" => "integer"}, _shapes),   do: value(text) |> String.to_integer
  def parse([xmlText() = text], %{"type" => "long"}, _shapes),      do: value(text) |> String.to_integer
  def parse([xmlText() = text], %{"type" => "timestamp"}, _shapes), do: value(text) |> NaiveDateTime.from_iso8601!
  def parse([], %{"type" => "string"},    _shapes),                 do: nil
  def parse([], %{"type" => "boolean"},   _shapes),                 do: nil
  def parse([], %{"type" => "integer"},   _shapes),                 do: nil
  def parse([], %{"type" => "long"},   _shapes),                    do: nil
  def parse([], %{"type" => "timestamp"}, _shapes),                 do: nil
  def parse(nil, %{"type" => "string"},    _shapes),                do: nil
  def parse(nil, %{"type" => "boolean"},   _shapes),                do: nil
  def parse(nil, %{"type" => "integer"},   _shapes),                do: nil
  def parse(nil, %{"type" => "long"},   _shapes),                   do: nil
  def parse(nil, %{"type" => "timestamp"}, _shapes),                do: nil
  def parse(xmlElement(content: content), %{"type" => type} = shape, shapes) when type != "structure" and type != "list" do
    content
    |> trim
    |> Enum.at(0)
    |> parse(shape, shapes)
  end
  #  def parse(xmlElement(content: content1), %{"type" => "structure", "members" => [%{"type" => "list", "flattened" => true}=nested_shape]}, shapes) do
  #    # The direct children in content1 are actually of nested_shape
  #    content1
  #    |> parse(nested_shape, shapes)
  #  end
  def parse(xmlElement(content: content1), %{"type" => "structure", "members" => members}, shapes) do
    members
    |> Map.to_list # members1
    |> parse_structure(content1, shapes)
    # Now list of elements
    |> Enum.filter(fn {_, nil} -> false; _ -> true end)
    |> Map.new
  end
  def parse(xmlElement(content: content), %{"type" => "structure"} = shape, shapes) when is_list(content) do
    content
    |> trim
    |> Enum.at(0)
    |> parse(shape, shapes)
  end
  def parse(xmlElement(content: content), %{"type" => "list", "member" => %{"shape" => shape}}, shapes) do
    content
    |> Enum.filter(fn xmlText() -> false; _ -> true end)
    |> Enum.map(fn xmlElement() = elem -> parse(elem, shape, shapes) end)
  end

  def parse_structure(members, content, shapes) do
    # content = 
    members # [{"QueueUrls", %{"shape" => "QueueUrlList"}}]
    |> Enum.map(fn {name, %{"shape" => shape_name} = member} ->
      # name = "QueueUrls"
      # shape_name = "QueueUrlList"
      # -> shapes["QueueUrlList"] = %{"flattened" => true,
      #           "member" => %{"locationName" => "QueueUrl", "shape" => "String"},
      #           "type" => "list"}
      # If 'name' (or 'shape.locationName') points to a flattened list, 'location'
      # will not exist in content
      location = Map.get(member, "locationName", name)
      parse_from_location_in_content(content, location, shape_name, shapes)
    end)
  end

  # content = [ xmlElement(), xmlElement() ]
  # location = ^^ name of list of elements e.g. QueueUrls
  # shape_name = e.g. "QueueUrlList"
  def parse_from_location_in_content(content, location, shape_name, shapes) do
    shape = shapes[shape_name]
    # When shapes[shape]
    # Find in content (children of a node)
    case shape do
      %{ "type" => "list", "flattened" => true, "member" => member} ->
        # Elements in this content are actually of shape list_member_def
        # Do we need to return:
        # %{ "QueueUrlList" => [ %{ "QueueUrl" => "..." }, ... ] }
        # OR
        # [ %{ "QueueUrl" => " ... " }, ... ]
        {member_shape, member_location} = shape_and_location(member)
        list_elements = content 
                        |> Enum.filter(fn(xmlElement()) -> true; (_) -> false end) 
                        |> Enum.map(fn(c) -> parse(c, member_shape, shapes) end) 
        { location, list_elements }
      _ ->
        case Enum.find(content, fn(xmlElement(name: name)) -> Atom.to_string(name) == location; _ -> false end) do
          nil ->
            {location, nil}
          xmlElement() = c ->
            {location, parse(c, shape_name, shapes)}
        end
    end
  end

  defp shape_and_location(%{ "shape" => member_shape, "locationName" => member_location }) do
    {member_shape, member_location}
  end

  def trim(content) when is_list(content) do
    content
    |> Enum.filter(fn xmlText() = text -> String.length(value(text)) > 0; _ -> true end)
  end
end
