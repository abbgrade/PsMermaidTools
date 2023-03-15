function Add-C4Component {

    [CmdletBinding()]
    param (
        # The boundary, that the component is added to.
        [Parameter( Mandatory, ValueFromPipeline, ParameterSetName = 'Object' )]
        [Parameter( Mandatory, ValueFromPipeline, ParameterSetName = 'Properties' )]
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
