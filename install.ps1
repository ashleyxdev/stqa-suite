Write-Host "================================================"
Write-Host "   Software Testing & Quality Assurance"
Write-Host "           Lab File Downloader"
Write-Host "================================================"
Write-Host ""

# Base URL of your GitHub repo (raw content)
$repoBase = "https://raw.githubusercontent.com/ashleyxdev/stqa-suite/master"

# All files — section: "Practical" or "Setup"
$labFiles = @(
    @{ id = 1; name = "7-update-student-records.py"; type = "Python";   section = "Practical" },
    @{ id = 2; name = "8-select-student-marks.py";   type = "Python";   section = "Practical" },
    @{ id = 3; name = "selenium-setup-guide.md";     type = "Markdown"; section = "Setup"     },
    @{ id = 4; name = "pom.xml";                     type = "XML";      section = "Setup"     }
)

# Display: Lab Practicals
Write-Host "Lab Practicals:"
Write-Host "---------------"
foreach ($f in $labFiles | Where-Object { $_.section -eq "Practical" }) {
    Write-Host "  $($f.id). [$($f.type)] $($f.name)"
}

Write-Host ""

# Display: Helper / Setup Files
Write-Host "Helper / Setup Files:"
Write-Host "---------------------"
foreach ($f in $labFiles | Where-Object { $_.section -eq "Setup" }) {
    Write-Host "  $($f.id). [$($f.type)] $($f.name)"
}

Write-Host ""
$choice = Read-Host "Enter your choice (1-$($labFiles.Count))"

$selected = $labFiles | Where-Object { $_.id -eq [int]$choice }

if (-not $selected) {
    Write-Host "Invalid choice! Exiting."
    exit
}

# Download selected file
$fileUrl = "$repoBase/$($selected.name)"
Write-Host "`nDownloading $($selected.name)..."
try {
    Invoke-WebRequest -Uri $fileUrl -OutFile $selected.name -ErrorAction Stop
    Write-Host "✅ Download complete! File saved as: $($selected.name)"
} catch {
    Write-Host "❌ Failed to download file. Please check the repository link or filename."
}

Write-Host "`nDone!"