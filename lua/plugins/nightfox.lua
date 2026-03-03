return {
    "EdenEast/nightfox.nvim",
    config = function()
        require("nightfox").setup({options = {transparent = true}})
        -- Set the colorscheme to Carbonfox
        vim.cmd("colorscheme carbonfox")
    end
}
