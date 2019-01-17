---
external help file: ITGlueAPI-help.xml
Module Name: ITGlueAPI
online version:
schema: 2.0.0
---

# Add-ITGlueAPIKey

## SYNOPSIS
Sets variable $ITGlue_API_Key to supplied value.

## SYNTAX

```
Add-ITGlueAPIKey [[-Api_Key] <String>] [<CommonParameters>]
```

## DESCRIPTION
Prompts the user for their ITGlue API Key and converts the value to a secure string value.
Stores converted secure string to a variable named $ITGlue_API_Key.

## EXAMPLES

### EXAMPLE 1
```
Add-ITGlueAPIKey
```

## PARAMETERS

### -Api_Key
Specifies the API key to be converted and stored.

```yaml
Type: String
Parameter Sets: (All)
Aliases: ApiKey

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
