function Add-FlowchartClass {

    <#

    .SYNOPSIS
    Adds a new class to a flowchart.

    .DESCRIPTION
    Create a class and add it to a flowchart to define the style of a set of nodes.

    .LINK
    https://mermaid.js.org/syntax/flowchart.html#classes

    #>

    [CmdletBinding()]
    param (
        # The diagram, that the class is added to.
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
