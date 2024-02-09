resource "local_sensitive_file" "test-sensitive-file" {
  filename = "../../tmp/test-sensitive-file.txt"
  content = "this file is a sensitive file so the data is not visible in STDOUT logs"
}