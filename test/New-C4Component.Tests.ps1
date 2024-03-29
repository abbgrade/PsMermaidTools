#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }

Describe New-C4Component {

    BeforeAll {
        Import-Module $PSScriptRoot/../src/PsMermaidTools.psd1 -Force
    }

    Context C4Component {

        BeforeEach {
            $diagram = New-MermaidDiagram -C4Component
        }

        Context ContainerBoundary {

            BeforeEach {
                $container = New-MermaidC4ContainerBoundary -Key A -Name foo
                $diagram | Add-MermaidC4ContainerBoundary $container
            }

            It works {
                $component = New-MermaidC4Component -Key B -Name bar
                $component.Key | Should -Be B
                $component.Name | Should -Be bar
            }

            It works-with-details {
                $component = New-MermaidC4Component -Key B -Name bar -Technology tech -Description desc
                $component.Key | Should -Be B
                $component.Name | Should -Be bar
                $component.Technology | Should -Be tech
                $component.Description | Should -Be desc
            }
        }

    }

}
