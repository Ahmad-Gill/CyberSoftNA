#---------------------------Resourcegroup------------------------
Resource_group_name = "RG-TRACKCURE-DEV-CUS"
#---------------------------Location------------------------
location  = "Central US"
#---------------------------App Service plan------------------------
asp_name  = "asp-trackcure-dev-cus"
os_type  = "Windows"
app_service_plan_sku  = "D1"
#-----------------------------App Service---------------------------
app_service_1_name="as-trackcure-dev-cus-fe"
app_service_2_name="as-trackcure-dev-cus-api"
#------------------------Storage Account------------
Storage_account_name="satrackcuredevcus"
account_tier     = "Standard"
replication_type = "LRS"
#------------------SQL SERVER-------------------------------
sqlserver_name="sqlsrv-trackcure-dev-cus"
sqlserverusername="Admin123"
sqlserverpassword="Admin@123"
#----------------------DATABASE---------------------------
DataBase_name="sqldb-trackcure-dev-cus"
edition="Basic"
requested_service_objective_name="Basic"
max_size_gb="2"
#-----------------------------Tages-------------------------
environment      = "dev"
creation_date    = "2025-06-17"
created_by       = "muhammad.ahmad@CybersoftNA.com"



