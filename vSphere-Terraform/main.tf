provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "s360-m01-dc01"
}

resource "vsphere_folder" "folder" {
  path          = var.vsphere_folder
  type          = "vm"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
