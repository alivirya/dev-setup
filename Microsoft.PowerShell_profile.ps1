Import-Module posh-git
Import-Module oh-my-posh
$Env:Path += ";C:\Users\alivi\.cargo\bin"
Set-Alias -Name cat -Value bat -Option AllScope
Set-Theme Agnoster
function Get-Items {
    lsd -ltrA
}

function Get-Env-Variables {
    Get-ChildItem Env:
}

Set-Alias -Name ls -Value Get-Items -Option AllScope
Set-Alias -Name env -Value Get-Env-Variables -Option AllScope
