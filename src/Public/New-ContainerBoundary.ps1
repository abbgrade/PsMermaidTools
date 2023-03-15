function New-ContainerBoundary {

    [CmdletBinding()]
    param (
        # The identifier of the container.
        [Parameter( Mandatory )]
        [string]
        $Key,

        # The container name.
        [Parameter( Mandatory )]
        [string]
        $Name
    )

    [PSCustomObject] @{
        Key = $Key
        Name = $Name
        Components = @()
    }

}
