# 💤 LazyVim IDE Configuration (Python, Go & PHP)

Personal Neovim configuration built on top of [LazyVim](https://github.com/LazyVim/LazyVim) transformed into a full-featured IDE for Python, Golang, and PHP development with `.vscode/launch.json` DAP debugging support.

---

## ⚡ Features

- 🐍 **Python IDE**:
  - **LSP / Linter**: `pyright` + `ruff`
  - **Formatting**: `black` + `isort` (Formatting on save via `conform.nvim`)
  - **Debugger (DAP)**: `debugpy` + `nvim-dap-python` + `nvim-dap-ui`
- 🐹 **Golang IDE**:
  - **LSP / Linter**: `gopls` + `golangci-lint`
  - **Formatting**: `gofumpt` + `goimports`
  - **Debugger (DAP)**: `delve` (`dlv`) + `nvim-dap-go` + `nvim-dap-ui`
- 🐘 **PHP IDE**:
  - **LSP / Linter**: `intelephense` + `phpcs`
  - **Formatting**: `php-cs-fixer`
  - **Debugger (DAP)**: `Xdebug` (`php-debug-adapter` on ports 9003 & 9000)
- 🚀 **`.vscode/launch.json` Support**:
  - Automatically loads and runs launch configurations from `.vscode/launch.json` for PHP, Python, and Go!
  - Reload launch configs manually with `<leader>dl`.
- 📁 **File Explorer**:
  - `Snacks Explorer` configured as the single, primary file explorer (`<leader>e`).
  - Hidden dotfiles (`.env`, `.gitignore`, `.neoconf.json` etc.) displayed by default.
- 🔍 **Search & Pickers**:
  - Search pickers (`Snacks Picker`, `Telescope`, `fzf-lua`) include hidden files by default.
- 🪟 **Tab & Buffer Management**:
  - Smart `:tabclose` / `:tc` and `<leader>x` to close active buffer tabs without breaking window splits.

---

## 📋 Prerequisites

Before installing, ensure the following tools are installed on your machine:

- **Neovim** `v0.11.0` or higher (Recommended: `v0.12+`)
- **Git**
- **Python 3** & `pip3`
- **Go** (`v1.20+`)
- **PHP** & **Xdebug** (for PHP debugging)
- **ripgrep** (`brew install ripgrep` on macOS or `apt install ripgrep` on Linux)
- C Compiler (`clang`, `gcc`, `make` for tree-sitter builds)

---

## 🚀 Installation Guide (Yeni Bilgisayarda Kurulum)

### Step 1: Clone Repository
Clone this repository directly into your Neovim configuration directory (`~/.config/nvim`):

```bash
git clone https://github.com/YOUR_USERNAME/lazyvim-starter.git ~/.config/nvim
```

### Step 2: Launch Neovim
Start Neovim. `lazy.nvim` will automatically download and set up all plugins matching `lazy-lock.json`:

```bash
nvim
```

### Step 3: Automatic Tool Installation (Mason)
When Neovim launches, `mason.nvim` will automatically download LSPs, formatters, and debuggers in the background. You can check the installation status inside Neovim via:

```vim
:Mason
```

---

## ⌨️ Keybindings Cheat Sheet

### Debugger (DAP)
| Shortcut | Action |
|---|---|
| `<F5>` | Start / Continue Debugging |
| `<F10>` | Step Over |
| `<F11>` | Step Into |
| `<F12>` | Step Out |
| `<leader>db` | Toggle Breakpoint |
| `<leader>dB` | Set Conditional Breakpoint |
| `<leader>du` | Toggle DAP UI |
| `<leader>dl` | Reload `.vscode/launch.json` |

### Explorer & Navigation
| Shortcut | Action |
|---|---|
| `<leader>e` | Open Snacks Explorer (Root Dir) |
| `<leader>E` | Open Snacks Explorer (CWD) |
| `<leader>ff` | Find Files (Includes hidden) |
| `<leader>sg` | Live Grep (Includes hidden) |

### Buffer & Tab Management
| Shortcut / Command | Action |
|---|---|
| `<leader>x` / `<leader>tc` | Close Current Buffer / Tab |
| `:tabclose` / `:tc` | Close Current Buffer / Tab |
| `<leader>bd` | Delete Buffer |
