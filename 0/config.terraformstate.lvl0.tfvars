inputs = {
  values = {    
    instance        = "1"
    workload        = "tfstate"
    region          = "weu"
    complianceLevel = "nongxp"
    stage           = "dev"
    tags = {
      ApplicationName     = "Terraform Remote State"
      ApplicationID       = "TRS0"
      Qualification       = "gxp"
      BusinessCriticality = "low"
      Environment         = "dev"
      GitTfModuleSource   = "dvm191/az-modules/modules"
      GitTfConfigSource   = "dvm191/az-deployment/layer-0"
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
        purgeProtectionEnabled   = false
        networkAcls = {
          defaultAction           = "Deny"
          bypass                  = "AzureServices"
          ipRules                 = []
          virtualNetworkSubnetIds = []
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
        infrastructureEncryptionEnabled = false
        customerManagedKey              = false
        customerManagedKeyRbac          = false
        sharedAccessKeyEnabled          = true
        localUserEnabled                = false
        allowNestedItemsToBePublic      = true
        networkRules = {
          defaultAction           = "Deny"
          bypass                  = ["AzureServices"]
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