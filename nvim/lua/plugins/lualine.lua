return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function ()
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'dracula',
                    -- theme = 'moonlight',
                    component_separators = { left = '', right = ''},
                    section_separators = { left = '', right = ''},
                    disabled_filetypes = {},
                    always_divide_middle = true,
                    globalstatus = false,
                },
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'branch', 'diff'},
                    lualine_c = {
                        {
                            'filename',
                            file_status = true,
                            path = 2,
                        }
                    },
                    lualine_x = {'diagnostics', 'filetype'},
                    lualine_y = {'encoding', 'fileformat'},
                    lualine_z = {'%l行, %c列', '%L:%p%%'},
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {'filename'},
                    lualine_x = {'location'},
                    lualine_y = {},
                    lualine_z = {}
                },
                -- tabline = {
                --     lualine_a = {'buffers'},
                --     lualine_b = {},
                --     lualine_c = {'filename'},
                --     lualine_x = {},
                --     lualine_y = {},
                --     lualine_z = {'tabs'}
                -- }
            }
        end
    },
    {
        'romgrk/barbar.nvim',
        dependencies = {
          'lewis6991/gitsigns.nvim',
          'nvim-tree/nvim-web-devicons',
        },
        version = '^1.0.0',
        config = function()
            local map = vim.api.nvim_set_keymap
            local opts = { noremap = true, silent = true }
            map('n', '<leader>1', '<Cmd>BufferGoto 1<CR>', opts)
            map('n', '<leader>2', '<Cmd>BufferGoto 2<CR>', opts)
            map('n', '<leader>3', '<Cmd>BufferGoto 3<CR>', opts)
            map('n', '<leader>4', '<Cmd>BufferGoto 4<CR>', opts)
            map('n', '<leader>5', '<Cmd>BufferGoto 5<CR>', opts)
            map('n', '<leader>6', '<Cmd>BufferGoto 6<CR>', opts)
            map('n', '<leader>7', '<Cmd>BufferGoto 7<CR>', opts)
            map('n', '<leader>8', '<Cmd>BufferGoto 8<CR>', opts)
            map('n', '<leader>9', '<Cmd>BufferGoto 9<CR>', opts)
            map('n', '<leader>0', '<Cmd>BufferGoto 0<CR>', opts)
            map('n', '<leader><c-w>q', '<Cmd>BufferClose<CR>', opts)
            map('n', '<leader><c-w>Q', '<Cmd>BufferCloseAllButCurrent<CR>', opts)
            map('n', '<leader>k', '<Cmd>BufferPrevious<CR>', opts)
            map('n', '<leader>j', '<Cmd>BufferNext<CR>', opts)
            vim.g.barbar_auto_setup = false
            require'barbar'.setup {
                animation = false,
                auto_hide = false,
                icons = {
                    buffer_index = true,
                },
            }
        end,
    }
}
