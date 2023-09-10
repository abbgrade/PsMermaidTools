#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }

Describe New-Diagram {

    BeforeAll {
        Import-Module $PSScriptRoot/../src/PsMermaidTools.psd1 -Force
    }

    It creates-er-diagram {
        $diagram = New-MermaidDiagram -ErDiagram
        $diagram | Should -Not -BeNullOrEmpty
        $diagram.Type | Should -Be erDiagram
        $diagram.Relations | Should -Be @()
        $diagram.Links | Should -BeNull
        $diagram.Nodes | Should -BeNull
    }

    It creates-er-diagram-with-title {
        $diagram = New-MermaidDiagram -ErDiagram -Title Test
        $diagram | Should -Not -BeNullOrEmpty
        $diagram.Title | Should -Be Test
        $diagram.Type | Should -Be erDiagram
        $diagram.Relations | Should -Be @()
        $diagram.Links | Should -BeNull
        $diagram.Nodes | Should -BeNull
    }

    It creates-Flowchart-diagram {
        $diagram = New-MermaidDiagram -Flowchart
        $diagram | Should -Not -BeNullOrEmpty
        $diagram.Type | Should -Be flowchart
        $diagram.Relations | Should -BeNull
        $diagram.Links | Should -Be @()
        $diagram.Nodes | Should -Be @()
        $diagram.Orientation | Should -BeNull
    }

    It creates-Flowchart-diagram-with-title {
        $diagram = New-MermaidDiagram -Flowchart -Orientation top-down -Title Test
        $diagram | Should -Not -BeNullOrEmpty
        $diagram.Title | Should -Be Test
        $diagram.Type | Should -Be flowchart
        $diagram.Relations | Should -BeNull
        $diagram.Links | Should -Be @()
        $diagram.Nodes | Should -Be @()
        $diagram.Orientation | Should -Be top-down
    }

    It creates-c4-component-diagram {
        $diagram = New-MermaidDiagram -C4Component
        $diagram | Should -Not -BeNullOrEmpty
        $diagram.Type | Should -Be C4Component
        $diagram.ContainerBoundaries | Should -Be @()
        $diagram.Relations | Should -Be @()
    }
}
