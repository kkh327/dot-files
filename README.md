# 💻 Development Environment Setup Guide  

## 🧭 macOS Setup  

### 🧰 Terminal & Shell  
- **Theme:** [Powerlevel10k](https://github.com/romkatv/powerlevel10k)  
  ```bash
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git     "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
  ```
- **Font:**  
  ```bash
  brew install font-meslo-lg-nerd-font
  ```
- **Aliases**
  ```bash
  alias cat="bat"
  alias ls="eza"
  ```
- **ZSH enhancements**
  - Enable autocompletion and syntax highlighting via GitHub plugins.
  - Add `z` command for quick directory jumping.
  - `diff-so-fancy` integration for pretty Git diffs:
    ```bash
    brew install git-delta
    curl -O https://raw.githubusercontent.com/erremauro/TwoDark/refs/heads/master/TwoDark.tmTheme
    export BAT_THEME="TwoDark"
    ```
  - Set up Git config to use `diff-so-fancy` as default pager.

- **Useful CLI Tools**
  ```bash
  brew install tlrc jq jless fblog trash ripgrep
  ```
- **Telescope (Fuzzy Finder)**  
  Requires `ripgrep` installed beforehand.

---

## 🧠 Neovim  

📺 *Tutorial:* [Neovim Setup Series (YouTube)](https://www.youtube.com/watch?v=zHTeCSVAFNY&list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn&index=2)

### Installation
```bash
brew install neovim
```

### Configuration
- Use **Lua configuration** with plugin directory.
- Install **LazyVim** plugin manager.
- Colorscheme: **Catppuccin**.

### Recommended Plugins
- **Treesitter:** Syntax highlighting.  
- **NeoTree:** File explorer (requires Nerd Font).  
  - `Ctrl + T` → open  
  - `/` → search, `a` → new file, `s/S` → splits, `t` → new tab  
  - `Ctrl + W` + arrows → navigate windows, `gt` → switch tabs  
- **Mason:** LSP management (requires Node/npm).  
- **None-LS:** Linters and formatters integration.  
- **nvim-dap & dap-ui:** Debugger + UI (requires debug adapters via brew).  
- **Comment.nvim:**  
  - `gcc` → toggle line  
  - `gcj` / `gc2j` → multiple lines  
  - `gcG` → comment whole buffer  
- **Substitute:** Replace strings inline.  
- **Surround:** Manage quotes/brackets easily.  
- **Auto-session:**  
  - `<Leader>ws` → save session  
  - `<Leader>wr` → restore session  
- **Completion Stack:**  
  - `nvim-cmp`, `luasnip`, `cmp-luasnip`, `cmp-nvim-lsp`, `friendly-snippets`  
  - `<Leader>cd` → go to definition  
  - `<Leader>cr` → references  
  - `<Leader>D` → diagnostics  
- **vim-test:** Run nearest tests with `<Leader>t`.  

### Extra Vim Plugins
- `vim-man`: View man pages with `:Man printf` or `:Vman`.
- `vim-fugitive`: Git integration (`:Git`, `:G`).
- `nerdtree`: Tree explorer (`Ctrl + T` to toggle).
- `fzf`: Fuzzy finder (`:Files`, `Ctrl + V/X` for splits).
- `markdown-preview.nvim`: `:MarkdownPreview` to render Markdown.
- `swagger-preview.nvim`: `:SwaggerPreview`.
- `undotree`: Undo history browser.

---

## 🧩 pyenv Setup  

```bash
brew install openssl readline sqlite3 xz zlib tcl-tk@8 libb2 zstd
curl -fsSL https://pyenv.run | bash
```

Append to `~/.zshrc`:
```bash
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - )"
```

Add the same lines to `~/.zprofile` for login shells.

---

## 🪟 Windows Setup  

### PowerShell Configuration  
🎥 [PowerShell Setup Video](https://www.youtube.com/watch?v=9zodIcv_7-M)  
🎨 [Windows Terminal Themes](https://windowsterminalthemes.dev/)  
🔡 [Nerd Fonts](https://www.nerdfonts.com/font-downloads)

#### Setup Steps
```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned -Force
oh-my-posh init pwsh --config "$HOME\jandedobbeleer.omp.json" | Invoke-Expression
Install-Module PSReadLine -Scope CurrentUser -Force
```

#### Neovim on Windows
```powershell
choco install neovim -y
choco install ripgrep
choco install delta
```
Add to PATH:
```
C:\tools\neovim\nvim-win64\bin
```

Create config:
```powershell
mkdir $env:USERPROFILE\AppData\Local\nvim
notepad $env:USERPROFILE\AppData\Local\nvim\init.vim
```

---

## 🐧 WSL Setup  

### Homebrew in WSL
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
export TERM=xterm-256color
brew install jandedobbeleer/oh-my-posh/oh-my-posh
eval "$(oh-my-posh init bash --config '/mnt/c/Program Files (x86)/oh-my-posh/themes/avit.omp.json')"
```

### Clipboard Tools
```bash
sudo apt-get install xclip -y
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
```

### Fish Shell Setup
```bash
sudo apt-get install fish
chsh -s /usr/bin/fish
fish
```

#### Environment
```fish
set -Ux EDITOR nvim
set -Ux VISUAL nvim
set -Ux TERM xterm-256color
set -U fish_user_paths $HOME/.local/bin $fish_user_paths
```

#### Aliases
```fish
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"
alias python="python3"
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"
alias cat="batcat"
```

#### zoxide + Homebrew + Oh My Posh
```fish
zoxide init fish | source
/home/linuxbrew/.linuxbrew/bin/brew shellenv | source
oh-my-posh init fish --config "/mnt/c/Program Files (x86)/oh-my-posh/themes/avit.omp.json" | source
```

Run interactive config:
```bash
fish_config
```

### Git Enhancements
```bash
git config --global core.pager "diff-so-fancy | less --tabs=4 -RF"
git config --global interactive.diffFilter "diff-so-fancy --patch"
sudo apt-get install ripgrep
brew install git-delta
```

---

### 🧭 Summary
- Customized **shells** (zsh, fish, PowerShell) with Powerlevel10k and Oh-My-Posh.  
- Unified **Neovim** config across platforms with plugins and LSP support.  
- Enhanced **Git**, **diff**, and **productivity tools** (`fzf`, `ripgrep`, `delta`, `tldr`, etc.).  
- **Cross-platform consistency** between macOS, Windows, and WSL environments.  

