function Remove-ITGlueJSONDepth {
    <#
.SYNOPSIS
    Removes variable $ITGlue_JSON_Conversion_Depth.
.DESCRIPTION
    Removes variable $ITGlue_JSON_Conversion_Depth.
.EXAMPLE
    C:\PS> Remove-ITGlueJSONDepth
.NOTES
#>
    [cmdletbinding()]
    Param (

    )
    Write-Verbose "Remove-ITGlueJSONDepth: Starting function"
    if ($null -eq $ITGlue_JSON_Conversion_Depth) {
        Write-Verbose "Remove-ITGlueJSONDepth: ITGlue_JSON_Conversion_Depth not set"
        Write-Warning "No variable ITGlue_JSON_Conversion_Depth to be removed."
    }
    else {
        Write-Verbose "Remove-ITGlueJSONDepth: Removing ITGlue_JSON_Conversion_Depth variable"
        Remove-Variable -Name "ITGlue_JSON_Conversion_Depth" -Scope global -Force
    }
}
