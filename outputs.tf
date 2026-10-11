output "sagemaker_endpoint_configurations_id" {
  description = "Map of id values across all sagemaker_endpoint_configurations, keyed the same as var.sagemaker_endpoint_configurations"
  value       = { for k, v in aws_sagemaker_endpoint_configuration.sagemaker_endpoint_configurations : k => v.id if v.id != null && length(v.id) > 0 }
}
output "sagemaker_endpoint_configurations_arn" {
  description = "Map of arn values across all sagemaker_endpoint_configurations, keyed the same as var.sagemaker_endpoint_configurations"
  value       = { for k, v in aws_sagemaker_endpoint_configuration.sagemaker_endpoint_configurations : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "sagemaker_endpoint_configurations_async_inference_config" {
  description = "Map of async_inference_config values across all sagemaker_endpoint_configurations, keyed the same as var.sagemaker_endpoint_configurations"
  value       = { for k, v in aws_sagemaker_endpoint_configuration.sagemaker_endpoint_configurations : k => one(v.async_inference_config) if v.async_inference_config != null && length(v.async_inference_config) > 0 }
}
output "sagemaker_endpoint_configurations_data_capture_config" {
  description = "Map of data_capture_config values across all sagemaker_endpoint_configurations, keyed the same as var.sagemaker_endpoint_configurations"
  value       = { for k, v in aws_sagemaker_endpoint_configuration.sagemaker_endpoint_configurations : k => one(v.data_capture_config) if v.data_capture_config != null && length(v.data_capture_config) > 0 }
}
output "sagemaker_endpoint_configurations_execution_role_arn" {
  description = "Map of execution_role_arn values across all sagemaker_endpoint_configurations, keyed the same as var.sagemaker_endpoint_configurations"
  value       = { for k, v in aws_sagemaker_endpoint_configuration.sagemaker_endpoint_configurations : k => v.execution_role_arn if v.execution_role_arn != null && length(v.execution_role_arn) > 0 }
}
output "sagemaker_endpoint_configurations_kms_key_arn" {
  description = "Map of kms_key_arn values across all sagemaker_endpoint_configurations, keyed the same as var.sagemaker_endpoint_configurations"
  value       = { for k, v in aws_sagemaker_endpoint_configuration.sagemaker_endpoint_configurations : k => v.kms_key_arn if v.kms_key_arn != null && length(v.kms_key_arn) > 0 }
}
output "sagemaker_endpoint_configurations_name" {
  description = "Map of name values across all sagemaker_endpoint_configurations, keyed the same as var.sagemaker_endpoint_configurations"
  value       = { for k, v in aws_sagemaker_endpoint_configuration.sagemaker_endpoint_configurations : k => v.name if v.name != null && length(v.name) > 0 }
}
output "sagemaker_endpoint_configurations_name_prefix" {
  description = "Map of name_prefix values across all sagemaker_endpoint_configurations, keyed the same as var.sagemaker_endpoint_configurations"
  value       = { for k, v in aws_sagemaker_endpoint_configuration.sagemaker_endpoint_configurations : k => v.name_prefix if v.name_prefix != null && length(v.name_prefix) > 0 }
}
output "sagemaker_endpoint_configurations_production_variants" {
  description = "Map of production_variants values across all sagemaker_endpoint_configurations, keyed the same as var.sagemaker_endpoint_configurations"
  value       = { for k, v in aws_sagemaker_endpoint_configuration.sagemaker_endpoint_configurations : k => v.production_variants if v.production_variants != null && length(v.production_variants) > 0 }
}
output "sagemaker_endpoint_configurations_region" {
  description = "Map of region values across all sagemaker_endpoint_configurations, keyed the same as var.sagemaker_endpoint_configurations"
  value       = { for k, v in aws_sagemaker_endpoint_configuration.sagemaker_endpoint_configurations : k => v.region if v.region != null && length(v.region) > 0 }
}
output "sagemaker_endpoint_configurations_shadow_production_variants" {
  description = "Map of shadow_production_variants values across all sagemaker_endpoint_configurations, keyed the same as var.sagemaker_endpoint_configurations"
  value       = { for k, v in aws_sagemaker_endpoint_configuration.sagemaker_endpoint_configurations : k => v.shadow_production_variants if v.shadow_production_variants != null && length(v.shadow_production_variants) > 0 }
}
output "sagemaker_endpoint_configurations_tags" {
  description = "Map of tags values across all sagemaker_endpoint_configurations, keyed the same as var.sagemaker_endpoint_configurations"
  value       = { for k, v in aws_sagemaker_endpoint_configuration.sagemaker_endpoint_configurations : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "sagemaker_endpoint_configurations_tags_all" {
  description = "Map of tags_all values across all sagemaker_endpoint_configurations, keyed the same as var.sagemaker_endpoint_configurations"
  value       = { for k, v in aws_sagemaker_endpoint_configuration.sagemaker_endpoint_configurations : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}

