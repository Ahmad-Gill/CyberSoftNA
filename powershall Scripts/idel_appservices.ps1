az login
"ResourceGroup,AppServiceName,State" | Out-File stopped-apps.csv -Encoding UTF8

$apps = az webapp list --query "[].{name:name, rg:resourceGroup}" -o tsv

$apps -split "`n" | ForEach-Object {
    $parts = $_ -split "`t"
    if ($parts.Length -eq 2) {
        $name = $parts[0]
        $rg = $parts[1]

        try {
            $state = az webapp show --name $name --resource-group $rg --query "state" -o tsv
            if ($state -eq "Stopped") {
                "$rg,$name,$state" | Out-File stopped-apps.csv -Append -Encoding UTF8
                Write-Host "STOPPED: $rg | $name" -ForegroundColor Red
            }
        }
        catch {
            Write-Warning "Failed to check $name in $rg"
        }
    }
}

Write-Host "`n✅ Done! Stopped apps saved to: stopped-apps.csv"
