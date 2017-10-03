defmodule Baiji.OpsWorksCM do
  @moduledoc """
  AWS OpsWorks for Chef Automate

  AWS OpsWorks for Chef Automate is a service that runs and manages
  configuration management servers.

  **Glossary of terms**

  <ul> <li> **Server**: A configuration management server that can be
  highly-available. The configuration manager runs on your instances by using
  various AWS services, such as Amazon Elastic Compute Cloud (EC2), and
  potentially Amazon Relational Database Service (RDS). A server is a generic
  abstraction over the configuration manager that you want to use, much like
  Amazon RDS. In AWS OpsWorks for Chef Automate, you do not start or stop
  servers. After you create servers, they continue to run until they are
  deleted.

  </li> <li> **Engine**: The specific configuration manager that you want to
  use (such as `Chef`) is the engine.

  </li> <li> **Backup**: This is an application-level backup of the data that
  the configuration manager stores. A backup creates a .tar.gz file that is
  stored in an Amazon Simple Storage Service (S3) bucket in your account. AWS
  OpsWorks for Chef Automate creates the S3 bucket when you launch the first
  instance. A backup maintains a snapshot of all of a server's important
  attributes at the time of the backup.

  </li> <li> **Events**: Events are always related to a server. Events are
  written during server creation, when health checks run, when backups are
  created, etc. When you delete a server, the server's events are also
  deleted.

  </li> <li> **AccountAttributes**: Every account has attributes that are
  assigned in the AWS OpsWorks for Chef Automate database. These attributes
  store information about configuration limits (servers, backups, etc.) and
  your customer account.

  </li> </ul> **Endpoints**

  AWS OpsWorks for Chef Automate supports the following endpoints, all HTTPS.
  You must connect to one of the following endpoints. Chef servers can only
  be accessed or managed within the endpoint in which they are created.

  <ul> <li> opsworks-cm.us-east-1.amazonaws.com

  </li> <li> opsworks-cm.us-west-2.amazonaws.com

  </li> <li> opsworks-cm.eu-west-1.amazonaws.com

  </li> </ul> **Throttling limits**

  All API operations allow for five requests per second with a burst of 10
  requests per second.
  """
  
  @doc """
  Associates a new node with the Chef server. This command is an alternative
  to `knife bootstrap`. For more information about how to disassociate a
  node, see `DisassociateNode`.

  A node can can only be associated with servers that are in a `HEALTHY`
  state. Otherwise, an `InvalidStateException` is thrown. A
  `ResourceNotFoundException` is thrown when the server does not exist. A
  `ValidationException` is raised when parameters of the request are not
  valid. The AssociateNode API call can be integrated into Auto Scaling
  configurations, AWS Cloudformation templates, or the user data of a
  server's instance.

  Example: `aws opsworks-cm associate-node --server-name *MyServer*
  --node-name *MyManagedNode* --engine-attributes
  "Name=*MyOrganization*,Value=default"
  "Name=*Chef_node_public_key*,Value=*Public_key_contents*"`
  """
  def associate_node(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:          "opsworkscm",
      endpoint:         "/",
      input:            input,
      options:          options,
      action:           "AssociateNode",
      
      target_prefix:    "OpsWorksCM_V2016_11_01",
      
      endpoint_prefix:  "opsworks-cm",
      type:             :json,
      version:          "2016-11-01",
      method:           :post
    }
  end
  
  @doc """
  Creates an application-level backup of a server. While the server is in the
  `BACKING_UP` state, the server cannot be changed, and no additional backup
  can be created.

  Backups can be created for servers in `RUNNING`, `HEALTHY`, and `UNHEALTHY`
  states. By default, you can create a maximum of 50 manual backups.

  This operation is asynchronous.

  A `LimitExceededException` is thrown when the maximum number of manual
  backups is reached. An `InvalidStateException` is thrown when the server is
  not in any of the following states: RUNNING, HEALTHY, or UNHEALTHY. A
  `ResourceNotFoundException` is thrown when the server is not found. A
  `ValidationException` is thrown when parameters of the request are not
  valid.
  """
  def create_backup(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:          "opsworkscm",
      endpoint:         "/",
      input:            input,
      options:          options,
      action:           "CreateBackup",
      
      target_prefix:    "OpsWorksCM_V2016_11_01",
      
      endpoint_prefix:  "opsworks-cm",
      type:             :json,
      version:          "2016-11-01",
      method:           :post
    }
  end
  
  @doc """
  Creates and immedately starts a new server. The server is ready to use when
  it is in the `HEALTHY` state. By default, you can create a maximum of 10
  servers.

  This operation is asynchronous.

  A `LimitExceededException` is thrown when you have created the maximum
  number of servers (10). A `ResourceAlreadyExistsException` is thrown when a
  server with the same name already exists in the account. A
  `ResourceNotFoundException` is thrown when you specify a backup ID that is
  not valid or is for a backup that does not exist. A `ValidationException`
  is thrown when parameters of the request are not valid.

  If you do not specify a security group by adding the `SecurityGroupIds`
  parameter, AWS OpsWorks creates a new security group. The default security
  group opens the Chef server to the world on TCP port 443. If a KeyName is
  present, AWS OpsWorks enables SSH access. SSH is also open to the world on
  TCP port 22.

  By default, the Chef Server is accessible from any IP address. We recommend
  that you update your security group rules to allow access from known IP
  addresses and address ranges only. To edit security group rules, open
  Security Groups in the navigation pane of the EC2 management console.
  """
  def create_server(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:          "opsworkscm",
      endpoint:         "/",
      input:            input,
      options:          options,
      action:           "CreateServer",
      
      target_prefix:    "OpsWorksCM_V2016_11_01",
      
      endpoint_prefix:  "opsworks-cm",
      type:             :json,
      version:          "2016-11-01",
      method:           :post
    }
  end
  
  @doc """
  Deletes a backup. You can delete both manual and automated backups. This
  operation is asynchronous.

  An `InvalidStateException` is thrown when a backup deletion is already in
  progress. A `ResourceNotFoundException` is thrown when the backup does not
  exist. A `ValidationException` is thrown when parameters of the request are
  not valid.
  """
  def delete_backup(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:          "opsworkscm",
      endpoint:         "/",
      input:            input,
      options:          options,
      action:           "DeleteBackup",
      
      target_prefix:    "OpsWorksCM_V2016_11_01",
      
      endpoint_prefix:  "opsworks-cm",
      type:             :json,
      version:          "2016-11-01",
      method:           :post
    }
  end
  
  @doc """
  Deletes the server and the underlying AWS CloudFormation stack (including
  the server's EC2 instance). When you run this command, the server state is
  updated to `DELETING`. After the server is deleted, it is no longer
  returned by `DescribeServer` requests. If the AWS CloudFormation stack
  cannot be deleted, the server cannot be deleted.

  This operation is asynchronous.

  An `InvalidStateException` is thrown when a server deletion is already in
  progress. A `ResourceNotFoundException` is thrown when the server does not
  exist. A `ValidationException` is raised when parameters of the request are
  not valid.
  """
  def delete_server(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:          "opsworkscm",
      endpoint:         "/",
      input:            input,
      options:          options,
      action:           "DeleteServer",
      
      target_prefix:    "OpsWorksCM_V2016_11_01",
      
      endpoint_prefix:  "opsworks-cm",
      type:             :json,
      version:          "2016-11-01",
      method:           :post
    }
  end
  
  @doc """
  Describes your account attributes, and creates requests to increase limits
  before they are reached or exceeded.

  This operation is synchronous.
  """
  def describe_account_attributes(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:          "opsworkscm",
      endpoint:         "/",
      input:            input,
      options:          options,
      action:           "DescribeAccountAttributes",
      
      target_prefix:    "OpsWorksCM_V2016_11_01",
      
      endpoint_prefix:  "opsworks-cm",
      type:             :json,
      version:          "2016-11-01",
      method:           :post
    }
  end
  
  @doc """
  Describes backups. The results are ordered by time, with newest backups
  first. If you do not specify a BackupId or ServerName, the command returns
  all backups.

  This operation is synchronous.

  A `ResourceNotFoundException` is thrown when the backup does not exist. A
  `ValidationException` is raised when parameters of the request are not
  valid.
  """
  def describe_backups(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:          "opsworkscm",
      endpoint:         "/",
      input:            input,
      options:          options,
      action:           "DescribeBackups",
      
      target_prefix:    "OpsWorksCM_V2016_11_01",
      
      endpoint_prefix:  "opsworks-cm",
      type:             :json,
      version:          "2016-11-01",
      method:           :post
    }
  end
  
  @doc """
  Describes events for a specified server. Results are ordered by time, with
  newest events first.

  This operation is synchronous.

  A `ResourceNotFoundException` is thrown when the server does not exist. A
  `ValidationException` is raised when parameters of the request are not
  valid.
  """
  def describe_events(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:          "opsworkscm",
      endpoint:         "/",
      input:            input,
      options:          options,
      action:           "DescribeEvents",
      
      target_prefix:    "OpsWorksCM_V2016_11_01",
      
      endpoint_prefix:  "opsworks-cm",
      type:             :json,
      version:          "2016-11-01",
      method:           :post
    }
  end
  
  @doc """
  Returns the current status of an existing association or disassociation
  request.

  A `ResourceNotFoundException` is thrown when no recent association or
  disassociation request with the specified token is found, or when the
  server does not exist. A `ValidationException` is raised when parameters of
  the request are not valid.
  """
  def describe_node_association_status(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:          "opsworkscm",
      endpoint:         "/",
      input:            input,
      options:          options,
      action:           "DescribeNodeAssociationStatus",
      
      target_prefix:    "OpsWorksCM_V2016_11_01",
      
      endpoint_prefix:  "opsworks-cm",
      type:             :json,
      version:          "2016-11-01",
      method:           :post
    }
  end
  
  @doc """
  Lists all configuration management servers that are identified with your
  account. Only the stored results from Amazon DynamoDB are returned. AWS
  OpsWorks for Chef Automate does not query other services.

  This operation is synchronous.

  A `ResourceNotFoundException` is thrown when the server does not exist. A
  `ValidationException` is raised when parameters of the request are not
  valid.
  """
  def describe_servers(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:          "opsworkscm",
      endpoint:         "/",
      input:            input,
      options:          options,
      action:           "DescribeServers",
      
      target_prefix:    "OpsWorksCM_V2016_11_01",
      
      endpoint_prefix:  "opsworks-cm",
      type:             :json,
      version:          "2016-11-01",
      method:           :post
    }
  end
  
  @doc """
  Disassociates a node from a Chef server, and removes the node from the Chef
  server's managed nodes. After a node is disassociated, the node key pair is
  no longer valid for accessing the Chef API. For more information about how
  to associate a node, see `AssociateNode`.

  A node can can only be disassociated from a server that is in a `HEALTHY`
  state. Otherwise, an `InvalidStateException` is thrown. A
  `ResourceNotFoundException` is thrown when the server does not exist. A
  `ValidationException` is raised when parameters of the request are not
  valid.
  """
  def disassociate_node(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:          "opsworkscm",
      endpoint:         "/",
      input:            input,
      options:          options,
      action:           "DisassociateNode",
      
      target_prefix:    "OpsWorksCM_V2016_11_01",
      
      endpoint_prefix:  "opsworks-cm",
      type:             :json,
      version:          "2016-11-01",
      method:           :post
    }
  end
  
  @doc """
  Restores a backup to a server that is in a `CONNECTION_LOST`, `HEALTHY`,
  `RUNNING`, `UNHEALTHY`, or `TERMINATED` state. When you run RestoreServer,
  the server's EC2 instance is deleted, and a new EC2 instance is configured.
  RestoreServer maintains the existing server endpoint, so configuration
  management of the server's client devices (nodes) should continue to work.

  This operation is asynchronous.

  An `InvalidStateException` is thrown when the server is not in a valid
  state. A `ResourceNotFoundException` is thrown when the server does not
  exist. A `ValidationException` is raised when parameters of the request are
  not valid.
  """
  def restore_server(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:          "opsworkscm",
      endpoint:         "/",
      input:            input,
      options:          options,
      action:           "RestoreServer",
      
      target_prefix:    "OpsWorksCM_V2016_11_01",
      
      endpoint_prefix:  "opsworks-cm",
      type:             :json,
      version:          "2016-11-01",
      method:           :post
    }
  end
  
  @doc """
  Manually starts server maintenance. This command can be useful if an
  earlier maintenance attempt failed, and the underlying cause of maintenance
  failure has been resolved. The server is in an `UNDER_MAINTENANCE` state
  while maintenance is in progress.

  Maintenance can only be started on servers in `HEALTHY` and `UNHEALTHY`
  states. Otherwise, an `InvalidStateException` is thrown. A
  `ResourceNotFoundException` is thrown when the server does not exist. A
  `ValidationException` is raised when parameters of the request are not
  valid.
  """
  def start_maintenance(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:          "opsworkscm",
      endpoint:         "/",
      input:            input,
      options:          options,
      action:           "StartMaintenance",
      
      target_prefix:    "OpsWorksCM_V2016_11_01",
      
      endpoint_prefix:  "opsworks-cm",
      type:             :json,
      version:          "2016-11-01",
      method:           :post
    }
  end
  
  @doc """
  Updates settings for a server.

  This operation is synchronous.
  """
  def update_server(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:          "opsworkscm",
      endpoint:         "/",
      input:            input,
      options:          options,
      action:           "UpdateServer",
      
      target_prefix:    "OpsWorksCM_V2016_11_01",
      
      endpoint_prefix:  "opsworks-cm",
      type:             :json,
      version:          "2016-11-01",
      method:           :post
    }
  end
  
  @doc """
  Updates engine-specific attributes on a specified server. The server enters
  the `MODIFYING` state when this operation is in progress. Only one update
  can occur at a time. You can use this command to reset the Chef server's
  private key (`CHEF_PIVOTAL_KEY`).

  This operation is asynchronous.

  This operation can only be called for servers in `HEALTHY` or `UNHEALTHY`
  states. Otherwise, an `InvalidStateException` is raised. A
  `ResourceNotFoundException` is thrown when the server does not exist. A
  `ValidationException` is raised when parameters of the request are not
  valid.
  """
  def update_server_engine_attributes(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:          "opsworkscm",
      endpoint:         "/",
      input:            input,
      options:          options,
      action:           "UpdateServerEngineAttributes",
      
      target_prefix:    "OpsWorksCM_V2016_11_01",
      
      endpoint_prefix:  "opsworks-cm",
      type:             :json,
      version:          "2016-11-01",
      method:           :post
    }
  end
  
end