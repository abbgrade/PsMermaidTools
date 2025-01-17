function Get-EscapedString {

    [CmdletBinding()]
    param (
        [Parameter(Position = 0)]
        [string] $Text
    )

    @('(', ')', '[', ']', '"') | ForEach-Object {
        $Text = $Text.Replace($_, [System.Web.HttpUtility]::HtmlEncode($_))
    }

    return $Text

}
