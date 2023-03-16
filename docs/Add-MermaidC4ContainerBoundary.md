---
external help file: PsMermaidTools-help.xml
Module Name: PsMermaidTools
online version: https://abbgrade.github.io/PsMermaidTools/docs/Add-MermaidC4ContainerBoundary.html
schema: 2.0.0
---

# Add-MermaidC4ContainerBoundary

## SYNOPSIS
Add a container boundary to a diagram.

## SYNTAX

### Properties
```
Add-MermaidC4ContainerBoundary -Diagram <Object> -Key <String> -Name <String> [<CommonParameters>]
```

### Object
```
Add-MermaidC4ContainerBoundary -Diagram <Object> [-ContainerBoundary] <Object> [<CommonParameters>]
```

## DESCRIPTION
Add or create a container boundary and add it to an C4 diagram.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -Diagram
The diagram, that the container is added to.

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

### -ContainerBoundary
{{ Fill ContainerBoundary Description }}

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
The identifier of the container.

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
The container name.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### C4Container diagram object.
## OUTPUTS

### None.
## NOTES

## RELATED LINKS

[https://abbgrade.github.io/PsMermaidTools/docs/Add-MermaidC4ContainerBoundary.html](https://abbgrade.github.io/PsMermaidTools/docs/Add-MermaidC4ContainerBoundary.html)

[https://mermaid.js.org/syntax/c4c.html#c4-component-diagram-c4component](https://mermaid.js.org/syntax/c4c.html#c4-component-diagram-c4component)

