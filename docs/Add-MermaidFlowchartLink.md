---
external help file: PsMermaidTools-help.xml
Module Name: PsMermaidTools
online version: https://mermaid.js.org/syntax/flowchart.html#links-between-nodes
schema: 2.0.0
---

# Add-MermaidFlowchartLink

## SYNOPSIS
Adds a new link between nodes to a flowchart.

## SYNTAX

```
Add-MermaidFlowchartLink [-Diagram <Object>] [-Source] <String> [-Destination] <String> [[-Text] <String>]
 [-Line <String>] [-DestinationHead <String>] [-SourceHead <String>] [<CommonParameters>]
```

## DESCRIPTION
Creates a link between nodes.
If one of the node is not defined before, it will implicitly created.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -Diagram
The flowchart diagram, that the relation is added to.

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

### -Source
The source node of the link.

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

### -Destination
The destination node of the link.

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

### -Text
The link text.

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

### -Line
The link style.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: Solid
Accept pipeline input: False
Accept wildcard characters: False
```

### -DestinationHead
The head style to destination direction.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: Arrow
Accept pipeline input: False
Accept wildcard characters: False
```

### -SourceHead
The head style to destination direction.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: Open
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://mermaid.js.org/syntax/flowchart.html#links-between-nodes](https://mermaid.js.org/syntax/flowchart.html#links-between-nodes)

