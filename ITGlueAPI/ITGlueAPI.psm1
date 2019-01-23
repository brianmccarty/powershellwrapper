# Locations of settings path and file
$ITGlueAPIConfPath = "$($env:PROGRAMDATA)\ITGlue"

$ITGlueAPIConfFile = "config.psd1"

$ITGlue_Headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"

$ITGlue_Headers.Add("Content-Type", 'application/vnd.api+json')

Set-Variable -Name "ITGlue_Headers"  -Value $ITGlue_Headers -Scope global

#Get public and private function definition files.
$Public = @(Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -Recurse -Exclude *.tests.ps1, *profile.ps1 -ErrorAction SilentlyContinue)
$Private = @(Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -Recurse -Exclude *.tests.ps1, *profile.ps1 -ErrorAction SilentlyContinue)
#Dot source the files
foreach ($import in @($Public + $Private)) {
    try {
        . $import.fullname
    }
    catch {
        Write-Error -Message "Failed to import function $($import.fullname): $_"
    }
}
# Export all the functions
Export-ModuleMember -Function $Public.Basename -Alias *

Import-ITGlueModuleSettings

Set-ITGlueModuleAliases
