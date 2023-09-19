#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }

Describe FlowchartSubgraph {

    BeforeAll {
        Import-Module $PSScriptRoot/../src/PsMermaidTools.psd1 -Force
    }

    Context flowchart {

        BeforeEach {
            $diagram = New-MermaidDiagram -Flowchart -Orientation top-down
        }

        It works-by-named-parameters {
            $diagram | Add-MermaidFlowchartSubgraph -Key A
            $diagram | Should -Not -BeNullOrEmpty
            $diagram.Subgraphs | Should -Not -BeNullOrEmpty
            $diagram.Subgraphs.Count | Should -Be 1
            $diagram.Subgraphs[0].Key | Should -Be A
        }

        It works-by-position {
            $diagram | Add-MermaidFlowchartSubgraph A
            $diagram | Should -Not -BeNullOrEmpty
            $diagram.Subgraphs | Should -Not -BeNullOrEmpty
            $diagram.Subgraphs.Count | Should -Be 1
            $diagram.Subgraphs[0].Key | Should -Be A
        }
    }
}
