# Variables
$resourceGroupName = "YourResourceGroupName"
$storageAccountName = "youruniquestorageacctname" # Storage account names must be unique across Azure
$location = "East US" # Choose an Azure region
$skuName = "Standard_LRS" # Locally redundant storage

# Create a new resource group if it doesn't exist
$resourceGroup = Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue
if (-not $resourceGroup) {
    $resourceGroup = New-AzResourceGroup -Name $resourceGroupName -Location $location
}

# Create the storage account
$storageAccount = New-AzStorageAccount -ResourceGroupName $resourceGroupName `
                                       -Name $storageAccountName `
                                       -Location $location `
                                       -SkuName $skuName `
                                       -Kind "StorageV2"

# Output the storage account details
$storageAccount