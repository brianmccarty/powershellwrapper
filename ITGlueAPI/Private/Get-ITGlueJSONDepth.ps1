function Get-ITGlueJSONDepth {
    <#
.SYNOPSIS
    Gets variable $ITGlue_JSON_Conversion_Depth.
.DESCRIPTION
    Retrieves the variable $ITGlue_JSON_Conversion_Depth, returns error if variable not set.
.EXAMPLE
    C:\PS> Get-ITGlueJSONDepth
.NOTES
#>
    [cmdletbinding()]
    Param (

    )
    Write-Verbose "Get-ITGlueJSONDepth: Starting function"
    if ($null -eq $ITGlue_JSON_Conversion_Depth) {
        Write-Verbose "Get-ITGlueJSONDepth: ITGlue_JSON_Conversion_Depth not set"
        Write-Error "No variable ITGlue_JSON_Conversion_Depth exists. Please run Add-ITGlueJSONDepth to add."
    }
    else {
        Write-Verbose "Get-ITGlueJSONDepth: ITGlue_JSON_Conversion_Depth retrieved"
        $ITGlue_JSON_Conversion_Depth
    }
}
