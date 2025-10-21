# Ruta del ejecutable
$exePath = "C:\dev\github\misHerramientasAzureDevops\ProyectoObtenerKeysLibrary\ProyectoLibrary\bin\Debug\net8.0\ProyectoLibrary.exe"

# Carpeta de salida
$outputDir = "C:\dev\github\misHerramientasAzureDevops\ProyectoObtenerKeysLibrary\ProyectoLibrary\script\salida"

# Crear la carpeta de salida si no existe
if (-not (Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir | Out-Null
}

# Fecha actual en formato YYYYMMDD
$fecha = Get-Date -Format "yyyyMMdd"

# Lista de libraries (según la captura)
$libraries = @(
    "Auth-PRU",
    "Authorization-PRU",        
    "BenefitAuthorization-PRU",
    "BffPrivate-PRU",
    "Cards-PRU",
    "Certificates-PRU",    
    "Core-PRU",    
    "HealthPlans-PRU",
    "Notifications-PRU",
    "Policy-PRU",
    "PrivateCore-PRU",
    "PrivateMaster-PRU",
    "Public-PRU",
    "Receipt-PRU",        
    "Tracing-PRU"
)

# Bucle principal: ejecutar el programa para cada library
foreach ($lib in $libraries) {
    Write-Host "Ejecutando $lib..."
    $outputFile = Join-Path $outputDir "$lib-$fecha.txt"

    # Ejecuta el programa y redirige la salida al archivo
    & $exePath $lib > $outputFile 2>&1

    Write-Host "Salida guardada en: $outputFile"
}

Write-Host "✅ Proceso completado para $($libraries.Count) libraries."
