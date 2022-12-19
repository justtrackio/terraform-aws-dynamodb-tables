module "example" {
  source = "../.."

  namespace   = "ns"
  environment = "env"
  stage       = "st"
  name        = "app"
  attributes  = ["foo"]

  tables = {
    basic = {
      table = {
        hash_key = "id"
      }
    }
  }
}
