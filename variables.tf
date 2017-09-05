variable "schematics_environment" {
  default = true
}

variable "ssh_pub_key" {
  type    = "string"
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDhCFCB4BAqZ40rL7EtJ9ODFMWQfks4Pxw/m5FOVSO4mAFp6ocpAMeweAbiMexzyW/ot8y5pqZjL0h4lmZbjJcJnMNpYV3QAfSXUFDIDEpOvQmaqS5U9gWMEoUiRjVaW/bsTOmqRCsjibPJ/v9wdbr7vH9ynetxWaabwqGzY9UrRA9Fft37IFmei1En5YfIKruze6tBkCyqOgrR6upbS8wvNAJY2hiDPpB9QKCoQNuU4qdvOx/kWIAh6AhQZArfxGNxicuMtxCaesgC89N3PaoiX9ubO3r37dTPOsNk2psdpupgaayStKgv+A3uwS/YFtulKt9nNpJa9Axn5cuGfwHt akthakur@Ashishs-MacBook-Pro.local"
}

#Plain string variable
variable "ssh_pub_key_label" {
  type    = "string"
  default = "mydefaultlabel"
}

# List variable
variable "tags" {
  type        = "list"
  description = "tags for tagging the VM"
  default     = ["tag1", "tag2"]
}

# Multi-line heredoc 
variable "user_metadata" {
  type = "string"

  default = <<EOF
	{
		"value": "new value"
	}
EOF
}

# Map variable
variable "vm_domain_names" {
  type = "map"

  default = {
    schematics = "schematics.ibm.com"
    basetf     = "terraform.ibm.com"
  }
}
