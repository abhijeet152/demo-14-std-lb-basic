# create resource group
resourceGroup="MyResourceGroup"
storageAccount="mystorageaccount20260123"
location="eastus"

az group create \
  --name $resourceGroup \
  --location $location

# create storage account
az storage account create \
  --name $storageAccount \
  --resource-group $resourceGroup \
  --location $location \
  --sku Standard_LRS

# create container in storage account
az storage container create \
  --name mycontainer \
  --account-name $storageAccount  

