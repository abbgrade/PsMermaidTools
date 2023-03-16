function Add-C4ContainerBoundary {

    <#

    .SYNOPSIS
    Add a container boundary to a diagram.

    .DESCRIPTION
    Add or create a container boundary and add it to an C4 diagram.

    .INPUTS
    C4Component diagram object.

    .OUTPUTS
    None.

    .LINK
    https://abbgrade.github.io/PsMermaidTools/docs/Add-MermaidC4ContainerBoundary.html

    .LINK
    https://mermaid.js.org/syntax/c4c.html#c4-component-diagram-c4component

    #>

    [CmdletBinding()]
    param (
        # The diagram, that the container is added to.
        [Parameter( Mandatory, ValueFromPipeline, ParameterSetName = 'Object' )]
        [Parameter( Mandatory, ValueFromPipeline, ParameterSetName = 'Properties' )]
        [ValidateNotNull()]
        $Diagram,

        [Parameter( Mandatory, Position = 0, ParameterSetName = 'Object' )]
        $ContainerBoundary,

        # The identifier of the container.
        [Parameter( Mandatory, ParameterSetName = 'Properties' )]
        [string]
        $Key,

        # The container name.
        [Parameter( Mandatory, ParameterSetName = 'Properties' )]
        [string]
        $Name
    )

    switch ( $PSCmdlet.ParameterSetName ) {
        Properties {
            $ContainerBoundary = New-C4ContainerBoundary `
                -Key $Key `
                -Name $Name
        }
    }

    $Diagram.ContainerBoundaries += $ContainerBoundary
}
