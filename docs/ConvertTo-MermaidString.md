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

### erDiagram
```
ConvertTo-MermaidString -Type <String> -Relations <PSObject[]> [<CommonParameters>]
```

### erRelation
```
ConvertTo-MermaidString -FirstEntity <String> -Relationship <PSObject> -SecondEntity <String> [-Label <String>]
 [<CommonParameters>]
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
The diagram type.

```yaml
Type: String
Parameter Sets: erDiagram
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

Required: True
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

Required: True
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
end region

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
