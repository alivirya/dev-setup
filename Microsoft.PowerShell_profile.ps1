Import-Module posh-git
Import-Module oh-my-posh
$Env:Path += ";C:\Users\alivi\.cargo\bin"
Set-Alias -Name cat -Value bat -Option AllScope
Set-Theme Phoebe
function Get-Items {
    lsd -ltrA
}

function colors() {
    $colors = [Enum]::GetValues( [ConsoleColor] )
    $max = ($colors | ForEach-Object { "$_ ".Length } | Measure-Object -Maximum).Maximum
    foreach ( $color in $colors ) {
        Write-Host (" {0,2} {1,$max} " -f [int]$color, $color) -NoNewline
        Write-Host "$color" -Foreground $color
    }
}

function themec() {
    Show-ThemeColors
}

function Get-Env-Variables {
    Get-ChildItem Env:
}

function proj {
    Set-Location ~/Documents/projs
}

function profile {
    Set-Location ~/Documents/WindowsPowerShell
}

function pt4 {
    Set-Location ~/Documents/projs/AR-Lab-Orientation
}

Set-Alias -Name ls -Value Get-Items -Option AllScope
Set-Alias -Name env -Value Get-Env-Variables -Option AllScope
