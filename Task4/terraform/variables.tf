variable "yc_token" {
  description = "Yandex Cloud OAuth token"
  type        = string
  sensitive   = true
}

variable "yc_cloud_id" {
  description = "Yandex Cloud ID"
  type        = string
}

variable "yc_folder_id" {
  description = "Yandex Cloud Folder ID"
  type        = string
}

variable "yc_zone" {
  description = "Yandex Cloud zone"
  type        = string
  default     = "ru-central1-a"
}

variable "image_name" {
  type    = string
  default = "ubuntu-2204-lts"
}

variable "vm_name" {
  type    = string
  default = "future2-vm"
}

variable "vm_cores" {
  description = "Number of CPU cores for VM"
  type    = number
  default = 4
}

variable "vm_memory" {
  description = "Amount of RAM in GB for VM"
  type    = number
  default = 8
}

variable "vm_disk_size_gb" {
  description = "Boot disk size in GB"
  type        = number
  default     = 30
}

variable "network_name" {
  description = "Name of the VPC network for Future 2.0"
  type        = string
  default     = "future2-vpc-network"
}

variable "subnet_name" {
  description = "Name of the public subnet"
  type        = string
  default     = "future2-subnet"
}

variable "subnet_cidr" {
  description = "IPv4 CIDR blocks for the public subnet"
  type        = list(string)
  default     = ["10.10.0.0/24"]
}

variable "subnet_id" {
  type    = string
  default = "e9bnhrf6d0e1p0dki377"
}

variable "ssh_public_key_path" {
  description = "Path to SSH public key file"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}