# SET variable is used  to create files using  for_each meta argument

variable "paths" {
  type    = set(any)
  default = ["/tmp/Rama", "/tmp/Seetha", "/tmp/Hanuma", "/tmp/Laxmana"]
}

resource "local_file" "my-files" {
  for_each = var.paths
  filename = each.value
  content  = each.value
}