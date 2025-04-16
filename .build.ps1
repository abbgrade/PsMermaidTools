
[CmdletBinding()]
param (
    [Parameter()]
    [int] $BuildNumber
)

$ModuleName = 'PsMermaidTools'

. $PSScriptRoot/tasks/Build.Tasks.ps1
. $PSScriptRoot/tasks/PsBuild.Tasks.ps1

task InstallModuleDependencies -Jobs {
    Install-Module Yayaml -Scope CurrentUser
}

task InstallBuildDependencies -Jobs InstallModuleDependencies, {
    Install-Module platyPs -Scope CurrentUser
}

task InstallTestDependencies -Jobs InstallModuleDependencies

task InstallReleaseDependencies -Jobs InstallModuleDependencies
