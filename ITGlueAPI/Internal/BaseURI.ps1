function Add-ITGlueBaseURI {
<#
.SYNOPSIS
    Sets variable $ITGlue_Base_URI to supplied value.
.DESCRIPTION
    Sets variable $ITGlue_Base_URI to supplied value.
.PARAMETER base_uri
    Specifies the ITGlue URL for the API request.
.PARAMETER data_center
    Specifies the ITGlue datacenter.
.EXAMPLE
    C:\PS> Add-ITGlueBaseURI
.NOTES
#>
    [cmdletbinding()]
    Param (
        [parameter(ValueFromPipeline)]
        [string]$base_uri = 'https://api.itglue.com',

        [Alias('locale', 'dc')]
        [ValidateSet( 'US', 'EU')]
        [String]$data_center = ''
    )

    # Trim superflous forward slash from address (if applicable)
    if ($base_uri[$base_uri.Length - 1] -eq "/") {
        $base_uri = $base_uri.Substring(0, $base_uri.Length - 1)
    }

    switch ($data_center) {
        'US' {
            $base_uri = 'https://api.itglue.com'
        }
        'EU' {
            $base_uri = 'https://api.eu.itglue.com'
        }
        Default {
        }
    }

    Set-Variable -Name "ITGlue_Base_URI" -Value $base_uri -Option ReadOnly -Scope global -Force
}

function Remove-ITGlueBaseURI {
<#
.SYNOPSIS
    Removes variable $ITGlue_Base_URI.
.DESCRIPTION
    Removes variable $ITGlue_Base_URI.
.EXAMPLE
    C:\PS> Remove-ITGlueBaseURI
.NOTES
#>
    Remove-Variable -Name "ITGlue_Base_URI" -Scope global -Force
}

function Get-ITGlueBaseURI {
<#
.SYNOPSIS
    Gets variable $ITGlue_Base_URI.
.DESCRIPTION
    Retrieves the variable $ITGlue_Base_URI, returns error if variable not set.
.EXAMPLE
    C:\PS> Get-ITGlueBaseURI
.NOTES
#>
    $ITGlue_Base_URI
}

New-Alias -Name Set-ITGlueBaseURI -Value Add-ITGlueBaseURI
