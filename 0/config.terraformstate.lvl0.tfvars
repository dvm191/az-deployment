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
      GitTfModuleSource   = ""
      GitTfConfigSource   = ""
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