

variable "vpc_cidr" {
  type        = string
  description = "Public Subnet CIDR values"
  default     = "172.16.0.0/22"
#   default     = "10.0.0.0/16"
}

variable "cidr_public_subnet" {
  type        = list(string)
  description = "Public Subnet CIDR values"
  default     = ["172.16.0.0/24", "172.16.1.0/24"]
#   default     = ["10.0.1.0/24"]
}

variable "cidr_private_subnet" {
  type        = list(string)
  description = "Private Subnet CIDR values"
  default     = ["172.16.2.0/24", "172.16.3.0/24",]
#   default     = ["10.0.2.0/24"]
}

variable "ap_availability_zone" {
 type        = list(string)
 description = "Availability Zones"
 default     = ["ap-south-1a",]
}
variable "AWS_REGION" {
  default   = "us-east-1"
  type      = string
  sensitive = true
}

variable "AWS_ACCOUNT_ID" {
  default   = "Your aws account number"
  type      = string
  sensitive = true
}