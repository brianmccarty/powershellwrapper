#
# Module manifest for module 'ITGlueAPI'
#
# Generated by: Caleb Albers
#
# Generated on: 6/2/2017
#

@{

# Script module or binary module file associated with this manifest
RootModule = '.\ITGlueAPI.psm1'

# Version number of this module.
# Follows https://semver.org Semantic Versioning 2.0.0
# Given a version number MAJOR.MINOR.PATCH, increment the:
# -- MAJOR version when you make incompatible API changes,
# -- MINOR version when you add functionality in a backwards-compatible manner, and
# -- PATCH version when you make backwards-compatible bug fixes.

ModuleVersion = '2.0.4'

# ID used to uniquely identify this module
#GUID = ''

# Author of this module
Author = 'Caleb Albers'

# Company or vendor of this module
CompanyName = 'IT Glue'

# Description of the functionality provided by this module
Description = 'This module provides a PowerShell wrapper for the IT Glue API.'

# Copyright information of this module
Copyright = 'https://github.com/itglue/powershellwrapper/blob/master/LICENSE'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '3.0'

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of the .NET Framework required by this module
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = '*'

# Cmdlets to export from this module
CmdletsToExport = @()

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module
AliasesToExport = '*'

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess
# PrivateData = ''

# HelpInfo URI of this module
HelpInfoURI = 'https://github.com/itglue/powershellwrapper/wiki'

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}
