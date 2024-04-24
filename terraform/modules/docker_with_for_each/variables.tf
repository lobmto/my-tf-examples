variable "image_names" {
  type        = map(string)
  description = "Dockerのイメージ名"
  default = {
    first  = "nginx:latest",
    second = "nginx:latest"
  }
}
