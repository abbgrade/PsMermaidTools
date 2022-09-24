function Add-Node {

    [CmdletBinding()]
    param (
        # The diagram, that the relation is added to.
        [Parameter(ValueFromPipeline)]
        $Diagram,

        # The identifier of the node.
        [Parameter(Mandatory, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [string] $Key,

        # The node name.
        [Parameter(Mandatory, Position = 1)]
        [ValidateNotNullOrEmpty()]
        [string] $Name,

        # The node shape.
        [Parameter(Mandatory, Position = 2)]
        [ValidateSet(
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
        [string] $Shape
    )

    $Diagram.Nodes += [PSCustomObject]@{
        Key = $Key
        Name = $Name
        Shape = $Shape
    }

}
