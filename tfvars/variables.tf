variable "instances" {
  type = map

}

variable "domain_name" {
  default = "rrajesh.online"
}

variable "zone_id" {
  default = "Z03795423TULP9T7SQZWH"
}

variable "common_tags" {
  default = {
    project   = "expense"
    terraform = "true"
  }
}

variable "tags" {
  type = map 
}

variable "environment" {
}