Describe Add-Node {
    BeforeAll {
        Import-Module $PSScriptRoot/../src/PsMermaidTools.psd1 -Force
    }

    Context flowchart {
        BeforeEach {
            $diagram = New-MermaidDiagram -Type flowchart -Orientation TD
        }

        It works-by-named-parmeters {
            $diagram | Add-MermaidNode -Key A -Name foo
            $diagram | Should -Not -BeNullOrEmpty
            $diagram.Nodes | Should -Not -BeNullOrEmpty
            $diagram.Nodes.Count | Should -Be 1
            $diagram.Nodes[0].Key | Should -Be A
            $diagram.Nodes[0].Name | Should -Be foo
        }

        It works-by-positions {
            $diagram | Add-MermaidNode A foo
            $diagram | Should -Not -BeNullOrEmpty
            $diagram.Nodes | Should -Not -BeNullOrEmpty
            $diagram.Nodes.Count | Should -Be 1
            $diagram.Nodes[0].Key | Should -Be A
            $diagram.Nodes[0].Name | Should -Be foo
        }
    }

}
