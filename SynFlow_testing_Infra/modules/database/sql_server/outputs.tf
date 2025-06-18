output "sql_server_id" {
  description = "The name of the Azure SQL Server"
  value       = azurerm_mssql_server.this.id
}

output "sql_server_fqdn" {
  description = "The fully qualified domain name (FQDN) of the SQL Server"
  value       = azurerm_mssql_server.this.fully_qualified_domain_name
}
