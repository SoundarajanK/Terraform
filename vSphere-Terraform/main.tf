provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server
}

resource "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter_name
}

resource "vsphere_cluster" "cluster" {
  name             = var.vsphere_cluster_name
  datacenter_id    = vsphere_datacenter.dc.id
  resource_pool_id = vsphere_datacenter.dc.resource_pool_id
}

resource "vsphere_folder" "folder" {
  name          = var.vsphere_folder_name
  path          = var.vsphere_folder_path
  datacenter_id = vsphere_datacenter.dc.id
  type          = "Folder"
  parent_folder_id = vsphere_cluster.cluster.id
}
