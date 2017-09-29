defmodule Baiji.Organizations do
  @moduledoc """
  AWS Organizations API Reference

  AWS Organizations is a web service that enables you to consolidate your
  multiple AWS accounts into an *organization* and centrally manage your
  accounts and their resources.

  This guide provides descriptions of the Organizations API. For more
  information about using this service, see the [AWS Organizations User
  Guide](http://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html).

  **API Version**

  This version of the Organizations API Reference documents the Organizations
  API version 2016-11-28.

  <note> As an alternative to using the API directly, you can use one of the
  AWS SDKs, which consist of libraries and sample code for various
  programming languages and platforms (Java, Ruby, .NET, iOS, Android, and
  more). The SDKs provide a convenient way to create programmatic access to
  AWS Organizations. For example, the SDKs take care of cryptographically
  signing requests, managing errors, and retrying requests automatically. For
  more information about the AWS SDKs, including how to download and install
  them, see [Tools for Amazon Web Services](http://aws.amazon.com/tools/).

  </note> We recommend that you use the AWS SDKs to make programmatic API
  calls to Organizations. However, you also can use the Organizations Query
  API to make direct calls to the Organizations web service. To learn more
  about the Organizations Query API, see [Making Query
  Requests](http://docs.aws.amazon.com/organizations/latest/userguide/orgs_query-requests.html)
  in the *AWS Organizations User Guide*. Organizations supports GET and POST
  requests for all actions. That is, the API does not require you to use GET
  for some actions and POST for others. However, GET requests are subject to
  the limitation size of a URL. Therefore, for operations that require larger
  sizes, use a POST request.

  **Signing Requests**

  When you send HTTP requests to AWS, you must sign the requests so that AWS
  can identify who sent them. You sign requests with your AWS access key,
  which consists of an access key ID and a secret access key. We strongly
  recommend that you do not create an access key for your root account.
  Anyone who has the access key for your root account has unrestricted access
  to all the resources in your account. Instead, create an access key for an
  IAM user account that has administrative privileges. As another option, use
  AWS Security Token Service to generate temporary security credentials, and
  use those credentials to sign requests.

  To sign requests, we recommend that you use [Signature Version
  4](http://docs.aws.amazon.com/general/latest/gr/signature-version-4.html).
  If you have an existing application that uses Signature Version 2, you do
  not have to update it to use Signature Version 4. However, some operations
  now require Signature Version 4. The documentation for operations that
  require version 4 indicate this requirement.

  When you use the AWS Command Line Interface (AWS CLI) or one of the AWS
  SDKs to make requests to AWS, these tools automatically sign the requests
  for you with the access key that you specify when you configure the tools.

  In this release, each organization can have only one root. In a future
  release, a single organization will support multiple roots.

  **Support and Feedback for AWS Organizations**

  We welcome your feedback. Send your comments to
  [feedback-awsorganizations@amazon.com](mailto:feedback-awsorganizations@amazon.com)
  or post your feedback and questions in our private [AWS Organizations
  support forum](http://forums.aws.amazon.com/forum.jspa?forumID=219). If you
  don't have access to the forum, send a request for access to the email
  address, along with your forum user ID. For more information about the AWS
  support forums, see [Forums Help](http://forums.aws.amazon.com/help.jspa).

  **Endpoint to Call When Using the CLI or the AWS API**

  For the current release of Organizations, you must specify the `us-east-1`
  region for all AWS API and CLI calls. You can do this in the CLI by using
  these parameters and commands:

  <ul> <li> Use the following parameter with each command to specify both the
  endpoint and its region:

  `--endpoint-url https://organizations.us-east-1.amazonaws.com`

  </li> <li> Use the default endpoint, but configure your default region with
  this command:

  `aws configure set default.region us-east-1`

  </li> <li> Use the following parameter with each command to specify the
  endpoint:

  `--region us-east-1`

  </li> </ul> For the various SDKs used to call the APIs, see the
  documentation for the SDK of interest to learn how to direct the requests
  to a specific endpoint. For more information, see [Regions and
  Endpoints](http://docs.aws.amazon.com/general/latest/gr/rande.html#sts_region)
  in the *AWS General Reference*.

  **How examples are presented**

  The JSON returned by the AWS Organizations service as response to your
  requests is returned as a single long string without line breaks or
  formatting whitespace. Both line breaks and whitespace are included in the
  examples in this guide to improve readability. When example input
  parameters also would result in long strings that would extend beyond the
  screen, we insert line breaks to enhance readability. You should always
  submit the input as a single JSON text string.

  **Recording API Requests**

  AWS Organizations supports AWS CloudTrail, a service that records AWS API
  calls for your AWS account and delivers log files to an Amazon S3 bucket.
  By using information collected by AWS CloudTrail, you can determine which
  requests were successfully made to Organizations, who made the request,
  when it was made, and so on. For more about AWS Organizations and its
  support for AWS CloudTrail, see [Logging AWS Organizations Events with AWS
  CloudTrail](http://docs.aws.amazon.com/organizations/latest/userguide/orgs_cloudtrail-integration.html)
  in the *AWS Organizations User Guide*. To learn more about CloudTrail,
  including how to turn it on and find your log files, see the [AWS
  CloudTrail User
  Guide](http://docs.aws.amazon.com/awscloudtrail/latest/userguide/what_is_cloud_trail_top_level.html).
  """
  
  @doc """
  Retrieves Organizations-related information about the specified account.

  This operation can be called only from the organization's master account.
  """
  def describe_account(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "DescribeAccount",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Creates an AWS organization. The account whose user is calling the
  CreateOrganization operation automatically becomes the [master
  account](http://docs.aws.amazon.com/IAM/latest/UserGuide/orgs_getting-started_concepts.html#account)
  of the new organization.

  This operation must be called using credentials from the account that is to
  become the new organization's master account. The principal must also have
  the relevant IAM permissions.

  By default (or if you set the `FeatureSet` parameter to `ALL`), the new
  organization is created with all features enabled and service control
  policies automatically enabled in the root. If you instead choose to create
  the organization supporting only the consolidated billing features by
  setting the `FeatureSet` parameter to `CONSOLIDATED_BILLING"`, then no
  policy types are enabled by default and you cannot use organization
  policies.
  """
  def create_organization(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "CreateOrganization",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Disables an organizational control policy type in a root. A policy of a
  certain type can be attached to entities in a root only if that type is
  enabled in the root. After you perform this operation, you no longer can
  attach policies of the specified type to that root or to any OU or account
  in that root. You can undo this by using the `EnablePolicyType` operation.

  This operation can be called only from the organization's master account.
  """
  def disable_policy_type(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "DisablePolicyType",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Lists the current handshakes that are associated with the account of the
  requesting user.

  Handshakes that are ACCEPTED, DECLINED, or CANCELED appear in the results
  of this API for only 30 days after changing to that state. After that they
  are deleted and no longer accessible.

  This operation can be called from any account in the organization.
  """
  def list_handshakes_for_account(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "ListHandshakesForAccount",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Retrieves the list of all policies in an organization of a specified type.

  This operation can be called only from the organization's master account.
  """
  def list_policies(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "ListPolicies",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Enables all features in an organization. This enables the use of
  organization policies that can restrict the services and actions that can
  be called in each account. Until you enable all features, you have access
  only to consolidated billing, and you can't use any of the advanced account
  administration features that AWS Organizations supports. For more
  information, see [Enabling All Features in Your
  Organization](http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html)
  in the *AWS Organizations User Guide*.

  <important> This operation is required only for organizations that were
  created explicitly with only the consolidated billing features enabled, or
  that were migrated from a Consolidated Billing account family to
  Organizations. Calling this operation sends a handshake to every invited
  account in the organization. The feature set change can be finalized and
  the additional features enabled only after all administrators in the
  invited accounts approve the change by accepting the handshake.

  </important> After all invited member accounts accept the handshake, you
  finalize the feature set change by accepting the handshake that contains
  `"Action": "ENABLE_ALL_FEATURES"`. This completes the change.

  After you enable all features in your organization, the master account in
  the organization can apply policies on all member accounts. These policies
  can restrict what users and even administrators in those accounts can do.
  The master account can apply policies that prevent accounts from leaving
  the organization. Ensure that your account administrators are aware of
  this.

  This operation can be called only from the organization's master account.
  """
  def enable_all_features(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "EnableAllFeatures",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Lists the organizational units (OUs) in a parent organizational unit or
  root.

  This operation can be called only from the organization's master account.
  """
  def list_organizational_units_for_parent(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "ListOrganizationalUnitsForParent",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Deletes an organizational unit from a root or another OU. You must first
  remove all accounts and child OUs from the OU that you want to delete.

  This operation can be called only from the organization's master account.
  """
  def delete_organizational_unit(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "DeleteOrganizationalUnit",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Lists the handshakes that are associated with the organization that the
  requesting user is part of. The `ListHandshakesForOrganization` operation
  returns a list of handshake structures. Each structure contains details and
  status about a handshake.

  Handshakes that are ACCEPTED, DECLINED, or CANCELED appear in the results
  of this API for only 30 days after changing to that state. After that they
  are deleted and no longer accessible.

  This operation can be called only from the organization's master account.
  """
  def list_handshakes_for_organization(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "ListHandshakesForOrganization",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Sends an invitation to another account to join your organization as a
  member account. Organizations sends email on your behalf to the email
  address that is associated with the other account's owner. The invitation
  is implemented as a `Handshake` whose details are in the response.

  <important> You can invite AWS accounts only from the same seller as the
  master account. For example, if your organization's master account was
  created by Amazon Internet Services Pvt. Ltd (AISPL), an AWS seller in
  India, then you can only invite other AISPL accounts to your organization.
  You can't combine accounts from AISPL and AWS, or any other AWS seller. For
  more information, see [Consolidated Billing in
  India](http://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/useconsolidatedbilliing-India.html).

  </important> This operation can be called only from the organization's
  master account.

  <important> If you get an exception that indicates that you exceeded your
  account limits for the organization or that you can"t add an account
  because your organization is still initializing, please contact [ AWS
  Customer Support](https://console.aws.amazon.com/support/home#/).

  </important>
  """
  def invite_account_to_organization(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "InviteAccountToOrganization",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Enables a policy type in a root. After you enable a policy type in a root,
  you can attach policies of that type to the root, any OU, or account in
  that root. You can undo this by using the `DisablePolicyType` operation.

  This operation can be called only from the organization's master account.
  """
  def enable_policy_type(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "EnablePolicyType",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Sends a response to the originator of a handshake agreeing to the action
  proposed by the handshake request.

  This operation can be called only by the following principals when they
  also have the relevant IAM permissions:

  <ul> <li> **Invitation to join** or **Approve all features request**
  handshakes: only a principal from the member account.

  </li> <li> **Enable all features final confirmation** handshake: only a
  principal from the master account.

  For more information about invitations, see [Inviting an AWS Account to
  Join Your
  Organization](http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_invites.html)
  in the *AWS Organizations User Guide*. For more information about requests
  to enable all features in the organization, see [Enabling All Features in
  Your
  Organization](http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html)
  in the *AWS Organizations User Guide*.

  </li> </ul> After you accept a handshake, it continues to appear in the
  results of relevant APIs for only 30 days. After that it is deleted.
  """
  def accept_handshake(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "AcceptHandshake",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Removes a member account from its parent organization. This version of the
  operation is performed by the account that wants to leave. To remove a
  member account as a user in the master account, use
  `RemoveAccountFromOrganization` instead.

  This operation can be called only from a member account in the
  organization.

  <important> <ul> <li> The master account in an organization with all
  features enabled can set service control policies (SCPs) that can restrict
  what administrators of member accounts can do, including preventing them
  from successfully calling `LeaveOrganization` and leaving the organization.

  </li> <li> You can leave an organization as a member account only if the
  account is configured with the information required to operate as a
  standalone account. When you create an account in an organization using the
  AWS Organizations console, API, or CLI commands, the information required
  of standalone accounts is *not* automatically collected. For each account
  that you want to make standalone, you must accept the End User License
  Agreement (EULA), choose a support plan, provide and verify the required
  contact information, and provide a current payment method. AWS uses the
  payment method to charge for any billable (not free tier) AWS activity that
  occurs while the account is not attached to an organization. Follow the
  steps at [ To leave an organization when all required account information
  has not yet been
  provided](http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_remove.html#leave-without-all-info)
  in the *AWS Organizations User Guide*.

  </li> <li> You can leave an organization only after you enable IAM user
  access to billing in your account. For more information, see [Activating
  Access to the Billing and Cost Management
  Console](http://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/grantaccess.html#ControllingAccessWebsite-Activate)
  in the *AWS Billing and Cost Management User Guide*.

  </li> </ul> </important>
  """
  def leave_organization(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "LeaveOrganization",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Declines a handshake request. This sets the handshake state to `DECLINED`
  and effectively deactivates the request.

  This operation can be called only from the account that received the
  handshake. The originator of the handshake can use `CancelHandshake`
  instead. The originator can't reactivate a declined request, but can
  re-initiate the process with a new handshake request.

  After you decline a handshake, it continues to appear in the results of
  relevant APIs for only 30 days. After that it is deleted.
  """
  def decline_handshake(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "DeclineHandshake",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Renames the specified organizational unit (OU). The ID and ARN do not
  change. The child OUs and accounts remain in place, and any attached
  policies of the OU remain attached.

  This operation can be called only from the organization's master account.
  """
  def update_organizational_unit(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "UpdateOrganizationalUnit",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Lists all of the OUs or accounts that are contained in the specified parent
  OU or root. This operation, along with `ListParents` enables you to
  traverse the tree structure that makes up this root.
  """
  def list_children(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "ListChildren",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Retrieves information about an organizational unit (OU).

  This operation can be called only from the organization's master account.
  """
  def describe_organizational_unit(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "DescribeOrganizationalUnit",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Cancels a handshake. Canceling a handshake sets the handshake state to
  `CANCELED`.

  This operation can be called only from the account that originated the
  handshake. The recipient of the handshake can't cancel it, but can use
  `DeclineHandshake` instead. After a handshake is canceled, the recipient
  can no longer respond to that handshake.

  After you cancel a handshake, it continues to appear in the results of
  relevant APIs for only 30 days. After that it is deleted.
  """
  def cancel_handshake(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "CancelHandshake",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Retrieves information about a policy.

  This operation can be called only from the organization's master account.
  """
  def describe_policy(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "DescribePolicy",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Lists the policies that are directly attached to the specified target root,
  organizational unit (OU), or account. You must specify the policy type that
  you want included in the returned list.

  This operation can be called only from the organization's master account.
  """
  def list_policies_for_target(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "ListPoliciesForTarget",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Retrieves the current status of an asynchronous request to create an
  account.

  This operation can be called only from the organization's master account.
  """
  def describe_create_account_status(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "DescribeCreateAccountStatus",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Lists the account creation requests that match the specified status that is
  currently being tracked for the organization.

  This operation can be called only from the organization's master account.
  """
  def list_create_account_status(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "ListCreateAccountStatus",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Creates a policy of a specified type that you can attach to a root, an
  organizational unit (OU), or an individual AWS account.

  For more information about policies and their use, see [Managing
  Organization
  Policies](http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies.html).

  This operation can be called only from the organization's master account.
  """
  def create_policy(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "CreatePolicy",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Creates an organizational unit (OU) within a root or parent OU. An OU is a
  container for accounts that enables you to organize your accounts to apply
  policies according to your business requirements. The number of levels deep
  that you can nest OUs is dependent upon the policy types enabled for that
  root. For service control policies, the limit is five.

  For more information about OUs, see [Managing Organizational
  Units](http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_ous.html)
  in the *AWS Organizations User Guide*.

  This operation can be called only from the organization's master account.
  """
  def create_organizational_unit(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "CreateOrganizationalUnit",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Detaches a policy from a target root, organizational unit, or account. If
  the policy being detached is a service control policy (SCP), the changes to
  permissions for IAM users and roles in affected accounts are immediate.

  **Note:** Every root, OU, and account must have at least one SCP attached.
  If you want to replace the default `FullAWSAccess` policy with one that
  limits the permissions that can be delegated, then you must attach the
  replacement policy before you can remove the default one. This is the
  authorization strategy of
  [whitelisting](http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_about-scps.html#orgs_policies_whitelist).
  If you instead attach a second SCP and leave the `FullAWSAccess` SCP still
  attached, and specify `"Effect": "Deny"` in the second SCP to override the
  `"Effect": "Allow"` in the `FullAWSAccess` policy (or any other attached
  SCP), then you are using the authorization strategy of
  [blacklisting](http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_about-scps.html#orgs_policies_blacklist).

  This operation can be called only from the organization's master account.
  """
  def detach_policy(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "DetachPolicy",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Lists the root or organizational units (OUs) that serve as the immediate
  parent of the specified child OU or account. This operation, along with
  `ListChildren` enables you to traverse the tree structure that makes up
  this root.

  This operation can be called only from the organization's master account.

  <note> In the current release, a child can have only a single parent.

  </note>
  """
  def list_parents(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "ListParents",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Lists all the accounts in the organization. To request only the accounts in
  a root or OU, use the `ListAccountsForParent` operation instead.

  This operation can be called only from the organization's master account.
  """
  def list_accounts(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "ListAccounts",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Lists the roots that are defined in the current organization.

  This operation can be called only from the organization's master account.
  """
  def list_roots(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "ListRoots",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Moves an account from its current source parent root or OU to the specified
  destination parent root or OU.

  This operation can be called only from the organization's master account.
  """
  def move_account(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "MoveAccount",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Deletes the organization. You can delete an organization only by using
  credentials from the master account. The organization must be empty of
  member accounts, OUs, and policies.
  """
  def delete_organization(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "DeleteOrganization",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Attaches a policy to a root, an organizational unit, or an individual
  account. How the policy affects accounts depends on the type of policy:

  <ul> <li> **Service control policy (SCP)** - An SCP specifies what
  permissions can be delegated to users in affected member accounts. The
  scope of influence for a policy depends on what you attach the policy to:

  <ul> <li> If you attach an SCP to a root, it affects all accounts in the
  organization.

  </li> <li> If you attach an SCP to an OU, it affects all accounts in that
  OU and in any child OUs.

  </li> <li> If you attach the policy directly to an account, then it affects
  only that account.

  </li> </ul> SCPs essentially are permission "filters". When you attach one
  SCP to a higher level root or OU, and you also attach a different SCP to a
  child OU or to an account, the child policy can further restrict only the
  permissions that pass through the parent filter and are available to the
  child. An SCP that is attached to a child cannot grant a permission that is
  not already granted by the parent. For example, imagine that the parent SCP
  allows permissions A, B, C, D, and E. The child SCP allows C, D, E, F, and
  G. The result is that the accounts affected by the child SCP are allowed to
  use only C, D, and E. They cannot use A or B because they were filtered out
  by the child OU. They also cannot use F and G because they were filtered
  out by the parent OU. They cannot be granted back by the child SCP; child
  SCPs can only filter the permissions they receive from the parent SCP.

  AWS Organizations attaches a default SCP named `"FullAWSAccess` to every
  root, OU, and account. This default SCP allows all services and actions,
  enabling any new child OU or account to inherit the permissions of the
  parent root or OU. If you detach the default policy, you must replace it
  with a policy that specifies the permissions that you want to allow in that
  OU or account.

  For more information about how Organizations policies permissions work, see
  [Using Service Control
  Policies](http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scp.html)
  in the *AWS Organizations User Guide*.

  </li> </ul> This operation can be called only from the organization's
  master account.
  """
  def attach_policy(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "AttachPolicy",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Retrieves information about a previously requested handshake. The handshake
  ID comes from the response to the original `InviteAccountToOrganization`
  operation that generated the handshake.

  You can access handshakes that are ACCEPTED, DECLINED, or CANCELED for only
  30 days after they change to that state. They are then deleted and no
  longer accessible.

  This operation can be called from any account in the organization.
  """
  def describe_handshake(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "DescribeHandshake",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Removes the specified account from the organization.

  The removed account becomes a stand-alone account that is not a member of
  any organization. It is no longer subject to any policies and is
  responsible for its own bill payments. The organization's master account is
  no longer charged for any expenses accrued by the member account after it
  is removed from the organization.

  This operation can be called only from the organization's master account.
  Member accounts can remove themselves with `LeaveOrganization` instead.

  <important> <ul> <li> You can remove an account from your organization only
  if the account is configured with the information required to operate as a
  standalone account. When you create an account in an organization using the
  AWS Organizations console, API, or CLI commands, the information required
  of standalone accounts is *not* automatically collected. For an account
  that you want to make standalone, you must accept the End User License
  Agreement (EULA), choose a support plan, provide and verify the required
  contact information, and provide a current payment method. AWS uses the
  payment method to charge for any billable (not free tier) AWS activity that
  occurs while the account is not attached to an organization. To remove an
  account that does not yet have this information, you must sign in as the
  member account and follow the steps at [ To leave an organization when all
  required account information has not yet been
  provided](http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_remove.html#leave-without-all-info)
  in the *AWS Organizations User Guide*.

  </li> <li> You can remove a member account only after you enable IAM user
  access to billing in the member account. For more information, see
  [Activating Access to the Billing and Cost Management
  Console](http://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/grantaccess.html#ControllingAccessWebsite-Activate)
  in the *AWS Billing and Cost Management User Guide*.

  </li> </ul> </important>
  """
  def remove_account_from_organization(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "RemoveAccountFromOrganization",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Deletes the specified policy from your organization. Before you perform
  this operation, you must first detach the policy from all OUs, roots, and
  accounts.

  This operation can be called only from the organization's master account.
  """
  def delete_policy(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "DeletePolicy",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Retrieves information about the organization that the user's account
  belongs to.

  This operation can be called from any account in the organization.
  """
  def describe_organization(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "DescribeOrganization",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Updates an existing policy with a new name, description, or content. If any
  parameter is not supplied, that value remains unchanged. Note that you
  cannot change a policy's type.

  This operation can be called only from the organization's master account.
  """
  def update_policy(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "UpdatePolicy",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Lists all the roots, OUs, and accounts to which the specified policy is
  attached.

  This operation can be called only from the organization's master account.
  """
  def list_targets_for_policy(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "ListTargetsForPolicy",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Lists the accounts in an organization that are contained by the specified
  target root or organizational unit (OU). If you specify the root, you get a
  list of all the accounts that are not in any OU. If you specify an OU, you
  get a list of all the accounts in only that OU, and not in any child OUs.
  To get a list of all accounts in the organization, use the `ListAccounts`
  operation.
  """
  def list_accounts_for_parent(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "ListAccountsForParent",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
  @doc """
  Creates an AWS account that is automatically a member of the organization
  whose credentials made the request. This is an asynchronous request that
  AWS performs in the background. If you want to check the status of the
  request later, you need the `OperationId` response element from this
  operation to provide as a parameter to the `DescribeCreateAccountStatus`
  operation.

  AWS Organizations preconfigures the new member account with a role (named
  `OrganizationAccountAccessRole` by default) that grants administrator
  permissions to the new account. Principals in the master account can assume
  the role. AWS Organizations clones the company name and address information
  for the new account from the organization's master account.

  For more information about creating accounts, see [Creating an AWS Account
  in Your
  Organization](http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_create.html)
  in the *AWS Organizations User Guide*.

  <important> When you create an account in an organization using the AWS
  Organizations console, API, or CLI commands, the information required for
  the account to operate as a standalone account, such as a payment method
  and signing the End User Licence Agreement (EULA) is *not* automatically
  collected. If you must remove an account from your organization later, you
  can do so only after you provide the missing information. Follow the steps
  at [ To leave an organization when all required account information has not
  yet been
  provided](http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_remove.html#leave-without-all-info)
  in the *AWS Organizations User Guide*.

  </important> <note> When you create a member account with this operation,
  you can choose whether to create the account with the **IAM User and Role
  Access to Billing Information** switch enabled. If you enable it, IAM users
  and roles that have appropriate permissions can view billing information
  for the account. If you disable this, then only the account root user can
  access billing information. For information about how to disable this for
  an account, see [Granting Access to Your Billing Information and
  Tools](http://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/grantaccess.html).

  </note> This operation can be called only from the organization's master
  account.

  <important> If you get an exception that indicates that you exceeded your
  account limits for the organization or that you can"t add an account
  because your organization is still initializing, please contact [ AWS
  Customer Support](https://console.aws.amazon.com/support/home#/).

  </important>
  """
  def create_account(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "organizations",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "CreateAccount",
      
      target_prefix:  "AWSOrganizationsV20161128",
      
      type:           :json,
      method:         :post
    }
  end
  
end