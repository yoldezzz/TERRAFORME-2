provider "vsphere" {
  user                 = "yna"
  password             = "2a2DXWrgt9tD35"
  vsphere_server       = "vc-vstack-017-lab.virtualstack.tn"
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "datacenter" {
  name = var.datacenter
}
data "vsphere_datastore" "datastore" {
  name          = var.datastore
  datacenter_id = data.vsphere_datacenter.datacenter.id
}
data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster
  datacenter_id = data.vsphere_datacenter.datacenter.id
}
data "vsphere_network" "network" {
  name          = var.network_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}


data "vsphere_virtual_machine" "template" {
  name          = var.template
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_virtual_machine" "vm" {
  name             = "R VM W"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  folder = "yoldez nouira"
  datastore_id     = data.vsphere_datastore.datastore.id
  
  guest_id     = "Windows_64Guest"
  num_cpus = 4
  memory   = 400
  clone {
     template_uuid = data.vsphere_virtual_machine.template.id
     customize {
      windows_options {
        computer_name = "vmt"
      }
      network_interface {
        ipv4_address = "10.2.1.30"
        ipv4_netmask = 24
        dns_server_list = ["8.8.8.8"]  
      }
      
    ipv4_gateway = "10.2.1.254"
    }
  }
   network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = "vmxnet3" 
  }
 
  disk {
  label = "disk0"
  size  = 50
  thin_provisioned = false
 
  }
 
 cdrom {
   datastore_id     = data.vsphere_datastore.datastore.id
    path = "ISO/Windows-Server-2022.ISO"
}
}


