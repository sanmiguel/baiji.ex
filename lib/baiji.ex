defmodule Baiji do
  @moduledoc """
  Baiji provides an interface for interacting with the AWS API. Baiji is 
  typically used by invoking a service function to generate an operation which 
  is then passed to Baiji.perform to make the request.

  ## Examples

    iex> Baiji.EC2.describe_instances
    ...> |> Baiji.perform
    {:ok, %{"reservationSet": ...}}
  """
  alias Baiji.{
    Operation,
    Config,
    Auth,
    Request,
    Response
  }

  @doc """
  Perform an operation
  """
  def perform(%Operation{} = operation, opts \\ []) do
    try do
      operation = %{operation | options: Keyword.merge(operation.options, opts)}

      operation
      |> Config.merge
      |> Operation.debug("Populating Authentication Parameters...")
      |> Auth.populate
      |> Operation.debug("Making Request...")
      |> Request.make
      |> Response.parse(operation)
    rescue
      e -> {:error, e}
    end
  end

  @doc """
  Perform an operation, raises an exception if the operation fails
  """
  def perform!(%Operation{} = operation, opts \\ []) do
    operation = %{operation | options: Keyword.merge(operation.options, opts)}
    
    operation
    |> Config.merge
    |> Operation.debug("Populating Authentication Parameters...")
    |> Auth.populate
    |> Operation.debug("Making Request...")
    |> Request.make
    |> Response.parse(operation)
  end
end
