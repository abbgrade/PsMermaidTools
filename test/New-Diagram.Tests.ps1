Describe New-Diagram {
    BeforeAll {
        Import-Module $PSScriptRoot/../src/PsMermaidTools.psd1 -Force
    }

    It creates-er-diagram {
        $diagram = New-MermaidDiagram -Type erDiagram
        $diagram | Should -Not -BeNullOrEmpty
        $diagram.Type | Should -Be erDiagram
        $diagram.Relations | Should -Be @()
        $diagram.Links | Should -BeNull
    }

    It creates-flowchart-diagram {
        $diagram = New-MermaidDiagram -Type flowchart -Orientation TD
        $diagram | Should -Not -BeNullOrEmpty
        $diagram.Type | Should -Be flowchart
        $diagram.Relations | Should -BeNull
        $diagram.Links | Should -Be @()
    }
}
