# provider random with other useful resouces types
resource "random_password" "password" {
  length = 16
}

resource "random_string" "random" {
  length  = 8
  special = false # this will not include special charecters.
}

resource "random_uuid" "uuid" {
}

resource "local_file" "password-details" {
  filename = "/tmp/password-${random_uuid.uuid.id}.txt"
  content  = random_password.password.result
}

output "password" {
  value     = random_password.password.result # This is a sensitive data, we can't display as output.
  sensitive = true
}
output "string" {
  value = random_string.random.id
}
output "uuid" {
  value = random_uuid.uuid.id
}