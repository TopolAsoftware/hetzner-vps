########################################################################
###
### terraform-hetzner-webserver script
### 2021 (c) Oleg Vlasenko, MIT License
###
########################################################################
########################################################################
### terraform requires declaration of required providers
###

terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud" 
    }
 }
}
########################################################################
### Create Hetzner Cloud VPS
###

resource "hcloud_server" "vps" {
  name        = var.server_name
  image       = var.server_image
  server_type = var.server_type
  datacenter  = var.datacenter
  user_data   = var.userdata
  ssh_keys    = var.ssh_key

  public_net {
    ipv4_enabled = var.ipv4_enabled
    ipv6_enabled = var.ipv6_enabled
  }
}

########################################################################
### Set reverse record
###

resource "hcloud_rdns" "ptr4" {
  count = var.server_domain == "" || var.ipv4_enabled != true ? 0 : 1

  server_id  = hcloud_server.vps.id
  ip_address = hcloud_server.vps.ipv4_address
  dns_ptr    = var.server_domain
}

resource "hcloud_rdns" "ptr6" {
  count = var.server_domain == "" || var.ipv6_enabled != true ? 0 : 1

  server_id  = hcloud_server.vps.id
  ip_address = hcloud_server.vps.ipv6_address
  dns_ptr    = var.server_domain
}


########################################################################
