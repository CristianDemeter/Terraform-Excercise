variable "environment_char" {
  type = string
}

variable "environment" {
  type = string
}

variable "s3" {
  type = object(
    {
      bucket = map(map(string))
    }
  )
}