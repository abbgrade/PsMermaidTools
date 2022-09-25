Describe ConvertTo-String {
    BeforeAll {
        Import-Module $PSScriptRoot/../src/PsMermaidTools.psd1 -Force
    }

    Context empty-erDiagram {
        BeforeAll {
            $diagram = New-MermaidDiagram -Type erDiagram
        }

        It works {
            $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
            $output | Should -Not -BeNullOrEmpty
            $output | Should -Be (@"
erDiagram
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

    Context empty-flowchart {
        BeforeAll {
            $diagram = New-MermaidDiagram -Type flowchart -Orientation left-to-right
        }

        It works {
            $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
            $output | Should -Not -BeNullOrEmpty
            $output | Should -Be (@"
flowchart LR
"@.Replace("`r`n", [Environment]::NewLine))
        }
    }

    Context flowchart {
        BeforeAll {
            $diagram = New-MermaidDiagram -Type flowchart -Orientation left-to-right
            $diagram | Add-MermaidLink A B arrow
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

    Context flowchart-with-a-node-with-round-edges {
        BeforeAll {
            $diagram = New-MermaidDiagram -Type flowchart -Orientation left-to-right
            $diagram | Add-MermaidNode A node round-edges
        }

        It works {
            $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
            $output | Should -Not -BeNullOrEmpty
            $output | Should -Be (@"
flowchart LR
    A(node)
"@.Replace("`r`n", [Environment]::NewLine))
        }
    }

    Context flowchart-with-a-stadium-shape {
        BeforeAll {
            $diagram = New-MermaidDiagram -Type flowchart -Orientation left-to-right
            $diagram | Add-MermaidNode A node stadium
        }

        It works {
            $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
            $output | Should -Not -BeNullOrEmpty
            $output | Should -Be (@"
flowchart LR
    A([node])
"@.Replace("`r`n", [Environment]::NewLine))
        }
    }

    Context flowchart-with-a-subroutine {
        BeforeAll {
            $diagram = New-MermaidDiagram -Type flowchart -Orientation left-to-right
            $diagram | Add-MermaidNode A node subroutine
        }

        It works {
            $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
            $output | Should -Not -BeNullOrEmpty
            $output | Should -Be (@"
flowchart LR
    A[[node]]
"@.Replace("`r`n", [Environment]::NewLine))
        }
    }

    Context flowchart-with-a-cylindrical-shape {
        BeforeAll {
            $diagram = New-MermaidDiagram -Type flowchart -Orientation left-to-right
            $diagram | Add-MermaidNode A node cylindrical
        }

        It works {
            $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
            $output | Should -Not -BeNullOrEmpty
            $output | Should -Be (@"
flowchart LR
    A[(node)]
"@.Replace("`r`n", [Environment]::NewLine))
        }
    }

    Context flowchart-with-a-circle {
        BeforeAll {
            $diagram = New-MermaidDiagram -Type flowchart -Orientation left-to-right
            $diagram | Add-MermaidNode A node circle
        }

        It works {
            $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
            $output | Should -Not -BeNullOrEmpty
            $output | Should -Be (@"
flowchart LR
    A((node))
"@.Replace("`r`n", [Environment]::NewLine))
        }
    }

    Context flowchart-with-a-asymmetric-shape {
        BeforeAll {
            $diagram = New-MermaidDiagram -Type flowchart -Orientation left-to-right
            $diagram | Add-MermaidNode A node asymmetric
        }

        It works {
            $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
            $output | Should -Not -BeNullOrEmpty
            $output | Should -Be (@"
flowchart LR
    A>node]
"@.Replace("`r`n", [Environment]::NewLine))
        }
    }

    Context flowchart-with-a-rhombus {
        BeforeAll {
            $diagram = New-MermaidDiagram -Type flowchart -Orientation left-to-right
            $diagram | Add-MermaidNode A node rhombus
        }

        It works {
            $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
            $output | Should -Not -BeNullOrEmpty
            $output | Should -Be (@"
flowchart LR
    A{node}
"@.Replace("`r`n", [Environment]::NewLine))
        }
    }

    Context flowchart-with-a-hexagon {
        BeforeAll {
            $diagram = New-MermaidDiagram -Type flowchart -Orientation left-to-right
            $diagram | Add-MermaidNode A node hexagon
        }

        It works {
            $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
            $output | Should -Not -BeNullOrEmpty
            $output | Should -Be (@"
flowchart LR
    A{{node}}
"@.Replace("`r`n", [Environment]::NewLine))
        }
    }

    Context flowchart-with-a-parallelogram {
        BeforeAll {
            $diagram = New-MermaidDiagram -Type flowchart -Orientation left-to-right
            $diagram | Add-MermaidNode A node parallelogram
        }

        It works {
            $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
            $output | Should -Not -BeNullOrEmpty
            $output | Should -Be (@"
flowchart LR
    A[/node/]
"@.Replace("`r`n", [Environment]::NewLine))
        }
    }

    Context flowchart-with-a-alt-parallelogram {
        BeforeAll {
            $diagram = New-MermaidDiagram -Type flowchart -Orientation left-to-right
            $diagram | Add-MermaidNode A node parallelogram-alt
        }

        It works {
            $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
            $output | Should -Not -BeNullOrEmpty
            $output | Should -Be (@"
flowchart LR
    A[\node\]
"@.Replace("`r`n", [Environment]::NewLine))
        }
    }

    Context flowchart-with-a-trapezoid {
        BeforeAll {
            $diagram = New-MermaidDiagram -Type flowchart -Orientation left-to-right
            $diagram | Add-MermaidNode A node trapezoid
        }

        It works {
            $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
            $output | Should -Not -BeNullOrEmpty
            $output | Should -Be (@"
flowchart LR
    A[/node\]
"@.Replace("`r`n", [Environment]::NewLine))
        }
    }

    Context flowchart-with-a-alt-trapezoid {
        BeforeAll {
            $diagram = New-MermaidDiagram -Type flowchart -Orientation left-to-right
            $diagram | Add-MermaidNode A node trapezoid-alt
        }

        It works {
            $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
            $output | Should -Not -BeNullOrEmpty
            $output | Should -Be (@"
flowchart LR
    A[\node/]
"@.Replace("`r`n", [Environment]::NewLine))
        }
    }

    Context flowchart-with-a-double-circle {
        BeforeAll {
            $diagram = New-MermaidDiagram -Type flowchart -Orientation left-to-right
            $diagram | Add-MermaidNode A node double-circle
        }

        It works {
            $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
            $output | Should -Not -BeNullOrEmpty
            $output | Should -Be (@"
flowchart LR
    A(((node)))
"@.Replace("`r`n", [Environment]::NewLine))
        }
    }
}
