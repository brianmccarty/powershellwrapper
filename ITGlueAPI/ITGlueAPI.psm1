# Locations of settings path and file
$ITGlueAPIConfPath = "$($env:PROGRAMDATA)\ITGlue"

$ITGlueAPIConfFile = "config.psd1"

$ITGlue_Headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"

$ITGlue_Headers.Add("Content-Type", 'application/vnd.api+json')

Set-Variable -Name "ITGlue_Headers"  -Value $ITGlue_Headers -Scope global

Import-ITGlueModuleSettings

Set-ITGlueModuleAliases
