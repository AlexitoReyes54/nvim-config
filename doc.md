## 🔌 Neovim TL;DR Cheat-Sheet

### 🧠 Basics
- Leader: `<Space>`
- Save: `<leader>w`
- Quit: `<leader>q`
- Save & quit: `<leader>ww`
- Quit w/o save: `<leader>Q`
- Clear search highlight: `<Esc>`
- Exit terminal mode: `<Esc><Esc>`

---

### 🩺 Status / Health
- Plugin UI: `:Lazy`
- Update plugins: `:Lazy update`
- Mason UI (LSP tools): `:Mason`
- Update Mason tools: `:MasonUpdate`
- LSP info (current buffer): `:LspInfo`
- Health check: `:checkhealth`
- Treesitter info: `:TSModuleInfo`

---

### 🤖 LSP / Code Actions
- Code action: `<leader>g` **or** `<leader>ca`
- Hover docs: `K`
- Signature help: `<C-k>` (Normal mode)
- Rename symbol: `<leader>rn`
- Format: `<leader>f`
- Go to definition: `gd`
- Go to implementation: `gI`
- Go to type definition: `gy`
- Go to declaration: `gD`
- Diagnostics float: `<leader>e`
- Prev diagnostic: `[d`
- Next diagnostic: `]d`

---

### 🧩 Completion (nvim-cmp)
- Trigger completion: `<C-Space>`
- Accept selection: `<CR>`
- Next item: `<Tab>`
- Abort/close menu: `<C-e>`

---

### ✂️ Snippets (LuaSnip)
**JS / TS filetypes**

Triggers:
- `log` → `console.log("value");`
- `cl` → `console.log("label", value);`
- `cw` → `console.warn("label", value);`
- `ce` → `console.error("label", value);`

Movement:
- Jump forward: `<C-k>`
- Jump backward: `<C-j>`

---

### 🧱 Visual Setup
- Colorscheme: `carbonfox` (Nightfox)
- Transparent background: **enabled**
- Treesitter: highlight + indent (JS/TS/HTML/CSS/Lua/etc)
- Autopairs: `mini.pairs` (Insert/Command, TS-aware)

