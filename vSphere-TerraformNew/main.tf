data "vsphere_compute_cluster" "cluster" {
  name              = "${var.vsphere_vm_compute_cluster}"
  datacenter_id     = "${data.vsphere_datacenter.dc.id}"
}
