# Generate random pets & create files with pet names

# Generate 10 random pet names
resource "random_pet" "my_pets" {
  count = 20
}

# Create a file for each pet in the /tmp folder
resource "local_file" "pet_files" {
  count    = length(random_pet.my_pets)
  filename = "/tmp/${random_pet.my_pets.*.id[count.index]}.txt"
  content  = random_pet.my_pets.*.id[count.index]
}
