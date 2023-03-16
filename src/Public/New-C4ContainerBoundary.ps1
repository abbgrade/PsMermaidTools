function New-C4ContainerBoundary {

    <#

    .SYNOPSIS
    Create a container boundary.

    .DESCRIPTION
    Create a container boundary for a C4 diagram. It can be edited and referenced.

    .OUTPUTS
    None.

    .LINK
    https://abbgrade.github.io/PsMermaidTools/docs/New-MermaidC4ContainerBoundary.html

    .LINK
    https://mermaid.js.org/syntax/c4c.html#c4-component-diagram-c4component

    #>

    [CmdletBinding()]
    param (
        # The identifier of the container.
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Key,

        # The container name.
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Name
    )

    [PSCustomObject] @{
        Key = $Key
        Name = $Name
        Components = @()
    }

}
