# How to use this lifecycle

The root lifecycle is a service module on the terraform module resource repository. Therefore all you need to do is:

1. Change to the service module directory
2. Run terraform init pointing to the lifecycle backend file
3. Run terraform plan pointing to the lifecycle tfvar file
4. Run terraform apply pointing to the lifecycle tfvar file

```pwsh
# 1
cd az-modules\modules\cloud_blocks\terraformState
# 1.1
Set-Content -Path 'env:ARM_CLIENT_SECRET' -Value <SPN Secret Goes Here>
Set-Content -Path 'env:ARM_CLIENT_ID' -Value 728a254f-6140-4fb4-bc20-cdc5509a543e
Set-Content -Path 'env:ARM_TENANT_ID' -Value 6cf3e972-5740-433e-9b79-f28fd42d7a76
Set-Content -Path 'env:ARM_SUBSCRIPTION_ID' -Value 1eb32a95-0574-4a72-a4e9-a5e833b055c0
# 2
terraform init -backend-config=terraform init -backend-config="..\..\..\..\az-deployment\0\backend.terraformstate.lvl0.hcl"
# 3
terraform plan -var-file="..\..\..\..\az-deployment\0\config.terraformstate.lvl0.tfvars"
# 4
terraform apply -var-file="..\..\..\..\az-deployment\0\config.terraformstate.lvl0.tfvars"
```