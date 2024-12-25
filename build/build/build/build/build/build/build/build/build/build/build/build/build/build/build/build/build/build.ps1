param (
    [string]$rule = "default"
)
<# NOTE: Update these variables to target different files with this script. #>
$MAIN = "src.app"
# ======================================================================== #
$CP_DELIM = ";"

# Define the source and destination directories
$sourceDir = "C:\projects-v2\udahal2.github.io\"
$destinationDir = "C:\projects-v2\udahal2.github.io\build\"

# Create the destination directory if it doesn't exist
if (-Not (Test-Path -Path $destinationDir)) {
    New-Item -ItemType Directory -Path $destinationDir
}

# Copy all files except about.md
Get-ChildItem -Path $sourceDir -Recurse | Where-Object {
    $_.FullName -notlike "*about.md"
} | ForEach-Object {
    $destinationPath = $_.FullName.Replace($sourceDir, $destinationDir)
    $destinationDirPath = [System.IO.Path]::GetDirectoryName($destinationPath)
    if (-Not (Test-Path -Path $destinationDirPath)) {
        New-Item -ItemType Directory -Path $destinationDirPath
    }
    Copy-Item -Path $_.FullName -Destination $destinationPath
}

Write-Output "Build completed. about.md is excluded from the build."



if ($IsMacOS -or $IsLinux) {
    $CP_DELIM = ":" # changes to : for Mac or Linux
}
<# ======================================================================== #>
if ($rule -eq "" -or $rule -eq "default") {
    Clear-Host
}

elseif ($rule -eq "update") {
    git add .
    git commit -m "updated"
    Write-Debug " ** committed ** "
    git fetch origin main
    git pull origin main
    git push origin main
    Write-Output " **Pushing to github done..."

    # Clear current cache memory
    Clear-Host
    Write-Output " **Cache memory cleared..."
} 
else {
    Write-Output "build: *** No rule to make target '$rule'.  Stop."
}