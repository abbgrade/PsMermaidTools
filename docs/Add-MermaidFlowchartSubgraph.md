---
external help file: PsMermaidTools-help.xml
Module Name: PsMermaidTools
online version: https://mermaid.js.org/syntax/flowchart.html#subgraphs
schema: 2.0.0
---

# Add-MermaidFlowchartSubgraph

## SYNOPSIS
Adds a new flowchart to a flowchart.

## SYNTAX

```
Add-MermaidFlowchartSubgraph [-Diagram <Object>] [-Key] <String> [[-Title] <String>] [-PassThru]
 [<CommonParameters>]
```

## DESCRIPTION
Create and add a subgraph.
Subgraphs may contain nodes, links, interactions and other subgraphs.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -Diagram
The diagram or parent subgraph, that the subgraph is added to.

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
The identifier of the subgraph.

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

### -Title
The subgraph title.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PassThru
Return the created subgraph object.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://mermaid.js.org/syntax/flowchart.html#subgraphs](https://mermaid.js.org/syntax/flowchart.html#subgraphs)

