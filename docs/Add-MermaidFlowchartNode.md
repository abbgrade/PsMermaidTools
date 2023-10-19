---
external help file: PsMermaidTools-help.xml
Module Name: PsMermaidTools
online version: https://mermaid.js.org/syntax/flowchart.html#node-shapes
schema: 2.0.0
---

# Add-MermaidFlowchartNode

## SYNOPSIS
Adds a new node to a flowchart.

## SYNTAX

```
Add-MermaidFlowchartNode [-Diagram <Object>] [-Key] <String> [[-Text] <String>] [[-Shape] <String>]
 [-Class <String>] [<CommonParameters>]
```

## DESCRIPTION
Create and add a note explicitly to the diagram.
You can specify the style via class or geometry.

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

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Key
The identifier of the node.

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

### -Text
The node text.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Name

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Shape
The node shape.

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

### -Class
The class of the node.

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

## OUTPUTS

## NOTES

## RELATED LINKS

[https://mermaid.js.org/syntax/flowchart.html#node-shapes](https://mermaid.js.org/syntax/flowchart.html#node-shapes)

