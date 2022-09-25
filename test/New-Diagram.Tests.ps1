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
        $diagram.Nodes | Should -BeNull
    }

    It creates-er-diagram-by-position {
        $diagram = New-MermaidDiagram erDiagram
        $diagram | Should -Not -BeNullOrEmpty
        $diagram.Type | Should -Be erDiagram
        $diagram.Relations | Should -Be @()
        $diagram.Links | Should -BeNull
        $diagram.Nodes | Should -BeNull
    }

    It creates-flowchart-diagram {
        $diagram = New-MermaidDiagram -Type flowchart -Orientation top-down
        $diagram | Should -Not -BeNullOrEmpty
        $diagram.Type | Should -Be flowchart
        $diagram.Relations | Should -BeNull
        $diagram.Links | Should -Be @()
        $diagram.Nodes | Should -Be @()
    }

    It creates-flowchart-diagram-by-position {
        $diagram = New-MermaidDiagram flowchart top-down
        $diagram | Should -Not -BeNullOrEmpty
        $diagram.Type | Should -Be flowchart
        $diagram.Relations | Should -BeNull
        $diagram.Links | Should -Be @()
        $diagram.Nodes | Should -Be @()
    }
}
