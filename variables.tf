variable "resource_group_name" {
  type = string
  description = "Resource Group Name where the storage account will be created"
}

variable "app_name" {
  default = ""
}

variable "location" {
  type = string
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created"
}

variable "environment" {
  type = string
  description = "Specifies the environment name"
}

variable "storage_account_name" {
  type = string
  description = "Specifies the name of the storage account preifx with the specified environment. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group."
}

variable "storage_replication_type" {
  type = string
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS"
}

variable "storage_account_tier" {
  type = string
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Changing this forces a new resource to be created."
}

variable "storage_account_kind" {
  type = string
  description = "Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Changing this forces a new resource to be created. Defaults to StorageV2"
}

variable "storage_account_enable_https_traffic_only" {
  type = bool
  default = true
  description = "Boolean flag which forces HTTPS if enabled, see here for more information. Defaults to true."
}

variable "storage_account_access_tier" {
  type = string
  default = "Hot"
  description = "Defines the access tier for BlobStorage, FileStorage and StorageV2 accounts. Valid options are Hot and Cool, defaults to Hot"
}

variable "storage_account_tls_version" {
  type = string
  default = "TLS1_0"
  description = "The minimum supported TLS version for the storage account. Possible values are TLS1_0, TLS1_1, and TLS1_2. Defaults to TLS1_0 for new storage accounts"
}

variable "tags" {
  type = map(string)
  description = "Tags to apply to the created resource"
}

variable "create_storage_container" {
  type = bool
  description = ""
}

variable "storage_account_blob_container_name" {
  type = list(string)
  description = ""
}

variable "create_storage_queue" {
  type = bool
  default = false
  description = ""
}

variable "storage_account_queue_name" {
  type = list(string)
  description = ""
}

variable "create_storage_table" {
  type = bool
  default = false
  description = ""
}

variable "storage_account_table_name" {
  type = list(string)
  description = ""
}

variable "create_storage_share" {
  type = bool
  default = false
  description = ""
}

variable "storage_account_share_name" {
  type = list(string)
  description = ""
}

variable "storage_account_file_share_quota" {
  type = number
  description = ""
}