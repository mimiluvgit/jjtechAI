resource "azurerm_resource_group" "rg" {
  name     = "jjtechA1NOV20"
  location = "Canada Central"
}

resource "azurerm_resource_group" "new-rg" {
  name     = "jjtechNew20"
  location = "Canada Central"
}


resource "azurerm_storage_account" "sa" {
  name                     = "mimitech2025ai"
  resource_group_name      = azurerm_resource_group.new-rg.name
  location                 = azurerm_resource_group.new-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_account" "sa-backend" {                                                     
  name                     = "mimistorageforbackend20"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_kind              = "blobstorage"
  account_replication_type = "LRS"

  tags = {
    environment = "dev"
  }
}


resource "azurerm_kubernetes_cluster" "mimi-aks" {
  name                = "mimi-tech-aks1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "mimi-tech-aks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}