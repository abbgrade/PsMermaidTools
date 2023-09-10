#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }

Describe Add-FlowchartNode {

    BeforeAll {
        Import-Module $PSScriptRoot/../src/PsMermaidTools.psd1 -Force
    }

    Context flowchart {

        BeforeEach {
            $diagram = New-MermaidDiagram -Flowchart -Orientation top-down
        }

        It works-by-named-parmeters-minimum {
            $diagram | Add-MermaidFlowchartNode -Key A
            $diagram | Should -Not -BeNullOrEmpty
            $diagram.Nodes | Should -Not -BeNullOrEmpty
            $diagram.Nodes.Count | Should -Be 1
            $diagram.Nodes[0].Key | Should -Be A
            $diagram.Nodes[0].Text | Should -BeNullOrEmpty
            $diagram.Nodes[0].Shape | Should -BeNullOrEmpty
            $diagram.Nodes[0].Class | Should -BeNull
        }

        It works-by-positions-minimum {
            $diagram | Add-MermaidFlowchartNode A
            $diagram | Should -Not -BeNullOrEmpty
            $diagram.Nodes | Should -Not -BeNullOrEmpty
            $diagram.Nodes.Count | Should -Be 1
            $diagram.Nodes[0].Key | Should -Be A
            $diagram.Nodes[0].Text | Should -BeNullOrEmpty
            $diagram.Nodes[0].Shape | Should -BeNullOrEmpty
            $diagram.Nodes[0].Class | Should -BeNull
        }

        It works-by-named-parmeters {
            $diagram | Add-MermaidFlowchartNode -Key A -Text foo -Shape round-edges
            $diagram | Should -Not -BeNullOrEmpty
            $diagram.Nodes | Should -Not -BeNullOrEmpty
            $diagram.Nodes.Count | Should -Be 1
            $diagram.Nodes[0].Key | Should -Be A
            $diagram.Nodes[0].Text | Should -Be foo
            $diagram.Nodes[0].Shape | Should -Be round-edges
            $diagram.Nodes[0].Class | Should -BeNull
        }

        It works-by-positions {
            $diagram | Add-MermaidFlowchartNode A foo round-edges
            $diagram | Should -Not -BeNullOrEmpty
            $diagram.Nodes | Should -Not -BeNullOrEmpty
            $diagram.Nodes.Count | Should -Be 1
            $diagram.Nodes[0].Key | Should -Be A
            $diagram.Nodes[0].Text | Should -Be foo
            $diagram.Nodes[0].Shape | Should -Be round-edges
            $diagram.Nodes[0].Class | Should -BeNull
        }

        Context class {

            BeforeEach {
                $diagram | Add-MermaidFlowchartClass foobar 'solid:#ffffff'
            }

            It works-by-named-parmeters-with-class-without-name {
                $diagram | Add-MermaidFlowchartNode -Key A -Class foobar
                $diagram | Should -Not -BeNullOrEmpty
                $diagram.Nodes | Should -Not -BeNullOrEmpty
                $diagram.Nodes.Count | Should -Be 1
                $diagram.Nodes[0].Key | Should -Be A
                $diagram.Nodes[0].Text | Should -BeNull
                $diagram.Nodes[0].Shape | Should -BeNull
                $diagram.Nodes[0].Class | Should -Be foobar
            }

            It works-by-positions-with-class-without-name {
                $diagram | Add-MermaidFlowchartNode A -Class foobar
                $diagram | Should -Not -BeNullOrEmpty
                $diagram.Nodes | Should -Not -BeNullOrEmpty
                $diagram.Nodes.Count | Should -Be 1
                $diagram.Nodes[0].Key | Should -Be A
                $diagram.Nodes[0].Text | Should -BeNull
                $diagram.Nodes[0].Shape | Should -BeNull
                $diagram.Nodes[0].Class | Should -Be foobar
            }

            It works-by-named-parmeters-with-class-and-name {
                $diagram | Add-MermaidFlowchartNode -Key A -Text foo -Class foobar
                $diagram | Should -Not -BeNullOrEmpty
                $diagram.Nodes | Should -Not -BeNullOrEmpty
                $diagram.Nodes.Count | Should -Be 1
                $diagram.Nodes[0].Key | Should -Be A
                $diagram.Nodes[0].Text | Should -Be foo
                $diagram.Nodes[0].Shape | Should -BeNull
                $diagram.Nodes[0].Class | Should -Be foobar
            }

            It works-by-positions-with-class-and-name {
                $diagram | Add-MermaidFlowchartNode A foo -Class foobar
                $diagram | Should -Not -BeNullOrEmpty
                $diagram.Nodes | Should -Not -BeNullOrEmpty
                $diagram.Nodes.Count | Should -Be 1
                $diagram.Nodes[0].Key | Should -Be A
                $diagram.Nodes[0].Text | Should -Be foo
                $diagram.Nodes[0].Shape | Should -BeNull
                $diagram.Nodes[0].Class | Should -Be foobar
            }
        }
    }
}
