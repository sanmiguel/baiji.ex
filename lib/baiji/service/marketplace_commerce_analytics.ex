defmodule Baiji.MarketplaceCommerceAnalytics do
  @moduledoc """
  Provides AWS Marketplace business intelligence data on-demand.
  """
  
  @doc """
  Given a data set type and data set publication date, asynchronously
  publishes the requested data set to the specified S3 bucket and notifies
  the specified SNS topic once the data is available. Returns a unique
  request identifier that can be used to correlate requests with
  notifications from the SNS topic. Data sets will be published in
  comma-separated values (CSV) format with the file name
  {data_set_type}_YYYY-MM-DD.csv. If a file with the same name already exists
  (e.g. if the same data set is requested twice), the original file will be
  overwritten by the new file. Requires a Role with an attached permissions
  policy providing Allow permissions for the following actions: s3:PutObject,
  s3:GetBucketLocation, sns:GetTopicAttributes, sns:Publish,
  iam:GetRolePolicy.
  """
  def generate_data_set(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "marketplacecommerceanalytics",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "GenerateDataSet",
      
      target_prefix:  "MarketplaceCommerceAnalytics20150701",
      
      type:           :json,
      version:        "2015-07-01",
      method:         :post
    }
  end
  
  @doc """
  Given a data set type and a from date, asynchronously publishes the
  requested customer support data to the specified S3 bucket and notifies the
  specified SNS topic once the data is available. Returns a unique request
  identifier that can be used to correlate requests with notifications from
  the SNS topic. Data sets will be published in comma-separated values (CSV)
  format with the file name {data_set_type}_YYYY-MM-DD'T'HH-mm-ss'Z'.csv. If
  a file with the same name already exists (e.g. if the same data set is
  requested twice), the original file will be overwritten by the new file.
  Requires a Role with an attached permissions policy providing Allow
  permissions for the following actions: s3:PutObject, s3:GetBucketLocation,
  sns:GetTopicAttributes, sns:Publish, iam:GetRolePolicy.
  """
  def start_support_data_export(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "marketplacecommerceanalytics",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "StartSupportDataExport",
      
      target_prefix:  "MarketplaceCommerceAnalytics20150701",
      
      type:           :json,
      version:        "2015-07-01",
      method:         :post
    }
  end
  
end