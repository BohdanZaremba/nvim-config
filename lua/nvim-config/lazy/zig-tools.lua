
return {
  "NTBBloodbath/zig-tools.nvim",
    config = function()
        require("zig-tools").setup()
    end,
    dependencies = {
      {'akinsho/toggleterm.nvim'},
      {'nvim-lua/plenary.nvim'},
    }
}
