function Add-FlowchartSubgraph {

    [CmdletBinding()]
    param (
        # The diagram, that the subgraph is added to.
        [Parameter(ValueFromPipeline)]
        [ValidateNotNull()]
        $Diagram,

        # The identifier of the subgraph.
        [Parameter(Mandatory, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [string] $Key
    )

    process {
        $subgraph = [PSCustomObject]@{
            Key   = $Key
        }

        $Diagram.Subgraphs += $subgraph
    }

}
