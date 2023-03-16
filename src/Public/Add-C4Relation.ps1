function Add-C4Relation {

    <#

    .SYNOPSIS
    Add a relation to a diagram.

    .DESCRIPTION
    Create a relation between two components and add it to an C4 diagram.

    .INPUTS
    C4 diagram object.

    .OUTPUTS
    None.

    .LINK
    https://abbgrade.github.io/PsMermaidTools/docs/Add-MermaidC4Relation.html

    .LINK
    https://mermaid.js.org/syntax/c4c.html#c4-component-diagram-c4component

    #>

    [CmdletBinding()]
    param (
        # The diagram, that the relation is added to.
        [Parameter( Mandatory, ValueFromPipeline)]
        [ValidateNotNull()]
        $Diagram,

        # The first entity of the relation.
        [Parameter(Mandatory, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [string] $From,

        # The second entity of the relation.
        [Parameter(Mandatory, Position = 1)]
        [ValidateNotNullOrEmpty()]
        [string] $To,

        # Describes the relationship.
        [Parameter(Mandatory, Position = 2)]
        [string] $Label,

        # The relation technology / implementation.
        [Parameter()]
        [string] $Technology,

        # Describes the relation.
        [Parameter()]
        [string] $Description
    )

    $Diagram.Relations += [PSCustomObject]@{
        From = $From
        To = $To
        Label = $Label
        Technology = $Technology
        Description = $Description
    }
}
