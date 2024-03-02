
# We are using "local" provider and creating a local testfile using "local_file" resouce.

resource "local_file" "test-file" {
  filename = "/tmp/test-file.txt"
  content  = "This is a test file created "
}
