return {
    "tpope/vim-commentary",
    config = function()
        vim.keymap.set("n", "<C-/>", vim.cmd.Commentary)
        vim.keymap.set("v", "<C-/>", vim.cmd.Commentary)
    end
}
