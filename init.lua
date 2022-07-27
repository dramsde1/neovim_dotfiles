-- Map leader to space
--vim.g.mapleader = ' '
local fn = vim.fn
local execute = vim.api.nvim_command
-- Sensible defaults
require('settings')
require('plugins')
-- Key mappings
require('keymappings')
require('telescope_config')
require('whichkey_config')
require('lsp_lua')
require('config')
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
    log_level = vim.log.levels.DEBUG
})

require("mason-lspconfig").setup({
    ensure_installed = { "sumneko_lua", "rust_analyzer", "pyright" }
})


require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}
-- empty setup using defaults
require("nvim-tree").setup()


-- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua
