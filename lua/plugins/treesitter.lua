return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "json",
      "javascript",
      "typescript",
      "tsx",
      "html",
      "css",
      "bash",
      "python",
    },
  },
}
