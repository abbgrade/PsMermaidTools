Describe Add-Relation {
    BeforeAll {
        Import-Module $PSScriptRoot/../src/PsMermaidTools.psd1 -Force
    }

    Context erDiagram {
        BeforeEach {
            $diagram = New-MermaidDiagram -Type erDiagram
        }

        It works-by-named-parmeters {
            $diagram | Add-MermaidRelation -FirstEntity First -FirstCardinality Zero-or-one -SecondEntity Second -SecondCardinality Zero-or-more -Label Example
            $diagram | Should -Not -BeNullOrEmpty
            $diagram.Relations | Should -Not -BeNullOrEmpty
            $diagram.Relations.Count | Should -Be 1
            $diagram.Relations[0].FirstEntity | Should -Be First
            $diagram.Relations[0].SecondEntity | Should -Be Second
            $diagram.Relations[0].Relationship | Should -Not -BeNullOrEmpty
            $diagram.Relations[0].Relationship.FirstCardinality | Should -Be Zero-or-one
            $diagram.Relations[0].Relationship.SecondCardinality | Should -Be Zero-or-more
            $diagram.Relations[0].Relationship.Identifying | Should -Be $true
            $diagram.Relations[0].Label | Should -Be Example
        }

        It works-by-positions {
            $diagram | Add-MermaidRelation Exactly-one Customer places Zero-or-more Order
            $diagram | Add-MermaidRelation Exactly-one Order contains One-or-more LineItem
            $diagram | Add-MermaidRelation One-or-more Customer uses One-or-more DeliveryAddress -NonIdentifying

            $diagram | Should -Not -BeNullOrEmpty
            $diagram.Relations | Should -Not -BeNullOrEmpty
            $diagram.Relations.Count | Should -Be 3

            $diagram.Relations[0].FirstEntity | Should -Be Customer
            $diagram.Relations[0].SecondEntity | Should -Be Order
            $diagram.Relations[0].Relationship | Should -Not -BeNullOrEmpty
            $diagram.Relations[0].Relationship.FirstCardinality | Should -Be Exactly-one
            $diagram.Relations[0].Relationship.SecondCardinality | Should -Be Zero-or-more
            $diagram.Relations[0].Relationship.Identifying | Should -Be $true
            $diagram.Relations[0].Label | Should -Be places

            $diagram.Relations[1].FirstEntity | Should -Be Order
            $diagram.Relations[1].SecondEntity | Should -Be LineItem
            $diagram.Relations[1].Relationship | Should -Not -BeNullOrEmpty
            $diagram.Relations[1].Relationship.FirstCardinality | Should -Be Exactly-one
            $diagram.Relations[1].Relationship.SecondCardinality | Should -Be One-or-more
            $diagram.Relations[1].Relationship.Identifying | Should -Be $true
            $diagram.Relations[1].Label | Should -Be contains

            $diagram.Relations[2].FirstEntity | Should -Be Customer
            $diagram.Relations[2].SecondEntity | Should -Be DeliveryAddress
            $diagram.Relations[2].Relationship | Should -Not -BeNullOrEmpty
            $diagram.Relations[2].Relationship.FirstCardinality | Should -Be One-or-more
            $diagram.Relations[2].Relationship.SecondCardinality | Should -Be One-or-more
            $diagram.Relations[2].Relationship.Identifying | Should -Be $false
            $diagram.Relations[2].Label | Should -Be uses
        }
    }

}
