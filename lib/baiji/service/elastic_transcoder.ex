defmodule Baiji.ElasticTranscoder do
  @moduledoc """
  AWS Elastic Transcoder Service

  The AWS Elastic Transcoder Service.
  """
  
  @doc """
  The CancelJob operation cancels an unfinished job.

  <note> You can only cancel a job that has a status of `Submitted`. To
  prevent a pipeline from starting to process a job while you're getting the
  job identifier, use `UpdatePipelineStatus` to temporarily pause the
  pipeline.

  </note>
  """
  def cancel_job(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:          "elastictranscoder",
      endpoint:         "/2012-09-25/jobs/{Id}",
      input:            input,
      options:          options,
      action:           "CancelJob",
      
      endpoint_prefix:  "elastictranscoder",
      type:             :rest_json,
      version:          "2012-09-25",
      method:           :delete
    }
  end
  
  @doc """
  When you create a job, Elastic Transcoder returns JSON data that includes
  the values that you specified plus information about the job that is
  created.

  If you have specified more than one output for your jobs (for example, one
  output for the Kindle Fire and another output for the Apple iPhone 4s), you
  currently must use the Elastic Transcoder API to list the jobs (as opposed
  to the AWS Console).
  """
  def create_job(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:          "elastictranscoder",
      endpoint:         "/2012-09-25/jobs",
      input:            input,
      options:          options,
      action:           "CreateJob",
      
      endpoint_prefix:  "elastictranscoder",
      type:             :rest_json,
      version:          "2012-09-25",
      method:           :post
    }
  end
  
  @doc """
  The CreatePipeline operation creates a pipeline with settings that you
  specify.
  """
  def create_pipeline(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:          "elastictranscoder",
      endpoint:         "/2012-09-25/pipelines",
      input:            input,
      options:          options,
      action:           "CreatePipeline",
      
      endpoint_prefix:  "elastictranscoder",
      type:             :rest_json,
      version:          "2012-09-25",
      method:           :post
    }
  end
  
  @doc """
  The CreatePreset operation creates a preset with settings that you specify.

  <important> Elastic Transcoder checks the CreatePreset settings to ensure
  that they meet Elastic Transcoder requirements and to determine whether
  they comply with H.264 standards. If your settings are not valid for
  Elastic Transcoder, Elastic Transcoder returns an HTTP 400 response
  (`ValidationException`) and does not create the preset. If the settings are
  valid for Elastic Transcoder but aren't strictly compliant with the H.264
  standard, Elastic Transcoder creates the preset and returns a warning
  message in the response. This helps you determine whether your settings
  comply with the H.264 standard while giving you greater flexibility with
  respect to the video that Elastic Transcoder produces.

  </important> Elastic Transcoder uses the H.264 video-compression format.
  For more information, see the International Telecommunication Union
  publication *Recommendation ITU-T H.264: Advanced video coding for generic
  audiovisual services*.
  """
  def create_preset(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:          "elastictranscoder",
      endpoint:         "/2012-09-25/presets",
      input:            input,
      options:          options,
      action:           "CreatePreset",
      
      endpoint_prefix:  "elastictranscoder",
      type:             :rest_json,
      version:          "2012-09-25",
      method:           :post
    }
  end
  
  @doc """
  The DeletePipeline operation removes a pipeline.

  You can only delete a pipeline that has never been used or that is not
  currently in use (doesn't contain any active jobs). If the pipeline is
  currently in use, `DeletePipeline` returns an error.
  """
  def delete_pipeline(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:          "elastictranscoder",
      endpoint:         "/2012-09-25/pipelines/{Id}",
      input:            input,
      options:          options,
      action:           "DeletePipeline",
      
      endpoint_prefix:  "elastictranscoder",
      type:             :rest_json,
      version:          "2012-09-25",
      method:           :delete
    }
  end
  
  @doc """
  The DeletePreset operation removes a preset that you've added in an AWS
  region.

  <note> You can't delete the default presets that are included with Elastic
  Transcoder.

  </note>
  """
  def delete_preset(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:          "elastictranscoder",
      endpoint:         "/2012-09-25/presets/{Id}",
      input:            input,
      options:          options,
      action:           "DeletePreset",
      
      endpoint_prefix:  "elastictranscoder",
      type:             :rest_json,
      version:          "2012-09-25",
      method:           :delete
    }
  end
  
  @doc """
  The ListJobsByPipeline operation gets a list of the jobs currently in a
  pipeline.

  Elastic Transcoder returns all of the jobs currently in the specified
  pipeline. The response body contains one element for each job that
  satisfies the search criteria.
  """
  def list_jobs_by_pipeline(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:          "elastictranscoder",
      endpoint:         "/2012-09-25/jobsByPipeline/{PipelineId}",
      input:            input,
      options:          options,
      action:           "ListJobsByPipeline",
      
      endpoint_prefix:  "elastictranscoder",
      type:             :rest_json,
      version:          "2012-09-25",
      method:           :get
    }
  end
  
  @doc """
  The ListJobsByStatus operation gets a list of jobs that have a specified
  status. The response body contains one element for each job that satisfies
  the search criteria.
  """
  def list_jobs_by_status(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:          "elastictranscoder",
      endpoint:         "/2012-09-25/jobsByStatus/{Status}",
      input:            input,
      options:          options,
      action:           "ListJobsByStatus",
      
      endpoint_prefix:  "elastictranscoder",
      type:             :rest_json,
      version:          "2012-09-25",
      method:           :get
    }
  end
  
  @doc """
  The ListPipelines operation gets a list of the pipelines associated with
  the current AWS account.
  """
  def list_pipelines(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:          "elastictranscoder",
      endpoint:         "/2012-09-25/pipelines",
      input:            input,
      options:          options,
      action:           "ListPipelines",
      
      endpoint_prefix:  "elastictranscoder",
      type:             :rest_json,
      version:          "2012-09-25",
      method:           :get
    }
  end
  
  @doc """
  The ListPresets operation gets a list of the default presets included with
  Elastic Transcoder and the presets that you've added in an AWS region.
  """
  def list_presets(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:          "elastictranscoder",
      endpoint:         "/2012-09-25/presets",
      input:            input,
      options:          options,
      action:           "ListPresets",
      
      endpoint_prefix:  "elastictranscoder",
      type:             :rest_json,
      version:          "2012-09-25",
      method:           :get
    }
  end
  
  @doc """
  The ReadJob operation returns detailed information about a job.
  """
  def read_job(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:          "elastictranscoder",
      endpoint:         "/2012-09-25/jobs/{Id}",
      input:            input,
      options:          options,
      action:           "ReadJob",
      
      endpoint_prefix:  "elastictranscoder",
      type:             :rest_json,
      version:          "2012-09-25",
      method:           :get
    }
  end
  
  @doc """
  The ReadPipeline operation gets detailed information about a pipeline.
  """
  def read_pipeline(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:          "elastictranscoder",
      endpoint:         "/2012-09-25/pipelines/{Id}",
      input:            input,
      options:          options,
      action:           "ReadPipeline",
      
      endpoint_prefix:  "elastictranscoder",
      type:             :rest_json,
      version:          "2012-09-25",
      method:           :get
    }
  end
  
  @doc """
  The ReadPreset operation gets detailed information about a preset.
  """
  def read_preset(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:          "elastictranscoder",
      endpoint:         "/2012-09-25/presets/{Id}",
      input:            input,
      options:          options,
      action:           "ReadPreset",
      
      endpoint_prefix:  "elastictranscoder",
      type:             :rest_json,
      version:          "2012-09-25",
      method:           :get
    }
  end
  
  @doc """
  The TestRole operation tests the IAM role used to create the pipeline.

  The `TestRole` action lets you determine whether the IAM role you are using
  has sufficient permissions to let Elastic Transcoder perform tasks
  associated with the transcoding process. The action attempts to assume the
  specified IAM role, checks read access to the input and output buckets, and
  tries to send a test notification to Amazon SNS topics that you specify.
  """
  def test_role(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:          "elastictranscoder",
      endpoint:         "/2012-09-25/roleTests",
      input:            input,
      options:          options,
      action:           "TestRole",
      
      endpoint_prefix:  "elastictranscoder",
      type:             :rest_json,
      version:          "2012-09-25",
      method:           :post
    }
  end
  
  @doc """
  Use the `UpdatePipeline` operation to update settings for a pipeline.

  <important> When you change pipeline settings, your changes take effect
  immediately. Jobs that you have already submitted and that Elastic
  Transcoder has not started to process are affected in addition to jobs that
  you submit after you change settings.

  </important>
  """
  def update_pipeline(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:          "elastictranscoder",
      endpoint:         "/2012-09-25/pipelines/{Id}",
      input:            input,
      options:          options,
      action:           "UpdatePipeline",
      
      endpoint_prefix:  "elastictranscoder",
      type:             :rest_json,
      version:          "2012-09-25",
      method:           :put
    }
  end
  
  @doc """
  With the UpdatePipelineNotifications operation, you can update Amazon
  Simple Notification Service (Amazon SNS) notifications for a pipeline.

  When you update notifications for a pipeline, Elastic Transcoder returns
  the values that you specified in the request.
  """
  def update_pipeline_notifications(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:          "elastictranscoder",
      endpoint:         "/2012-09-25/pipelines/{Id}/notifications",
      input:            input,
      options:          options,
      action:           "UpdatePipelineNotifications",
      
      endpoint_prefix:  "elastictranscoder",
      type:             :rest_json,
      version:          "2012-09-25",
      method:           :post
    }
  end
  
  @doc """
  The UpdatePipelineStatus operation pauses or reactivates a pipeline, so
  that the pipeline stops or restarts the processing of jobs.

  Changing the pipeline status is useful if you want to cancel one or more
  jobs. You can't cancel jobs after Elastic Transcoder has started processing
  them; if you pause the pipeline to which you submitted the jobs, you have
  more time to get the job IDs for the jobs that you want to cancel, and to
  send a `CancelJob` request.
  """
  def update_pipeline_status(input \\ %{}, options \\ []) do
    %Baiji.Operation{
      service:          "elastictranscoder",
      endpoint:         "/2012-09-25/pipelines/{Id}/status",
      input:            input,
      options:          options,
      action:           "UpdatePipelineStatus",
      
      endpoint_prefix:  "elastictranscoder",
      type:             :rest_json,
      version:          "2012-09-25",
      method:           :post
    }
  end
  
end