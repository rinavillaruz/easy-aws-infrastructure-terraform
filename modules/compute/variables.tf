variable "public_subnet_cidrs" {
  type = list(string)
  default = [ "10.0.1.0/24" ]
}

variable "public_instance_private_ip" {
  type = string
  default = "10.0.1.10"
}

variable "private_instance_private_ips" {
  type = list(string)
  default = [ "10.0.2.10", "10.0.3.10" ]
}

// FROM other modules
variable "vpc_id" {
  type = string
}

variable "private_subnets" {
  type = any
}

variable "public_subnets" {
  type = any
}

variable "public_security_group_id" {
  type = string
}

variable "private_security_group_id" {
  type = string
}

variable "tls_private_key_pem" {
  type = string
  sensitive = true
}

variable "key_pair_name" {
  type = string
}