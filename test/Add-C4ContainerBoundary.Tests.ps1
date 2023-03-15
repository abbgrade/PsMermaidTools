#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }

Describe Add-C4ContainerBoundary {

    BeforeAll {
        Import-Module $PSScriptRoot/../src/PsMermaidTools.psd1 -Force
    }

    Context C4Component {

        BeforeEach {
            $diagram = New-MermaidDiagram -C4Component
        }

        It works {
            $diagram | Add-MermaidC4ContainerBoundary -Key A -Name foo
            $diagram.ContainerBoundaries | Should -Not -BeNullOrEmpty
            $diagram.ContainerBoundaries.Count | Should -Be 1
            $diagram.ContainerBoundaries[0].Key | Should -Be A
            $diagram.ContainerBoundaries[0].Name | Should -Be foo
        }

        Context ContainerBoundary {

            BeforeAll {
                $boundary = New-MermaidContainerBoundary -Key A -Name foo
            }

            It works {
                $diagram | Add-MermaidC4ContainerBoundary $boundary
                $diagram.ContainerBoundaries | Should -Not -BeNullOrEmpty
                $diagram.ContainerBoundaries.Count | Should -Be 1
                $diagram.ContainerBoundaries[0].Key | Should -Be A
                $diagram.ContainerBoundaries[0].Name | Should -Be foo
            }
        }
    }

}
