function Add-ITGlueAPIKey {
    <#
.SYNOPSIS
    Sets variable $ITGlue_API_Key to supplied value.
.DESCRIPTION
    Prompts the user for their ITGlue API Key and converts the value to a secure string value.
    Stores converted secure string to a variable named $ITGlue_API_Key.
.PARAMETER Api_Key
    Specifies the API key to be converted and stored.
.EXAMPLE
    C:\PS> Add-ITGlueAPIKey
.NOTES
#>
    [cmdletbinding()]
    Param (
        [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [AllowEmptyString()]
        [Alias('ApiKey')]
        [string]$Api_Key
    )
    if ($Api_Key) {
        try {
            $x_api_key = ConvertTo-SecureString $Api_Key -AsPlainText -Force -ErrorAction Stop -ErrorVariable $err
            Set-Variable -Name "ITGlue_API_Key" -Value $x_api_key -Option ReadOnly -Scope global -Force -ErrorAction Stop -ErrorVariable $err
        }
        catch {
            Write-Error $err
        }
    }
    else {
        Write-Host "Please enter your API key:"
        $x_api_key = Read-Host -AsSecureString
        if (!$x_api_key) {
            try {
                Set-Variable -Name "ITGlue_API_Key" -Value $x_api_key -Option ReadOnly -Scope global -Force -ErrorAction Stop -ErrorVariable $err
            }
            catch {
                Write-Error $err
            }
        }
        else {
            Write-Host "No value entered" -ForegroundColor Yellow
        }
    }
}

function Remove-ITGlueAPIKey {
    <#
.SYNOPSIS
    Removes variable $ITGlue_API_Key.
.DESCRIPTION
    Removes variable $ITGlue_API_Key.
.EXAMPLE
    C:\PS> Remove-ITGlueAPIKey
.NOTES
#>
    try {
        Remove-Variable -Name "ITGlue_API_Key" -Scope global -Force -ErrorAction Stop -ErrorVariable $err
    }
    catch {
        Write-Error $err
    }
}

function Get-ITGlueAPIKey {
    <#
.SYNOPSIS
    Gets variable $ITGlue_API_Key.
.DESCRIPTION
    Retrieves the variable $ITGlue_API_Key, returns error if variable not set.
.EXAMPLE
    C:\PS> Get-ITGlueAPIKey
.NOTES
#>
    try {
        $result = Get-Variable ITGlue_API_Key -ErrorAction Stop -ErrorVariable $err
    }
    catch {
        Write-Error $err
        $result = $null
    }
    return $result
}

New-Alias -Name Set-ITGlueAPIKey -Value Add-ITGlueAPIKey
