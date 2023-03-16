---
external help file: PsMermaidTools-help.xml
Module Name: PsMermaidTools
online version: https://abbgrade.github.io/PsMermaidTools/docs/Add-MermaidC4Component.html
schema: 2.0.0
---

# Add-MermaidC4Component

## SYNOPSIS
Add a component to a container boundary.

## SYNTAX

### Properties
```
Add-MermaidC4Component -Boundary <Object> -Key <String> -Name <String> [-Technology <String>]
 [-Description <String>] [<CommonParameters>]
```

### Object
```
Add-MermaidC4Component -Boundary <Object> [-Component] <Object> [<CommonParameters>]
```

## DESCRIPTION
Add or create a component and add it to an C4 container boundary.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -Boundary
The boundary, that the component is added to.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Component
{{ Fill Component Description }}

```yaml
Type: Object
Parameter Sets: Object
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Key
The identifier of the component.

```yaml
Type: String
Parameter Sets: Properties
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
The component name.

```yaml
Type: String
Parameter Sets: Properties
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Technology
The component technology / implementation.

```yaml
Type: String
Parameter Sets: Properties
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Description
Describes the component.

```yaml
Type: String
Parameter Sets: Properties
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### C4ContainerBoundary object.
## OUTPUTS

### None.
## NOTES

## RELATED LINKS

[https://abbgrade.github.io/PsMermaidTools/docs/Add-MermaidC4Component.html](https://abbgrade.github.io/PsMermaidTools/docs/Add-MermaidC4Component.html)

[https://mermaid.js.org/syntax/c4c.html#c4-component-diagram-c4component](https://mermaid.js.org/syntax/c4c.html#c4-component-diagram-c4component)

