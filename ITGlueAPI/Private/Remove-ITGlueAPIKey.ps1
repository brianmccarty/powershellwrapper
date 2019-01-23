function Remove-ITGlueAPIKey {
    Remove-Variable -Name "ITGlue_API_Key" -Scope global -Force
}
