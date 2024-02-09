resource "random_pet" "my-pet" {
}

resource "local_file" "my-pet-details" {
  filename = "../../tmp/my-pet-details.txt"
# we are refering the random pet information in the my-pet-details.txt
  content = "My random pet name is '${random_pet.my-pet.id}'"
}