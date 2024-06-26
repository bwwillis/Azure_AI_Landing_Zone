terraform {
  # It is recommended to use remote state instead of local
  #backend "local" {}
  # If you are using Azure Storage, You can update these values in order to configure your remote state. backend.conf is not required for local backend.
  #backend "azurerm" {    
  # key                  = "anoa"
  #}

  backend "azurerm" {
    resource_group_name  = "anoa-tfstate-network-artifacts-rg"
    storage_account_name = "anoaterraform"
    container_name       = "tfstate"
    key                  = "anoa.ai.tfstate"
    endpoint             = "https://anoaterraform.blob.core.usgovcloudapi.net/tfstate"
    tenant_id            = "325ad034-a9c4-4349-9b24-1ed7913ef24f"
    subscription_id      = "0f880e51-6682-428b-a00a-40ac2da5bc2d"
    environment          = "usgovernment"
  }

  # If you are using Terraform Cloud, You can update these values in order to configure your remote state.
  /*  backend "remote" {
    organization = "{{ORGANIZATION_NAME}}"
    workspaces {
      name = "{{WORKSPACE_NAME}}"
    }
  }
  */

  required_version = ">= 1.3"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.36"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.0"
    }
    null = {
      source = "hashicorp/null"
    }
    random = {
      version = "= 3.6.0"
      source  = "hashicorp/random"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.11.1"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}
/*
provider "azurerm" {
  subscription_id            = var.subscription_id_hub
  environment                = var.environment
  skip_provider_registration = var.environment == "usgovernment" ? true : false
  features {
    log_analytics_workspace {
      permanently_delete_on_destroy = var.provider_azurerm_features_keyvault.permanently_delete_on_destroy
    }
    key_vault {
      purge_soft_delete_on_destroy = var.provider_azurerm_features_keyvault.purge_soft_delete_on_destroy
    }
    resource_group {
      prevent_deletion_if_contains_resources = var.provider_azurerm_features_resource_group.prevent_deletion_if_contains_resources # When that feature flag is set to true, this is required to stop the deletion of the resource group when the deployment is destroyed. This is required if the resource group contains resources that are not managed by Terraform.
    }
  }
}

provider "azurerm" {
  alias                      = "hub"
  subscription_id            = var.subscription_id_hub
  environment                = var.environment
  skip_provider_registration = var.environment == "usgovernment" ? true : false
  features {
    log_analytics_workspace {
      permanently_delete_on_destroy = var.provider_azurerm_features_keyvault.permanently_delete_on_destroy
    }
    key_vault {
      purge_soft_delete_on_destroy = var.provider_azurerm_features_keyvault.purge_soft_delete_on_destroy
    }
    resource_group {
      prevent_deletion_if_contains_resources = var.provider_azurerm_features_resource_group.prevent_deletion_if_contains_resources # When that feature flag is set to true, this is required to stop the deletion of the resource group when the deployment is destroyed. This is required if the resource group contains resources that are not managed by Terraform.
    }
  }
}

provider "azurerm" {
  alias                      = "identity"
  subscription_id            = coalesce(var.subscription_id_identity, var.subscription_id_hub)
  environment                = var.environment
  skip_provider_registration = var.environment == "usgovernment" ? true : false
  features {
    log_analytics_workspace {
      permanently_delete_on_destroy = var.provider_azurerm_features_keyvault.permanently_delete_on_destroy
    }
    key_vault {
      purge_soft_delete_on_destroy = var.provider_azurerm_features_keyvault.purge_soft_delete_on_destroy
    }
    resource_group {
      prevent_deletion_if_contains_resources = var.provider_azurerm_features_resource_group.prevent_deletion_if_contains_resources # When that feature flag is set to true, this is required to stop the deletion of the resource group when the deployment is destroyed. This is required if the resource group contains resources that are not managed by Terraform.
    }
  }
}

provider "azurerm" {
  alias                      = "operations"
  subscription_id            = coalesce(var.subscription_id_operations, var.subscription_id_hub)
  environment                = var.environment
  skip_provider_registration = var.environment == "usgovernment" ? true : false
  features {
    log_analytics_workspace {
      permanently_delete_on_destroy = var.provider_azurerm_features_keyvault.permanently_delete_on_destroy
    }
    key_vault {
      purge_soft_delete_on_destroy = var.provider_azurerm_features_keyvault.purge_soft_delete_on_destroy
    }
    resource_group {
      prevent_deletion_if_contains_resources = var.provider_azurerm_features_resource_group.prevent_deletion_if_contains_resources # When that feature flag is set to true, this is required to stop the deletion of the resource group when the deployment is destroyed. This is required if the resource group contains resources that are not managed by Terraform.
    }
  }
}

provider "azurerm" {
  alias                      = "devsecops"
  subscription_id            = coalesce(var.subscription_id_devsecops, var.subscription_id_hub)
  environment                = var.environment
  skip_provider_registration = var.environment == "usgovernment" ? true : false
  features {
    log_analytics_workspace {
      permanently_delete_on_destroy = var.provider_azurerm_features_keyvault.permanently_delete_on_destroy
    }
    key_vault {
      purge_soft_delete_on_destroy = var.provider_azurerm_features_keyvault.purge_soft_delete_on_destroy
    }
    resource_group {
      prevent_deletion_if_contains_resources = var.provider_azurerm_features_resource_group.prevent_deletion_if_contains_resources # When that feature flag is set to true, this is required to stop the deletion of the resource group when the deployment is destroyed. This is required if the resource group contains resources that are not managed by Terraform.
    }
  }
}
*/