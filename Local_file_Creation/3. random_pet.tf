# Generate random pets & create files with petnames

# creating a random pet using "random" provider and passing pet details into a file. 
resource "random_pet" "my-pet" {}

resource "local_file" "my-pet-details" {
  filename = "/tmp/my-pet-details.txt"
  content  = "My random pet name is '${random_pet.my-pet.id}'"
}

output "pet-id" { value = random_pet.my-pet.id }
output "pet-details" { value = random_pet.my-pet.* } # prints all attributes of my-pet like id, length, prefix, separator
