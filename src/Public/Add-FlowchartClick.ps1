function Add-FlowchartClick {

    [CmdletBinding()]
    param (
        # The diagram, that the click is added to.
        [Parameter(ValueFromPipeline)]
        [ValidateNotNull()]
        $Diagram,

        # The key of the node, to add the click to.
        [Parameter(Mandatory, Position = 0)]
        [string] $Node,

        # The url to open, when the node is clicked.
        [Parameter(Mandatory, Position = 1)]
        [string] $Url,

        # The tooltip text.
        [Parameter()]
        [string] $Tooltip,

        # The target to open the url to.
        [Parameter(Mandatory)]
        [ValidateSet('self', 'blank', 'parent', 'top')]
        [string] $Target
    )

    process {
        $click = [PSCustomObject]@{
            Node  = $Node
            Url = $Url
        }

        if ( $Tooltip ) {
            $click | Add-Member Tooltip $Tooltip
        }

        if ( $Target ) {
            $click | Add-Member Target $Target
        }

        $Diagram.Clicks += $click
    }

}
