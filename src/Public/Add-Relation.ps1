function Add-Relation {

    <#

    .SYNOPSIS
    Add a relation to a erDiagram.

    .DESCRIPTION
    Add a relation to a er diagram. Used entities do not to be defined before.

    .INPUTS
    Mermaid diagram definition object.

    .OUTPUTS
    None.

    .EXAMPLE
    PS C:\> $diagram = New-MermaidDiagram -Type erDiagram
    PS C:\> $diagram | Add-MermaidRelation Exactly-one Customer places Zero-or-more Order
    PS C:\> $diagram | Add-MermaidRelation Exactly-one Order contains One-or-more LineItem
    PS C:\> $diagram | Add-MermaidRelation One-or-more Customer uses One-or-more DeliveryAddress -NonIdentifying
    PS C:\> $diagram | ConvertTo-MermaidString
    erDiagram
        Customer ||--o{ Order : places
        Order ||--|{ LineItem : contains
        Customer }|..|{ DeliveryAddress : uses

    Create a erDiagram, add a few relations and convert it to a diagram string.

    .LINK
    https://mermaid-js.github.io/mermaid/#/entityRelationshipDiagram?id=entities-and-relationships

    #>

    [CmdletBinding()]
    param (
        # The diagram, that the relation is added to.
        [Parameter(ValueFromPipeline)]
        $Diagram,

        # The first entity of the relation.
        [Parameter(Position = 1)]
        [ValidateNotNullOrEmpty()]
        [string] $FirstEntity,

        # How often the first entity exists in the relation.
        [Parameter(Position = 0)]
        [ValidateSet('Zero-or-one', 'Exactly-one', 'Zero-or-more', 'One-or-more')]
        [string] $FirstCardinality,

        # The second entity of the relation.
        [Parameter(Position = 4)]
        [ValidateNotNullOrEmpty()]
        [string] $SecondEntity,

        # How often the second entity exists in the relation.
        [Parameter(Position = 3)]
        [ValidateSet('Zero-or-one', 'Exactly-one', 'Zero-or-more', 'One-or-more')]
        [string] $SecondCardinality,

        # Describes the relationship.
        [Parameter( Position = 2)]
        [string] $Label,

        # Specifies if one of the entities may exist without the other.
        [Parameter()]
        [switch] $NonIdentifying
    )

    $Diagram.Relations += [PSCustomObject]@{
        FirstEntity = $FirstEntity
        Relationship = [PSCustomObject]@{
            FirstCardinality = $FirstCardinality
            SecondCardinality = $SecondCardinality
            Identifying = -Not $NonIdentifying.IsPresent
        }
        SecondEntity = $SecondEntity
        Label = $Label
    }
}
