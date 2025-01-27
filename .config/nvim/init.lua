----------------------------------------------------------------------- General
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.scrolloff = 7
vim.opt.swapfile = false
vim.opt.fileformat = "unix"
vim.opt.termguicolors = true
vim.opt.hlsearch = false

vim.g.mapleader = ","
vim.cmd("colorscheme gruvbox")

----------------------------------------------------------------------- Plugins
require("packer").startup(
  function(use)
    -- NERDtree
    use "preservim/nerdtree"
    -- gruvbox
    use "morhetz/gruvbox"
    -- auto-save
    use {
      "Pocco81/auto-save.nvim",
      config = function()
        require("auto-save").setup()
      end
    }
    -- Telescope
    use {
      "nvim-telescope/telescope.nvim", tag = "0.1.8",
      requires = { {"nvim-lua/plenary.nvim"} },
      config=function()
        require("telescope").setup()
      end
    }
    -- fzf for Telescope
    use {
      "nvim-telescope/telescope-fzf-native.nvim",
      run = "make",
      config=function()
        require("telescope").load_extension("fzf")
      end
    }
  end
)

----------------------------------------- Customization for specific file types
-- Python
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    local keymap = "<C-h>"
    local command = ":w<CR>:!python3 %<CR>"
    local settings = { buffer = true, silent = true }
    vim.keymap.set("n", keymap, command, settings)
    vim.keymap.set("i", keymap, command, settings)
  end
})

-- C++
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    local keymap = "<C-h>"
    local command = ":w<CR>:!g++ % -o ./.output<CR>:!./.output<CR>:!rm ./.output<CR>"
    local settings = { buffer = true, silent = true }
    vim.keymap.set("n", keymap, command, settings)
    vim.keymap.set("i", keymap, command, settings)
  end
})

-- HTML, CSS, JS, TS, JSX, TSX, JSON, JSONC, KDL, Lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "html",
    "css",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "json",
    "jsonc",
    "kdl",
    "lua"
  },
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
  end
})

------------------------------------------------------------------ Key bindings
-- General
vim.keymap.set("n", "H", "gT")
vim.keymap.set("n", "L", "gt")
-- NERDTree
vim.keymap.set("n", "<leader>e", ":NERDTreeFocus<CR>")
vim.keymap.set("n", "<leader>w", ":NERDTreeClose<CR>")
-- Telescope
local telescope_builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", telescope_builtin.find_files)
vim.keymap.set("n", "<leader>g", telescope_builtin.live_grep)
