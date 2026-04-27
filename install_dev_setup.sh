#!/bin/bash
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

#==============================================================================
# Helpers
#==============================================================================

log()  { printf '\n\033[1;34m==>\033[0m %s\n' "$*"; }
warn() { printf '\033[1;33m⚠️  %s\033[0m\n' "$*"; }
ok()   { printf '\033[1;32m✓\033[0m %s\n' "$*"; }
have() { command -v "$1" >/dev/null 2>&1; }

detect_os() {
    case "$(uname -s)" in
        Darwin*) echo Mac ;;
        Linux*)  echo Linux ;;
        *)       echo Unsupported ;;
    esac
}

#==============================================================================
# Steps
#==============================================================================

create_folders() {
    log "Creating folders"
    mkdir -p \
        "$HOME/notes" \
        "$HOME/workspace/forks" \
        "$HOME/workspace/open-source" \
        "$HOME/workspace/personal-repositories" \
        "$HOME/workspace/repositories" \
        "$HOME/.config/kitty" \
        "$HOME/.ssh"
    chmod 700 "$HOME/.ssh"
}

install_homebrew() {
    log "Homebrew"
    if have brew; then
        ok "brew already installed"
    else
        /bin/bash -c \
            "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    [ -x /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"
}

install_packages() {
    log "Installing packages (brew)"
    brew install \
        vim neovim tmux direnv pyenv git jq \
        colima qemu docker node just

    # --adopt: take over an existing /Applications/*.app instead of erroring
    # (e.g. kitty previously installed via upstream installer.sh).
    brew install --cask --adopt kitty dbeaver-community
}

install_oh_my_zsh() {
    log "Oh My Zsh"
    if [ -d "$HOME/.oh-my-zsh" ]; then
        ok "oh-my-zsh already installed"
    else
        RUNZSH=no CHSH=no sh -c \
            "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi
}

link_dotfiles() {
    log "Linking dotfiles"

    ln -sf "$REPO/.zshenv"          "$HOME/.zshenv"
    ln -sf "$REPO/.zshrc"           "$HOME/.zshrc"
    ln -sf "$REPO/.vimrc"           "$HOME/.vimrc"
    ln -sf "$REPO/.tmux.conf"       "$HOME/.tmux.conf"
    ln -sf "$REPO/.gitconfig"       "$HOME/.gitconfig"
    ln -sf "$REPO/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"

    # BSD `ln -sf` nests the link inside an existing real directory rather
    # than replacing it. Remove any non-symlink first.
    if [ -d "$HOME/.config/nvim" ] && [ ! -L "$HOME/.config/nvim" ]; then
        rm -rf "$HOME/.config/nvim"
    fi
    ln -sfn "$REPO/nvim" "$HOME/.config/nvim"
}

seed_local_files() {
    log "Seeding per-machine files"

    # Stub sourced by .zshrc; created so a missing file doesn't break shells.
    touch "$HOME/.my_python_envs.sh"

    # Per-machine git identity (untracked). Seed only if missing.
    if [ ! -f "$HOME/.gitconfig.local" ]; then
        cat > "$HOME/.gitconfig.local" <<'EOF'
[user]
  name = TODO
  email = TODO
EOF
        warn "Created ~/.gitconfig.local — fill in user.name and user.email"
    fi
}

install_tpm() {
    log "tmux plugin manager"
    if [ -d "$HOME/.tmux/plugins/tpm" ]; then
        ok "tpm already installed"
    else
        git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
    fi
}

#==============================================================================
# Main
#==============================================================================

main() {
    local os
    os="$(detect_os)"

    if [ "$os" != "Mac" ]; then
        warn "Only macOS is supported by this script (detected: $os)"
        exit 1
    fi

    log "macOS setup starting"

    create_folders
    install_homebrew
    install_packages
    install_oh_my_zsh
    link_dotfiles
    seed_local_files
    install_tpm

    log "Setup complete"
    echo "   Restart your terminal or run: source ~/.zshrc"
}

main "$@"
