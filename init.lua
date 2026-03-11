--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

What is Kickstart?

  Kickstart.nvim is *not* a distribution.

  Kickstart.nvim is a starting point for your own configuration.
    The goal is that you can read every line of code, top-to-bottom, understand
    what your configuration is doing, and modify it to suit your needs.

    Once you've done that, you can start exploring, configuring and tinkering to
    make Neovim your own! That might mean leaving Kickstart just the way it is for a while
    or immediately breaking it into modular pieces. It's up to you!

    If you don't know anything about Lua, I recommend taking some time to read through
    a guide. One possible example which will only take 10-15 minutes:
      - https://learnxinyminutes.com/docs/lua/

    After understanding a bit more about Lua, you can use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

Kickstart Guide:

  TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.

    If you don't know what this means, type the following:
      - <escape key>
      - :
      - Tutor
      - <enter key>

    (If you already know the Neovim basics, you can skip this step.)

  Once you've completed that, you can continue working through **AND READING** the rest
  of the kickstart init.lua.

  Next, run AND READ `:help`.
	    This will open up a help window with some basic information
	    about reading, navigating and searching the builtin help documentation.

	    This should be the first place you go to look when you're stuck or confused
	    with something. It's one of my favorite Neovim features.

	    MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
	    which is very useful when you're not exactly sure of what you're looking for.

	  I have left several `:help X` comments throughout the init.lua
	    These are hints about where to find more information about the relevant settings,
	    plugins or Neovim features used in Kickstart.

	   NOTE: Look for lines like this

	    Throughout the file. These are for you, the reader, to help you understand what is happening.
	    Feel free to delete them once you know what you're doing, but they should serve as a guide
	    for when you are first encountering a few different constructs in your Neovim config.

	If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

	I hope you enjoy your Neovim journey,
	- TJ

	P.S. You can delete this when you're done too. It's your config now! :)
	--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.swapfile = false

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.o.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
-- vim.o.list = true
-- vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Allow backspace delete no vim style
-- vim.keymap.set("i", "<C-h>", "<C-w>", { noremap = true })
vim.keymap.set("i", "<C-h>", "<C-w>", { noremap = true })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
-- --  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Keybinds close and save files
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Close file" })

-- Buffer navigation keymaps
vim.keymap.set("n", "<leader>p", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>n", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>d", "<cmd>bdelete<cr>", { desc = "Delete buffer" })

-- vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
vim.keymap.set("n", "<leader>Q", "<cmd>q!<cr>", { desc = "Close file without saving" })
-- save and Close file
vim.keymap.set("n", "<leader>ww", "<cmd>wq<cr>", { desc = "Save and Close file" })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--

-- Setup Lazy Vim
-- Load lazy.nvim configuration (the module already bootstraps and calls setup)
require("config.lazy")

-- start style
vim.cmd("colorscheme nightfox")

-- Minimal LSP Setup with Mason
require("mason").setup()

-- Configure the bridge between Mason and lspconfig

-- Add nvim-cmp LSP capabilities
-- local lspconfig = require('lspconfig')
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("mason-lspconfig").setup({
	-- This ensures your installed servers are automatically set up by lspconfig
	automatic_installation = true,
	tsserver = {
		capabilities = capabilities,
	},
})

vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Code Action
vim.keymap.set("n", "<leader>g", vim.lsp.buf.code_action, { desc = "Code Action" })

-- Go to Definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })

-- References
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References", nowait = true })

-- Close floating window/preview
vim.keymap.set("n", "<C-c>", "<cmd>close<cr>", { silent = true, desc = "Close floating window/preview" })

-- Go to Implementation
vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "Goto Implementation" })

-- Go to Type Definition
vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { desc = "Goto Type Definition" })

-- Go to Declaration
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })

-- Hover
vim.keymap.set("n", "K", function()
	return vim.lsp.buf.hover()
end, { desc = "Hover" })

-- Signature Help
vim.keymap.set("n", "<C-k>", function()
	return vim.lsp.buf.signature_help()
end, { desc = "Signature Help" })

-- Rename
vim.keymap.set("n", "<leader>rn", function()
	return vim.lsp.buf.rename()
end, { desc = "Rename" })

-- Code Action (leader ca)
vim.keymap.set("n", "<leader>ca", function()
	return vim.lsp.buf.code_action()
end, { desc = "Code Action" })

-- Format Document
vim.keymap.set("n", "<leader>f", function()
	return vim.lsp.buf.format({ async = true })
end, { desc = "Format Document" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>w", vim.diagnostic.open_float)

-- LuaSnip Example (in a .lua file)

-- Esta línea debe estar en algún lugar de tu configuración principal de LuaSnip
-- Load LuaSnip snippets from lua/snippets

-- === LuaSnip console snippets ===
local ok, ls = pcall(require, "luasnip")
if ok then
	local s = ls.snippet
	local i = ls.insert_node
	local fmt = require("luasnip.extras.fmt").fmt

	-- JS / TS filetypes you want
	local filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" }

	for _, ft in ipairs(filetypes) do
		ls.add_snippets(ft, {
			-- just to log text
			s(
				"log",
				fmt([[console.log({});]], {
					i(1),
				})
			),

			-- console.log
			s(
				"cl",
				fmt([[console.log("{}", {});]], {
					i(1, "label"),
					i(2, "value"),
				})
			),

			-- console.warn
			s(
				"cw",
				fmt([[console.warn("{}", {});]], {
					i(1, "label"),
					i(2, "value"),
				})
			),

			-- console.error
			s(
				"ce",
				fmt([[console.error("{}", {});]], {
					i(1, "label"),
					i(2, "value"),
				})
			),
		}, { key = ft })
	end

	-- disable expand for now i rather have the move between windows for now
	-- Keymaps to expand / jump with <C-k> and go back with <C-j>
	-- vim.keymap.set({ "i", "s" }, "<C-k>", function()
	-- 	if ls.expand_or_jumpable() then
	-- 		ls.expand_or_jump()
	-- 	end
	-- end, { silent = true, desc = "LuaSnip expand or jump" })

	--	vim.keymap.set({ "i", "s" }, "<C-j>", function()
	--		if ls.jumpable(-1) then
	--			ls.jump(-1)
	--		end
	--	end, { silent = true, desc = "LuaSnip jump back" })
end
-- === end LuaSnip console snippets ===

-- [[ Configure Telescope ]]

require("telescope").setup({
	defaults = {
		-- file_ignore_patterns = {
		--   "node_modules/",
		--   "%.git/",
		--   "%.DS_Store",
		--   "package-lock.json",
		--   ".git/",  -- Matches .git/ at the start of the path
		--   "/.git/", -- Matches .git/ anywhere else in the path
		--   "^.cursor/",       -- Hides the entire .git directory
		--   "%.cursor/",    -- Hides the entire .cursor directory
		--   "dist/",        -- Hides the dist directory
		--   "build/",       -- Hides the build directory
		-- },

		file_ignore_patterns = {
			-- Files
			"%.a",
			"%.class",
			"%.mkv",
			"%.mp4",
			"%.o",
			"%.out",
			"%.pdf",
			"%.zip",
			"%.sample",
			-- Directories
			".cache",
			"^.git/",
			-- "%.git/",
			"%.git/*",
			".git/*",
			".github/",
			".node_modules/",
			".node_modules/*",
			"%.node_modules/*",
			"^.node_modules/",
		},

		-- Default settings for all pickers
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.5,
			},
		},
		sorting_strategy = "ascending",
		mappings = {
			i = {
				["<C-j>"] = "move_selection_next",
				["<C-k>"] = "move_selection_previous",
				["<C-q>"] = "send_selected_to_qflist",
			},
		},
	},
	extensions = {
		-- Extensions can be loaded here
	},
})

local builtin = require("telescope.builtin")
-- find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Keymap for opening the built-in netrw file explorer
vim.api.nvim_set_keymap("n", "<Leader>e", "<cmd>Ex<CR>", {
	noremap = true,
	silent = true,
	desc = "Open netrw file explorer",
})

-- custon todo utility hacking my way around, en bacaneria
function Is_txt()
	return vim.bo.filetype == "text"
end

-- Insert a new todo line and enter insert mode at line start
function Insert()
	if not Is_txt() then
		return
	end
	-- insert the todo line below
	vim.api.nvim_put({ "- [ ] " }, "l", true, true)

	-- move cursor to beginning of the line
	vim.cmd("normal! 0")

	-- enter insert mode
	vim.cmd("startinsert")
end

-- Toggle checkbox on current line
function Toggle()
	if not Is_txt() then
		return
	end

	local line = vim.api.nvim_get_current_line()

	if line:match("%[ %]") then
		line = line:gsub("%[ %]", "[x]", 1)
	elseif line:match("%[x%]") then
		line = line:gsub("%[x%]", "[ ]", 1)
	else
		return
	end

	vim.api.nvim_set_current_line(line)
end

-- vim.api.nvim_set_keymap("n", "TodoAdd", Insert, {})
-- vim.api.nvim_set_keymap("n", "TodoToggle", Toggle, {})

vim.keymap.set("n", "<leader>tt", Insert, { desc = "Add todo" })
vim.keymap.set("n", "<leader>td", Toggle, { desc = "Toggle todo" })

--- dap setting debugger

local dap = require("dap")


-- Reutilizar la misma config para JavaScript
dap.configurations.javascript = dap.configurations.typescript
-- Reutilizar para JS
dap.configurations.javascript = dap.configurations.typescript

vim.keymap.set("n", "<F5>", function()
	dap.continue()
end)
vim.keymap.set("n", "<F10>", function()
	dap.step_over()
end)
vim.keymap.set("n", "<F11>", function()
	dap.step_into()
end)
vim.keymap.set("n", "<F12>", function()
	dap.step_out()
end)
vim.keymap.set("n", "<Leader>b", function()
	dap.toggle_breakpoint()
end)
