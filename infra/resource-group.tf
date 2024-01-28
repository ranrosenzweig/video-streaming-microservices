# Creates a resource group for video streaming application in your Azure account.

resource "azurerm_resource_group" "video-streaming" {
  name     = var.app_name
  location = var.location
}