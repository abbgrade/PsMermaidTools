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
    PS C:\> $diagram = New-MermaidDiagram -Type erDiagram
    PS C:\> $diagram | Add-MermaidRelation Exactly-one Customer places Zero-or-more Order
    PS C:\> $diagram | Add-MermaidRelation Exactly-one Order contains One-or-more LineItem
    PS C:\> $diagram | Add-MermaidRelation One-or-more Customer uses One-or-more DeliveryAddress -NonIdentifying
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
        [Parameter( Mandatory, ParameterSetName = 'flowchart' )]
        [Parameter( Mandatory, ParameterSetName = 'erDiagram' )]
        [ValidateSet('erDiagram', 'flowchart')]
        [string] $Type,

        # The diagram oriuebtatuib.
        [Parameter( Mandatory, ParameterSetName = 'flowchart' )]
        [ValidateSet('TB', 'TD', 'BT', 'RL', 'LR')]
        [string] $Orientation
    )

    $definition = [PSCustomObject]@{
        Type = $Type
    }

    switch ( $PSCmdlet.ParameterSetName ) {
        erDiagram {
            $definition | Add-Member Relations @()
        }
        flowchart {
            $definition | Add-Member Orientation $Orientation
            $definition | Add-Member Links $()
        }
    }

    Write-Output $definition

}
