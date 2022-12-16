module "example" {
  source = "../.."

  namespace   = "ns"
  environment = "env"
  stage       = "st"
  name        = "app"
  attributes  = ["foo"]

  tables = {
    full = {
      autoscaler = {
        attributes         = ["foo"]
        enabled            = true
        max_read_capacity  = 500
        max_write_capacity = 500
        min_read_capacity  = 2
        min_write_capacity = 2
        read_schedule = [{
          schedule     = "cron(0 5 ? * * *)"
          min_capacity = 3
          max_capacity = 501
        }]
        read_schedule_index = [{
          schedule     = "cron(0 5 ? * * *)"
          min_capacity = 4
          max_capacity = 502
        }]
        read_target = 80
        write_schedule = [{
          schedule     = "cron(0 5 ? * * *)"
          min_capacity = 3
          max_capacity = 501
        }]
        write_schedule_index = [{
          schedule     = "cron(0 5 ? * * *)"
          min_capacity = 4
          max_capacity = 502
        }]
        write_target = 80
        tags = {
          Foo = "Bar"
        }
      }
      global_secondary_index_map = [
        {
          hash_key           = "foo"
          name               = "fooIdx"
          non_key_attributes = ["bar"]
          projection_type    = "INCLUDE"
          range_key          = "created_at"
          read_capacity      = 3
          write_capacity     = 3
        }
      ]
      local_secondary_index_map = [
        {
          name               = "foo2Idx"
          non_key_attributes = ["bar"]
          projection_type    = "INCLUDE"
          range_key          = "created_at"
        }
      ]
      table = {
        attributes = [
          {
            name = "foo"
            type = "S"
          }
        ]
        billing_mode = "PROVISIONED"
        encryption = {
          enabled     = true
          kms_key_arn = "arn:aws:kms:eu-central-1:123456789123:key/d187ad95-05de-4695-b9c9-a9b2895fa4cc"
        }
        point_in_time_recovery = {
          enabled = false
        }
        streams = {
          enabled   = true
          view_type = "NEW_AND_OLD_IMAGES"
        }
        exists         = false
        hash_key       = "id"
        hash_key_type  = "S"
        range_key      = "created_at"
        range_key_type = "N"
        replicas       = []
        tags = {
          enabled = true
        }
        ttl = {
          attribute = "time-to-live"
          enabled   = true
        }
      }
    }
  }
}
