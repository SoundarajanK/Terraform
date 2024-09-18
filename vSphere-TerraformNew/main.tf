provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server
  datacenter     = var.vsphere_datacenter
  allow_unverified_ssl = true
}
data "vsphere_datacenter" "dc" {}

resource "vsphere_folder" "folder" {
  path     = "/${var.vsphere_datacenter_name}/host/${var.vsphere_cluster_name}/User-VM/"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
  type     = "vm"
}
