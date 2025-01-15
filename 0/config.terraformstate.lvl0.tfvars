inputs = {
  values = {    
    instance        = "0"
    workload        = "trs"
    region          = "weu"
    complianceLevel = "gxp"
    stage           = "dev"
    tags = {
      ApplicationName     = "Terraform Remote State"
      ApplicationID       = "TRS0"
      Qualification       = "gxp"
      BusinessCriticality = "low"
      Environment         = "dev"
      GitTfModuleSource   = "ccoe-az-tf-module-resources/modules/ccoe/terraformState"
      GitTfConfigSource   = "ccoe-az-tf-deployment-lvl0/devbnt/platform/management/dev-bnt-azr-001/weu/terraformState/dev/config.terraformState.lvl0.tfvars"
    }
    resourceGroup = [
      {
        index         = "01"
        applicationID = "0"
        lock          = { 
          level = "CanNotDelete"
          notes = "This Resource Group cannot be deleted."          
        }
        description = "Resource Group for terraform state"        
      },
    ]
    keyVault = [
      {        
        index                    = "01"
        resourceGroupIndex       = "01"
        applicationID            = "0"
        enabledForDiskEncryption = false
        enableRbacAuthorization  = true
        purgeProtectionEnabled   = true
        networkAcls = {
          defaultAction           = "Deny"
          bypass                  = "AzureServices"
          ipRules                 = []
          virtualNetworkSubnetIds = []
        }
        privateEndpoint = {
          privateLinkSubnetId = "/subscriptions/4c38dc84-aafd-4c68-8127-42c806cf6a3d/resourceGroups/rg01-trc-001-weu-nongxp-dev/providers/Microsoft.Network/virtualNetworks/vnet01-trc001-weu-nongxp-dev/subnets/sub01-trc-001-weu-nongxp-dev-states"
          privateDnsZoneId    = ["/subscriptions/af6cb0d6-1a06-4fb5-af80-d941684f8e62/resourceGroups/rg001-dnszonesglobal-001-weu-gxp-dev/providers/Microsoft.Network/privateDnsZones/privatelink.vaultcore.azure.net"]
        }
        lock = { 
          level = "CanNotDelete"
          notes = "This Resource Group cannot be deleted."          
        }        
      }, 
    ]
    storageAccount = [
      {
        index                           = "01"
        keyVaultIndex                   = "01"
        resourceGroupIndex              = "01"
        applicationID                   = "0"
        accountReplicationType          = "RAGRS"
        infrastructureEncryptionEnabled = true
        customerManagedKey              = true
        customerManagedKeyRbac          = true
        sharedAccessKeyEnabled          = false
        localUserEnabled                = false
        networkRules = {
          defaultAction           = "Deny"
          bypass                  = ["AzureServices"]
        }
        privateEndpoint = {
          privateLinkSubnetId = "/subscriptions/4c38dc84-aafd-4c68-8127-42c806cf6a3d/resourceGroups/rg01-trc-001-weu-nongxp-dev/providers/Microsoft.Network/virtualNetworks/vnet01-trc001-weu-nongxp-dev/subnets/sub01-trc-001-weu-nongxp-dev-states"
          blobPrivateDnsZoneId  = ["/subscriptions/af6cb0d6-1a06-4fb5-af80-d941684f8e62/resourceGroups/rg001-dnszonesglobal-001-weu-gxp-dev/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net"]
        }
        lock = { 
          level = "CanNotDelete"
          notes = "This Resource Group cannot be deleted."          
        }
        blobProperties = {
          versioningEnabled     = true
          changeFeedEnabled     = true
          lastAccessTimeEnabled = true
        }
        container = [
          {
            name                = "tfstate"
            containerAccessType = "private"
          },
        ]       
      },
    ]
  }
}