param (
    [string]$rule = "default"
)
<# NOTE: Update these variables to target different files with this script. #>
$MAIN = "src.app"
# ======================================================================== #
$CP_DELIM = ";"
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