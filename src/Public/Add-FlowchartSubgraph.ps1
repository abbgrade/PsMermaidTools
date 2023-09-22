function Add-FlowchartSubgraph {

    <#

    .SYNOPSIS
    Adds a new flowchart to a flowchart.

    .DESCRIPTION
    Create and add a subgraph. Subgraphs may contain nodes, links, interactions and other subgraphs.

    .LINK
    https://mermaid.js.org/syntax/flowchart.html#subgraphs

    #>

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
