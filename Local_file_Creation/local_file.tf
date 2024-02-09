resource "local_file" "test-file" {
  filename = "../../tmp/test-file.txt"
  content = "This is a test file created "
}
