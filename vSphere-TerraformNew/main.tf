provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "datacenter" {
  name = "S360-MG-DC01"
}

data "vsphere_resource_pool" "pool" {
  name          = "S360-MG-CL01/Mgmt-rp"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "compute_cluster" {
  name          = "S360-MG-CL01"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_folder" "folder" {
  path          = var.folder_name
  type          = "vm"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
  resource_pool_id = data.vsphere_resource_pool.pool.id
}
