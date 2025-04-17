function Add-ErAttribute {

    <#

    .SYNOPSIS
    Add a attribute to a erDiagram.

    .DESCRIPTION
    Add a attribute to a er diagram. Used entities do not to be defined before.

    .INPUTS
    Mermaid diagram definition object.

    .OUTPUTS
    None.

    .LINK
    https://mermaid.js.org/syntax/entityRelationshipDiagram.html

    #>

    [CmdletBinding()]
    param (
        # The diagram, that the relation is added to.
        [Parameter(ValueFromPipeline)]
        [ValidateNotNull()]
        $Diagram,

        # The first entity of the relation.
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Entity,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Name,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Type
    )

    if ( -not $Diagram.Entities.Contains($Entity)) {
        $Diagram.Entities[$Entity] = [PSCustomObject]@{
            Name = $Entity
            Attributes = @()
        }
    }

    $Diagram.Entities[$Entity].Attributes += [PSCustomObject]@{
        Name = $Name
        Type = $Type
    }
}
