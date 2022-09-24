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
        [string] $Destination
    )

    $Diagram.Links += [PSCustomObject]@{
        SourceNode = $Source
        DestinationNode = $Destination
    }

}
