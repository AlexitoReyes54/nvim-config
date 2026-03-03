-- return {
--   "neovim/nvim-lspconfig",
--   opts = {
--     servers = {
--       ['*'] = {
--         keys = {
--           { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action" },
--         },
--       },
--     },
--   },
-- }
return {
    "neovim/nvim-lspconfig",
    config = function()
        --   vim.lsp.config.tsserver.setup({})
        --   vim.lsp.config.lua_ls.setup({})
    end,
    opts = {
        servers = {['*'] = {}},
        vtsls = {
            filetypes = {
                "javascript", "javascriptreact", "javascript.jsx", "typescript",
                "typescriptreact", "typescript.tsx"
            },

            settings = {
                complete_function_calls = true,
                vtsls = {
                    enableMoveToFileCodeAction = true,
                    autoUseWorkspaceTsdk = true,
                    experimental = {
                        maxInlayHintLength = 30,
                        completion = {enableServerSideFuzzyMatch = true}
                    }
                },
                typescript = {
                    updateImportsOnFileMove = {enabled = "always"},
                    suggest = {completeFunctionCalls = true},
                    inlayHints = {
                        enumMemberValues = {enabled = true},
                        functionLikeReturnTypes = {enabled = true},
                        parameterNames = {enabled = "literals"},
                        parameterTypes = {enabled = true},
                        propertyDeclarationTypes = {enabled = true},
                        variableTypes = {enabled = false}
                    }
                }
            }

            -- keys = {

            --     {
            --         "<leader>co",
            --         LazyVim.lsp.action["source.organizeImports"],
            --         desc = "Organize Imports"
            --     }, {
            --         "<leader>cM",
            --         LazyVim.lsp.action["source.addMissingImports.ts"],
            --         desc = "Add missing imports"
            --     }, {
            --         "<leader>cu",
            --         LazyVim.lsp.action["source.removeUnused.ts"],
            --         desc = "Remove unused imports"
            --     }, {
            --         "<leader>cD",
            --         LazyVim.lsp.action["source.fixAll.ts"],
            --         desc = "Fix all diagnostics"
            --     }
            -- }

        }
    },

    dependencies = {
        { -- Autocompletion
            'hrsh7th/nvim-cmp',
            dependencies = {
                'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip',
                'saadparwaiz1/cmp_luasnip'
            }
        }, -- Useful status updates for LSP
        -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
        {'j-hui/fidget.nvim', opts = {}}

    }

}
