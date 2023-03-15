#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }

Describe Add-FlowchartNode {

    BeforeAll {
        Import-Module $PSScriptRoot/../src/PsMermaidTools.psd1 -Force
    }

    Context flowchart {

        BeforeEach {
            $diagram = New-MermaidDiagram -flowchart -Orientation top-down
        }

        It works-by-named-parmeters {
            $diagram | Add-MermaidFlowchartNode -Key A -Name foo -Shape round-edges
            $diagram | Should -Not -BeNullOrEmpty
            $diagram.Nodes | Should -Not -BeNullOrEmpty
            $diagram.Nodes.Count | Should -Be 1
            $diagram.Nodes[0].Key | Should -Be A
            $diagram.Nodes[0].Name | Should -Be foo
            $diagram.Nodes[0].Shape | Should -Be round-edges
        }

        It works-by-positions {
            $diagram | Add-MermaidFlowchartNode A foo round-edges
            $diagram | Should -Not -BeNullOrEmpty
            $diagram.Nodes | Should -Not -BeNullOrEmpty
            $diagram.Nodes.Count | Should -Be 1
            $diagram.Nodes[0].Key | Should -Be A
            $diagram.Nodes[0].Name | Should -Be foo
            $diagram.Nodes[0].Shape | Should -Be round-edges
        }
    }

}
