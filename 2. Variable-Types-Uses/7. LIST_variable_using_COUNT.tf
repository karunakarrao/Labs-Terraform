# Loop  the LIST variable using COUNT meta argument.

variable "users" {
  type    = list(any)
  default = ["/home/Rama", "/home/Seetha", "/home/Hanuma", "/home/Laxmana"]
}

resource "local_file" "users-path" {
  count    = length(var.users)
  filename = var.users[count.index]
  content  = "This file is for user ${var.users[count.index]}"
}