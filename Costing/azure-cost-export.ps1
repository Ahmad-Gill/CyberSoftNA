# azure-cost-export.ps1
# Author: Ahmad Gill
# Description: Fetches Azure cost and usage data for the last 90 days and saves it as a CSV file.

# --------- CONFIGURATION ---------
$subscriptionId = "6724e37f-1a98-4353-96d3-f11a8d3b45dc"
$outputFile = "azure_cost_report.csv"
# ---------------------------------

# Calculate the last 90 days range
$startDate = (Get-Date).AddDays(-90).ToString("yyyy-MM-dd")
$endDate = (Get-Date).ToString("yyyy-MM-dd")

# Check for Azure CLI
if (-not (Get-Command az -ErrorAction SilentlyContinue)) {
    Write-Host "ERROR: Azure CLI is not installed. Please install it to continue." -ForegroundColor Red
    exit 1
}

# Verify login
try {
    az account show | Out-Null
} catch {
    Write-Host "ERROR: You are not logged into Azure CLI. Run 'az login' first." -ForegroundColor Red
    exit 1
}

# Set subscription
Write-Host "Setting Azure subscription..." -ForegroundColor Cyan
az account set --subscription $subscriptionId

Write-Host "Fetching Azure cost data from $startDate to $endDate..." -ForegroundColor Cyan

# Fetch usage data as JSON
$jsonData = az consumption usage list --start-date $startDate --end-date $endDate --output json

if (-not $jsonData) {
    Write-Host "ERROR: Failed to fetch Azure cost data from az CLI." -ForegroundColor Red
    exit 1
}

# Convert JSON to PowerShell objects
$dataObjects = $jsonData | ConvertFrom-Json

# Prepare objects with needed properties for CSV export
$csvObjects = foreach ($item in $dataObjects) {
    [PSCustomObject]@{
        Date     = $item.usageStartTime  -or $item.usageStart  -or "N/A"
        Resource = $item.instanceName    -or "Unknown"
        Meter    = $item.meterName       -or "Unknown"
        Quantity = $item.quantity
        Cost     = $item.pretaxCost
    }
}

# Export to CSV
try {
    $csvObjects | Export-Csv -Path $outputFile -NoTypeInformation -Encoding UTF8
    Write-Host "Azure cost data saved to: $outputFile" -ForegroundColor Green
} catch {
    Write-Host "Failed to save Azure cost data." -ForegroundColor Red
    exit 1
}
