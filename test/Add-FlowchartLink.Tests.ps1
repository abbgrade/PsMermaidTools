#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }

Describe Add-FcLink {

    BeforeAll {
        Import-Module $PSScriptRoot/../src/PsMermaidTools.psd1 -Force
    }

    Context flowchart {

        BeforeEach {
            $diagram = New-MermaidDiagram -Flowchart -Orientation top-down
        }

        It works-by-named-parameters {
            $diagram | Add-MermaidFlowchartLink -Source A -Destination B
            $diagram | Should -Not -BeNullOrEmpty
            $diagram.Links | Should -Not -BeNullOrEmpty
            $diagram.Links.Count | Should -Be 1
            $diagram.Links[0].SourceNode | Should -Be A
            $diagram.Links[0].SourceHead | Should -Be open
            $diagram.Links[0].DestinationNode | Should -Be B
            $diagram.Links[0].DestinationHead | Should -Be arrow
            $diagram.Links[0].Line | Should -Be solid
        }

        It works-by-named-parameters-with-text {
            $diagram | Add-MermaidFlowchartLink -Source A -Destination B -Line solid -Text 'text'
            $diagram | Should -Not -BeNullOrEmpty
            $diagram.Links | Should -Not -BeNullOrEmpty
            $diagram.Links.Count | Should -Be 1
            $diagram.Links[0].SourceNode | Should -Be A
            $diagram.Links[0].DestinationNode | Should -Be B
            $diagram.Links[0].Line | Should -Be solid
            $diagram.Links[0].Text | Should -Be text
        }

        It works-by-positions {
            $diagram | Add-MermaidFlowchartLink A B solid
            $diagram | Should -Not -BeNullOrEmpty
            $diagram.Links | Should -Not -BeNullOrEmpty
            $diagram.Links.Count | Should -Be 1
            $diagram.Links[0].SourceNode | Should -Be A
            $diagram.Links[0].DestinationNode | Should -Be B
            $diagram.Links[0].Line | Should -Be solid
        }
    }

}
