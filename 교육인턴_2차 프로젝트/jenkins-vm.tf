resource "azurerm_virtual_machine" "jenkins" { # Linux 운영체제를 사용하는 VM에 특화된 리소스
  name = "${var.name}-vm-jenkins"
  location = "${var.location}"
  resource_group_name = azurerm_resource_group.test.name
  network_interface_ids = ["${azurerm_network_interface.jenkins_nic.id}"]
  
  vm_size = "Standard_D2s_v3"

  # delete_os_disk_on_termination -> 가상머신이 삭제하면 OS Disk도 같이 삭제할지의 여부
  delete_os_disk_on_termination = true

  # 사용할 이미지 지정
  storage_image_reference {
    publisher  = "Canonical"
    offer      = "UbuntuServer"
    sku        = "18.04-LTS"
    version    = "latest"
  }

  storage_os_disk {
    name = "jenkins-os-disk"
    caching = "ReadWrite"                 # 캐시 사용 여부 
    create_option = "FromImage"           # 디스크 생성 옵션 -> "FromImage" (이미지에서 디스크 생성)
    managed_disk_type = "StandardSSD_LRS" # 중간 성능의 SSD 디스크 사용
  }

  os_profile {
    computer_name = "${var.name}-vm"
    admin_username = "adminuser"
    admin_password = "p@ssw0rd1234"
  }

  os_profile_linux_config {
    # disable_password_authentication -> VM에 대한 SSH 연결에서 암호 인증 여부 (false : 기본값)
    disable_password_authentication = false
  }
}
