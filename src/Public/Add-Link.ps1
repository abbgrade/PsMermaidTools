function Add-Link {

    [CmdletBinding()]
    param (
        # The diagram, that the relation is added to.
        [Parameter(ValueFromPipeline)]
        $Diagram,

        # The source node of the link.
        [Parameter(Mandatory, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [string] $Source,

        # The destination node of the link.
        [Parameter(Mandatory, Position = 1)]
        [ValidateNotNullOrEmpty()]
        [string] $Destination,

        # The link type.
        [Parameter( Mandatory, Position = 2 )]
        [ValidateSet('arrow', 'open', 'dotted', 'thick')]
        [string] $Type,

        # The link text.
        [Parameter()]
        [string] $Text
    )

    $link = [PSCustomObject]@{
        SourceNode = $Source
        DestinationNode = $Destination
        Type = $Type
    }

    if ( $Text ) {
        $link | Add-Member Text $Text
    }

    $Diagram.Links += $link

}
