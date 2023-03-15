function Add-C4Relation {

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

        # The component technology / implementation.
        [Parameter()]
        [string] $Technology,

        # Describes the component.
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
