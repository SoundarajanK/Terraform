provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {}

data "vsphere_resource_pool" "resource_pool" {
  name              = "/${var.vsphere_vm_datacenter}/host/${var.vsphere_vm_compute_cluster}/Resources/${var.vsphere_vm_resource_pool}"
  datacenter_id     = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_folder" "folder" {
  path          = var.folder_name
  type          = "vm"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
  resource_pool_id    = "${data.vsphere_resource_pool.resource_pool.id}"
}
