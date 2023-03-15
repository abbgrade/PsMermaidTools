#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }

Describe Add-C4Relation {

    BeforeAll {
        Import-Module $PSScriptRoot/../src/PsMermaidTools.psd1 -Force
    }

    Context C4Component {

        BeforeEach {
            $diagram = New-MermaidDiagram -C4Component
            $componentA = New-MermaidC4Component a foo
            $componentB = New-MermaidC4Component b bar
        }

        It works-by-id {
            $diagram | Add-MermaidC4Relation -From $componentA.Key -To $componentB.Key -Label uses
            $diagram.Relations.Count | Should -Be 1
            $diagram.Relations[0].From | Should -Be $componentA.Key
            $diagram.Relations[0].To | Should -Be $componentB.Key
            $diagram.Relations[0].Label | Should -Be uses
        }

        It works-with-details {
            $diagram | Add-MermaidC4Relation -From $componentA.Key -To $componentB.Key -Label uses -Technology tech -Description desc
            $diagram.Relations.Count | Should -Be 1
            $diagram.Relations[0].From | Should -Be $componentA.Key
            $diagram.Relations[0].To | Should -Be $componentB.Key
            $diagram.Relations[0].Label | Should -Be uses
            $diagram.Relations[0].Technology | Should -Be tech
            $diagram.Relations[0].Description | Should -Be desc
        }
    }

}
