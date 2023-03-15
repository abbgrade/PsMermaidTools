function Add-C4ContainerBoundary {

    [CmdletBinding()]
    param (
        # The diagram, that the container is added to.
        [Parameter( Mandatory, ValueFromPipeline, ParameterSetName = 'Object' )]
        [Parameter( Mandatory, ValueFromPipeline, ParameterSetName = 'Properties' )]
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
