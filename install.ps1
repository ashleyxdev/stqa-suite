Write-Host "================================================"
Write-Host "   Software Testing & Quality Assurance"
Write-Host "           Lab File Downloader"
Write-Host "================================================"
Write-Host ""

# Base URL of your GitHub repo (raw content)
$repoBase = "https://raw.githubusercontent.com/ashleyxdev/stqa-suite/master"

# List of lab practical files (add new entries here as the course progresses)
$labFiles = @(
    @{ id = 1; name = "7-update-student-records.py"; type = "Python" },
    @{ id = 2; name = "8-select-student-marks.py";   type = "Python" }
)

# Display options
Write-Host "Available Lab Files:`n"
foreach ($f in $labFiles) {
    Write-Host "$($f.id). [$($f.type)] $($f.name)"
}

Write-Host ""
$choice = Read-Host "Enter your choice (1-$($labFiles.Count))"

$selected = $labFiles | Where-Object { $_.id -eq [int]$choice }

if (-not $selected) {
    Write-Host "Invalid choice! Exiting."
    exit
}

# Download selected lab file
$fileUrl = "$repoBase/$($selected.name)"
Write-Host "`nDownloading $($selected.name)..."
try {
    Invoke-WebRequest -Uri $fileUrl -OutFile $selected.name -ErrorAction Stop
    Write-Host "✅ Download complete! File saved as: $($selected.name)"
} catch {
    Write-Host "❌ Failed to download file. Please check the repository link or filename."
}

Write-Host "`nDone!"