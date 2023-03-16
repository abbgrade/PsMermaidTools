---
external help file: PsMermaidTools-help.xml
Module Name: PsMermaidTools
online version: https://abbgrade.github.io/PsMermaidTools/docs/Add-MermaidC4Relation.html
schema: 2.0.0
---

# Add-MermaidC4Relation

## SYNOPSIS
Add a relation to a diagram.

## SYNTAX

```
Add-MermaidC4Relation -Diagram <Object> [-From] <String> [-To] <String> [-Label] <String>
 [-Technology <String>] [-Description <String>] [<CommonParameters>]
```

## DESCRIPTION
Create a relation between two components and add it to an C4 diagram.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -Diagram
The diagram, that the relation is added to.

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

### -From
The first entity of the relation.

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

### -To
The second entity of the relation.

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

### -Label
Describes the relationship.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Technology
The relation technology / implementation.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Description
Describes the relation.

```yaml
Type: String
Parameter Sets: (All)
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

### C4 diagram object.
## OUTPUTS

### None.
## NOTES

## RELATED LINKS

[https://abbgrade.github.io/PsMermaidTools/docs/Add-MermaidC4Relation.html](https://abbgrade.github.io/PsMermaidTools/docs/Add-MermaidC4Relation.html)

[https://mermaid.js.org/syntax/c4c.html#c4-component-diagram-c4component](https://mermaid.js.org/syntax/c4c.html#c4-component-diagram-c4component)

