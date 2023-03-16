function New-C4Component {

    <#

    .SYNOPSIS
    Create a component.

    .DESCRIPTION
    Create a component for a C4 diagram. It can be edited and referenced.

    .OUTPUTS
    None.

    .LINK
    https://abbgrade.github.io/PsMermaidTools/docs/New-MermaidC4Component.html

    .LINK
    https://mermaid.js.org/syntax/c4c.html#c4-component-diagram-c4component

    #>

    [CmdletBinding()]
    param (
        # The identifier of the component.
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Key,

        # The component name.
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Name,

        # The component technology / implementation.
        [Parameter()]
        [string] $Technology,

        # Describes the component.
        [Parameter()]
        [string] $Description
    )

    [PSCustomObject] @{
        Key = $Key
        Name = $Name
        Technology = $Technology
        Description = $Description
    }
}
