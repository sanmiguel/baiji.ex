defmodule Baiji.AsProfile do
  @moduledoc """
  Derives authentication profiles from local configuration, assumes the
  roles as appropriate and then performs a request
  """
  alias Baiji.Operation

  def perform(%Operation{} = op, profile \\ "default") do
    # Read credentials file
    # Parse profiles
    # Assume roles in profile stack
    # Use Baiji.perform
    assume_stack = fetch(profile)
    op
    |> assume_all(assume_stack)
    |> Baiji.perform
  end

  def assume_all(%Operation{} = op, roles) do
    Enum.reduce(roles, op, fn(r, op) ->
      assume_role(op, r)
    end)
  end

  defp assume_role(op, %{ "aws_access_key_id" => keyid, "aws_secret_access_key" => key }) do
    op
    |> Operation.assign(:access_key_id, keyid)
    |> Operation.assign(:secret_access_key, key)
  end
  defp assume_role(op, %{"RoleArn" => _}=input) do
    Baiji.Auth.assume_role(op, input)
  end

  def fetch(profile \\ "default") do
    # Read ini file
    home = System.get_env("HOME")
    path = home <> "/.aws/credentials"
    # File.exists?(path)
    {:ok, ini} = File.read(path)
    profiles = Ini.decode(ini)
    # Parse and enrich
    #  - Resolve any source_profile references
    #  - Store role_arn, account_id for assumption later
    extract_assume_stack(profile, profiles)
  end

  def extract_assume_stack(profile, profiles) do
    case Map.get(profiles, profile) do
      nil ->
        # TODO Conversation with Baiji maintainer about appropriate
        # control flow mechanism for this.
        exit({:unknown_profile, profile})
      %{ "mfa_serial" => _ } ->
        exit({:unsupported_profile, profile, :mfa_serial})
      %{ "source_profile" => source_profile } = p ->
        # %{ role_arn: role } = p
        # TODO: Optional p = %{ external_id: extid }
        role_deps = extract_assume_stack(source_profile, profiles)
        role_deps ++ [ camelize_input(p) ]
      %{ "aws_access_key_id" => _, "aws_secret_access_key" => _ } = profile_data ->
        [ profile_data ]
    end
  end

  defp camelize_input(%{}=input) do
    input
    |> Enum.reduce(%{}, fn({k, v}, map) -> Map.put(map, Macro.camelize(k), v) end)
  end
end
