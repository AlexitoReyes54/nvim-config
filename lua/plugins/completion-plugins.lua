return {
  -- El Motor Principal
  "hrsh7th/nvim-cmp",

      opts = function(_, opts)
    -- your existing cmp config…

    local function set_cmp_highlights()
      vim.api.nvim_set_hl(0, "Pmenu",    { bg = "#1e1e2e", fg = "#cdd6f4" })
      vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#45475a", fg = "#f9e2af" })
      vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = "#cdd6f4" })
      vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#89b4fa", bold = true })
      vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#89b4fa", italic = true })
      vim.api.nvim_set_hl(0, "CmpItemKind", { fg = "#94e2d5" })
      vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#a6adc8" })
    end

    set_cmp_highlights()

    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = set_cmp_highlights,
    })

    return opts
  end,
  dependencies = {
    -- Fuentes de Sugerencias
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    
    -- Motor de Snippets (Necesario)
    "L3MON4D3/LuaSnip",
    
    -- Apariencia (Muestra íconos)
    "onsails/lspkind.nvim",
  },
  -- Configuración (La que definimos en el paso anterior)
  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    cmp.setup({
    performance = {
        max_view_entries = 10,
    },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        -- ['<-Tab>'] = cmp.mapping.select_prev_item(),
      }),
      
      sources = cmp.config.sources({
        { name = 'nvim_lsp', opt= {
            
        } },
        { name = 'luasnip', option = { show_autosnippets = true } },
        { name = 'buffer', },
        -- { name = 'path' },
      }),
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol_text',
          maxheight = 45,
          maxwidth = 50,
          ellipsis_char = '...',
        }),

      },

   

    })

  end,
}