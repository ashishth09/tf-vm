resource "ibm_compute_ssh_key" "mykey" {
  label      = "${var.ssh_pub_key_label}"
  public_key = "${var.ssh_pub_key}"
}

resource "ibm_compute_vm_instance" "debian_small_virtual_guest" {
  os_reference_code    = "DEBIAN_7_64"
  domain               = "${var.schematics_environment == "1" ? var.vm_domain_names["schematics"] : var.vm_domain_names["basetf"]}"
  datacenter           = "dal06"
  network_speed        = 10
  hourly_billing       = true
  private_network_only = false
  local_disk           = false
  cores                = 1
  memory               = 1024
  disks                = [25]
  tags                 = "${var.tags}"

  user_metadata = "${var.user_metadata}"

  dedicated_acct_host_only = true
  ssh_key_ids              = ["${ibm_compute_ssh_key.mykey.id}"]
  secondary_ip_count       = 4
}
