function Add-FlowchartClass {

    [CmdletBinding()]
    param (
        # The diagram, that the relation is added to.
        [Parameter(ValueFromPipeline)]
        [ValidateNotNull()]
        $Diagram,

        # The class name.
        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        # The class tyle.
        [Parameter(Mandatory, Position = 1)]
        [string] $Style
    )

    process {
        $class = [PSCustomObject]@{
            Name  = $Name
            Style = $Style
        }

        $Diagram.Classes += $class
    }

}
