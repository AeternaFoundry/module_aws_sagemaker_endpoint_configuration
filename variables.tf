variable "sagemaker_endpoint_configurations" {
  description = <<EOT
Map of sagemaker_endpoint_configurations, attributes below
Required:
    - production_variants (block):
        - accelerator_type (optional)
        - capacity_reservation_config (optional, block):
            - capacity_reservation_preference (optional)
            - ml_reservation_arn (optional)
        - container_startup_health_check_timeout_in_seconds (optional)
        - core_dump_config (optional, block):
            - destination_s3_uri (required)
            - kms_key_id (optional)
        - enable_ssm_access (optional)
        - inference_ami_version (optional)
        - initial_instance_count (optional)
        - initial_variant_weight (optional)
        - instance_type (optional)
        - managed_instance_scaling (optional, block):
            - max_instance_count (optional)
            - min_instance_count (optional)
            - status (optional)
        - model_data_download_timeout_in_seconds (optional)
        - model_name (optional)
        - routing_config (optional, block):
            - routing_strategy (required)
        - serverless_config (optional, block):
            - max_concurrency (required)
            - memory_size_in_mb (required)
            - provisioned_concurrency (optional)
        - variant_name (optional)
        - volume_size_in_gb (optional)
Optional:
    - execution_role_arn
    - kms_key_arn
    - name
    - name_prefix
    - region
    - tags
    - tags_all
    - async_inference_config (block):
        - client_config (optional, block):
            - max_concurrent_invocations_per_instance (optional)
        - output_config (required, block):
            - kms_key_id (optional)
            - notification_config (optional, block):
                - error_topic (optional)
                - include_inference_response_in (optional)
                - success_topic (optional)
            - s3_failure_path (optional)
            - s3_output_path (required)
    - data_capture_config (block):
        - capture_content_type_header (optional, block):
            - csv_content_types (optional)
            - json_content_types (optional)
        - capture_options (required, block):
            - capture_mode (required)
        - destination_s3_uri (required)
        - enable_capture (optional)
        - initial_sampling_percentage (required)
        - kms_key_id (optional)
    - shadow_production_variants (block):
        - accelerator_type (optional)
        - capacity_reservation_config (optional, block):
            - capacity_reservation_preference (optional)
            - ml_reservation_arn (optional)
        - container_startup_health_check_timeout_in_seconds (optional)
        - core_dump_config (optional, block):
            - destination_s3_uri (required)
            - kms_key_id (required)
        - enable_ssm_access (optional)
        - inference_ami_version (optional)
        - initial_instance_count (optional)
        - initial_variant_weight (optional)
        - instance_type (optional)
        - managed_instance_scaling (optional, block):
            - max_instance_count (optional)
            - min_instance_count (optional)
            - status (optional)
        - model_data_download_timeout_in_seconds (optional)
        - model_name (optional)
        - routing_config (optional, block):
            - routing_strategy (required)
        - serverless_config (optional, block):
            - max_concurrency (required)
            - memory_size_in_mb (required)
            - provisioned_concurrency (optional)
        - variant_name (optional)
        - volume_size_in_gb (optional)
EOT

  type = map(object({
    execution_role_arn = optional(string)
    kms_key_arn        = optional(string)
    name               = optional(string)
    name_prefix        = optional(string)
    region             = optional(string)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
    production_variants = list(object({
      accelerator_type = optional(string)
      capacity_reservation_config = optional(object({
        capacity_reservation_preference = optional(string)
        ml_reservation_arn              = optional(string)
      }))
      container_startup_health_check_timeout_in_seconds = optional(number)
      core_dump_config = optional(object({
        destination_s3_uri = string
        kms_key_id         = optional(string)
      }))
      enable_ssm_access      = optional(bool)
      inference_ami_version  = optional(string)
      initial_instance_count = optional(number)
      initial_variant_weight = optional(number)
      instance_type          = optional(string)
      managed_instance_scaling = optional(object({
        max_instance_count = optional(number)
        min_instance_count = optional(number)
        status             = optional(string)
      }))
      model_data_download_timeout_in_seconds = optional(number)
      model_name                             = optional(string)
      routing_config = optional(list(object({
        routing_strategy = string
      })))
      serverless_config = optional(object({
        max_concurrency         = number
        memory_size_in_mb       = number
        provisioned_concurrency = optional(number)
      }))
      variant_name      = optional(string)
      volume_size_in_gb = optional(number)
    }))
    async_inference_config = optional(object({
      client_config = optional(object({
        max_concurrent_invocations_per_instance = optional(number)
      }))
      output_config = object({
        kms_key_id = optional(string)
        notification_config = optional(object({
          error_topic                   = optional(string)
          include_inference_response_in = optional(set(string))
          success_topic                 = optional(string)
        }))
        s3_failure_path = optional(string)
        s3_output_path  = string
      })
    }))
    data_capture_config = optional(object({
      capture_content_type_header = optional(object({
        csv_content_types  = optional(set(string))
        json_content_types = optional(set(string))
      }))
      capture_options = list(object({
        capture_mode = string
      }))
      destination_s3_uri          = string
      enable_capture              = optional(bool)
      initial_sampling_percentage = number
      kms_key_id                  = optional(string)
    }))
    shadow_production_variants = optional(list(object({
      accelerator_type = optional(string)
      capacity_reservation_config = optional(object({
        capacity_reservation_preference = optional(string)
        ml_reservation_arn              = optional(string)
      }))
      container_startup_health_check_timeout_in_seconds = optional(number)
      core_dump_config = optional(object({
        destination_s3_uri = string
        kms_key_id         = string
      }))
      enable_ssm_access      = optional(bool)
      inference_ami_version  = optional(string)
      initial_instance_count = optional(number)
      initial_variant_weight = optional(number)
      instance_type          = optional(string)
      managed_instance_scaling = optional(object({
        max_instance_count = optional(number)
        min_instance_count = optional(number)
        status             = optional(string)
      }))
      model_data_download_timeout_in_seconds = optional(number)
      model_name                             = optional(string)
      routing_config = optional(list(object({
        routing_strategy = string
      })))
      serverless_config = optional(object({
        max_concurrency         = number
        memory_size_in_mb       = number
        provisioned_concurrency = optional(number)
      }))
      variant_name      = optional(string)
      volume_size_in_gb = optional(number)
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_endpoint_configurations : (
        length(v.production_variants) >= 1 && length(v.production_variants) <= 10
      )
    ])
    error_message = "Each production_variants list must contain between 1 and 10 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_endpoint_configurations : (
        v.data_capture_config == null || (length(v.data_capture_config.capture_options) >= 1 && length(v.data_capture_config.capture_options) <= 2)
      )
    ])
    error_message = "Each capture_options list must contain between 1 and 2 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_endpoint_configurations : (
        v.shadow_production_variants == null || (length(v.shadow_production_variants) <= 10)
      )
    ])
    error_message = "Each shadow_production_variants list must contain at most 10 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_endpoint_configurations : (
        v.async_inference_config == null || (v.async_inference_config.client_config == null || (v.async_inference_config.client_config.max_concurrent_invocations_per_instance == null || (v.async_inference_config.client_config.max_concurrent_invocations_per_instance >= 1 && v.async_inference_config.client_config.max_concurrent_invocations_per_instance <= 1000)))
      )
    ])
    error_message = "must be between 1 and 1000"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_endpoint_configurations : (
        v.async_inference_config == null || (v.async_inference_config.output_config.s3_failure_path == null || ((can(regex("^(https|s3)://([^/])/?(.*)$", v.async_inference_config.output_config.s3_failure_path))) && (length(v.async_inference_config.output_config.s3_failure_path) >= 1 && length(v.async_inference_config.output_config.s3_failure_path) <= 512)))
      )
    ])
    error_message = "all of: must be between 1 and 512 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_endpoint_configurations : (
        v.async_inference_config == null || ((can(regex("^(https|s3)://([^/])/?(.*)$", v.async_inference_config.output_config.s3_output_path))) && (length(v.async_inference_config.output_config.s3_output_path) >= 1 && length(v.async_inference_config.output_config.s3_output_path) <= 512))
      )
    ])
    error_message = "all of: must be between 1 and 512 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_endpoint_configurations : (
        v.data_capture_config == null || (v.data_capture_config.capture_content_type_header == null || (v.data_capture_config.capture_content_type_header.csv_content_types == null || (alltrue([for x in v.data_capture_config.capture_content_type_header.csv_content_types : (can(regex("^[0-9A-Za-z](-*[0-9A-Za-z])*\\/[0-9A-Za-z](-*[0-9A-Za-z.])*", x))) && (length(x) >= 1 && length(x) <= 256)]))))
      )
    ])
    error_message = "all of: must be between 1 and 256 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_endpoint_configurations : (
        v.data_capture_config == null || (v.data_capture_config.capture_content_type_header == null || (v.data_capture_config.capture_content_type_header.json_content_types == null || (alltrue([for x in v.data_capture_config.capture_content_type_header.json_content_types : (can(regex("^[0-9A-Za-z](-*[0-9A-Za-z])*\\/[0-9A-Za-z](-*[0-9A-Za-z.])*", x))) && (length(x) >= 1 && length(x) <= 256)]))))
      )
    ])
    error_message = "all of: must be between 1 and 256 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_endpoint_configurations : (
        v.data_capture_config == null || ((can(regex("^(https|s3)://([^/])/?(.*)$", v.data_capture_config.destination_s3_uri))) && (length(v.data_capture_config.destination_s3_uri) >= 1 && length(v.data_capture_config.destination_s3_uri) <= 512))
      )
    ])
    error_message = "all of: must be between 1 and 512 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_endpoint_configurations : (
        v.data_capture_config == null || (v.data_capture_config.initial_sampling_percentage >= 0 && v.data_capture_config.initial_sampling_percentage <= 100)
      )
    ])
    error_message = "must be between 0 and 100"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_endpoint_configurations : (
        alltrue([for item in v.production_variants : (item.container_startup_health_check_timeout_in_seconds == null || (item.container_startup_health_check_timeout_in_seconds >= 60 && item.container_startup_health_check_timeout_in_seconds <= 3600))])
      )
    ])
    error_message = "must be between 60 and 3600"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_endpoint_configurations : (
        alltrue([for item in v.production_variants : (item.core_dump_config == null || ((can(regex("^(https|s3)://([^/])/?(.*)$", item.core_dump_config.destination_s3_uri))) && (length(item.core_dump_config.destination_s3_uri) >= 1 && length(item.core_dump_config.destination_s3_uri) <= 512)))])
      )
    ])
    error_message = "all of: must be between 1 and 512 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_endpoint_configurations : (
        alltrue([for item in v.production_variants : (item.initial_instance_count == null || (item.initial_instance_count >= 1))])
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_endpoint_configurations : (
        alltrue([for item in v.production_variants : (item.initial_variant_weight == null || (item.initial_variant_weight >= 0))])
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_endpoint_configurations : (
        alltrue([for item in v.production_variants : (item.model_data_download_timeout_in_seconds == null || (item.model_data_download_timeout_in_seconds >= 60 && item.model_data_download_timeout_in_seconds <= 3600))])
      )
    ])
    error_message = "must be between 60 and 3600"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_endpoint_configurations : (
        alltrue([for item in v.production_variants : (item.serverless_config == null || (item.serverless_config.max_concurrency >= 1 && item.serverless_config.max_concurrency <= 200))])
      )
    ])
    error_message = "must be between 1 and 200"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_endpoint_configurations : (
        alltrue([for item in v.production_variants : (item.serverless_config == null || (contains([1024, 2048, 3072, 4096, 5120, 6144], item.serverless_config.memory_size_in_mb)))])
      )
    ])
    error_message = "must be one of: 1024, 2048, 3072, 4096, 5120, 6144"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_endpoint_configurations : (
        alltrue([for item in v.production_variants : (item.serverless_config == null || (item.serverless_config.provisioned_concurrency == null || (item.serverless_config.provisioned_concurrency >= 1 && item.serverless_config.provisioned_concurrency <= 200)))])
      )
    ])
    error_message = "must be between 1 and 200"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_endpoint_configurations : (
        alltrue([for item in v.production_variants : (item.managed_instance_scaling == null || (item.managed_instance_scaling.max_instance_count == null || (item.managed_instance_scaling.max_instance_count >= 1)))])
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_endpoint_configurations : (
        alltrue([for item in v.production_variants : (item.managed_instance_scaling == null || (item.managed_instance_scaling.min_instance_count == null || (item.managed_instance_scaling.min_instance_count >= 0)))])
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_endpoint_configurations : (
        alltrue([for item in v.production_variants : (item.volume_size_in_gb == null || (item.volume_size_in_gb >= 1 && item.volume_size_in_gb <= 512))])
      )
    ])
    error_message = "must be between 1 and 512"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_endpoint_configurations : (
        v.shadow_production_variants == null || alltrue([for item in v.shadow_production_variants : (item.container_startup_health_check_timeout_in_seconds == null || (item.container_startup_health_check_timeout_in_seconds >= 60 && item.container_startup_health_check_timeout_in_seconds <= 3600))])
      )
    ])
    error_message = "must be between 60 and 3600"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_endpoint_configurations : (
        v.shadow_production_variants == null || alltrue([for item in v.shadow_production_variants : (item.core_dump_config == null || ((can(regex("^(https|s3)://([^/])/?(.*)$", item.core_dump_config.destination_s3_uri))) && (length(item.core_dump_config.destination_s3_uri) >= 1 && length(item.core_dump_config.destination_s3_uri) <= 512)))])
      )
    ])
    error_message = "all of: must be between 1 and 512 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_endpoint_configurations : (
        v.shadow_production_variants == null || alltrue([for item in v.shadow_production_variants : (item.initial_instance_count == null || (item.initial_instance_count >= 1))])
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_endpoint_configurations : (
        v.shadow_production_variants == null || alltrue([for item in v.shadow_production_variants : (item.initial_variant_weight == null || (item.initial_variant_weight >= 0))])
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_endpoint_configurations : (
        v.shadow_production_variants == null || alltrue([for item in v.shadow_production_variants : (item.model_data_download_timeout_in_seconds == null || (item.model_data_download_timeout_in_seconds >= 60 && item.model_data_download_timeout_in_seconds <= 3600))])
      )
    ])
    error_message = "must be between 60 and 3600"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_endpoint_configurations : (
        v.shadow_production_variants == null || alltrue([for item in v.shadow_production_variants : (item.serverless_config == null || (item.serverless_config.max_concurrency >= 1 && item.serverless_config.max_concurrency <= 200))])
      )
    ])
    error_message = "must be between 1 and 200"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_endpoint_configurations : (
        v.shadow_production_variants == null || alltrue([for item in v.shadow_production_variants : (item.serverless_config == null || (contains([1024, 2048, 3072, 4096, 5120, 6144], item.serverless_config.memory_size_in_mb)))])
      )
    ])
    error_message = "must be one of: 1024, 2048, 3072, 4096, 5120, 6144"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_endpoint_configurations : (
        v.shadow_production_variants == null || alltrue([for item in v.shadow_production_variants : (item.serverless_config == null || (item.serverless_config.provisioned_concurrency == null || (item.serverless_config.provisioned_concurrency >= 1 && item.serverless_config.provisioned_concurrency <= 200)))])
      )
    ])
    error_message = "must be between 1 and 200"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_endpoint_configurations : (
        v.shadow_production_variants == null || alltrue([for item in v.shadow_production_variants : (item.managed_instance_scaling == null || (item.managed_instance_scaling.max_instance_count == null || (item.managed_instance_scaling.max_instance_count >= 1)))])
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_endpoint_configurations : (
        v.shadow_production_variants == null || alltrue([for item in v.shadow_production_variants : (item.managed_instance_scaling == null || (item.managed_instance_scaling.min_instance_count == null || (item.managed_instance_scaling.min_instance_count >= 0)))])
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_endpoint_configurations : (
        v.shadow_production_variants == null || alltrue([for item in v.shadow_production_variants : (item.volume_size_in_gb == null || (item.volume_size_in_gb >= 1 && item.volume_size_in_gb <= 512))])
      )
    ])
    error_message = "must be between 1 and 512"
  }
  # Note: 30 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

