provider "proxmox" {
  pm_api_url = "https://<your-proxmox-host>:8006/api2/json"
  pm_user = "<your-proxmox-user>"
  pm_password = "<your-proxmox-password>"
  pm_tls_insecure = true # Set to false if using SSL certificates
}

resource "proxmox_vm_qemu" "example_vm" {
  name = "example-vm"
  target_node = "pve"
  memory = 2048
  cores = 2
  sockets = 1
  os_type = "l26"
  scsihw = "virtio-scsi-pci"
  disk {
    id = 0
    size = "10G"
    type = "scsi"
    storage = "local"
  }
  network {
    id = "net0"
    model = "virtio"
    bridge = "vmbr0"
    mac = "00:11:22:33:44:55"
    ip = "192.168.1.100/24"
    gateway = "192.168.1.1"
  }
}
