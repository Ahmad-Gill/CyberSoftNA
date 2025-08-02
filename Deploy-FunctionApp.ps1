param (
    [string]$FunctionAppName = "samplePOCC",
    [string]$FunctionAppPath = "D:\synapticflow\Synapticflow_fa_ClientRelease"
)
az login
Set-Location -Path $FunctionAppPath
func azure functionapp publish $FunctionAppName --python
Write-Host "Deployment complete."
