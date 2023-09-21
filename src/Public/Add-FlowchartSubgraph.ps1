function Add-FlowchartSubgraph {

    [CmdletBinding()]
    param (
        # The diagram or parent subgraph, that the subgraph is added to.
        [Parameter(ValueFromPipeline)]
        [ValidateNotNull()]
        $Diagram,

        # The identifier of the subgraph.
        [Parameter(Mandatory, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [string] $Key,

        # Return the created subgraph object.
        [Parameter()]
        [switch] $PassThru
    )

    process {
        $subgraph = [PSCustomObject]@{
            Key       = $Key
            Nodes     = @()
            Links     = @()
            Clicks    = @()
            Subgraphs = @()
        }

        $Diagram.Subgraphs += $subgraph

        if ( $PassThru.IsPresent ) {
            Write-Output $subgraph
        }
    }

}
