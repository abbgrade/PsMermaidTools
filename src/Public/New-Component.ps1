function New-Component {

    [CmdletBinding()]
    param (
        # The identifier of the component.
        [Parameter( Mandatory )]
        [string] $Key,

        # The component name.
        [Parameter( Mandatory )]
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
