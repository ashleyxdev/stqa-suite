Write-Host "==============================="
Write-Host "    Python Script Downloader"
Write-Host "==============================="
Write-Host ""

# Base URL of your GitHub repo (raw content)
$repoBase = "https://raw.githubusercontent.com/ashleyxdev/dsa-suite/master"

# List available Python scripts
$pyPrograms = @(
    @{ id = 1; name = "7-update-student-records.py" },
    @{ id = 2; name = "8-select-student-marks.py" }
)

# Display options
Write-Host "Available Python Scripts:`n"
foreach ($p in $pyPrograms) {
    Write-Host "$($p.id). $($p.name)"
}

Write-Host ""
$choice = Read-Host "Enter your choice (1-$($pyPrograms.Count))"

$selected = $pyPrograms | Where-Object { $_.id -eq [int]$choice }

if (-not $selected) {
    Write-Host "Invalid choice! Exiting."
    exit
}

# Download chosen Python script
$fileUrl = "$repoBase/$($selected.name)"
Write-Host "`nDownloading $($selected.name)..."
try {
    Invoke-WebRequest -Uri $fileUrl -OutFile $selected.name -ErrorAction Stop
    Write-Host "✅ Download complete! File saved as: $($selected.name)"
} catch {
    Write-Host "❌ Failed to download file. Please check the repository link or filename."
}

Write-Host "`nDone!"