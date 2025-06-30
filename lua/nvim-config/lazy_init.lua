local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = "nvim-config.lazy",
    change_detection = { notify = false }
})

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
    vim.keymap.set("n", "gD", vim.lsp.buf.definition)
    vim.keymap.set("n", "K", vim.lsp.buf.hover)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
    vim.keymap.set("n", "gr", vim.lsp.buf.references)
    vim.keymap.set("n", "gds", vim.lsp.buf.document_symbol)
    vim.keymap.set("n", "gws", vim.lsp.buf.workspace_symbol)
    vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run)
    vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
end)

lsp_zero.configure('gdscript', {
    force_setup = true,
    single_file_support = false,
    cmd = vim.lsp.rpc.connect('127.0.0.1', 6005),
    -- root_dir = '/home/linux/Projects/GameDevUdemy/barbarianblaster',
    root_dir = vim.fs.root(0, {'.gitignore', 'project.godot', '.git'}),
    filetypes = { 'gd', 'gdscript' },
})

require('lspconfig').ts_ls.setup({
    init_options = {
        plugins = {
            {
                name = "@vue/typescript-plugin",
                location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
                languages = { "vue" }
            }
        },
    },
    filetypes = { "javascript", "typescript", "vue" }
})
require('lspconfig').volar.setup({
    settings = {
        -- this is where vue={} was before
    },
    init_options = {
        -- typescript = {
        --     tsdk = '/usr/local/lib/node_modules/typescript/lib'
        -- },
        vue = {
            complete = {
                casing = {
                    tags = "kebab",
                    props = "kebab"
                }
            },
            format = {
                script = {
                    initialIndent = false
                }
            },
            hybridMode = true,
        },
    },
    -- filetypes = { "javascript", "typescript", "vue" }
})

require('lspconfig').zls.setup({
    settings = {
        zig_lib_path="/usr/local/zig-0.13/lib",
        zig_exe_path="/usr/local/zig-0.13/zig",
        build_on_save=true,
    },
})

--- if you want to know more about lsp-zero and mason.nvim
--- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    lsp_zero.default_setup,
  },
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- `Tab` key to confirm completion
    ['<Tab>'] = cmp.mapping.confirm({select = true}),
    ['<CR>'] = cmp.mapping.confirm({select = true}),
    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

    -- Scroll up and down in the completion documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  })
})
