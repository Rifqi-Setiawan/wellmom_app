# Script untuk copy Icon_Notification.png ke Android resources
# Jalankan script ini dari root project: .\copy_notification_icon.ps1

$sourceFile = "assets\images\Icon_Notification.png"
$targetFolders = @(
    "android\app\src\main\res\mipmap-mdpi",
    "android\app\src\main\res\mipmap-hdpi",
    "android\app\src\main\res\mipmap-xhdpi",
    "android\app\src\main\res\mipmap-xxhdpi",
    "android\app\src\main\res\mipmap-xxxhdpi"
)

if (-not (Test-Path $sourceFile)) {
    Write-Host "Error: File $sourceFile tidak ditemukan!" -ForegroundColor Red
    exit 1
}

foreach ($folder in $targetFolders) {
    if (-not (Test-Path $folder)) {
        Write-Host "Membuat folder: $folder" -ForegroundColor Yellow
        New-Item -ItemType Directory -Path $folder -Force | Out-Null
    }
    
    $targetFile = Join-Path $folder "ic_notification.png"
    Copy-Item -Path $sourceFile -Destination $targetFile -Force
    Write-Host "Copied: $targetFile" -ForegroundColor Green
}

Write-Host "`nSelesai! Icon notification sudah di-copy ke semua folder mipmap." -ForegroundColor Green
Write-Host "Sekarang rebuild aplikasi dengan: flutter clean && flutter run" -ForegroundColor Yellow
