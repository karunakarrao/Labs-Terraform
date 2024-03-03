# MAP variable is used to create files for customers.

variable "customers" {
  type = map(string)
  default = {
    Rama    = "/home/Rama"
    Seetha  = "/home/Seetha"
    Hanuma  = "/home/Hanuma"
    Laxmana = "/home/Laxmana"
  }
}

resource "local_file" "cust-path" {
  for_each = var.customers

  filename = each.value
  content  = "This file is for user ${each.key}"
}