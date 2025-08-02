# Azure Resource Group Cost - Month to Date
az login

# Set your resource group name
$resourceGroupName = "RG-PAPICARE-DEV-CUS"

# Get current subscription ID
$subscriptionId = az account show --query "id" -o tsv

# Set date range (1st of this month to today)
$firstDay = (Get-Date -Day 1).ToString("yyyy-MM-dd")
$today = (Get-Date).ToString("yyyy-MM-dd")

# Run cost query
$costJson = az costmanagement query `
    --type Usage `
    --scope "/subscriptions/$subscriptionId/resourceGroups/$resourceGroupName" `
    --timeframe Custom `
    --time-period-from $firstDay `
    --time-period-to $today `
    --query "properties.rows[0][0]" `
    -o tsv

# Convert and format
if ($costJson) {
    $totalCost = [math]::Round([double]$costJson, 2)
    Write-Host " Total cost from $firstDay to $today for resource group '$resourceGroupName': $$totalCost"
} else {
    Write-Host " No cost data found for '$resourceGroupName' between $firstDay and $today"
}
