function Set-ITGlueConfigurationInterfaces {
    [CmdletBinding(DefaultParametersetName = 'update')]
    Param (
        [Parameter(ParameterSetName = 'update')]
        [Nullable[Int64]]$id,

        [Parameter(ParameterSetName = 'update')]
        [Nullable[Int64]]$conf_id = $null,

        [Parameter(ParameterSetName = 'bulk_update')]
        [Nullable[Int64]]$filter_id = $null,

        [Parameter(ParameterSetName = 'update')]
        [Parameter(ParameterSetName = 'bulk_update')]
        [Parameter(Mandatory = $true)]
        $data
    )

    $resource_uri = ('/configuration_interfaces/{0}' -f $id)

    if ($conf_id) {
        $resource_uri = ('/configurations/{0}/relationships/configuration_interfaces/{1}' -f $conf_id, $id)
    }

    $body = @{}

    if ($PSCmdlet.ParameterSetName -eq 'bulk_delete') {
        if ($filter_id) {
            $body += @{'filter[id]' = $filter_id}
        }
    }

    $body += @{'data' = $data}

    $body = ConvertTo-Json -InputObject $body -Depth $ITGlue_JSON_Conversion_Depth

    try {
        $ITGlue_Headers.Add('x-api-key', (New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList 'N/A', $ITGlue_API_Key).GetNetworkCredential().Password)
        $rest_output = Invoke-RestMethod -method 'PATCH' -uri ($ITGlue_Base_URI + $resource_uri) -headers $ITGlue_Headers `
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
