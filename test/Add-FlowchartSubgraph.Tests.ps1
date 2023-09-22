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

        It works-by-named-parameters-with-passthru {
            $subgraph = $diagram | Add-MermaidFlowchartSubgraph -Key A -PassThru
            $diagram | Should -Not -BeNullOrEmpty
            $diagram.Subgraphs | Should -Not -BeNullOrEmpty
            $diagram.Subgraphs.Count | Should -Be 1
            $diagram.Subgraphs[0].Key | Should -Be A

            $subgraph.Key | Should -Be A
        }

        It works-by-position-with-passthru {
            $subgraph = $diagram | Add-MermaidFlowchartSubgraph A -PassThru
            $diagram | Should -Not -BeNullOrEmpty
            $diagram.Subgraphs | Should -Not -BeNullOrEmpty
            $diagram.Subgraphs.Count | Should -Be 1
            $diagram.Subgraphs[0].Key | Should -Be A

            $subgraph.Key | Should -Be A
        }

        Context parent-subgraph {

            BeforeEach {
                $parentSubgraph = $diagram | Add-MermaidFlowchartSubgraph -Key A -PassThru
            }

            It works {
                $parentSubgraph | Add-MermaidFlowchartSubgraph -Key B

                $diagram | Should -Not -BeNullOrEmpty
                $diagram.Subgraphs | Should -Not -BeNullOrEmpty
                $diagram.Subgraphs.Count | Should -Be 1
                $diagram.Subgraphs[0].Key | Should -Be A

                $diagram.Subgraphs[0].Subgraphs | Should -Not -BeNullOrEmpty
                $diagram.Subgraphs[0].Subgraphs.Count | Should -Be 1
                $diagram.Subgraphs[0].Subgraphs[0].Key | Should -Be B
            }
        }
    }
}
