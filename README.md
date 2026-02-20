# Neovim Configuration

A modern Neovim configuration based on Kickstart.nvim with AI assistance (Copilot + Sidekick), beautiful UI (Snacks + Lualine), and efficient workflows.

## Features

- **AI Assistance**: Copilot integration with Sidekick for AI-powered coding
- **Beautiful UI**: Tokyo Night theme, Snacks dashboard, Lualine status bar
- **Fuzzy Finding**: Telescope with fzf for blazing-fast search
- ** LSP**: Built-in LSP support with Mason for easy tool management
- **Completion**: Blink.cmp for modern autocompletion
- **Treesitter**: Syntax highlighting and indentation
- **Utilities**: Mini.ai, Mini.surround for textobjects

## Installation

### Requirements

- Neovim >= 0.9.5
- Git
- A Nerd Font (recommended for icons)
- `make` (for telescope-fzf-native)

### Setup

1. Backup existing config:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. Clone this repo:
   ```bash
   git clone https://github.com/YOUR_USERNAME/nvim-config.git ~/.config/nvim
   ```

3. Start Neovim:
   ```bash
   nvim
   ```

4. Install plugins (Lazy will handle this automatically on first run)

## Keymaps

### General

| Keymap | Description |
|--------|-------------|
| `<Esc>` | Clear search highlights |
| `<C-s>` | Save file |
| `<C-h/j/k/l>` | Navigate windows |
| `<leader>Q` | Quit all |

### Telescope (Search)

| Keymap | Description |
|--------|-------------|
| `<leader>sf` | Find files |
| `<leader>sg` | Live grep |
| `<leader>sw` | Search current word |
| `<leader>sd` | Search diagnostics |
| `<leader>sh` | Search help |
| `<leader>sk` | Search keymaps |
| `<leader>sr` | Resume search |
| `<leader>s.` | Recent files |
| `<leader>sc` | Search commands |
| `<leader>/` | Fuzzy search in buffer |
| `<leader><leader>` | Find buffers |

### LSP

| Keymap | Description |
|--------|-------------|
| `grn` | Rename |
| `gra` | Code action |
| `grD` | Go to declaration |
| `grr` | References |
| `gri` | Implementations |
| `grd` | Definitions |
| `grt` | Type definitions |
| `gO` | Document symbols |
| `gW` | Workspace symbols |
| `<leader>th` | Toggle inlay hints |
| `<leader>q` | Quickfix list |

### Snacks

| Keymap | Description |
|--------|-------------|
| `<leader>e` | File explorer |
| `<leader>t` | Toggle terminal |
| `<leader>sf` | Picker: files |
| `<leader>sg` | Picker: grep |
| `<leader>sb` | Picker: buffers |
| `<leader>sn` | Notifications |
| `<leader>.` | Recent files |

### AI (Copilot + Sidekick)

| Keymap | Description |
|--------|-------------|
| `<Tab>` | Accept AI suggestion |
| `<C-.>` | Toggle Sidekick |
| `<leader>os` | Toggle Sidekick |
| `<leader>oa` | Ask Sidekick |

### Format

| Keymap | Description |
|--------|-------------|
| `<leader>f` | Format buffer |

## Structure

```
nvim/
├── init.lua              # Main config
├── lua/
│   └── custom/
│       └── plugins/
│           ├── init.lua  # Plugin entry point
│           ├── ai.lua     # AI plugins
│           └── ui.lua     # UI plugins
├── .stylua.toml          # Formatter config
└── .gitignore
```

## Adding Plugins

Add plugins to `lua/custom/plugins/init.lua` or create new files:

```lua
-- lua/custom/plugins/myplugin.lua
return {
  'author/pluginname',
  -- config...
}
```

## Languages

This config includes support for:
- Lua (via lua_ls)
- More can be added via Mason

Install additional language servers:
```vim
:Mason
```

## Updating

```vim
:Lazy
```

Then press `U` to update all plugins.

## Credits

Based on [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
