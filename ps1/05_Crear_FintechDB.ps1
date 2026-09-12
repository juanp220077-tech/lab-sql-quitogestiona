# ============================================================
# UNIDAD 0 · Configuracion del Entorno DBA DevOps
# Diapositiva: LAB 0.3 - Crear la base de datos del curso: FintechDB
# Objetivo: dejar creada la base de datos que se usara en las Unidades 1-5
# Ejecutar en: PowerShell 7 (pwsh)
# ============================================================

# Evitar repetir -TrustServerCertificate: configuralo una sola vez
Set-DbatoolsConfig -FullName sql.connection.trustcert -Value $true -Register

New-DbaDatabase -SqlInstance localhost -Name FintechDB
Get-DbaDatabase -SqlInstance localhost -Database FintechDB |
    Select-Object Name, Status, RecoveryModel, SizeMB
