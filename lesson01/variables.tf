variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "TF-INS"
}


variable "ami" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ami-09e67e426f25ce0d7"
}

variable "ingress_rules" {
  type = list(number)
  default = ["80", "443","22"]
}
