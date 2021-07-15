
# Path settings
set PATH -x "$HOME/.userbin" $PATH
set PATH -x "$HOME/.dotnet/tools" $PATH
set PATH -x  "/snap/bin" $PATH
set PATH -x "/usr/sbin/" $PATH
set PATH -x (go env GOPATH)/bin $PATH
set PATH -x "$HOME/.local/bin" $PATH

# Git settings
set GIT_EXEC_PATH -x "$HOME/.userbin" $GIT_EXEC_PATH

# Other env vars
set -x EDITOR vim
set -x BROWSER firefox

# Aliases
alias icat "kitty +kitten icat"
alias bazel "bazelisk"
alias syu "sudo pacman -Syu"

# Python
set -x VIRTUAL_ENV_DISABLE_PROMPT 0
set -x VENV_DIR "$HOME/.venv/"

# .NET xD
set -x DOTNET_CLI_TELEMETRY_OPTOUT true
set -x DOTNET_ROOT /opt/dotnet

# Kubernetes
alias kubectl "microk8s.kubectl"

# Run XINIT
if test -z "$DISPLAY" && test "$XDG_VTNR" -eq 1
        $HOME/.config/fish/wait_countdown.sh "Press ^C if you don't want to run sway" 5
        exec sway
end

# Useful when you've written a long line you'll need later

set -g _funny_line ""

function _store_cmd
    set current_cmd (commandline)
    if test -n "$current_cmd"
        set _funny_line "$current_cmd"
        commandline ""
    end
end

function _restore_cmd
    if test -n "$_funny_line"
        commandline "$_funny_line"
    end
end

bind \cs '_store_cmd'
bind \cr '_restore_cmd'
