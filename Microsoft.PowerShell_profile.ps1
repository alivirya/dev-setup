$ENV:STARSHIP_CONFIG = "$HOME\.starship\starship.toml"

function proj {
    Set-Location C:/projects
}

function cDrive {
    Set-Location C:/
}

function personal {
    Set-Location C:/personal
}

function docs {
    Set-Location ~/Documents
}

function dl { 
    Set-Location ~/Downloads
}

function home {
    Set-Location ~
}

function gitConfig {
    cat ~/.gitconfig
}

function Update-GitConfig {
    code C:\Users\audrey.livirya\.gitconfig
}

function Update-Starship {
    code C:\Users\audrey.livirya\.starship\starship.toml
}

function Update-Profile {
    code $PROFILE
}

function env {
    dir env:
}

function Clean-Branches {
    $local=git branch -l
    $remote=git branch -r
    $local|
        %{$_.Trim()}|
        ?{-not ($remote -like '*' + $_) }|
        ?{-not($_ -match "master" )}|
        %{git branch -D $_}
}

function terminal {
    cat ~\AppData\Local\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\settings.json
}

Invoke-Expression (&starship init powershell)

