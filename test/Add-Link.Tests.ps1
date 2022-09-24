Describe Add-Link {
    BeforeAll {
        Import-Module $PSScriptRoot/../src/PsMermaidTools.psd1 -Force
    }

    Context flowchart {
        BeforeEach {
            $diagram = New-MermaidDiagram -Type flowchart -Orientation TD
        }

        It works-by-named-parmeters {
            $diagram | Add-MermaidLink -Source A -Destination B -Type arrow
            $diagram | Should -Not -BeNullOrEmpty
            $diagram.Links | Should -Not -BeNullOrEmpty
            $diagram.Links.Count | Should -Be 1
            $diagram.Links[0].SourceNode | Should -Be A
            $diagram.Links[0].DestinationNode | Should -Be B
            $diagram.Links[0].Type | Should -Be arrow
        }

        It works-by-positions {
            $diagram | Add-MermaidLink A B arrow
            $diagram | Should -Not -BeNullOrEmpty
            $diagram.Links | Should -Not -BeNullOrEmpty
            $diagram.Links.Count | Should -Be 1
            $diagram.Links[0].SourceNode | Should -Be A
            $diagram.Links[0].DestinationNode | Should -Be B
            $diagram.Links[0].Type | Should -Be arrow
        }
    }

}
