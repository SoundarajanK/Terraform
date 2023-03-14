provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server
}

resource "vsphere_folder" "my_folder" {
  path     = "/${var.vsphere_datacenter_name}/host/${var.vsphere_cluster_name}/vm/"
  name     = "MyFolder"
  type     = "Folder"
}
