#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }

Describe Add-FlowchartClass {

    BeforeAll {
        Import-Module $PSScriptRoot/../src/PsMermaidTools.psd1 -Force
    }

    Context flowchart {

        BeforeEach {
            $diagram = New-MermaidDiagram -Flowchart -Orientation top-down
        }

        It works-by-named-parmeters {
            $diagram | Add-MermaidFlowchartClass -Name foo -Style 'fill:#ffffff'
            $diagram | Should -Not -BeNullOrEmpty
            $diagram.Classes | Should -Not -BeNullOrEmpty
            $diagram.Classes.Count | Should -Be 1
            $diagram.Classes[0].Name | Should -Be foo
            $diagram.Classes[0].Style | Should -Be 'fill:#ffffff'
        }

        It works-by-positions {
            $diagram | Add-MermaidFlowchartClass foo 'fill:#ffffff'
            $diagram | Should -Not -BeNullOrEmpty
            $diagram.Classes | Should -Not -BeNullOrEmpty
            $diagram.Classes.Count | Should -Be 1
            $diagram.Classes[0].Name | Should -Be foo
            $diagram.Classes[0].Style | Should -Be 'fill:#ffffff'
        }
    }

}
