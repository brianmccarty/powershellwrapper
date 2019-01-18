function Get-ITGlue_Helper_GetAll {
    <#
.SYNOPSIS
    Helper function to get all ITGlue records
.DESCRIPTION
    Helper function that calls various ITGlue Get functions for return all the records
.EXAMPLE
    C:\PS> Get-ITGlue_Helper_GetAll Get-ITGlueOperatingSystems
.EXAMPLE
    C:\PS> Get-ITGlue_Helper_GetAll Get-ITGlueOperatingSystems -Verbose
.NOTES
    Supported ITGlue functions include:

            Get-ITGlueConfigurations
            Get-ITGlueConfigurationStatuses
            Get-ITGlueConfigurationTypes
            Get-ITGlueContacts
            Get-ITGlueContactTypes
            Get-ITGlueCountries
            Get-ITGlueFlexibleAssetTypes
            Get-ITGlueGroups
            Get-ITGlueLocations
            Get-ITGlueManufacturers
            Get-ITGlueModels
            Get-ITGlueOperatingSystems
            Get-ITGlueOrganizations
            Get-ITGlueOrganizationStatuses
            Get-ITGlueOrganizationTypes
            Get-ITGluePasswordCategories
            Get-ITGluePasswords
            Get-ITGluePlatforms
            Get-ITGlueRegions
            Get-ITGlueUserMetrics
            Get-ITGlueUsers

    The following Get functions are not yet implemented

        Get-ITGlueConfigurationInterfaces
        Get-ITGlueFlexibleAssetFields
        Get-ITGlueFlexibleAssets

#>
    [CmdletBinding()]
    param(
        [parameter(Mandatory,
            ValueFromPipeline)]
        [ValidateSet(
            'Get-ITGlueConfigurations',
            'Get-ITGlueConfigurationStatuses',
            'Get-ITGlueConfigurationTypes',
            'Get-ITGlueContacts',
            'Get-ITGlueContactTypes',
            'Get-ITGlueCountries',
            'Get-ITGlueFlexibleAssetTypes',
            'Get-ITGlueGroups',
            'Get-ITGlueLocations',
            'Get-ITGlueManufacturers',
            'Get-ITGlueModels',
            'Get-ITGlueOperatingSystems',
            'Get-ITGlueOrganizations',
            'Get-ITGlueOrganizationStatuses',
            'Get-ITGlueOrganizationTypes',
            'Get-ITGluePasswordCategories',
            'Get-ITGluePasswords',
            'Get-ITGluePlatforms',
            'Get-ITGlueRegions',
            'Get-ITGlueUserMetrics',
            'Get-ITGlueUsers')]
        [string]$function
    )
    Write-Verbose "Get-ITGlue_Helper_GetAll: $function initiated"
    $page_number = 1
    $data = @()
    do {

        switch ($function) {

            #Get-ITGlueConfigurationInterfaces { not yet implemented }

            Get-ITGlueConfigurations {
                $current_page = Get-ITGlueConfigurations -page_number $page_number
            }

            Get-ITGlueConfigurationStatuses {
                $current_page = Get-ITGlueConfigurationStatuses -page_number $page_number
            }

            Get-ITGlueConfigurationTypes {
                $current_page = Get-ITGlueConfigurationTypes -page_number $page_number
            }

            Get-ITGlueContacts {
                $current_page = Get-ITGlueContacts -page_number $page_number
            }

            Get-ITGlueContactTypes {
                $current_page = Get-ITGlueContactTypes -page_number $page_number
            }

            Get-ITGlueCountries {
                $current_page = Get-ITGlueCountries -page_number $page_number
            }

            #Get-ITGlueFlexibleAssetFields { not yet implemented }

            #Get-ITGlueFlexibleAssets { not yet implemented }

            Get-ITGlueFlexibleAssetTypes {
                $current_page = Get-ITGlueFlexibleAssetTypes -page_number $page_number
            }

            Get-ITGlueGroups {
                $current_page = Get-ITGlueGroups -page_number $page_number
            }

            Get-ITGlueLocations {
                $current_page = Get-ITGlueLocations -page_number $page_number
            }

            Get-ITGlueManufacturers {
                $current_page = Get-ITGlueManufacturers -page_number $page_number
            }

            Get-ITGlueModels {
                $current_page = Get-ITGlueModels -page_number $page_number
            }

            Get-ITGlueOperatingSystems {
                $current_page = Get-ITGlueOperatingSystems -page_number $page_number
            }

            Get-ITGlueOrganizations {
                $current_page = Get-ITGlueOrganizations -page_number $page_number
            }

            Get-ITGlueOrganizationStatuses {
                $current_page = Get-ITGlueOrganizationStatuses -page_number $page_number
            }

            Get-ITGlueOrganizationTypes {
                $current_page = Get-ITGlueOrganizationTypes -page_number $page_number
            }

            Get-ITGluePasswordCategories {
                $current_page = Get-ITGluePasswordCategories -page_number $page_number
            }

            Get-ITGluePasswords {
                $current_page = Get-ITGluePasswords -page_number $page_number
            }

            Get-ITGluePlatforms {
                $current_page = Get-ITGluePlatforms -page_number $page_number
            }

            Get-ITGlueRegions {
                $current_page = Get-ITGlueRegions -page_number $page_number
            }

            Get-ITGlueUserMetrics {
                $current_page = Get-ITGlueUserMetrics -page_number $page_number
            }

            Get-ITGlueUsers {
                $current_page = Get-ITGlueUsers -page_number $page_number
            }
        }

        Write-Verbose "Get-ITGlue_Helper_GetAll: page $page_number of $($current_page.meta.'total-pages')"

        $data += $current_page.data
        Write-Verbose "Get-ITGlue_Helper_GetAll: $($data.count) records retrieved"

        $page_number++

    } while ($current_page.meta.'total-pages' -ne $page_number - 1)

    Write-Verbose "Get-ITGlue_Helper_GetAll: last page $page_number"
    Write-Verbose "Get-ITGlue_Helper_GetAll: $($data.count) total records retrieved"

    $data
}
