function Add-FlowchartNode {

    [CmdletBinding()]
    param (
        # The diagram, that the relation is added to.
        [Parameter(ValueFromPipeline)]
        [ValidateNotNull()]
        $Diagram,

        # The identifier of the node.
        [Parameter(Mandatory, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [string] $Key,

        # The node name.
        [Parameter(Position = 1)]
        [string] $Name,

        # The node shape.
        [Parameter(Position = 2)]
        [ValidateSet(
            'rectangle',
            'round-edges',
            'stadium',
            'subroutine',
            'cylindrical',
            'circle',
            'asymmetric',
            'rhombus',
            'hexagon',
            'parallelogram',
            'parallelogram-alt',
            'trapezoid',
            'trapezoid-alt',
            'double-circle'
        )]
        [string] $Shape,

        # The class of the node.
        [Parameter()]
        [string] $Class
    )

    process {
        $node = [PSCustomObject]@{
            Key   = $Key
        }

        if ( $Name ) {
            $node | Add-Member Name $Name
        }

        if ( $Shape ) {
            $node | Add-Member Shape $Shape
        }

        if ( $Class ) {
            $node | Add-Member Class $Class
        }

        $Diagram.Nodes += $node
    }

}
