function Add-C4Component {

    <#

    .SYNOPSIS
    Add a component to a container boundary.

    .DESCRIPTION
    Add or create a component and add it to an C4 container boundary.

    .INPUTS
    C4ContainerBoundary object.

    .OUTPUTS
    None.

    .LINK
    https://abbgrade.github.io/PsMermaidTools/docs/Add-MermaidC4Component.html

    .LINK
    https://mermaid.js.org/syntax/c4c.html#c4-component-diagram-c4component

    #>

    [CmdletBinding()]
    param (
        # The boundary, that the component is added to.
        [Parameter( Mandatory, ValueFromPipeline, ParameterSetName = 'Object' )]
        [Parameter( Mandatory, ValueFromPipeline, ParameterSetName = 'Properties' )]
        [ValidateNotNull()]
        $Boundary,

        [Parameter( Mandatory, Position = 0, ParameterSetName = 'Object' )]
        $Component,

        # The identifier of the component.
        [Parameter( Mandatory, ParameterSetName = 'Properties' )]
        [string] $Key,

        # The component name.
        [Parameter( Mandatory, ParameterSetName = 'Properties' )]
        [string] $Name,

        # The component technology / implementation.
        [Parameter( ParameterSetName = 'Properties' )]
        [string] $Technology,

        # Describes the component.
        [Parameter( ParameterSetName = 'Properties' )]
        [string] $Description
    )

    switch ( $PSCmdlet.ParameterSetName ) {
        Properties {
            $Component = [PSCustomObject] @{
                Key = $Key
                Name = $Name
                Technology = $Technology
                Description = $Description
            }
        }
    }

    $Boundary.Components += $Component
}
