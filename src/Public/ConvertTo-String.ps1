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
    PS C:\> $diagram | Add-MermaidRelation Exactly-one Customer places Zero-or-more Order
    PS C:\> $diagram | Add-MermaidRelation Exactly-one Order contains One-or-more LineItem
    PS C:\> $diagram | Add-MermaidRelation One-or-more Customer uses One-or-more DeliveryAddress -NonIdentifying
    PS C:\> $diagram | ConvertTo-MermaidString
    erDiagram
        Customer ||--o{ Order : places
        Order ||--|{ LineItem : contains
        Customer }|..|{ DeliveryAddress : uses

    Create a erDiagram, add a few relations and convert it to a diagram string.

    #>

    [CmdletBinding()]
    param (
        #region erDiagram

        # The diagram type.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'erDiagram')]
        [string] $Type,

        # Collection of relations.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ParameterSetName = 'erDiagram')]
        [PsObject[]] $Relations,

        #end region

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

        #end region

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

        #end region
    )

    process {
        @(
            switch ($PSCmdlet.ParameterSetName) {
                erDiagram {
                    $Type | Write-Output
                    $Relations | ConvertTo-String | Write-Output
                }
                erRelation {
                    if ( $SecondEntity ) {
                        Write-Output "    $FirstEntity $( $Relationship | ConvertTo-String ) $SecondEntity$( if ( $Label ) {" : $Label" })"
                    }
                    else {
                        Write-Output "    $FirstEntity"
                    }
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
