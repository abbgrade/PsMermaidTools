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
        [string] $Name
    )

    $Diagram.Nodes += [PSCustomObject]@{
        Key = $Key
        Name = $Name
    }

}
