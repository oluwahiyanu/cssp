#!/bin/bash
set -e

# Set variables
resourceGroup="myresourceGroup"
location="westus"
storageAccount="staticweb$RANDOM"

# Create Resource Group (i alread have a resource group)
# az group create --name $resourceGroup --location $location

# Create Storage Account
az storage account create \
  --name $storageAccount \
  --location $location \
  --resource-group $resourceGroup \
  --sku Standard_LRS \
  --kind StorageV2

# Enable Static Website Hosting
az storage blob service-properties update \
  --account-name $storageAccount \
  --static-website \
  --index-document index.html \
  --404-document 404.html

# Get connection string
connectionString=$(az storage account show-connection-string \
  --name $storageAccount \
  --resource-group $resourceGroup \
  --query connectionString -o tsv)

# Upload site files
az storage blob upload-batch \
  --account-name $storageAccount \
  --destination \$web \
  --source "./StaticWebPage" \
  --connection-string "$connectionString"

# Print site link
endpoint=$(az storage account show \
  --name $storageAccount \
  --resource-group $resourceGroup \
  --query "primaryEndpoints.web" -o tsv)

echo "✅ Website deployed at: $endpoint"