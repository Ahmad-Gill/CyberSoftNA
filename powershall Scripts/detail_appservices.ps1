# Requires: Azure CLI installed and logged in
az login

# Output CSV header (includes Location)
"ResourceGroup,AppServiceName,AppServicePlan,OS,SKU,Stack,State,Location,DefaultDomain,AvgCPU(%),AvgMemory(MB)" | Out-File "AppServices_Report.csv" -Encoding utf8

# Get friendly stack name
function Get-FriendlyStackName($config) {
    $fx = $null
    if ($config.linuxFxVersion) {
        $fx = $config.linuxFxVersion
    } elseif ($config.windowsFxVersion) {
        $fx = $config.windowsFxVersion
    }

    if ($fx) {
        if ($fx -like "DOTNETCORE*") { return ".NET Core " + ($fx -replace "DOTNETCORE\|?", "") }
        if ($fx -like "DOTNET*")      { return ".NET " + ($fx -replace "DOTNET\|?", "") }
        if ($fx -like "NODE*")        { return "Node.js " + ($fx -replace "NODE\|?", "") }
        if ($fx -like "PHP*")         { return "PHP " + ($fx -replace "PHP\|?", "") }
        if ($fx -like "PYTHON*")      { return "Python " + ($fx -replace "PYTHON\|?", "") }
        if ($fx -like "JAVA*")        { return "Java " + ($fx -replace "JAVA\|?", "") }
        return $fx
    }

    if ($config.netFrameworkVersion) {
        $version = $config.netFrameworkVersion -replace "[vV]", ""
        if ([version]$version -lt [version]"5.0") {
            return ".NET Framework $version"
        } else {
            return ".NET $version"
        }
    }

    if ($config.nodeVersion)    { return "Node.js " + $config.nodeVersion }
    if ($config.phpVersion)     { return "PHP " + $config.phpVersion }
    if ($config.pythonVersion)  { return "Python " + $config.pythonVersion }

    return "Unknown"
}

# Get all App Services
$apps = az webapp list --query "[].{name:name, rg:resourceGroup}" -o tsv

# Loop through each App Service
$apps -split "`n" | ForEach-Object {
    $parts = $_ -split "`t"
    if ($parts.Length -eq 2) {
        $name = $parts[0]
        $rg = $parts[1]

        try {
            $webapp = az webapp show --name $name --resource-group $rg -o json | ConvertFrom-Json
            $config = az webapp config show --name $name --resource-group $rg -o json | ConvertFrom-Json

            $planId = $webapp.appServicePlanId
            $planName = ($planId -split "/")[-1]
            $plan = az appservice plan show --ids $planId -o json | ConvertFrom-Json

            $os = if ($plan.kind -like "*linux*") { "Linux" } else { "Windows" }
            $sku = $plan.sku.name
            $stack = Get-FriendlyStackName $config
            $state = $webapp.state
            $domain = $webapp.defaultHostName
            $location = $webapp.location
            $resourceId = $webapp.id

            # Time range for last 30 days
            $start = (Get-Date).AddDays(-30).ToString("s") + "Z"
            $end = (Get-Date).ToString("s") + "Z"

            # CPU (seconds -> %)
            $cpuRaw = az monitor metrics list `
                --resource $resourceId `
                --metric "CpuTime" `
                --start-time $start --end-time $end `
                --interval PT1H --aggregation Average `
                --query "value[0].timeseries[0].data[].average" -o tsv
            $cpuAvg = ($cpuRaw | Measure-Object -Average).Average
            $cpu = if ($cpuAvg) { [math]::Round($cpuAvg * 100 / 3600, 2) } else { 0 }

            # Memory (bytes -> MB)
            $memRaw = az monitor metrics list `
                --resource $resourceId `
                --metric "MemoryWorkingSet" `
                --start-time $start --end-time $end `
                --interval PT1H --aggregation Average `
                --query "value[0].timeseries[0].data[].average" -o tsv
            $memAvg = ($memRaw | Measure-Object -Average).Average
            $memory = if ($memAvg) { [math]::Round($memAvg / 1MB, 2) } else { 0 }

            # Output to CSV
            "$rg,$name,$planName,$os,$sku,$stack,$state,$location,$domain,$cpu,$memory" | Out-File "AppServices_Report.csv" -Append -Encoding utf8
            Write-Host "$name processed."
        }
        catch {
            Write-Host "Error processing $name in $rg"
        }
    }
}

Write-Host "Report written to AppServices_Report.csv"
