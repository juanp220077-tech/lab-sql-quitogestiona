$serverName   = "localhost,1433"
$databaseName = "tempdb"
$credLocal    = New-Object System.Management.Automation.PSCredential ("sa", (ConvertTo-SecureString "PasswordSeguro2026!" -AsPlainText -Force))

Write-Host "=== LABORATORIO SQL LOCAL EN CODESPACES ===" -ForegroundColor Cyan
Write-Host "1. Desplegar Tablas en SQL Server Local"
Write-Host "2. Ver Tablas Creadas"
Write-Host "3. Consultar Registros Iniciales"

$opcion = Read-Host "Elige una opcion (1-3)"

switch ($opcion) {
    "1" {
        Write-Host "Desplegando esquema..." -ForegroundColor Yellow
        Invoke-DbaQuery -SqlInstance $serverName -Database $databaseName -SqlCredential $credLocal -File "./sql/01_Estructura_Tablas.sql"
        Write-Host "Tablas creadas correctamente." -ForegroundColor Green
    }
    "2" {
        Invoke-DbaQuery -SqlInstance $serverName -Database $databaseName -SqlCredential $credLocal `
            -Query "SELECT name AS Tabla, create_date AS CreadaEl FROM sys.tables ORDER BY name;" | Format-Table -AutoSize
    }
    "3" {
        Invoke-DbaQuery -SqlInstance $serverName -Database $databaseName -SqlCredential $credLocal `
            -Query "SELECT * FROM ZonasAdministrativas;" | Format-Table -AutoSize
    }
}
