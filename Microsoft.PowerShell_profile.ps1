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

function downloads {
    Set-Location ~/Downloads
}

function docs {
    Set-Location ~/Documents
}

function weather {
    $weather = Get-Weather
    $weather = "Weather in Auckland today is " + $weather.weatherStatus + " with a temperature of " + $weather.temp + $([char]::ConvertFromUtf32(0x00B0)) + "C"
    Write-Host $weather
}

function Get-Weather {
    [hashtable]$forecast = @{ }
    $weather = Invoke-WebRequest "api.openweathermap.org/data/2.5/weather?APPID=[apiId]&id=2193734&units=metric" | ConvertFrom-Json
    $weatherStatus = $weather.weather.main.ToLower()
    $weatherSymbol = ""
    if ($weatherStatus -eq "rain") {
        $weatherSymbol = $([char]::ConvertFromUtf32(0xE37C))
        $weatherStatus = $weatherSymbol + " raining"
    }
    elseif ($weatherStatus -eq "clear") {
        $weatherSymbol = $([char]::ConvertFromUtf32(0xE368))
        $weatherStatus = $weatherSymbol + " clear"
    }
    $forecast.temp = $weather.main.temp
    $forecast.weatherStatus = $weatherStatus
    $forecast.symbol = $weatherSymbol
    return $forecast
}

Set-Alias -Name ls -Value Get-Items -Option AllScope
Set-Alias -Name env -Value Get-Env-Variables -Option AllScope
