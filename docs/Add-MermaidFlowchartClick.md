---
external help file: PsMermaidTools-help.xml
Module Name: PsMermaidTools
online version: https://mermaid.js.org/syntax/flowchart.html#interaction
schema: 2.0.0
---

# Add-MermaidFlowchartClick

## SYNOPSIS
Adds a new click interaction to a flowchart.

## SYNTAX

```
Add-MermaidFlowchartClick [-Diagram <Object>] [-Node] <String> [-Url] <String> [-Tooltip <String>]
 -Target <String> [<CommonParameters>]
```

## DESCRIPTION
Add a hyperlink to a node as click interaction, that opens a website on clicking on the specified node.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -Diagram
The diagram, that the click is added to.

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

### -Node
The key of the node, to add the click to.

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

### -Url
The url to open, when the node is clicked.

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

### -Tooltip
The tooltip text.

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

### -Target
The target to open the url to.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://mermaid.js.org/syntax/flowchart.html#interaction](https://mermaid.js.org/syntax/flowchart.html#interaction)

