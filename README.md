# 💤 LazyVim IDE Configuration (Python & Go)

Personal Neovim configuration built on top of [LazyVim](https://github.com/LazyVim/LazyVim) transformed into a full-featured IDE for Python and Golang development.

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

### Step 4: (Optional) Install CLI Binaries Globally
If you also want these formatters and debuggers available directly in your terminal outside Neovim:

**Python Tools:**
```bash
pip3 install --user --break-system-packages debugpy black ruff isort
```

**Go Tools:**
```bash
go install mvdan.cc/gofumpt@latest
go install github.com/go-delve/delve/cmd/dlv@latest
go install golang.org/x/tools/cmd/goimports@latest
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
