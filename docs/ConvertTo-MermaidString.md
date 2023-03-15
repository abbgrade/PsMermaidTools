---
external help file: PsMermaidTools-help.xml
Module Name: PsMermaidTools
online version: https://mermaid-js.github.io/mermaid/#/entityRelationshipDiagram?id=entities-and-relationships
schema: 2.0.0
---

# ConvertTo-MermaidString

## SYNOPSIS
Converts a mermaid definition to string.

## SYNTAX

### C4ComponentDiagram
```
ConvertTo-MermaidString -Type <String> -ContainerBoundaries <PSObject[]> [<CommonParameters>]
```

### flowchart
```
ConvertTo-MermaidString -Type <String> -Orientation <String> -Nodes <PSObject[]> -Links <PSObject[]>
 [<CommonParameters>]
```

### erDiagram
```
ConvertTo-MermaidString -Type <String> -Relations <PSObject[]> [<CommonParameters>]
```

### C4ContainerBoundary
```
ConvertTo-MermaidString -Components <PSObject[]> -Key <String> -Name <String> [<CommonParameters>]
```

### C4Component
```
ConvertTo-MermaidString [-Technology <String>] [-Description <String>] -Key <String> -Name <String>
 [<CommonParameters>]
```

### erRelation
```
ConvertTo-MermaidString -FirstEntity <String> [-Relationship <PSObject>] [-SecondEntity <String>]
 [-Label <String>] [<CommonParameters>]
```

### flowchartLink
```
ConvertTo-MermaidString -SourceNode <String> -SourceHead <String> -DestinationNode <String>
 -DestinationHead <String> [-Text <String>] -Line <String> [<CommonParameters>]
```

### flowchartNode
```
ConvertTo-MermaidString -Key <String> -Name <String> -Shape <String> [<CommonParameters>]
```

### erRelationship
```
ConvertTo-MermaidString -FirstCardinality <String> -SecondCardinality <String> -Identifying <Boolean>
 [<CommonParameters>]
```

## DESCRIPTION
Generates mermaid syntax for definitions created with this module.

## EXAMPLES

### EXAMPLE 1
```
$diagram = New-MermaidDiagram -Type erDiagram
PS C:\> $diagram | Add-MermaidErRelation Exactly-one Customer places Zero-or-more Order
PS C:\> $diagram | Add-MermaidErRelation Exactly-one Order contains One-or-more LineItem
PS C:\> $diagram | Add-MermaidErRelation One-or-more Customer uses One-or-more DeliveryAddress -NonIdentifying
PS C:\> $diagram | ConvertTo-MermaidString
erDiagram
    Customer ||--o{ Order : places
    Order ||--|{ LineItem : contains
    Customer }|..|{ DeliveryAddress : uses
```

Create a erDiagram, add a few relations and convert it to a diagram string.

## PARAMETERS

### -Type
The diagram link type.

```yaml
Type: String
Parameter Sets: C4ComponentDiagram, flowchart, erDiagram
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Relations
Collection of relations.

```yaml
Type: PSObject[]
Parameter Sets: erDiagram
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Orientation
Orientation of the flowchart.

```yaml
Type: String
Parameter Sets: flowchart
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Nodes
Collection of nodes for a flowchart.

```yaml
Type: PSObject[]
Parameter Sets: flowchart
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Links
Collection of links for a flowchart.

```yaml
Type: PSObject[]
Parameter Sets: flowchart
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ContainerBoundaries
Collection of container boundaries for a C4Component diagram.

```yaml
Type: PSObject[]
Parameter Sets: C4ComponentDiagram
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Components
Collection of components for a C4Component diagram.

```yaml
Type: PSObject[]
Parameter Sets: C4ContainerBoundary
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Technology
The component technology / implementation.

```yaml
Type: String
Parameter Sets: C4Component
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Description
Describes the component.

```yaml
Type: String
Parameter Sets: C4Component
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -FirstEntity
First entity of the relation.

```yaml
Type: String
Parameter Sets: erRelation
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Relationship
Relationship of the relation.

```yaml
Type: PSObject
Parameter Sets: erRelation
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -SecondEntity
First second of the relation.

```yaml
Type: String
Parameter Sets: erRelation
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Label
Describes the relation.

```yaml
Type: String
Parameter Sets: erRelation
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -SourceNode
Source node of the link.

```yaml
Type: String
Parameter Sets: flowchartLink
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -SourceHead
Source node of the link.

```yaml
Type: String
Parameter Sets: flowchartLink
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -DestinationNode
Destination node of the link.

```yaml
Type: String
Parameter Sets: flowchartLink
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -DestinationHead
Destination node of the link.

```yaml
Type: String
Parameter Sets: flowchartLink
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Text
Link text.

```yaml
Type: String
Parameter Sets: flowchartLink
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Line
{{ Fill Line Description }}

```yaml
Type: String
Parameter Sets: flowchartLink
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Key
Indentifier of the node/container/component.

```yaml
Type: String
Parameter Sets: C4ContainerBoundary, C4Component, flowchartNode
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Name
Name of the node/container.

```yaml
Type: String
Parameter Sets: C4ContainerBoundary, C4Component, flowchartNode
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Shape
Shape of the node.

```yaml
Type: String
Parameter Sets: flowchartNode
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -FirstCardinality
Cardinality of the first entity.

```yaml
Type: String
Parameter Sets: erRelationship
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -SecondCardinality
Cardinality of the second entity.

```yaml
Type: String
Parameter Sets: erRelationship
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Identifying
Flags if one entity may exist without the other.
endregion

```yaml
Type: Boolean
Parameter Sets: erRelationship
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Mermaid diagram definition object.
## OUTPUTS

### String.
## NOTES

## RELATED LINKS
