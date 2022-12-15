module "table" {
  source = "github.com/justtrackio/terraform-aws-dynamodb-table?ref=v1.0.1"

  for_each = var.tables

  context    = module.this.context
  attributes = module.this.attributes
  name       = each.key

  autoscale_write_target         = each.value.autoscaler.write_target
  autoscale_read_target          = each.value.autoscaler.read_target
  autoscale_min_read_capacity    = each.value.autoscaler.min_read_capacity
  autoscale_max_read_capacity    = each.value.autoscaler.max_read_capacity
  autoscale_min_write_capacity   = each.value.autoscaler.min_write_capacity
  autoscale_max_write_capacity   = each.value.autoscaler.max_write_capacity
  autoscale_read_schedule        = each.value.autoscaler.read_schedule
  autoscale_read_schedule_index  = each.value.autoscaler.read_schedule_index
  autoscale_write_schedule       = each.value.autoscaler.write_schedule
  autoscale_write_schedule_index = each.value.autoscaler.write_schedule_index
  autoscaler_attributes          = each.value.autoscaler.attributes
  autoscaler_tags                = each.value.autoscaler.tags

  billing_mode = each.value.table.billing_mode

  enable_autoscaler             = each.value.autoscaler.enabled
  enable_encryption             = each.value.table.encryption.enabled
  enable_point_in_time_recovery = each.value.table.point_in_time_recovery.enabled
  enable_streams                = each.value.table.streams.enabled

  global_secondary_index_map = each.value.global_secondary_index_map
  local_secondary_index_map  = each.value.local_secondary_index_map

  hash_key      = each.value.table.hash_key
  hash_key_type = each.value.table.hash_key_type

  dynamodb_table_exists = each.value.table.exists
  dynamodb_attributes   = each.value.table.attributes

  range_key      = each.value.table.range_key
  range_key_type = each.value.table.range_key_type

  replicas = each.value.table.replicas

  server_side_encryption_kms_key_arn = each.value.table.encryption.kms_key_arn
  stream_view_type                   = each.value.table.streams.view_type

  ttl_enabled   = each.value.table.ttl.enabled
  ttl_attribute = each.value.table.ttl.attribute

  tags         = module.this.tags
  tags_enabled = each.value.table.tags.enabled
}
