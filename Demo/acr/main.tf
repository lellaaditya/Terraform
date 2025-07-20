resource "azurerm_resource_group" "example" {
  name     = "aditya"
  location = "South India"
}

resource "azurerm_container_registry" "acr" {
  name                = "adityaworldacr"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku                 = "Premium"
  admin_enabled       = false
  georeplications {
    location                = "Central India"
    zone_redundancy_enabled = true
    tags                    = {}
  }
}  
