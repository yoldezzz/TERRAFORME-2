vsphere_user = "yna"
vsphere_password = "2a2DXWrgt9tD35"
vsphere_server = "vc-vstack-017-lab.virtualstack.tn"

#Infrastructure
vsphere_datacenter = "DTX1"
vsphere_host = "esx002-lab-ucs02-dtx1.tn.cloud-temple.lan"
vsphere_compute_cluster = "Clu001-UCS02-PRD"
vsphere_datastore = "ds001-lab-ucs02-svc1-stor3-dtx1"
vsphere_network = "VLAN_LAB"

#VM
vm_template_name = "Template windowss"
vm_guest_id = "windows9_64Guest"
vm_vcpu	= "4"
vm_memory	= "1280"
vm_ipv4_netmask	 = "24"
vm_ipv4_gateway	 = "10.2.1.30"
vm_dns_servers = ["8.8.8.8"]
vm_disk_label  = "disk0"
vm_disk_size  = "128"
vm_disk_thin = "true"
vm_domain	= ""
vm_firmware = "efi"

vms = {
  rocky_test_5 = {
    name                = "VMWD2"
    vm_ip               = "10.2.1.30"
  },
}