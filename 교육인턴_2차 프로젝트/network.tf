# Virtual Network Setting
resource "azurerm_virtual_network" "test" {
  name                  = "${var.name}-net"                             # VNet Name
  location              = "${azurerm_resource_group.test.location}"     # VNet Region
  resource_group_name   = "${azurerm_resource_group.test.name}"         # VNet이 속할 RG 지정
  address_space         = [ "${var.vnet_address_space}" ]
}

# "azurerm_virtual_network.test" Subnet Setting
resource "azurerm_subnet" "aks" {       # AKS Subnet
  name = "${var.name}-aks-subnet"                                       # AKS Subnet Name
  resource_group_name = azurerm_resource_group.test.name                # Subnet이 속할 RG 지정
  virtual_network_name = azurerm_virtual_network.test.name              # Subnet이 속한 VNet 지정
  address_prefixes = [ "${var.vnet_aks_subnet_space}" ]                 # Subnet에서 사용할 IP 주소 범위 지정
}

resource "azurerm_subnet" "agw" {       # AGW Subnet
  name = "${var.name}-agw-subnet"
  resource_group_name = azurerm_resource_group.test.name
  virtual_network_name = azurerm_virtual_network.test.name
  address_prefixes = [ "${var.vnet_agw_subnet_space}" ]
}

resource "azurerm_subnet" "cicd" {      # CICD Subnet
  name = "${var.name}-cicd-subnet"
  resource_group_name = azurerm_resource_group.test.name
  virtual_network_name = azurerm_virtual_network.test.name
  address_prefixes = [ "${var.vnet_cicd_subnet_space}" ]
}

# Public IP
resource "azurerm_public_ip" "Public_IP" {
  name = "jenkins-public-ip"
  location = "${var.location}"
  resource_group_name = azurerm_resource_group.test.name
  allocation_method = "Dynamic"
}

# NIC Setting
resource "azurerm_network_interface" "jenkins_nic" {
  name = "${var.name}-nic"
  location = "${var.location}"
  resource_group_name = azurerm_resource_group.test.name

  ip_configuration {
    name = "jenkins-ip-config"
    subnet_id = azurerm_subnet.cicd.id
    public_ip_address_id = azurerm_public_ip.Public_IP.id
    private_ip_address_allocation = "Dynamic"
  }
}