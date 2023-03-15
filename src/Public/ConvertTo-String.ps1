function ConvertTo-String {

    <#

    .SYNOPSIS
    Converts a mermaid definition to string.

    .DESCRIPTION
    Generates mermaid syntax for definitions created with this module.

    .INPUTS
    Mermaid diagram definition object.

    .OUTPUTS
    String.

    .EXAMPLE
    PS C:\> $diagram = New-MermaidDiagram -Type erDiagram
    PS C:\> $diagram | Add-MermaidErRelation Exactly-one Customer places Zero-or-more Order
    PS C:\> $diagram | Add-MermaidErRelation Exactly-one Order contains One-or-more LineItem
    PS C:\> $diagram | Add-MermaidErRelation One-or-more Customer uses One-or-more DeliveryAddress -NonIdentifying
    PS C:\> $diagram | ConvertTo-MermaidString
    erDiagram
        Customer ||--o{ Order : places
        Order ||--|{ LineItem : contains
        Customer }|..|{ DeliveryAddress : uses

    Create a erDiagram, add a few relations and convert it to a diagram string.

    #>

    [CmdletBinding()]
    param (

        #region diagram

        # The diagram link type.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'erDiagram')]
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'flowchart')]
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'C4ComponentDiagram')]
        [string] $Type,

        #endregion

        #region erDiagram

        # Collection of relations.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'erDiagram')]
        [AllowEmptyCollection()]
        [PsObject[]] $Relations,

        #endregion
        #region flowchart

        # Orientation of the flowchart.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'flowchart')]
        [string] $Orientation,

        # Collection of nodes for a flowchart.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'flowchart')]
        [AllowEmptyCollection()]
        [PsObject[]] $Nodes,

        # Collection of links for a flowchart.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'flowchart')]
        [AllowEmptyCollection()]
        [PsObject[]] $Links,

        #endregion
        #region C4ComponentDiagram

        # Collection of container boundaries for a C4Component diagram.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'C4ComponentDiagram')]
        [AllowEmptyCollection()]
        [PsObject[]] $ContainerBoundaries,

        # Collection of components for a C4Component diagram.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'C4ContainerBoundary')]
        [AllowEmptyCollection()]
        [PSObject[]] $Components,

        #endregion

        #region C4Component

        # The component technology / implementation.
        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'C4Component')]
        [string] $Technology,

        # Describes the component.
        [Parameter(ValueFromPipelineByPropertyName,  ParameterSetName = 'C4Component')]
        [string] $Description,

        #endregion

        #region erRelation

        # First entity of the relation.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'erRelation')]
        [string] $FirstEntity,

        # Relationship of the relation.
        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'erRelation')]
        [PSObject] $Relationship,

        # First second of the relation.
        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'erRelation')]
        [string] $SecondEntity,

        # Describes the relation.
        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'erRelation')]
        [string] $Label,

        #endregion

        #region flowchartLink

        # Source node of the link.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'flowchartLink')]
        [string] $SourceNode,

        # Source node of the link.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'flowchartLink')]
        [string] $SourceHead,

        # Destination node of the link.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'flowchartLink')]
        [string] $DestinationNode,

        # Destination node of the link.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'flowchartLink')]
        [string] $DestinationHead,

        # Link text.
        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'flowchartLink')]
        [string] $Text,

        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'flowchartLink')]
        [string] $Line,

        #endregion

        #region flowchartNode

        # Indentifier of the node/container/component.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'flowchartNode')]
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'C4ContainerBoundary')]
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'C4Component')]
        [string] $Key,

        # Name of the node/container.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'flowchartNode')]
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'C4ContainerBoundary')]
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'C4Component')]
        [string] $Name,

        # Shape of the node.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'flowchartNode')]
        [string] $Shape,

        #endregion

        #region erRelationship

        # Cardinality of the first entity.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'erRelationship')]
        [string] $FirstCardinality,

        # Cardinality of the second entity.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'erRelationship')]
        [string] $SecondCardinality,

        # Flags if one entity may exist without the other.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'erRelationship')]
        [bool] $Identifying

        #endregion
    )

    process {
        @(
            switch ($PSCmdlet.ParameterSetName) {
                erDiagram {
                    $Type | Write-Output
                    $Relations | ConvertTo-String | Write-Output
                }
                flowchart {
                    switch ( $Orientation ) {
                        top-to-bottom { "$Type TB" | Write-Output }
                        top-down { "$Type TD" | Write-Output }
                        bottom-to-top { "$Type BT" | Write-Output }
                        right-to-left { "$Type RL" | Write-Output }
                        left-to-right { "$Type LR" | Write-Output }
                    }
                    $Nodes | ConvertTo-String | Write-Output
                    $Links | ConvertTo-String | Write-Output
                }
                C4ComponentDiagram {
                    $Type | Write-Output
                    $ContainerBoundaries | ConvertTo-String | Write-Output
                }
                erRelation {
                    if ( $SecondEntity ) {
                        Write-Output "    $FirstEntity $( $Relationship | ConvertTo-String ) $SecondEntity$( if ( $Label ) {" : $Label" })"
                    }
                    else {
                        Write-Output "    $FirstEntity"
                    }
                }
                flowchartLink {
                    Write-Output "    $SourceNode $(
                        switch ( $Line ) {
                            solid { "$(
                                switch ( $SourceHead ) {
                                    open { '-' }
                                    arrow { '<' }
                                    circle { 'o' }
                                    cross { 'x' }
                                    Default {
                                        Write-Error "convert $_ is not supported."
                                    }
                                }
                            )$(
                                if ( $SourceHead -ne 'open' ) { '-'}
                             )-$(
                                switch ( $DestinationHead ) {
                                    open { '-' }
                                    arrow { '>' }
                                    circle { 'o' }
                                    cross { 'x' }
                                    Default {
                                        Write-Error "convert $_ is not supported."
                                    }
                                }
                            )" }
                            dotted { "$(
                                switch ( $SourceHead ) {
                                    open { '' }
                                    arrow { '>' }
                                    circle { 'o' }
                                    cross { 'x' }
                                    Default {
                                        Write-Error "convert $_ is not supported."
                                    }
                                }
                            )-.-$(
                                switch ( $DestinationHead ) {
                                    open { '' }
                                    arrow { '>' }
                                    circle { 'o' }
                                    cross { 'x' }
                                    Default {
                                        Write-Error "convert $_ is not supported."
                                    }
                                }
                            )" }
                            thick { "$(
                                switch ( $SourceHead ) {
                                    open { '=' }
                                    arrow { '<' }
                                    circle { 'o' }
                                    cross { 'x' }
                                    Default {
                                        Write-Error "convert $_ is not supported."
                                    }
                                }
                            )=$(
                                if ( $SourceHead -ne 'open' ) { '=' }
                             )$(
                                switch ( $DestinationHead ) {
                                    open { '=' }
                                    arrow { '>' }
                                    circle { 'o' }
                                    cross { 'x' }
                                    Default {
                                        Write-Error "convert $_ is not supported."
                                    }
                                }
                            )" }
                            Default {
                                Write-Error "convert $_ is not supported."
                            }
                        }
                    )$( if ( $Text ) { "|$Text|" } ) $DestinationNode"
                }
                flowchartNode {
                    switch ( $Shape ) {
                        round-edges { Write-Output "    $Key($Name)" }
                        stadium { Write-Output "    $Key([$Name])" }
                        subroutine { Write-Output "    $Key[[$Name]]" }
                        cylindrical { Write-Output "    $Key[($Name)]" }
                        circle { Write-Output "    $Key(($Name))" }
                        asymmetric { Write-Output "    $Key>$Name]" }
                        rhombus { Write-Output "    $Key{$Name}" }
                        hexagon { Write-Output "    $Key{{$Name}}" }
                        parallelogram { Write-Output "    $Key[/$Name/]" }
                        parallelogram-alt { Write-Output "    $Key[\$Name\]" }
                        trapezoid { Write-Output "    $Key[/$Name\]" }
                        trapezoid-alt { Write-Output "    $Key[\$Name/]" }
                        double-circle { Write-Output "    $Key((($Name)))" }
                        Default {
                            Write-Error "'$_' is not supported for Node Shape."
                        }
                    }
                }
                C4ContainerBoundary {
                    Write-Output "Container_Boundary($Key, ""$Name"") {"
                    $Components | ForEach-Object { Write-Output "    $( $_ | ConvertTo-String )" }
                    Write-Output '}'
                }
                C4Component {
                    Write-Output "Component($Key, ""$Name""$( if ( $Technology ) { ', "' + $Technology + '"' } )$( if ( $Description ) { ', "' + $Description + '"' } ))"
                }
                erRelationship {
                    $FirstCardinalityCode = switch ($FirstCardinality) {
                        Zero-or-one { '|o' }
                        Exactly-one { '||' }
                        Zero-or-more { '{o' }
                        One-or-more { '}|' }
                        Default {
                            Write-Error "'$_' is not supported for FirstCardinality."
                        }
                    }
                    $SecondCardinalityCode = switch ($SecondCardinality) {
                        Zero-or-one { 'o|' }
                        Exactly-one { '||' }
                        Zero-or-more { 'o{' }
                        One-or-more { '|{' }
                        Default {
                            Write-Error "'$_' is not supported for SecondCardinality."
                        }
                    }
                    $IdentifyingCode = if ( $Identifying ) { '--' } else { '..' }
                    Write-Output "$FirstCardinalityCode$IdentifyingCode$SecondCardinalityCode"
                }
                Default {
                    Write-Error "convert $_ is not supported."
                }
            }
        ) -join [Environment]::NewLine | Write-Output
    }
}
