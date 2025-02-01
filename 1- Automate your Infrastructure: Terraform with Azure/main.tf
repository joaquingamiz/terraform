resource "azurerm_resource_group" "resource_group_testjg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "virtual_network_testjg" {
  name                = "vnetjg"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_group_testjg.name
}

resource "azurerm_subnet" "subnet_testjg" {
  name                 = "subnetjg"
  resource_group_name  = azurerm_resource_group.resource_group_testjg.name
  virtual_network_name = azurerm_virtual_network.virtual_network_testjg.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "net_interfacejg" {
  name                = "nicjg"
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_group_testjg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet_testjg.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "w11jg" {
  name                = "w11jg-vm"
  resource_group_name = azurerm_resource_group.resource_group_testjg.name
  location            = var.location
  size                = "Standard_B2s"
  admin_username      = "adminuser"
  admin_password      = var.admin_password
  network_interface_ids = [azurerm_network_interface.net_interfacejg.id]

  os_disk {
    name              = "osdisk-example"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsDesktop"
    offer     = "windows-11"
    sku       = "win11-22h2-pro"
    version   = "latest"
  }
}
