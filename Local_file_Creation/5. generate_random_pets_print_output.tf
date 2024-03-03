# Generate  multipule random pets print as output
provider "random" {}

# Note: The "count" object can only be used in "module", "resource", and "data" blocks, and only when the "count" argument is set.
resource "random_pet" "pet" {
  count = 10
}

output "pet_names_output" {
  value = [for i in random_pet.pet : i.id]
}