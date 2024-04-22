variable "image_name" {
  type        = string
  description = "Dockerのイメージ名"
  default     = "nginx:latest"
}

variable "external_port" {
  type        = list(number)
  description = "Dockerの公開ポート番号"
  default     = [8080, 8081]

  validation {
    condition = alltrue([
      for port in var.external_port : port >= 8080 && port <= 8090
    ])
    error_message = "ポート番号は8080〜8090で指定してください（例）"
  }
}
