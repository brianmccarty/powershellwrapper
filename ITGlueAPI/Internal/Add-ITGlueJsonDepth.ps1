function Add-ITGlueJSONDepth {
    <#
.SYNOPSIS
    Sets variable $ITGlue_JSON_Conversion_Depth to supplied value.
.DESCRIPTION
    Sets variable $ITGlue_JSON_Conversion_Depth to supplied value.
.PARAMETER depth
    Specifies the JSON Depth variable for ITGlue.
    Defaults to 100
.EXAMPLE
    C:\PS> Add-ITGlueJSONDepth
.EXAMPLE
    C:\PS> Add-ITGlueJSONDepth -depth 100
.NOTES
#>
    [cmdletbinding()]
    Param (
        [parameter(Mandatory = $false, ValueFromPipeline)]
        [int]$depth = 100
    )
    Write-Verbose "Add-ITGlueJSONDepth: Starting function"
    try {
        Write-Verbose "Add-ITGlueJSONDepth: Attempting to set variable ITGlue_JSON_Conversion_Depth to $depth"
        Set-Variable -Name "ITGlue_JSON_Conversion_Depth" -Value $depth -Scope global -ErrorAction Stop
        Get-ITGlueJSONDepth
    }
    catch {
        Write-Error $_.Exception.Message
    }
}
