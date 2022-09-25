Describe ConvertTo-String {
    BeforeAll {
        Import-Module $PSScriptRoot/../src/PsMermaidTools.psd1 -Force
    }

    Context erDiagram {
        BeforeEach {
            $diagram = New-MermaidDiagram -Type erDiagram
        }

        It works-empty {
            $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
            $output | Should -Not -BeNullOrEmpty
            $output | Should -Be (@"
erDiagram
"@.Replace("`r`n", [Environment]::NewLine))
        }

        Context minimum {
            BeforeEach {
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

        Context complex {
            BeforeEach {
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
    }

    Context flowchart {
        BeforeEach {
            $diagram = New-MermaidDiagram -Type flowchart -Orientation left-to-right
        }

        It works-empty {
            $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
            $output | Should -Not -BeNullOrEmpty
            $output | Should -Be (@"
flowchart LR
"@.Replace("`r`n", [Environment]::NewLine))
        }

        Context shapes {

            Context round-edges {
                BeforeEach {
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

            Context stadium-shape {
                BeforeEach {
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

            Context subroutine {
                BeforeEach {
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

            Context cylindrical-shape {
                BeforeEach {
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

            Context circle {
                BeforeEach {
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

            Context asymmetric-shape {
                BeforeEach {
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

            Context rhombus {
                BeforeEach {
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

            Context hexagon {
                BeforeEach {
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

            Context parallelogram {
                BeforeEach {
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

            Context alt-parallelogram {
                BeforeEach {
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

            Context trapezoid {
                BeforeEach {
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

            Context alt-trapezoid {
                BeforeEach {
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

            Context double-circle {
                BeforeEach {
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

        Context links {

            Context A-link-with-arrow-head {

                BeforeEach {
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

            Context An-open-link {

                BeforeEach {
                    $diagram | Add-MermaidLink A B open
                }

                It works {
                    $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                    $output | Should -Not -BeNullOrEmpty
                    $output | Should -Be (@"
flowchart LR
    A---B
"@.Replace("`r`n", [Environment]::NewLine))
                }
            }

            Context Text-on-links {

                BeforeEach {
                    $diagram | Add-MermaidLink A B open -Text 'text'
                }

                It works {
                    $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                    $output | Should -Not -BeNullOrEmpty
                    $output | Should -Be (@"
flowchart LR
    A---|text|B
"@.Replace("`r`n", [Environment]::NewLine))
                }
            }

            Context A-link-with-arrow-head-and-text {

                BeforeEach {
                    $diagram | Add-MermaidLink A B arrow -Text 'text'
                }

                It works {
                    $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                    $output | Should -Not -BeNullOrEmpty
                    $output | Should -Be (@"
flowchart LR
    A-->|text|B
"@.Replace("`r`n", [Environment]::NewLine))
                }
            }

            Context Dotted-link {

                BeforeEach {
                    $diagram | Add-MermaidLink A B dotted
                }

                It works {
                    $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                    $output | Should -Not -BeNullOrEmpty
                    $output | Should -Be (@"
flowchart LR
    A-.->B
"@.Replace("`r`n", [Environment]::NewLine))
                }
            }

            Context Dotted-link-with-text {

                BeforeEach {
                    $diagram | Add-MermaidLink A B dotted -Text 'text'
                }

                It works {
                    $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                    $output | Should -Not -BeNullOrEmpty
                    $output | Should -Be (@"
flowchart LR
    A-.->|text|B
"@.Replace("`r`n", [Environment]::NewLine))
                }
            }

            Context Thick-link {

                BeforeEach {
                    $diagram | Add-MermaidLink A B thick
                }

                It works {
                    $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                    $output | Should -Not -BeNullOrEmpty
                    $output | Should -Be (@"
flowchart LR
    A==>B
"@.Replace("`r`n", [Environment]::NewLine))
                }
            }

            Context Thick-link-with-text {

                BeforeEach {
                    $diagram | Add-MermaidLink A B thick -Text 'text'
                }

                It works {
                    $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                    $output | Should -Not -BeNullOrEmpty
                    $output | Should -Be (@"
flowchart LR
    A==>|text|B
"@.Replace("`r`n", [Environment]::NewLine))
                }
            }
        }
    }
}
