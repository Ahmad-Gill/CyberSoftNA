az login

"ResourceGroup,AppServiceName,AppServicePlan" | Out-File appservices.csv

$apps = az webapp list --query "[].{name:name, rg:resourceGroup}" -o tsv

$apps -split "`n" | ForEach-Object {
    $parts = $_ -split "`t"
    if ($parts.Length -eq 2) {
        $name = $parts[0]
        $rg = $parts[1]

        try {
            $planId = az webapp show --name $name --resource-group $rg --query "appServicePlanId" -o tsv
            if ($planId) {
                $planName = ($planId -split "/")[-1]
            } else {
                $planName = "None"
            }

            "$rg,$name,$planName" | Out-File appservices.csv -Append
            Write-Host "$rg | $name | $planName"
        }
        catch {
            "$rg,$name,ERROR" | Out-File appservices.csv -Append
            Write-Host "Error getting plan for $name in $rg"
        }
    }
}

Write-Host "Done! File saved as appservices.csv"
