resource "vsphere_virtual_machine" "vmm" {
  name             = "VM www"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  folder           = "yoldez nouira"
  datastore_id     = data.vsphere_datastore.datastore.id

  clone {
    template_uuid = "Template windows"
  }

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = "disk0"
    size  = 20
  }

  cdrom {
    datastore_id = data.vsphere_datastore.datastore.id
    path         = "ISO/Windows-Server-2022.ISO"
  }
}