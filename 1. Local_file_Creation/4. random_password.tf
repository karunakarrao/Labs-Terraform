# provider random with other useful resouces types

# Generate random password using the "random_password" 
resource "random_password" "password" {
  length = 16
}

resource "local_file" "password-details" {
  filename = "/tmp/password.txt"
  content  = random_password.password.result
}

output "password" {
  value     = random_password.password.result # This is a sensitive data, we can't display as output.
  sensitive = true
}
