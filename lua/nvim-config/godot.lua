vim.lsp.config('*', {
    root_markers = { '.git', '.gitignore' },
    on_attach = function ()
        -- key bindings here
    end
})

-- this does not work
function StartGodotLsp()
    vim.lsp.start({
        name = 'gdscript',
        cmd = vim.lsp.rpc.connect('127.0.0.1', 6005),
        -- root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, { upward = true })[1]),
        -- root_dir = vim.fs.root(0, {'.gitignore', 'project.godot', '.git'}),
        -- root_dir = vim.fs.root(0, {'project.godot'}),
        -- root_markers = { '.gitignore', 'project.godot', '.git' },
        root_dir = '/home/linux/Projects/GameDevUdemy/barbarianblaster',
        filetypes = { 'gd', 'gdscript' },
        on_attach = function(client, bufnr)
            --vim.api.nvim_command('echo serverstart("/tmp/godot.pipe")')
        end
    })
end

StartGodotLsp()
vim.lsp.enable('gdscript')
