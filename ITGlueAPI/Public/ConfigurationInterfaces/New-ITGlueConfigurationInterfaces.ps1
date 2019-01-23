function New-ITGlueConfigurationInterfaces {
    Param (
        [Nullable[Int64]]$conf_id = $null,

        [Parameter(Mandatory = $true)]
        $data
    )

    $resource_uri = '/configuration_interfaces/'

    if ($conf_id) {
        $resource_uri = ('/configurations/{0}/relationships/configuration_interfaces' -f $conf_id)
    }

    $body = @{}

    $body += @{'data' = $data}

    $body = ConvertTo-Json -InputObject $body -Depth $ITGlue_JSON_Conversion_Depth

    try {
        $ITGlue_Headers.Add('x-api-key', (New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList 'N/A', $ITGlue_API_Key).GetNetworkCredential().Password)
        $rest_output = Invoke-RestMethod -method 'POST' -uri ($ITGlue_Base_URI + $resource_uri) -headers $ITGlue_Headers `
            -body $body -ErrorAction Stop -ErrorVariable $web_error
    }
    catch {
        Write-Error $_
    }
    finally {
        $ITGlue_Headers.Remove('x-api-key') >$null # Quietly clean up scope so the API key doesn't persist
    }

    $data = @{}
    $data = $rest_output
    return $data
}
