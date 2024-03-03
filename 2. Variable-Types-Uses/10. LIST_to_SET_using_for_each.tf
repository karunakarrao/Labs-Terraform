# List of items need to create a file using for_each

variable "class" {
  type    = list(any)
  default = ["/tmp/class1", "/tmp/class2", "/tmp/class3", "/tmp/class4"]
}

# the "for_each" argument must be a map, or set of strings, and you have provided a value of type List, to convert use toset() function.
resource "local_file" "my-class" {
  for_each = toset(var.class)
  filename = each.value
  content  = each.value
}

