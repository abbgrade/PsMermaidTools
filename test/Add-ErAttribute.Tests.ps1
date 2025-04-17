#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }

Describe Add-ErAttribute {

    BeforeAll {
        Import-Module $PSScriptRoot/../src/PsMermaidTools.psd1 -Force
    }

    Context erDiagram {

        BeforeEach {
            $diagram = New-MermaidDiagram -ErDiagram
        }

        It works-with-attributes {
            $diagram | Add-MermaidErAttribute -Entity Customer -Name Name -Type String
            $diagram | Add-MermaidErAttribute -Entity Customer -Name Sector -Type String
            $diagram | Add-MermaidErAttribute -Entity Order -Name Number -Type Int
            $diagram | Should -Not -BeNullOrEmpty
            $diagram.Entities | Should -Not -BeNullOrEmpty
            $diagram.Entities.Count | Should -Be 2
            $diagram.Entities['Customer'].Attributes | Should -Not -BeNullOrEmpty
            $diagram.Entities['Customer'].Attributes.Count | Should -Be 2
            $diagram.Entities['Customer'].Attributes[0].Name | Should -Be Name
            $diagram.Entities['Customer'].Attributes[0].Type | Should -Be String
            $diagram.Entities['Customer'].Attributes[1].Name | Should -Be Sector
            $diagram.Entities['Customer'].Attributes[1].Type | Should -Be String
            $diagram.Entities['Order'].Attributes | Should -Not -BeNullOrEmpty
            $diagram.Entities['Order'].Attributes.Count | Should -Be 1
            $diagram.Entities['Order'].Attributes[0].Name | Should -Be Number
            $diagram.Entities['Order'].Attributes[0].Type | Should -Be Int
        }
    }

}
