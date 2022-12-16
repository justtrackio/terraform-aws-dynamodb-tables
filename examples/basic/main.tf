module "example" {
  source = "../.."

  environment = "example"

  tables = {
    basic = {
      table = {
        hash_key = "id"
      }
    }
  }
}
