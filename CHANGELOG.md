# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Flowchart subgraph support.

### Fixed

- Flowchart nodes with shape but without text use key as default.

## [0.4.0] - 2023-09-10

### Added

- new parameter title for ER and flow diagrams.
- new command `Add-FlowchartClass`.
- new parameter class for `Add-FlowchartNode`.
- new command `Add-FlowchartClick`.

### Changed

- Diagram orientation is now optional.
- Name and shape are now optional for flow diagram nodes.

## [0.3.0] - 2023-03-15

### Added

- new diagram type flowchart.
- new command `Add-FlowchartNode`.
- new command `Add-FlowchartMermaidLink`.
- new diagram type C4 component diagram.
- new command `Add-C4Component`.
- new command `Add-C4ContainerBoundary`.
- new command `Add-C4Relation`.
- new command `New-C4Component`.
- new command `New-C4ContainerBoundary`.

### Changed

- renamed `Add-Relation` to `Add-ErRelation`.

## [0.2.0] - 2022-09-14

### Added

- Parameter validation and entity creation.

## [0.1.0] - 2022-09-11

### Added

- erDiagram generation.

<!-- markdownlint-configure-file {"MD024": { "siblings_only": true } } -->
