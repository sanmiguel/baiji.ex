defmodule Baiji.CloudWatch do
  @moduledoc """
  Amazon CloudWatch monitors your Amazon Web Services (AWS) resources and the
  applications you run on AWS in real time. You can use CloudWatch to collect
  and track metrics, which are the variables you want to measure for your
  resources and applications.

  CloudWatch alarms send notifications or automatically change the resources
  you are monitoring based on rules that you define. For example, you can
  monitor the CPU usage and disk reads and writes of your Amazon EC2
  instances. Then, use this data to determine whether you should launch
  additional instances to handle increased load. You can also use this data
  to stop under-used instances to save money.

  In addition to monitoring the built-in metrics that come with AWS, you can
  monitor your own custom metrics. With CloudWatch, you gain system-wide
  visibility into resource utilization, application performance, and
  operational health.
  """
  
  @doc """
  Deletes the specified alarms. In the event of an error, no alarms are
  deleted.
  """
  def delete_alarms(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "monitoring",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "DeleteAlarms",
      
      type:           :xml,
      version:        "2010-08-01",
      method:         :post
    }
  end
  
  @doc """
  Deletes all dashboards that you specify. You may specify up to 100
  dashboards to delete. If there is an error during this call, no dashboards
  are deleted.
  """
  def delete_dashboards(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "monitoring",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "DeleteDashboards",
      
      type:           :xml,
      version:        "2010-08-01",
      method:         :post
    }
  end
  
  @doc """
  Retrieves the history for the specified alarm. You can filter the results
  by date range or item type. If an alarm name is not specified, the
  histories for all alarms are returned.

  CloudWatch retains the history of an alarm even if you delete the alarm.
  """
  def describe_alarm_history(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "monitoring",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "DescribeAlarmHistory",
      
      type:           :xml,
      version:        "2010-08-01",
      method:         :post
    }
  end
  
  @doc """
  Retrieves the specified alarms. If no alarms are specified, all alarms are
  returned. Alarms can be retrieved by using only a prefix for the alarm
  name, the alarm state, or a prefix for any action.
  """
  def describe_alarms(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "monitoring",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "DescribeAlarms",
      
      type:           :xml,
      version:        "2010-08-01",
      method:         :post
    }
  end
  
  @doc """
  Retrieves the alarms for the specified metric. To filter the results,
  specify a statistic, period, or unit.
  """
  def describe_alarms_for_metric(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "monitoring",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "DescribeAlarmsForMetric",
      
      type:           :xml,
      version:        "2010-08-01",
      method:         :post
    }
  end
  
  @doc """
  Disables the actions for the specified alarms. When an alarm's actions are
  disabled, the alarm actions do not execute when the alarm state changes.
  """
  def disable_alarm_actions(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "monitoring",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "DisableAlarmActions",
      
      type:           :xml,
      version:        "2010-08-01",
      method:         :post
    }
  end
  
  @doc """
  Enables the actions for the specified alarms.
  """
  def enable_alarm_actions(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "monitoring",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "EnableAlarmActions",
      
      type:           :xml,
      version:        "2010-08-01",
      method:         :post
    }
  end
  
  @doc """
  Displays the details of the dashboard that you specify.

  To copy an existing dashboard, use `GetDashboard`, and then use the data
  returned within `DashboardBody` as the template for the new dashboard when
  you call `PutDashboard` to create the copy.
  """
  def get_dashboard(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "monitoring",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "GetDashboard",
      
      type:           :xml,
      version:        "2010-08-01",
      method:         :post
    }
  end
  
  @doc """
  Gets statistics for the specified metric.

  The maximum number of data points returned from a single call is 1,440. If
  you request more than 1,440 data points, CloudWatch returns an error. To
  reduce the number of data points, you can narrow the specified time range
  and make multiple requests across adjacent time ranges, or you can increase
  the specified period. Data points are not returned in chronological order.

  CloudWatch aggregates data points based on the length of the period that
  you specify. For example, if you request statistics with a one-hour period,
  CloudWatch aggregates all data points with time stamps that fall within
  each one-hour period. Therefore, the number of values aggregated by
  CloudWatch is larger than the number of data points returned.

  CloudWatch needs raw data points to calculate percentile statistics. If you
  publish data using a statistic set instead, you can only retrieve
  percentile statistics for this data if one of the following conditions is
  true:

  <ul> <li> The SampleCount value of the statistic set is 1.

  </li> <li> The Min and the Max values of the statistic set are equal.

  </li> </ul> Amazon CloudWatch retains metric data as follows:

  <ul> <li> Data points with a period of less than 60 seconds are available
  for 3 hours. These data points are high-resolution metrics and are
  available only for custom metrics that have been defined with a
  `StorageResolution` of 1.

  </li> <li> Data points with a period of 60 seconds (1-minute) are available
  for 15 days.

  </li> <li> Data points with a period of 300 seconds (5-minute) are
  available for 63 days.

  </li> <li> Data points with a period of 3600 seconds (1 hour) are available
  for 455 days (15 months).

  </li> </ul> Data points that are initially published with a shorter period
  are aggregated together for long-term storage. For example, if you collect
  data using a period of 1 minute, the data remains available for 15 days
  with 1-minute resolution. After 15 days, this data is still available, but
  is aggregated and retrievable only with a resolution of 5 minutes. After 63
  days, the data is further aggregated and is available with a resolution of
  1 hour.

  CloudWatch started retaining 5-minute and 1-hour metric data as of July 9,
  2016.

  For information about metrics and dimensions supported by AWS services, see
  the [Amazon CloudWatch Metrics and Dimensions
  Reference](http://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CW_Support_For_AWS.html)
  in the *Amazon CloudWatch User Guide*.
  """
  def get_metric_statistics(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "monitoring",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "GetMetricStatistics",
      
      type:           :xml,
      version:        "2010-08-01",
      method:         :post
    }
  end
  
  @doc """
  Returns a list of the dashboards for your account. If you include
  `DashboardNamePrefix`, only those dashboards with names starting with the
  prefix are listed. Otherwise, all dashboards in your account are listed.
  """
  def list_dashboards(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "monitoring",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "ListDashboards",
      
      type:           :xml,
      version:        "2010-08-01",
      method:         :post
    }
  end
  
  @doc """
  List the specified metrics. You can use the returned metrics with
  `GetMetricStatistics` to obtain statistical data.

  Up to 500 results are returned for any one call. To retrieve additional
  results, use the returned token with subsequent calls.

  After you create a metric, allow up to fifteen minutes before the metric
  appears. Statistics about the metric, however, are available sooner using
  `GetMetricStatistics`.
  """
  def list_metrics(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "monitoring",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "ListMetrics",
      
      type:           :xml,
      version:        "2010-08-01",
      method:         :post
    }
  end
  
  @doc """
  Creates a dashboard if it does not already exist, or updates an existing
  dashboard. If you update a dashboard, the entire contents are replaced with
  what you specify here.

  You can have up to 500 dashboards per account. All dashboards in your
  account are global, not region-specific.

  A simple way to create a dashboard using `PutDashboard` is to copy an
  existing dashboard. To copy an existing dashboard using the console, you
  can load the dashboard and then use the View/edit source command in the
  Actions menu to display the JSON block for that dashboard. Another way to
  copy a dashboard is to use `GetDashboard`, and then use the data returned
  within `DashboardBody` as the template for the new dashboard when you call
  `PutDashboard`.

  When you create a dashboard with `PutDashboard`, a good practice is to add
  a text widget at the top of the dashboard with a message that the dashboard
  was created by script and should not be changed in the console. This
  message could also point console users to the location of the
  `DashboardBody` script or the CloudFormation template used to create the
  dashboard.
  """
  def put_dashboard(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "monitoring",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "PutDashboard",
      
      type:           :xml,
      version:        "2010-08-01",
      method:         :post
    }
  end
  
  @doc """
  Creates or updates an alarm and associates it with the specified metric.
  Optionally, this operation can associate one or more Amazon SNS resources
  with the alarm.

  When this operation creates an alarm, the alarm state is immediately set to
  `INSUFFICIENT_DATA`. The alarm is evaluated and its state is set
  appropriately. Any actions associated with the state are then executed.

  When you update an existing alarm, its state is left unchanged, but the
  update completely overwrites the previous configuration of the alarm.

  If you are an IAM user, you must have Amazon EC2 permissions for some
  operations:

  <ul> <li> `ec2:DescribeInstanceStatus` and `ec2:DescribeInstances` for all
  alarms on EC2 instance status metrics

  </li> <li> `ec2:StopInstances` for alarms with stop actions

  </li> <li> `ec2:TerminateInstances` for alarms with terminate actions

  </li> <li> `ec2:DescribeInstanceRecoveryAttribute` and
  `ec2:RecoverInstances` for alarms with recover actions

  </li> </ul> If you have read/write permissions for Amazon CloudWatch but
  not for Amazon EC2, you can still create an alarm, but the stop or
  terminate actions are not performed. However, if you are later granted the
  required permissions, the alarm actions that you created earlier are
  performed.

  If you are using an IAM role (for example, an EC2 instance profile), you
  cannot stop or terminate the instance using alarm actions. However, you can
  still see the alarm state and perform any other actions such as Amazon SNS
  notifications or Auto Scaling policies.

  If you are using temporary security credentials granted using AWS STS, you
  cannot stop or terminate an EC2 instance using alarm actions.

  You must create at least one stop, terminate, or reboot alarm using either
  the Amazon EC2 or CloudWatch consoles to create the **EC2ActionsAccess**
  IAM role. After this IAM role is created, you can create stop, terminate,
  or reboot alarms using a command-line interface or API.
  """
  def put_metric_alarm(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "monitoring",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "PutMetricAlarm",
      
      type:           :xml,
      version:        "2010-08-01",
      method:         :post
    }
  end
  
  @doc """
  Publishes metric data points to Amazon CloudWatch. CloudWatch associates
  the data points with the specified metric. If the specified metric does not
  exist, CloudWatch creates the metric. When CloudWatch creates a metric, it
  can take up to fifteen minutes for the metric to appear in calls to
  `ListMetrics`.

  Each `PutMetricData` request is limited to 40 KB in size for HTTP POST
  requests.

  Although the `Value` parameter accepts numbers of type `Double`, CloudWatch
  rejects values that are either too small or too large. Values must be in
  the range of 8.515920e-109 to 1.174271e+108 (Base 10) or 2e-360 to 2e360
  (Base 2). In addition, special values (for example, NaN, +Infinity,
  -Infinity) are not supported.

  You can use up to 10 dimensions per metric to further clarify what data the
  metric collects. For more information about specifying dimensions, see
  [Publishing
  Metrics](http://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html)
  in the *Amazon CloudWatch User Guide*.

  Data points with time stamps from 24 hours ago or longer can take at least
  48 hours to become available for `GetMetricStatistics` from the time they
  are submitted.

  CloudWatch needs raw data points to calculate percentile statistics. If you
  publish data using a statistic set instead, you can only retrieve
  percentile statistics for this data if one of the following conditions is
  true:

  <ul> <li> The SampleCount value of the statistic set is 1

  </li> <li> The Min and the Max values of the statistic set are equal

  </li> </ul>
  """
  def put_metric_data(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "monitoring",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "PutMetricData",
      
      type:           :xml,
      version:        "2010-08-01",
      method:         :post
    }
  end
  
  @doc """
  Temporarily sets the state of an alarm for testing purposes. When the
  updated state differs from the previous value, the action configured for
  the appropriate state is invoked. For example, if your alarm is configured
  to send an Amazon SNS message when an alarm is triggered, temporarily
  changing the alarm state to `ALARM` sends an SNS message. The alarm returns
  to its actual state (often within seconds). Because the alarm state change
  happens quickly, it is typically only visible in the alarm's **History**
  tab in the Amazon CloudWatch console or through `DescribeAlarmHistory`.
  """
  def set_alarm_state(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:        "monitoring",
      endpoint:       "/",
      input:          input,
      options:        options,
      action:         "SetAlarmState",
      
      type:           :xml,
      version:        "2010-08-01",
      method:         :post
    }
  end
  
end