Describe ConvertTo-String {
    BeforeAll {
        Import-Module $PSScriptRoot/../src/PsMermaidTools.psd1 -Force
    }

    Context erDiagram {
        BeforeAll {
            $diagram = New-MermaidDiagram -Type erDiagram
            $diagram | Add-MermaidRelation Exactly-one Customer places Zero-or-more Order
            $diagram | Add-MermaidRelation Exactly-one Order contains One-or-more LineItem
            $diagram | Add-MermaidRelation One-or-more Customer uses One-or-more DeliveryAddress -NonIdentifying
        }

        It works-for-identifying-relationship {
            $output = $diagram.Relations[0].Relationship | ConvertTo-MermaidString -ErrorAction Stop
            $output | Should -Not -BeNullOrEmpty
            $output | Should -Be '||--o{'
        }

        It works-for-non-identifying-relationship {
            $output = $diagram.Relations[2].Relationship | ConvertTo-MermaidString -ErrorAction Stop
            $output | Should -Not -BeNullOrEmpty
            $output | Should -Be '}|..|{'
        }

        It works-for-relation {
            $output = $diagram.Relations[0] | ConvertTo-MermaidString -ErrorAction Stop
            $output | Should -Not -BeNullOrEmpty
            $output | Should -Be '    Customer ||--o{ Order : places'
        }

        It works-for-diagram {
            $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
            $output | Should -Not -BeNullOrEmpty
            $output | Should -Be (@"
erDiagram
    Customer ||--o{ Order : places
    Order ||--|{ LineItem : contains
    Customer }|..|{ DeliveryAddress : uses
"@.Replace("`r`n", [Environment]::NewLine))
        }
    }

    Context minimum-erDiagram {
        BeforeAll {
            $diagram = New-MermaidDiagram -Type erDiagram
            $diagram | Add-MermaidRelation -Entity Entity
        }

        It works {
            $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
            $output | Should -Not -BeNullOrEmpty
            $output | Should -Be (@"
erDiagram
    Entity
"@.Replace("`r`n", [Environment]::NewLine))
        }
    }

    Context flowchart {
        BeforeAll {
            $diagram = New-MermaidDiagram -Type flowchart -Orientation LR
            $diagram | Add-MermaidLink A B
        }

        It works {
            $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
            $output | Should -Not -BeNullOrEmpty
            $output | Should -Be (@"
flowchart LR
    A-->B
"@.Replace("`r`n", [Environment]::NewLine))
        }
    }
}
