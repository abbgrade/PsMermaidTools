#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }

Describe Add-C4Component {

    BeforeAll {
        Import-Module $PSScriptRoot/../src/PsMermaidTools.psd1 -Force
    }

    Context C4Component {

        BeforeEach {
            $diagram = New-MermaidDiagram -C4Component
        }

        Context ContainerBoundary {

            BeforeEach {
                $container = New-MermaidContainerBoundary -Key A -Name foo
                $diagram | Add-MermaidC4ContainerBoundary $container
            }

            It works {
                $container | Add-MermaidC4Component -Key B -Name bar
                $container.Components | Should -Not -BeNullOrEmpty
                $container.Components.Count | Should -Be 1
                $container.Components[0].Key | Should -Be B
                $container.Components[0].Name | Should -Be bar
            }

            It works-with-details {
                $container | Add-MermaidC4Component -Key B -Name bar -Technology tech -Description desc
                $container.Components | Should -Not -BeNullOrEmpty
                $container.Components.Count | Should -Be 1
                $container.Components[0].Key | Should -Be B
                $container.Components[0].Name | Should -Be bar
                $container.Components[0].Technology | Should -Be tech
                $container.Components[0].Description | Should -Be desc
            }

            Context Component {

                BeforeAll {
                    $component = New-MermaidC4Component -Key B -Name bar -Technology tech -Description desc
                    $component.Key | Should -Be B
                    $component.Name | Should -Be bar
                    $component.Technology | Should -Be tech
                    $component.Description | Should -Be desc
                }

                It works {
                    $container | Add-MermaidC4Component $component
                    $container.Components | Should -Not -BeNullOrEmpty
                    $container.Components.Count | Should -Be 1
                    $container.Components[0].Key | Should -Be B
                    $container.Components[0].Name | Should -Be bar
                    $container.Components[0].Technology | Should -Be tech
                    $container.Components[0].Description | Should -Be desc
                }

            }

        }

    }

}
