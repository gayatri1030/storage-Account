data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_storage_account" "sa" {

  account_replication_type  = var.storage_replication_type
  account_tier              = var.storage_account_tier
  location                  = var.location
  name                      = var.storage_account_name != ""? "${var.storage_account_name}${var.environment}sa" : "${var.app_name}${var.environment}sa"
  resource_group_name       = data.azurerm_resource_group.rg.name
  enable_https_traffic_only = var.storage_account_enable_https_traffic_only
  account_kind              = var.storage_account_kind
  access_tier               = var.storage_account_access_tier
  min_tls_version           = var.storage_account_tls_version
  tags                      = var.tags

  identity {
    type = "SystemAssigned"
  }

}

resource "azurerm_storage_container" "sa-container" {
  depends_on = [
    azurerm_storage_account.sa
  ]
  for_each             = toset(var.create_storage_container ? var.storage_account_blob_container_name : [])
  name                 = each.value
  storage_account_name = azurerm_storage_account.sa.name
}

resource "azurerm_storage_queue" "sa-queue" {
  depends_on = [
    azurerm_storage_account.sa
  ]
  for_each             = toset(var.create_storage_queue ? var.storage_account_queue_name : [])
  name                 = each.value
  storage_account_name = azurerm_storage_account.sa.name
}

resource "azurerm_storage_table" "sa-table" {
  depends_on = [
    azurerm_storage_account.sa
  ]
  for_each             = toset(var.create_storage_table ? var.storage_account_table_name : [])
  name                 = each.value
  storage_account_name = azurerm_storage_account.sa.name
}

resource "azurerm_storage_share" "sa-share" {
  depends_on = [
    azurerm_storage_account.sa
  ]
  for_each             = toset(var.create_storage_share ? var.storage_account_share_name : [])
  name                 = each.value
  storage_account_name = azurerm_storage_account.sa.name
  quota                = var.storage_account_file_share_quota

}

