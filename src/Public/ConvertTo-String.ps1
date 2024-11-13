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

    #>

    [CmdletBinding()]
    param (

        #region diagram

        # The diagram link type.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'erDiagram')]
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'flowchart')]
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'C4ComponentDiagram')]
        [string] $Type,

        # Title of the diagram.
        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'erDiagram')]
        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'flowchart')]
        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'flowchartSubgraph')]
        [string] $Title,

        # Configuration of the diagram.
        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'erDiagram')]
        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'flowchart')]
        [hashtable] $Config,

        #endregion

        #region erDiagram

        # Collection of relations.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'erDiagram')]
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'C4ComponentDiagram')]
        [AllowEmptyCollection()]
        [PSCustomObject[]] $Relations,

        #endregion

        #region flowchart

        # Orientation of the flowchart.
        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'flowchart')]
        [string] $Orientation,

        # Collection of nodes for a flowchart.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'flowchart')]
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'flowchartSubgraph')]
        [AllowEmptyCollection()]
        [PSCustomObject[]] $Nodes,

        # Collection of links for a flowchart.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'flowchart')]
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'flowchartSubgraph')]
        [AllowEmptyCollection()]
        [PSCustomObject[]] $Links,

        # Collection of classes for a flowchart.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'flowchart')]
        [AllowEmptyCollection()]
        [PSCustomObject[]] $Classes,

        # Collection of clicks for a flowchart.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'flowchart')]
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'flowchartSubgraph')]
        [AllowEmptyCollection()]
        [PSCustomObject[]] $Clicks,

        # Collection of subgraphs for a flowchart.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'flowchart')]
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'flowchartSubgraph')]
        [AllowEmptyCollection()]
        [PSCustomObject[]] $Subgraphs,

        #endregion

        #region C4ComponentDiagram

        # Collection of container boundaries for a C4Component diagram.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'C4ComponentDiagram')]
        [AllowEmptyCollection()]
        [PSCustomObject[]] $ContainerBoundaries,

        # Collection of components for a C4Component diagram.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'C4ContainerBoundary')]
        [AllowEmptyCollection()]
        [PSCustomObject[]] $Components,

        #endregion

        #region C4Relation

        #
        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'C4Relation')]
        [string] $From,

        #
        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'C4Relation')]
        [string] $To,

        #endregion

        #region C4Component

        # The component technology / implementation.
        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'C4Component')]
        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'C4Relation')]
        [string] $Technology,

        # Describes the component.
        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'C4Component')]
        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'C4Relation')]
        [string] $Description,

        #endregion

        #region erRelation

        # First entity of the relation.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'erRelation')]
        [string] $FirstEntity,

        # Relationship of the relation.
        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'erRelation')]
        [PSCustomObject] $Relationship,

        # First second of the relation.
        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'erRelation')]
        [string] $SecondEntity,

        # Describes the relation.
        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'erRelation')]
        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'C4Relation')]
        [string] $Label,

        #endregion

        #region flowchartLink

        [Parameter(ParameterSetName = 'flowchartLink')]
        [switch] $FromFlowchartLink,

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
        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'flowchartNode')]
        [string] $Text,

        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'flowchartLink')]
        [string] $Line,

        #endregion

        #region flowchartNode

        [Parameter(ParameterSetName = 'flowchartNode')]
        [switch] $FromFlowchartNode,

        # Identifier of the node/container/component.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'flowchartNode')]
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'flowchartSubgraph')]
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'C4ContainerBoundary')]
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'C4Component')]
        [string] $Key,

        # Shape of the node.
        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'flowchartNode')]
        [string] $Shape,

        # Class of the node.
        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'flowchartNode')]
        [string] $Class,

        #endregion

        #region flowchartClass

        [Parameter(ParameterSetName = 'flowchartClass')]
        [switch] $FromFlowchartClass,

        # Name of the class/container.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'flowchartClass')]
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'C4ContainerBoundary')]
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'C4Component')]
        [string] $Name,

        # Style of the class.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'flowchartClass')]
        [string] $Style,

        #endregion

        #region flowchartClick

        [Parameter(ParameterSetName = 'flowchartClick')]
        [switch] $FromFlowchartClick,

        # Node of the click.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'flowchartClick')]
        [string] $Node,

        # Url of the click.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'flowchartClick')]
        [string] $Url,

        # Url of the click.
        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'flowchartClick')]
        [string] $Tooltip,

        # Target of the click.
        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = 'flowchartClick')]
        [string] $Target,

        #endregion

        #region flowchartSubgraph

        [Parameter(ParameterSetName = 'flowchartSubgraph')]
        [switch] $FromFlowchartSubgraph,

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
                    if ( $Title ) {
                        '---' | Write-Output
                        "title: $Title" | Write-Output
                        '---' | Write-Output
                    }
                    $Type | Write-Output
                    $Relations | ConvertTo-String | Write-Output
                }
                flowchart {
                    if ( $Title -or $Config ) {
                        '---' | Write-Output
                        $frontmatter = [ordered]@{}
                        if ( $Title ) {
                            $frontmatter.title = $Title
                        }
                        if ( $Config ) {
                            $frontmatter.config = $Config
                        }
                        $frontmatter | ConvertTo-Yaml | Write-Output
                        '---' | Write-Output
                    }
                    switch ( $Orientation ) {
                        top-to-bottom { "$Type TB" | Write-Output }
                        top-down { "$Type TD" | Write-Output }
                        bottom-to-top { "$Type BT" | Write-Output }
                        right-to-left { "$Type RL" | Write-Output }
                        left-to-right { "$Type LR" | Write-Output }
                        default { $Type | Write-Output }
                    }
                    $(
                        $Classes | ConvertTo-String -FromFlowchartClass | Write-Output
                        $Nodes | ConvertTo-String -FromFlowchartNode | Write-Output
                        $Clicks | ConvertTo-String -FromFlowchartClick | Write-Output
                        $Links | ConvertTo-String -FromFlowchartLink | Write-Output
                        ( $Subgraphs | ConvertTo-String -FromFlowchartSubgraph ) -split [Environment]::NewLine | Write-Output
                    ) | ForEach-Object { "    $_" | Write-Output }
                }
                C4ComponentDiagram {
                    $Type | Write-Output
                    $ContainerBoundaries | ConvertTo-String | Write-Output
                    $Relations | ConvertTo-String | Write-Output
                }
                erRelation {
                    $(
                        if ( $SecondEntity ) {
                            Write-Output "$FirstEntity $( $Relationship | ConvertTo-String ) $SecondEntity$( if ( $Label ) {" : $Label" })"
                        }
                        else {
                            Write-Output "$FirstEntity"
                        }
                    ) | ForEach-Object { "    $_" | Write-Output }
                }
                flowchartLink {
                    Write-Output "$SourceNode $(
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
                    Write-Output "$Key$(
                        switch ( $Shape ) {
                            '' { "$( $Text ? "[$Text]" : '' )" }
                            rectangle { "[$( $Text ? $Text : $Key )]" }
                            round-edges { "($( $Text ? $Text : $Key ))" }
                            stadium { "([$( $Text ? $Text : $Key )])" }
                            subroutine { "[[$( $Text ? $Text : $Key )]]" }
                            cylindrical { "[($( $Text ? $Text : $Key ))]" }
                            circle { "(($( $Text ? $Text : $Key )))" }
                            asymmetric { ">$( $Text ? $Text : $Key )]" }
                            rhombus { "{$( $Text ? $Text : $Key )}" }
                            hexagon { "{{$( $Text ? $Text : $Key )}}" }
                            parallelogram { "[/$( $Text ? $Text : $Key )/]" }
                            parallelogram-alt { "[\$( $Text ? $Text : $Key )\]" }
                            trapezoid { "[/$( $Text ? $Text : $Key )\]" }
                            trapezoid-alt { "[\$( $Text ? $Text : $Key )/]" }
                            double-circle { "((($( $Text ? $Text : $Key ))))" }
                            Default {
                                Write-Error "'$_' is not supported for Node Shape."
                            }
                        } )$( $Class ? ":::$Class" : '' )"
                }
                flowchartClass {
                    Write-Output "classDef $Name $Style"
                }
                flowchartClick {
                    Write-Output "click $Node ""$Url""$( if ( $Tooltip ) {  ' "' + $Tooltip + '"' } )$( if ( $Target ) { " _$Target" } )"
                }
                flowchartSubgraph {
                    Write-Output "subgraph $Key$( $Title ? " [$Title]" : '' )"
                    $(
                        $Nodes | ConvertTo-String -FromFlowchartNode | Write-Output
                        $Clicks | ConvertTo-String -FromFlowchartClick | Write-Output
                        $Links | ConvertTo-String -FromFlowchartLink | Write-Output
                        ( $Subgraphs | ConvertTo-String -FromFlowchartSubgraph ) -split [Environment]::NewLine | Write-Output
                    ) | ForEach-Object { "    $_" | Write-Output }
                    Write-Output "end"
                }
                C4ContainerBoundary {
                    Write-Output "Container_Boundary($Key, ""$Name"") {"
                    $Components | ForEach-Object { Write-Output "    $( $_ | ConvertTo-String )" }
                    Write-Output '}'
                }
                C4Component {
                    Write-Output "Component($Key, ""$Name""$( if ( $Technology ) { ', "' + $Technology + '"' } )$( if ( $Description ) { ', "' + $Description + '"' } ))"
                }
                C4Relation {
                    Write-Output "Rel($From, $To, ""$Label""$( if ( $Technology ) { ', "' + $Technology + '"' } )$( if ( $Description ) { ', "' + $Description + '"' } ))"
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
