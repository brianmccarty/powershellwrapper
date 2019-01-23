function Set-ITGlueOrganizations {
    [CmdletBinding(DefaultParameterSetName = 'update')]
    Param (
        [Parameter(ParameterSetName = 'update')]
        [Nullable[Int64]]$id = $null,

        [Parameter(ParameterSetName = 'bulk_update')]
        [Nullable[Int64]]$filter_id = $null,

        [Parameter(ParameterSetName = 'bulk_update')]
        [String]$filter_name = '',

        [Parameter(ParameterSetName = 'bulk_update')]
        [Nullable[Int64]]$filter_organization_type_id = $null,

        [Parameter(ParameterSetName = 'bulk_update')]
        [Nullable[Int64]]$filter_organization_status_id = $null,

        [Parameter(ParameterSetName = 'bulk_update')]
        [String]$filter_created_at = '',

        [Parameter(ParameterSetName = 'bulk_update')]
        [String]$filter_updated_at = '',

        [Parameter(ParameterSetName = 'bulk_update')]
        [Nullable[Int64]]$filter_my_glue_account_id = $null,

        [Parameter(ParameterSetName = 'bulk_update')]
        [Nullable[Int64]]$filter_exclude_id = $null,

        [Parameter(ParameterSetName = 'bulk_update')]
        [String]$filter_exclude_name = '',

        [Parameter(ParameterSetName = 'bulk_update')]
        [Nullable[Int64]]$filter_exclude_organization_type_id = $null,

        [Parameter(ParameterSetName = 'bulk_update')]
        [Nullable[Int64]]$filter_exclude_organization_status_id = $null,

        [Parameter(ParameterSetName = 'update')]
        [Parameter(ParameterSetName = 'bulk_update')]
        [Parameter(Mandatory = $true)]
        $data

    )

    $resource_uri = ('/organizations/{0}' -f $id)

    $body = @{}

    if ($PSCmdlet.ParameterSetName -eq 'bulk_update') {
        if ($filter_id) {
            $body += @{'filter[id]' = $filter_id}
        }
        if ($filter_name) {
            $body += @{'filter[name]' = $filter_name}
        }
        if ($filter_organization_type_id) {
            $body += @{'filter[organization_type_id]' = $filter_organization_type_id}
        }
        if ($filter_organization_status_id) {
            $body += @{'filter[organization_status_id]' = $filter_organization_status_id}
        }
        if ($filter_created_at) {
            $body += @{'filter[created_at]' = $filter_created_at}
        }
        if ($filter_updated_at) {
            $body += @{'filter[updated_at]' = $filter_updated_at}
        }
        if ($filter_my_glue_account_id) {
            $body += @{'filter[my_glue_account_id]' = $filter_my_glue_account_id}
        }
        if ($filter_exclude_id) {
            $body += @{'filter[exclude][id]' = $filter_exclude_id}
        }
        if ($filter_exclude_name) {
            $body += @{'filter[exclude][name]' = $filter_exclude_name}
        }
        if ($filter_exclude_organization_type_id) {
            $body += @{'filter[exclude][organization_type_id]' = $filter_exclude_organization_type_id}
        }
        if ($filter_exclude_organization_status_id) {
            $body += @{'filter[exclude][organization_status_id]' = $filter_exclude_organization_status_id}
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
