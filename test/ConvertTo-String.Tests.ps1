#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }

Describe ConvertTo-String {

    BeforeAll {
        Import-Module $PSScriptRoot/../src/PsMermaidTools.psd1 -Force
    }

    Context erDiagram {

        BeforeEach {
            $diagram = New-MermaidDiagram -ErDiagram
        }

        It works-empty {
            $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
            $output | Should -Not -BeNullOrEmpty
            $output | Should -Be (@"
erDiagram
"@.Replace("`r`n", [Environment]::NewLine))
        }

        Context with-title {

            BeforeEach {
                $diagram = New-MermaidDiagram -ErDiagram -Title 'Test Diagram'
            }

            It works-empty {
                $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                $output | Should -Not -BeNullOrEmpty
                $output | Should -Be (@"
---
title: Test Diagram
---
erDiagram
"@.Replace("`r`n", [Environment]::NewLine))
            }
        }

        Context minimum {
            BeforeEach {
                $diagram | Add-MermaidErRelation -Entity Entity
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
                $diagram | Add-MermaidErRelation Exactly-one Customer places Zero-or-more Order
                $diagram | Add-MermaidErRelation Exactly-one Order contains One-or-more LineItem
                $diagram | Add-MermaidErRelation One-or-more Customer uses One-or-more DeliveryAddress -NonIdentifying
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

        Context minimum {

            BeforeEach {
                $diagram = New-MermaidDiagram -Flowchart
            }

            It works-empty {
                $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                $output | Should -Not -BeNullOrEmpty
                $output | Should -Be (@"
flowchart
"@.Replace("`r`n", [Environment]::NewLine))
            }
        }

        Context with-orientation {

            BeforeEach {
                $diagram = New-MermaidDiagram -Flowchart -Orientation left-to-right
            }

            It works-empty {
                $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                $output | Should -Not -BeNullOrEmpty
                $output | Should -Be (@"
flowchart LR
"@.Replace("`r`n", [Environment]::NewLine))
            }

            Context with-title {

                BeforeEach {
                    $diagram = New-MermaidDiagram -Flowchart -Orientation left-to-right -Title 'Test Diagram'
                }

                It works-empty {
                    $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                    $output | Should -Not -BeNullOrEmpty
                    $output | Should -Be (@"
---
title: Test Diagram
---
flowchart LR
"@.Replace("`r`n", [Environment]::NewLine))
                }
            }

            Context nodes {

                Context no-text {
                    BeforeEach {
                        $diagram | Add-MermaidFlowchartNode A
                    }

                    It works {
                        $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                        $output | Should -Not -BeNullOrEmpty
                        $output | Should -Be (@"
flowchart LR
    A
"@.Replace("`r`n", [Environment]::NewLine))
                    }

                }

                Context no-shape {
                    BeforeEach {
                        $diagram | Add-MermaidFlowchartNode A node
                    }

                    It works {
                        $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                        $output | Should -Not -BeNullOrEmpty
                        $output | Should -Be (@"
flowchart LR
    A[node]
"@.Replace("`r`n", [Environment]::NewLine))
                    }

                }

                Context rectangle-shape {
                    BeforeEach {
                        $diagram | Add-MermaidFlowchartNode A node rectangle
                    }

                    It works {
                        $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                        $output | Should -Not -BeNullOrEmpty
                        $output | Should -Be (@"
flowchart LR
    A[node]
"@.Replace("`r`n", [Environment]::NewLine))
                    }
                }

                Context rectangle-shape-without-text {
                    BeforeEach {
                        $diagram | Add-MermaidFlowchartNode -Key A -Shape rectangle
                        $diagram | Add-MermaidFlowchartNode -Key B -Shape rectangle
                    }

                    It works {
                        $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                        $output | Should -Not -BeNullOrEmpty
                        $output | Should -Be (@"
flowchart LR
    A[A]
    B[B]
"@.Replace("`r`n", [Environment]::NewLine))
                    }
                }

                Context round-edges {
                    BeforeEach {
                        $diagram | Add-MermaidFlowchartNode A node round-edges
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
                        $diagram | Add-MermaidFlowchartNode A node stadium
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
                        $diagram | Add-MermaidFlowchartNode A node subroutine
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
                        $diagram | Add-MermaidFlowchartNode A node cylindrical
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
                        $diagram | Add-MermaidFlowchartNode A node circle
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
                        $diagram | Add-MermaidFlowchartNode A node asymmetric
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
                        $diagram | Add-MermaidFlowchartNode A node rhombus
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
                        $diagram | Add-MermaidFlowchartNode A node hexagon
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
                        $diagram | Add-MermaidFlowchartNode A node parallelogram
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
                        $diagram | Add-MermaidFlowchartNode A node parallelogram-alt
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
                        $diagram | Add-MermaidFlowchartNode A node trapezoid
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
                        $diagram | Add-MermaidFlowchartNode A node trapezoid-alt
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
                        $diagram | Add-MermaidFlowchartNode A node double-circle
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
                        $diagram | Add-MermaidFlowchartLink A B -DestinationHead arrow
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
                        $diagram | Add-MermaidFlowchartLink A B -DestinationHead open
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
                        $diagram | Add-MermaidFlowchartLink A B -Text 'text' -DestinationHead open
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
                        $diagram | Add-MermaidFlowchartLink A B -Text 'text'
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
                        $diagram | Add-MermaidFlowchartLink A B -Line dotted
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
                        $diagram | Add-MermaidFlowchartLink A B -Line dotted -Text 'text'
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
                        $diagram | Add-MermaidFlowchartLink A B -Line thick
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
                        $diagram | Add-MermaidFlowchartLink A B -Line thick -Text 'text'
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
                        $diagram | Add-MermaidFlowchartLink A B -DestinationHead circle
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
                        $diagram | Add-MermaidFlowchartLink A B -DestinationHead cross
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
                        $diagram | Add-MermaidFlowchartLink A B -SourceHead arrow -DestinationHead arrow
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
                        $diagram | Add-MermaidFlowchartLink A B -SourceHead circle -DestinationHead circle
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
                        $diagram | Add-MermaidFlowchartLink A B -SourceHead cross -DestinationHead cross
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

            Context classes {

                Context simple-class {

                    BeforeEach {
                        $diagram | Add-MermaidFlowchartClass foo 'fill:#ffffff'
                    }

                    It works {
                        $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                        $output | Should -Not -BeNullOrEmpty
                        $output | Should -Be (@"
flowchart LR
    classDef foo fill:#ffffff
"@.Replace("`r`n", [Environment]::NewLine))
                    }

                    Context without-text {
                        BeforeEach {
                            $diagram | Add-MermaidFlowchartNode A -Class foo
                        }

                        It works {
                            $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                            $output | Should -Not -BeNullOrEmpty
                            $output | Should -Be (@"
flowchart LR
    classDef foo fill:#ffffff
    A:::foo
"@.Replace("`r`n", [Environment]::NewLine))
                        }

                    }

                    Context without-text-with-shape {
                        BeforeEach {
                            $diagram | Add-MermaidFlowchartNode A -Class foo -Shape stadium
                        }

                        It works {
                            $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                            $output | Should -Not -BeNullOrEmpty
                            $output | Should -Be (@"
flowchart LR
    classDef foo fill:#ffffff
    A([A]):::foo
"@.Replace("`r`n", [Environment]::NewLine))
                        }

                    }

                    Context with-text {
                        BeforeEach {
                            $diagram | Add-MermaidFlowchartNode A bar -Class foo
                        }

                        It works {
                            $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                            $output | Should -Not -BeNullOrEmpty
                            $output | Should -Be (@"
flowchart LR
    classDef foo fill:#ffffff
    A[bar]:::foo
"@.Replace("`r`n", [Environment]::NewLine))
                        }

                    }
                }
            }

            Context clicks {

                Context with-tooltip {

                    BeforeEach {
                        $diagram | Add-MermaidFlowchartClick foo 'http://localhost' -Tooltip 'home sweet home' -Target blank
                    }

                    It works {
                        $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                        $output | Should -Not -BeNullOrEmpty
                        $output | Should -Be (@"
flowchart LR
    click foo "http://localhost" "home sweet home" _blank
"@.Replace("`r`n", [Environment]::NewLine))
                    }
                }

                Context without-tooltip {

                    BeforeEach {
                        $diagram | Add-MermaidFlowchartClick foo 'http://localhost' -Target blank
                    }

                    It works {
                        $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                        $output | Should -Not -BeNullOrEmpty
                        $output | Should -Be (@"
flowchart LR
    click foo "http://localhost" _blank
"@.Replace("`r`n", [Environment]::NewLine))
                    }
                }
            }

            Context subgraphs {

                BeforeEach {
                    $subgraph = $diagram | Add-MermaidFlowchartSubgraph foo -PassThru
                }

                It works {
                    $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                    $output | Should -Not -BeNullOrEmpty
                    $output | Should -Be (@"
flowchart LR
    subgraph foo
    end
"@.Replace("`r`n", [Environment]::NewLine))
                }

                Context node {

                    BeforeEach {
                        $subgraph | Add-MermaidFlowchartNode bar
                    }

                    It works {
                        $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                        $output | Should -Not -BeNullOrEmpty
                        $output | Should -Be (@"
flowchart LR
    subgraph foo
        bar
    end
"@.Replace("`r`n", [Environment]::NewLine))
                    }
                }

                Context nested-subgraphs {

                    BeforeEach {
                        $subgraph | Add-MermaidFlowchartSubgraph bar 'this is a nested subgraph'
                    }

                    It works {
                        $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                        $output | Should -Not -BeNullOrEmpty
                        $output | Should -Be (@"
flowchart LR
    subgraph foo
        subgraph bar [this is a nested subgraph]
        end
    end
"@.Replace("`r`n", [Environment]::NewLine))
                    }
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
                $container = New-MermaidC4ContainerBoundary -Key api -Name 'API Application'
                $diagram | Add-MermaidC4ContainerBoundary $container
            }

            Context MinmumContainer {

                BeforeEach {
                    $container | Add-MermaidC4Component `
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
                    $container | Add-MermaidC4Component `
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

            Context Relation {

                BeforeEach {
                    $componentA = New-MermaidC4Component -Key sign -Name 'Sign In Controller'
                    $container | Add-MermaidC4Component $componentA
                    $componentB = New-MermaidC4Component -Key accounts -Name 'Accounts Summary Controller'
                    $container | Add-MermaidC4Component $componentB
                    $diagram | Add-MermaidC4Relation -From $componentA.Key -To $componentB.Key -Label Uses
                }

                It works {
                    $output = $diagram | ConvertTo-MermaidString -ErrorAction Stop
                    $output | Should -Not -BeNullOrEmpty
                    $output | Should -Be (@"
C4Component
Container_Boundary(api, "API Application") {
    Component(sign, "Sign In Controller")
    Component(accounts, "Accounts Summary Controller")
}
Rel(sign, accounts, "Uses")
"@.Replace("`r`n", [Environment]::NewLine))
                }
            }
        }
    }
}
