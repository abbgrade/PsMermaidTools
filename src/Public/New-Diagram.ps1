function New-Diagram {

    <#

    .SYNOPSIS
    Creates a new mermaid diagram.

    .DESCRIPTION
    Creates and returns a new diagram definition, that can be populated and later exported.

    .INPUTS
    None.

    .OUTPUTS
    Mermaid diagram definition object.

    .EXAMPLE
    PS C:\> $diagram = New-MermaidDiagram -ErDiagram
    PS C:\> $diagram | Add-MermaidErRelation Exactly-one Customer places Zero-or-more Order
    PS C:\> $diagram | Add-MermaidErRelation Exactly-one Order contains One-or-more LineItem
    PS C:\> $diagram | Add-MermaidErRelation One-or-more Customer uses One-or-more DeliveryAddress -NonIdentifying
    PS C:\> $diagram | ConvertTo-MermaidString
    erDiagram
        Customer ||--o{ Order : places
        Order ||--|{ LineItem : contains
        Customer }|..|{ DeliveryAddress : uses

    Create a erDiagram, add a few relations and convert it to a diagram string.

    .LINK
    https://mermaid-js.github.io/mermaid/#/README?id=diagram-types

    #>

    [CmdletBinding( DefaultParameterSetName = 'erDiagram' )]
    param (
        # The mermaid diagram type.
        [Parameter( Mandatory, ParameterSetName = 'flowchart', Position = 0 )]
        [switch] $Flowchart,

        [Parameter( Mandatory, ParameterSetName = 'erDiagram', Position = 0 )]
        [switch] $ErDiagram,

        [Parameter( Mandatory, ParameterSetName = 'C4Component', Position = 0 )]
        [switch] $C4Component,

        # The diagram orientation.
        [Parameter( ParameterSetName = 'flowchart', Position = 1 )]
        [ValidateSet('top-to-bottom', 'top-down', 'bottom-to-top', 'right-to-left', 'left-to-right')]
        [string] $Orientation,

        # The diagram title.
        [Parameter( ParameterSetName = 'flowchart')]
        [Parameter( ParameterSetName = 'erDiagram')]
        [string] $Title,

        # The diagram configuration.
        [Parameter( ParameterSetName = 'flowchart')]
        [Parameter( ParameterSetName = 'erDiagram')]
        [hashtable] $Config
    )

    $definition = [PSCustomObject]@{
        Type = $PSCmdlet.ParameterSetName
    }

    switch ( $definition.Type ) {
        erDiagram {
            if ( $Title ) {
                $definition | Add-Member Title $Title
            }

            if ( $Config ) {
                $definition | Add-Member Config $Config
            }

            $definition | Add-Member Entities ([ordered]@{})
            $definition | Add-Member Relations @()
        }
        flowchart {
            if ( $Title ) {
                $definition | Add-Member Title $Title
            }

            if ( $Config ) {
                $definition | Add-Member Config $Config
            }

            if ( $Orientation ) {
                $definition | Add-Member Orientation $Orientation
            }

            $definition | Add-Member Nodes @()
            $definition | Add-Member Links @()
            $definition | Add-Member Classes @()
            $definition | Add-Member Clicks @()
            $definition | Add-Member Subgraphs @()
        }
        C4Component {
            $definition | Add-Member ContainerBoundaries @()
            $definition | Add-Member Relations @()
        }
    }

    Write-Output $definition

}
