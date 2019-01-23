function Invoke-ITGlueRestMethod {
    <#
.SYNOPSIS
    Invoke-RestMethod from splatted arguements

.DESCRIPTION
    To remove the redundant commands from all the functions and reuse this code
    Will allow for flexibility and easier code management

.EXAMPLE
    Invoke-ITGlueRestMethod -method 'Get' -ITGlue_Base_URI 'https://api.itglue.com' -resource_uri '/organizations/{0}' -ITGlue_Headers '' -body ''

.EXAMPLE
    $itglueparams = @{
        method          = "POST"
        ITGlue_Base_URI = $ITGlue_Base_URI
        resource_uri    = $resource_uri
        body            = $body
    }
    Invoke-ITGlueRestMethod @itglueparams -ErrorAction Stop -ErrorVariable $web_error

.NOTES
    Replacement for POST commands in functions

        $itglueparams = @{
            method          = "POST"
            ITGlue_Base_URI = $ITGlue_Base_URI
            resource_uri    = $resource_uri
            body            = $body
        }
        $rest_output = Invoke-ITGlueRestMethod @itglueparams -ErrorAction Stop -ErrorVariable $web_error


    Replacement for GET commands in functions

        $itglueparams = @{
            method          = "GET"
            ITGlue_Base_URI = $ITGlue_Base_URI
            resource_uri    = $resource_uri
            body            = $body
        }

        $rest_output = Invoke-ITGlueRestMethod @itglueparams -ErrorAction Stop -ErrorVariable $web_error


    Replacement for PATCH commands in functions

        $itglueparams = @{
            method          = "PATCH"
            ITGlue_Base_URI = $ITGlue_Base_URI
            resource_uri    = $resource_uri
            body            = $body
        }

        $rest_output = Invoke-ITGlueRestMethod @itglueparams -ErrorAction Stop -ErrorVariable $web_error


    Replacement for DELETE commands in functions

        $itglueparams = @{
            method          = "DELETE"
            ITGlue_Base_URI = $ITGlue_Base_URI
            resource_uri    = $resource_uri
            body            = $body
        }

        $rest_output = Invoke-ITGlueRestMethod @itglueparams -ErrorAction Stop -ErrorVariable $web_error

#>
    [CmdletBinding()]
    param(
        [Parameter(
            Mandatory = $true, ValueFromPipeline)]
        [string]$method,
        [Parameter(
            Mandatory = $true, ValueFromPipeline)]
        [string]$ITGlue_Base_URI,
        [Parameter(
            Mandatory = $true, ValueFromPipeline)]
        [string]$resource_uri,
        [Parameter(
            Mandatory = $false, ValueFromPipeline)]
        [string]$body
    )

    try {

        $ITGlue_Headers.Add('x-api-key', (New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList 'N/A', $ITGlue_API_Key).GetNetworkCredential().Password)
        Invoke-RestMethod -method $method -uri ($ITGlue_Base_URI + $resource_uri) -headers $ITGlue_Headers -body $body -ErrorAction Stop -ErrorVariable $web_error
    }
    catch {
        Write-Verbose "Invoke-ITGlueRestMethod: Failure in Invoke-RestMethod"
        Write-Error $_
    }


}
