Describe New-Diagram {
    BeforeAll {
        Import-Module $PSScriptRoot/../src/PsMermaidTools.psd1 -Force
    }

    It works {
        $diagram = New-MermaidDiagram -Type erDiagram
        $diagram | Should -Not -BeNullOrEmpty
        $diagram.Type | Should -Be erDiagram
    }
}
