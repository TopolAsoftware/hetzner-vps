########################################################################
###
### terraform-hetzner-webserver script
### 2021 (c) Oleg Vlasenko, MIT License
###
########################################################################
########################################################################
### Create Hetzner Cloud VPS
###

resource "hcloud_server" "vps" {
  name        = var.server_name
  image       = var.server_image
  server_type = var.server_type
  datacenter  = var.datacenter
  user_data   = var.userdata
  ssh_keys    = [var.ssh_key]
}

########################################################################
