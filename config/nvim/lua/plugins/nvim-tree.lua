return {
  "nvim-tree/nvim-tree.lua",
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
  },
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 35,
      },
      git = {
        enable = false,
      },
      renderer = {
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = false,
          },
        },
      },
      on_attach = function(bufnr)
        local api = require('nvim-tree.api')
        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set('n', 'h', '', opts('Disabled'))
        vim.keymap.set('n', 'l', '', opts('Disabled'))
        vim.keymap.set('n', '<Left>', '', opts('Disabled'))
        vim.keymap.set('n', '<Right>', '', opts('Disabled'))
      end,
    })

    local function set_monochrome()
      local folder_color = "#D0D0D0"
      local file_color   = "#808080"
      local icon_color   = "#505050"

      vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = icon_color })
      vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = folder_color })
      vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = folder_color })
      vim.api.nvim_set_hl(0, "NvimTreeFileIcon", { fg = icon_color })
      vim.api.nvim_set_hl(0, "NvimTreeFileName", { fg = file_color })

      local icons = require("nvim-web-devicons").get_icons()
      for _, icon in pairs(icons) do
        vim.api.nvim_set_hl(0, "DevIcon" .. icon.name, { fg = icon_color })
      end
    end

    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = set_monochrome,
    })

    set_monochrome()
  end,
}
