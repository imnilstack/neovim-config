<h1 align="center">Neovim Configuration</h1>

<div align="center">

<a href="https://github.com/neovim/neovim">
    <img src="https://img.shields.io/badge/Neovim-57A143?style=for-the-badge&logo=neovim&logoColor=ffffff&labelColor=101418" alt="Neovim">
</a>

<br><br>

![GitHub last commit](https://img.shields.io/github/last-commit/imnilstack/neovim-config?style=for-the-badge&labelColor=101418&color=9ccbfb)
![GitHub Repo stars](https://img.shields.io/github/stars/imnilstack/neovim-config?style=for-the-badge&labelColor=101418&color=b9c8da)
![GitHub repo size](https://img.shields.io/github/repo-size/imnilstack/neovim-config?style=for-the-badge&labelColor=101418&color=d3bfe6)

</div>

# Neovim Configuration

A personal, modular **Neovim** configuration built with **Lua** and powered by **Lazy.nvim**.
This setup is designed for a smooth development workflow with modern completion, LSP support, fuzzy finding, Git integration, terminal workflows, and a polished UI.

> [!NOTE]
> This configuration is tailored for my own workflow, but it is structured cleanly enough to be reused, edited, or extended with minimal effort.

---

## Table of Contents

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Post-Installation](#post-installation)
- [Caelestia Shell Integration](#caelestia-shell-integration)
- [Project Structure](#project-structure)
- [Configuration Layout](#configuration-layout)
- [Plugin Matrix](#plugin-matrix)
- [Updating](#updating)
- [Credits](#credits)

---

## Features

- Fast plugin loading with **Lazy.nvim**
- Built-in **LSP** support and tool management
- Modern completion and snippet integration
- Fuzzy finding and navigation with **Telescope** and **Flash**
- File explorer workflow with **Neo-tree**
- Clean UI and statusline setup with **Bufferline**, **Lualine**, **Noice**, and **Notify**
- Git integration with **Gitsigns**
- Formatting with **Conform**
- Markdown enhancement and preview support
- Toggleable terminal workflow with **ToggleTerm**
- Modular plugin and keymap organization for easy maintenance

---

## Requirements

Before installing, make sure you have:

- **Neovim**
- **Git**
- **Zsh**

  > [!NOTE]
  > `ToggleTerm` is configured to use `zsh` as the shell.

- A Nerd Font or icon-capable font for the best visual experience

---

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/imnilstack/neovim-config ~/.config/nvim
```

### 2. Create the Neovim config directory manually, if needed

```bash
mkdir -p ~/.config/nvim
```

### 3. Copy the files into place

If you cloned the repository somewhere else, copy its contents into your Neovim config directory:

```bash
cp -r /path/to/neovim-config/* ~/.config/nvim/
```

> [!TIP]
> The repository is intended to live directly at `~/.config/nvim`.

---

## Post-Installation

After launching Neovim for the first time, **Lazy.nvim** will automatically begin installing the configured plugins.

Once everything is loaded, run:

```vim
:Lazy sync
:Lazy update
```

`Lazy sync` ensures the installed plugins match the configuration, and `Lazy update` keeps them up to date.

---

## Caelestia Shell Integration

This configuration uses the **Caelestia Shell** dynamic colors integration.

Caelestia Shell: https://github.com/caelestia-dots/shell

The integration is only called from `init.lua`:

```lua
require("colors.caelestia-dynamic-colors").setup()
```

If you do **not** use Caelestia Shell, you can remove that single line from `init.lua` and delete the entire `lua/colors/` directory.

> [!NOTE]
> Nothing else in the configuration depends on `lua/colors/`.

---

## Project Structure

```text
.
├── init.lua
├── lazy-lock.json
└── lua
    ├── colors
    │   └── caelestia-dynamic-colors.lua
    ├── config
    │   ├── autocmds.lua
    │   ├── lazy.lua
    │   └── options.lua
    ├── keymaps
    │   ├── aerial.lua
    │   ├── bufferline.lua
    │   ├── fun.lua
    │   ├── general.lua
    │   ├── git.lua
    │   ├── init.lua
    │   ├── neotree.lua
    │   ├── telescope.lua
    │   ├── todo.lua
    │   ├── toggleterm.lua
    │   └── trouble.lua
    └── plugins
        ├── aerial.lua
        ├── blink.lua
        ├── bufferline.lua
        ├── cellular-automaton.lua
        ├── comment.lua
        ├── conform.lua
        ├── dependencies.lua
        ├── flash.lua
        ├── gitsigns.lua
        ├── image.lua
        ├── indent-blankline.lua
        ├── lspkind.lua
        ├── lsp.lua
        ├── lualine.lua
        ├── luasnip.lua
        ├── mason.lua
        ├── mason-tool-installer.lua
        ├── mini.ai.lua
        ├── mini.animate.lua
        ├── mini.move.lua
        ├── mini.pairs.lua
        ├── multicursor.lua
        ├── neo-tree.lua
        ├── noice.lua
        ├── nvim-colorizer.lua
        ├── nvim-notify.lua
        ├── nvim-surround.lua
        ├── render-markdown.lua
        ├── telescope.lua
        ├── todo-comments.lua
        ├── toggleterm.lua
        ├── treesitter.lua
        ├── trouble.lua
        └── which-key.lua
```

---

## Configuration Layout

### Main configuration

| File                      | Purpose                                                              |
| ------------------------- | -------------------------------------------------------------------- |
| `init.lua`                | Entry point for the entire configuration                             |
| `lua/config/lazy.lua`     | Boots `lazy.nvim` and loads plugin specs                             |
| `lua/config/options.lua`  | Editor options such as line numbers, indentation, and shell settings |
| `lua/config/autocmds.lua` | Autocommands                                                         |

### Keymaps

All keybindings are organized under:

```text
lua/keymaps/init.lua
```

This file loads the rest of the keymap modules.

| File             | Purpose                           |
| ---------------- | --------------------------------- |
| `general.lua`    | General-purpose mappings          |
| `telescope.lua`  | Telescope mappings                |
| `neotree.lua`    | File explorer mappings            |
| `toggleterm.lua` | Terminal mappings                 |
| `git.lua`        | Git-related mappings              |
| `bufferline.lua` | Buffer navigation mappings        |
| `trouble.lua`    | Diagnostic and list navigation    |
| `todo.lua`       | TODO comment navigation           |
| `aerial.lua`     | Symbol outline mappings           |
| `fun.lua`        | Miscellaneous or playful mappings |

### Plugin specifications

All plugin specs live inside:

```text
lua/plugins/
```

Each file usually maps to one feature, which keeps the configuration clean and easy to change without touching unrelated parts.

---

## Plugin Matrix

### Core

| Plugin              | Role                                  |
| ------------------- | ------------------------------------- |
| `lazy.nvim`         | Plugin manager                        |
| `plenary.nvim`      | Utility library used by many plugins  |
| `nui.nvim`          | UI components for interactive plugins |
| `nvim-web-devicons` | File and UI icons                     |

### Language Support

| Plugin                      | Role                                     |
| --------------------------- | ---------------------------------------- |
| `nvim-lspconfig`            | LSP configuration                        |
| `mason.nvim`                | LSP and tool installation manager        |
| `mason-tool-installer.nvim` | Automatic installation of selected tools |
| `blink.cmp`                 | Completion engine                        |
| `LuaSnip`                   | Snippet engine                           |
| `lspkind.nvim`              | Completion item icons                    |

### Editing

| Plugin             | Role                        |
| ------------------ | --------------------------- |
| `conform.nvim`     | Formatting                  |
| `Comment.nvim`     | Comment toggling            |
| `nvim-surround`    | Surround editing            |
| `mini.ai`          | Text objects                |
| `mini.move`        | Line and selection movement |
| `mini.pairs`       | Auto pairs                  |
| `multicursor.nvim` | Multi-cursor editing        |

### Navigation and Search

| Plugin           | Role                      |
| ---------------- | ------------------------- |
| `telescope.nvim` | Fuzzy finding             |
| `flash.nvim`     | Fast in-buffer navigation |
| `neo-tree.nvim`  | File explorer             |
| `aerial.nvim`    | Symbol outline            |

### Git

| Plugin          | Role                |
| --------------- | ------------------- |
| `gitsigns.nvim` | Git signs and hunks |

### UI

| Plugin                  | Role                        |
| ----------------------- | --------------------------- |
| `lualine.nvim`          | Statusline                  |
| `bufferline.nvim`       | Buffer tabs                 |
| `noice.nvim`            | Command and notification UI |
| `nvim-notify`           | Notification system         |
| `which-key.nvim`        | Keybinding helper           |
| `indent-blankline.nvim` | Indent guides               |
| `nvim-colorizer.lua`    | Color previews              |

### Diagnostics and Notes

| Plugin               | Role                             |
| -------------------- | -------------------------------- |
| `trouble.nvim`       | Diagnostics, quickfix, and lists |
| `todo-comments.nvim` | Highlighting TODO-style comments |

### Terminal and Utilities

| Plugin                    | Role                        |
| ------------------------- | --------------------------- |
| `toggleterm.nvim`         | Terminal integration        |
| `image.nvim`              | Image support               |
| `render-markdown.nvim`    | Improved markdown rendering |
| `cellular-automaton.nvim` | Fun visual extra            |

---

## Updating

To keep the configuration fresh, run:

```vim
:Lazy sync
:Lazy update
```

You can also update the repository itself with:

```bash
git pull
```

if you manage the config as a cloned Git repository.

---

## Credits

This configuration was built with inspiration from the broader Neovim and dotfiles community.
Special thanks to the authors and maintainers of the plugins used here, and to the **Caelestia Shell** project for the colorscheme integration.

Caelestia Shell: https://github.com/caelestia-dots/shell
