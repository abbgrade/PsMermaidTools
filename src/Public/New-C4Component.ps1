function New-C4Component {

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
