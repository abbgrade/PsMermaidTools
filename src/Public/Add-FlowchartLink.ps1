function Add-FlowchartLink {

    [CmdletBinding()]
    param (
        # The flowchart diagram, that the relation is added to.
        [Parameter(ValueFromPipeline)]
        [ValidateNotNull()]
        $Diagram,

        # The source node of the link.
        [Parameter(Mandatory, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [string] $Source,

        # The destination node of the link.
        [Parameter(Mandatory, Position = 1)]
        [ValidateNotNullOrEmpty()]
        [string] $Destination,

        # The link text.
        [Parameter(Position = 2)]
        [string] $Text,

        # The link style.
        [Parameter()]
        [ValidateSet('solid', 'dotted', 'thick')]
        [string] $Line = 'solid',

        # The head style to destination direction.
        [Parameter()]
        [ValidateSet('arrow', 'open', 'circle', 'cross')]
        [string] $DestinationHead = 'arrow',

        # The head style to destination direction.
        [Parameter()]
        [ValidateSet('arrow', 'open', 'circle', 'cross')]
        [string] $SourceHead = 'open'
    )

    $link = [PSCustomObject]@{
        SourceNode = $Source
        SourceHead = $SourceHead
        DestinationNode = $Destination
        DestinationHead = $DestinationHead
        Line = $Line
    }

    if ( $Text ) {
        $link | Add-Member Text $Text
    }

    $Diagram.Links += $link

}
