variable "tables" {
  type = map(object({
    autoscaler = optional(object({
      attributes         = optional(list(string), [])
      enabled            = optional(bool, true)
      max_read_capacity  = optional(number, 1000)
      max_write_capacity = optional(number, 1000)
      min_read_capacity  = optional(number, 1)
      min_write_capacity = optional(number, 1)
      read_schedule = optional(list(object({
        schedule     = string
        min_capacity = number
        max_capacity = number
      })), [])
      read_schedule_index = optional(list(object({
        schedule     = string
        min_capacity = number
        max_capacity = number
      })), [])
      read_target = optional(number, 75)
      write_schedule = optional(list(object({
        schedule     = string
        min_capacity = number
        max_capacity = number
      })), [])
      write_schedule_index = optional(list(object({
        schedule     = string
        min_capacity = number
        max_capacity = number
      })), [])
      write_target = optional(number, 75)
      tags         = optional(map(string), {})
    }), {})
    global_secondary_index_map = optional(list(object({
      hash_key           = string
      name               = string
      non_key_attributes = list(string)
      projection_type    = string
      range_key          = string
      read_capacity      = number
      write_capacity     = number
    })), [])
    local_secondary_index_map = optional(list(object({
      name               = string
      non_key_attributes = list(string)
      projection_type    = string
      range_key          = string
    })), [])
    table = object({
      attributes = optional(list(object({
        name = string
        type = string
      })), [])
      billing_mode = optional(string, "PROVISIONED")
      encryption = optional(object({
        enabled     = optional(bool, false)
        kms_key_arn = optional(string, "")
      }), {})
      point_in_time_recovery = optional(object({
        enabled = optional(bool, false)
      }), {})
      streams = optional(object({
        enabled   = optional(bool, false)
        view_type = optional(string, "")
      }), {})
      exists         = optional(bool, true)
      hash_key       = string
      hash_key_type  = optional(string, "S")
      range_key      = optional(string, "")
      range_key_type = optional(string, "S")
      replicas       = optional(list(string), [])
      tags = optional(object({
        enabled = optional(bool, true)
      }), {})
      ttl = optional(object({
        attribute = optional(string, "ttl")
        enabled   = optional(bool, true)
      }), {})
    })
  }))
  description = "Tables to be created"
  default     = {}
}
