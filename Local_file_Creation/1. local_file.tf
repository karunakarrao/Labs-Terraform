# using "local" provider to create a local file

# create a test-file using the resouce "local_file"
resource "local_file" "test-file" {
  filename = "/tmp/test-file.txt"
  content  = "This is a test file created "
}
