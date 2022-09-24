Describe Add-Link {
    BeforeAll {
        Import-Module $PSScriptRoot/../src/PsMermaidTools.psd1 -Force
    }

    Context flowchart {
        BeforeEach {
            $diagram = New-MermaidDiagram -Type flowchart -Orientation TD
        }

        It works-by-named-parmeters {
            $diagram | Add-MermaidLink -Source A -Destination B
            $diagram | Should -Not -BeNullOrEmpty
            $diagram.Links | Should -Not -BeNullOrEmpty
            $diagram.Links.Count | Should -Be 1
            $diagram.Links[0].SourceNode | Should -Be A
        }

        It works-by-positions {
            $diagram | Add-MermaidLink A B
            $diagram | Should -Not -BeNullOrEmpty
            $diagram.Links | Should -Not -BeNullOrEmpty
            $diagram.Links.Count | Should -Be 1
            $diagram.Links[0].SourceNode | Should -Be A
        }
    }

}
