return {
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
      tabline = {
        lualine_a = {'buffers'},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {'tabs'}
      }
    }
  end
}
