provider "vsphere" {

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "S360-MG-DC01"
}

data "vsphere_datastore" "datastore" {
  name          = "S360-MG-VSAN01"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "pg-dvmg-dc01-WL-vLAN3241"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_virtual_machine" "vm" {
  name             = var.vm_name
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = 1
  memory   = 1024
  guest_id = "CentOS7-CloudInit"

  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }

  disk {
    label = "disk0"
    size  = 10
  }

  wait_for_guest_net_timeout    = -1
}
