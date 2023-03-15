function New-C4ContainerBoundary {

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
