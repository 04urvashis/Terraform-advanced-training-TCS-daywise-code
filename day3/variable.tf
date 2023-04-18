variable "instance_count" {
  type    = number
  default = 2

}
variable "enable_public_id" {
  type    = bool
  default = true

}

variable "project_tags" {
  type = map(string)
  default = {
    "Name"       = "ec2-instance"
    "project"    = "project-beta"
    "enviroment" = "dev"
  }

}