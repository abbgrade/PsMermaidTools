
[CmdletBinding()]
param (
    [Parameter()]
    [int] $BuildNumber
)

$ModuleName = 'PsMermaidTools'

. $PSScriptRoot/tasks/Build.Tasks.ps1
. $PSScriptRoot/tasks/PsBuild.Tasks.ps1

task InstallBuildDependencies {
    Install-Module platyPs -Scope CurrentUser
    Install-Module Yayaml -Scope CurrentUser
}
task InstallTestDependencies {}
task InstallReleaseDependencies {}
