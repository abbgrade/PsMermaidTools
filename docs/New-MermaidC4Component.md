---
external help file: PsMermaidTools-help.xml
Module Name: PsMermaidTools
online version: https://abbgrade.github.io/PsMermaidTools/docs/New-MermaidC4Component.html
schema: 2.0.0
---

# New-MermaidC4Component

## SYNOPSIS
Create a component.

## SYNTAX

```
New-MermaidC4Component [-Key] <String> [-Name] <String> [[-Technology] <String>] [[-Description] <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Create a component for a C4 diagram.
It can be edited and referenced.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -Key
The identifier of the component.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
The component name.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Technology
The component technology / implementation.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Description
Describes the component.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### None.
## NOTES

## RELATED LINKS

[https://abbgrade.github.io/PsMermaidTools/docs/New-MermaidC4Component.html](https://abbgrade.github.io/PsMermaidTools/docs/New-MermaidC4Component.html)

[https://mermaid.js.org/syntax/c4c.html#c4-component-diagram-c4component](https://mermaid.js.org/syntax/c4c.html#c4-component-diagram-c4component)

