---
external help file: PsMermaidTools-help.xml
Module Name: PsMermaidTools
online version: https://mermaid-js.github.io/mermaid/#/README?id=diagram-types
schema: 2.0.0
---

# New-MermaidDiagram

## SYNOPSIS
Creates a new mermaid diagram.

## SYNTAX

### erDiagram (Default)
```
New-MermaidDiagram -Type <String> [<CommonParameters>]
```

### flowchart
```
New-MermaidDiagram -Type <String> -Orientation <String> [<CommonParameters>]
```

## DESCRIPTION
Creates and returns a new diagram definition, that can be populated and later exported.

## EXAMPLES

### EXAMPLE 1
```
$diagram = New-MermaidDiagram -Type erDiagram
PS C:\> $diagram | Add-MermaidRelation Exactly-one Customer places Zero-or-more Order
PS C:\> $diagram | Add-MermaidRelation Exactly-one Order contains One-or-more LineItem
PS C:\> $diagram | Add-MermaidRelation One-or-more Customer uses One-or-more DeliveryAddress -NonIdentifying
PS C:\> $diagram | ConvertTo-MermaidString
erDiagram
    Customer ||--o{ Order : places
    Order ||--|{ LineItem : contains
    Customer }|..|{ DeliveryAddress : uses
```

Create a erDiagram, add a few relations and convert it to a diagram string.

## PARAMETERS

### -Type
The mermaid diagram type.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Orientation
The diagram oriuebtatuib.

```yaml
Type: String
Parameter Sets: flowchart
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

### None.
## OUTPUTS

### Mermaid diagram definition object.
## NOTES

## RELATED LINKS

[https://mermaid-js.github.io/mermaid/#/README?id=diagram-types](https://mermaid-js.github.io/mermaid/#/README?id=diagram-types)

