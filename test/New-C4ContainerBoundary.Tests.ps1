#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }

Describe New-C4ContainerBoundary {

    BeforeAll {
        Import-Module $PSScriptRoot/../src/PsMermaidTools.psd1 -Force
    }

    It works {
        $boundary = New-MermaidC4ContainerBoundary -Key A -Name foo
        $boundary | Should -Not -BeNullOrEmpty
        $boundary.Key | Should -Be A
        $boundary.Name | Should -Be foo
    }

}
