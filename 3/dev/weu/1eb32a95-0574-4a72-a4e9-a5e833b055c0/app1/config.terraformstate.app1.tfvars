inputs = {
  values = {    
    instance        = "01"
    workload        = "app"
    region          = "weu"
    complianceLevel = "nongxp"
    stage           = "dev"
    tags = {
      ApplicationName     = "app1"
      ApplicationID       = "app001"
      Qualification       = "nongxp"
      BusinessCriticality = "low"
      Environment         = "dev"
      GitTfModuleSource   = "dvm191/az-modules/modules"
      GitTfConfigSource   = "dvm191/az-deployment/layer-3"
    }
    resourceGroup = [
      {
        index         = "01"
        applicationID = "01"
        lock          = { 
          level = "CanNotDelete"
          notes = "This Resource Group cannot be deleted."          
        }
        description = "Resource Group for terraform state"        
      },
    ]
    virtualNetwork = [
      {
        index                     = "01"
        resourceGroupIndex        = "01"
        applicationID             = "001"        
        addressSpace              = ["10.0.0.0/24"]
        ddosProtectionPlanEnabled = false
      },
    ]
    subnet = [
    {
        index               = "01"
        virtualNetworkIndex = "01"
        applicationID       = "001"
        addressPrefixes = ["10.0.0.0/24"]
    },
    ]
  }
}