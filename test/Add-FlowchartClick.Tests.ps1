#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }

Describe Add-FlowchartClick {

    BeforeAll {
        Import-Module $PSScriptRoot/../src/PsMermaidTools.psd1 -Force
    }

    Context flowchart {

        BeforeEach {
            $diagram = New-MermaidDiagram -Flowchart
        }

        It works-by-named-parmeters {
            $diagram | Add-MermaidFlowchartClick -Node foo -Url 'http://localhost' -Tooltip 'home sweet home' -Target blank
            $diagram | Should -Not -BeNullOrEmpty
            $diagram.Clicks | Should -Not -BeNullOrEmpty
            $diagram.Clicks.Count | Should -Be 1
            $diagram.Clicks[0].Node | Should -Be foo
            $diagram.Clicks[0].Url | Should -Be 'http://localhost'
            $diagram.Clicks[0].Tooltip | Should -Be 'home sweet home'
            $diagram.Clicks[0].Target | Should -Be blank
        }

        It works-by-positions {
            $diagram | Add-MermaidFlowchartClick foo 'http://localhost' -Tooltip 'home sweet home' -Target blank
            $diagram | Should -Not -BeNullOrEmpty
            $diagram.Clicks | Should -Not -BeNullOrEmpty
            $diagram.Clicks.Count | Should -Be 1
            $diagram.Clicks[0].Node | Should -Be foo
            $diagram.Clicks[0].Url | Should -Be 'http://localhost'
            $diagram.Clicks[0].Tooltip | Should -Be 'home sweet home'
            $diagram.Clicks[0].Target | Should -Be blank
        }
    }

}
