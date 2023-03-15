#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }

Describe ConvertTo-String {

    BeforeAll {
        Import-Module $PSScriptRoot/../src/PsMermaidTools.psd1 -Force
    }

    Context erDiagram {

        BeforeEach {
            $diagram = New-MermaidDiagram -erDiagram
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
            $diagram = New-MermaidDiagram -flowchart -Orientation left-to-right
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
                    $diagram = New-MermaidDiagram -flowchart -Orientation left-to-right
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
                    $diagram = New-MermaidDiagram -flowchart -Orientation left-to-right
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
                    $diagram = New-MermaidDiagram -flowchart -Orientation left-to-right
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
                    $diagram = New-MermaidDiagram -flowchart -Orientation left-to-right
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
                    $diagram = New-MermaidDiagram -flowchart -Orientation left-to-right
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
                    $diagram = New-MermaidDiagram -flowchart -Orientation left-to-right
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
                    $diagram = New-MermaidDiagram -flowchart -Orientation left-to-right
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
                    $diagram = New-MermaidDiagram -flowchart -Orientation left-to-right
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
                    $diagram = New-MermaidDiagram -flowchart -Orientation left-to-right
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
                    $diagram = New-MermaidDiagram -flowchart -Orientation left-to-right
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
                    $diagram = New-MermaidDiagram -flowchart -Orientation left-to-right
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
                    $diagram = New-MermaidDiagram -flowchart -Orientation left-to-right
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
                    $diagram = New-MermaidDiagram -flowchart -Orientation left-to-right
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
                    $diagram | Add-MermaidLink A B -DestinationHead arrow
                }

                It works {
                    $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                    $output | Should -Not -BeNullOrEmpty
                    $output | Should -Be (@"
flowchart LR
    A --> B
"@.Replace("`r`n", [Environment]::NewLine))
                }
            }

            Context An-open-link {

                BeforeEach {
                    $diagram | Add-MermaidLink A B -DestinationHead open
                }

                It works {
                    $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                    $output | Should -Not -BeNullOrEmpty
                    $output | Should -Be (@"
flowchart LR
    A --- B
"@.Replace("`r`n", [Environment]::NewLine))
                }
            }

            Context Text-on-links {

                BeforeEach {
                    $diagram | Add-MermaidLink A B -Text 'text' -DestinationHead open
                }

                It works {
                    $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                    $output | Should -Not -BeNullOrEmpty
                    $output | Should -Be (@"
flowchart LR
    A ---|text| B
"@.Replace("`r`n", [Environment]::NewLine))
                }
            }

            Context A-link-with-arrow-head-and-text {

                BeforeEach {
                    $diagram | Add-MermaidLink A B -Text 'text'
                }

                It works {
                    $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                    $output | Should -Not -BeNullOrEmpty
                    $output | Should -Be (@"
flowchart LR
    A -->|text| B
"@.Replace("`r`n", [Environment]::NewLine))
                }
            }

            Context Dotted-link {

                BeforeEach {
                    $diagram | Add-MermaidLink A B -Line dotted
                }

                It works {
                    $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                    $output | Should -Not -BeNullOrEmpty
                    $output | Should -Be (@"
flowchart LR
    A -.-> B
"@.Replace("`r`n", [Environment]::NewLine))
                }
            }

            Context Dotted-link-with-text {

                BeforeEach {
                    $diagram | Add-MermaidLink A B -Line dotted -Text 'text'
                }

                It works {
                    $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                    $output | Should -Not -BeNullOrEmpty
                    $output | Should -Be (@"
flowchart LR
    A -.->|text| B
"@.Replace("`r`n", [Environment]::NewLine))
                }
            }

            Context Thick-link {

                BeforeEach {
                    $diagram | Add-MermaidLink A B -Line thick
                }

                It works {
                    $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                    $output | Should -Not -BeNullOrEmpty
                    $output | Should -Be (@"
flowchart LR
    A ==> B
"@.Replace("`r`n", [Environment]::NewLine))
                }
            }

            Context Thick-link-with-text {

                BeforeEach {
                    $diagram | Add-MermaidLink A B -Line thick -Text 'text'
                }

                It works {
                    $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                    $output | Should -Not -BeNullOrEmpty
                    $output | Should -Be (@"
flowchart LR
    A ==>|text| B
"@.Replace("`r`n", [Environment]::NewLine))
                }
            }

            Context circle-head {

                BeforeEach {
                    $diagram | Add-MermaidLink A B -DestinationHead circle
                }

                It works {
                    $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                    $output | Should -Not -BeNullOrEmpty
                    $output | Should -Be (@"
flowchart LR
    A --o B
"@.Replace("`r`n", [Environment]::NewLine))
                }
            }

            Context cross-head {

                BeforeEach {
                    $diagram | Add-MermaidLink A B -DestinationHead cross
                }

                It works {
                    $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                    $output | Should -Not -BeNullOrEmpty
                    $output | Should -Be (@"
flowchart LR
    A --x B
"@.Replace("`r`n", [Environment]::NewLine))
                }
            }

            Context multi-directional-arrow {

                BeforeEach {
                    $diagram | Add-MermaidLink A B -SourceHead arrow -DestinationHead arrow
                }

                It works {
                    $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                    $output | Should -Not -BeNullOrEmpty
                    $output | Should -Be (@"
flowchart LR
    A <--> B
"@.Replace("`r`n", [Environment]::NewLine))
                }
            }

            Context multi-directional-circle {

                BeforeEach {
                    $diagram | Add-MermaidLink A B -SourceHead circle -DestinationHead circle
                }

                It works {
                    $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                    $output | Should -Not -BeNullOrEmpty
                    $output | Should -Be (@"
flowchart LR
    A o--o B
"@.Replace("`r`n", [Environment]::NewLine))
                }
            }

            Context multi-directional-cross {

                BeforeEach {
                    $diagram | Add-MermaidLink A B -SourceHead cross -DestinationHead cross
                }

                It works {
                    $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                    $output | Should -Not -BeNullOrEmpty
                    $output | Should -Be (@"
flowchart LR
    A x--x B
"@.Replace("`r`n", [Environment]::NewLine))
                }
            }
        }
    }

    Context C4Component {
        BeforeEach {
            $diagram = New-MermaidDiagram -C4Component
        }

        It works-empty {
            $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
            $output | Should -Not -BeNullOrEmpty
            $output | Should -Be (@"
C4Component
"@.Replace("`r`n", [Environment]::NewLine))
        }

        Context ContainerBoundary {

            BeforeEach {
                $container = New-MermaidContainerBoundary -Key api -Name 'API Application'
                $diagram | Add-MermaidContainerBoundary $container
            }

            Context MinmumContainer {

                BeforeEach {
                    $container | Add-MermaidComponent `
                        -Key sign `
                        -Name 'Sign In Controller'
                }

                It works {
                    $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                    $output | Should -Not -BeNullOrEmpty
                    $output | Should -Be (@"
C4Component
Container_Boundary(api, "API Application") {
    Component(sign, "Sign In Controller")
}
"@.Replace("`r`n", [Environment]::NewLine))
                }
            }

            Context MaximumContainer {

                BeforeEach {
                    $container | Add-MermaidComponent `
                        -Key sign `
                        -Name 'Sign In Controller' `
                        -Technology 'MVC Rest Controller' `
                        -Description 'Allows users to sign in to the internet banking system'
                }

                It works {
                    $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                    $output | Should -Not -BeNullOrEmpty
                    $output | Should -Be (@"
C4Component
Container_Boundary(api, "API Application") {
    Component(sign, "Sign In Controller", "MVC Rest Controller", "Allows users to sign in to the internet banking system")
}
"@.Replace("`r`n", [Environment]::NewLine))
                }
            }

        }
    }
}
