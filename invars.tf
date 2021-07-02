
variable "server_name" {
   description = "Project name of web server (optional)"
   default = "hcloud-terraform"
}

variable "server_image" {
   description = "OS image (optional)"
   default = "debian-10"
}

variable "server_type" {
   description = "HCloud plan (optional)"
   default = "cx11"
}

variable "datacenter" {
   description = "Hetzner Data Center (optional)"
   default = "nbg1-dc3"
}

variable "ssh_key" {
   description = "SSH public key for root user (required)"
}

variable "userdata" {
   description = "cloud-init user data block (required)"
}

