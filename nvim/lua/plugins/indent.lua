return {
    "lukas-reineke/indent-blankline.nvim",
    config = function ()
        require("indent_blankline").setup {
            show_current_context = false,
          show_current_context_start = false,
        }
    end
}
