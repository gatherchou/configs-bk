local function open_nvim_tree(data)
    local is_real_file = vim.fn.filereadable(data.file) == 1
    local is_no_name_file = data.file == "" and vim.bo[data.buf].buftype == ""
    local is_a_directory = vim.fn.isdirectory(data.file) == 1

    if is_a_directory then
        vim.cmd.cd(data.file)
        require("nvim-tree.api").tree.open()
        return
    end

    if is_real_file or is_no_name_file then
        return
    end

    require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
end

local function on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set('n', '<C-e>', '', { buffer = bufnr })
    vim.keymap.del('n', '<C-e>', { buffer = bufnr })
    vim.keymap.set('n', 'u', api.tree.change_root_to_parent, opts('Up'))

end

local map = vim.keymap.set
map("n", "<leader>e", ":NvimTreeToggle<CR>")
map("n", "<leader>ff", ":NvimTreeFindFile<CR>")

return {
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function ()
      require("nvim-tree").setup({
        on_attach = on_attach,
        sort_by = "case_sensitive",
        disable_netrw = true,
        hijack_netrw = false,
        view = {
          width = 40,
          number = true,
          relativenumber = true,
          preserve_window_proportions = true,
        },
        renderer = {
          add_trailing = true,
          group_empty = false,
          icons = {
            glyphs = {
              folder = {
                arrow_closed = "▸",
                arrow_open = "▾",
              }
            }
          }
        },
        filters = {
          dotfiles = false,
          custom = {
            ".git$"
          },
          exclude = {
            ".env$",
            "node_modules",
            "vendor",
            ".gitlab-ci.yml"
          },
        },
      })
    end,
  }
}
