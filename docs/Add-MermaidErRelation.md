---
external help file: PsMermaidTools-help.xml
Module Name: PsMermaidTools
online version: https://mermaid-js.github.io/mermaid/#/entityRelationshipDiagram?id=entities-and-relationships
schema: 2.0.0
---

# Add-MermaidErRelation

## SYNOPSIS
Add a relation to a erDiagram.

## SYNTAX

### Entity
```
Add-MermaidErRelation [-Diagram <Object>] -Entity <String> [<CommonParameters>]
```

### Relation
```
Add-MermaidErRelation [-Diagram <Object>] [-FirstEntity] <String> [-FirstCardinality] <String>
 [-SecondEntity] <String> [-SecondCardinality] <String> [-Label] <String> [-NonIdentifying]
 [<CommonParameters>]
```

## DESCRIPTION
Add a relation to a er diagram.
Used entities do not to be defined before.

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

### -Entity
The first entity of the relation.

```yaml
Type: String
Parameter Sets: Entity
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FirstEntity
The first entity of the relation.

```yaml
Type: String
Parameter Sets: Relation
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FirstCardinality
How often the first entity exists in the relation.

```yaml
Type: String
Parameter Sets: Relation
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SecondEntity
The second entity of the relation.

```yaml
Type: String
Parameter Sets: Relation
Aliases:

Required: True
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SecondCardinality
How often the second entity exists in the relation.

```yaml
Type: String
Parameter Sets: Relation
Aliases:

Required: True
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Label
Describes the relationship.

```yaml
Type: String
Parameter Sets: Relation
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NonIdentifying
Specifies if one of the entities may exist without the other.

```yaml
Type: SwitchParameter
Parameter Sets: Relation
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

### Mermaid diagram definition object.
## OUTPUTS

### None.
## NOTES

## RELATED LINKS

[https://mermaid-js.github.io/mermaid/#/entityRelationshipDiagram?id=entities-and-relationships](https://mermaid-js.github.io/mermaid/#/entityRelationshipDiagram?id=entities-and-relationships)

