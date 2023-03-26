-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.o.scrolloff = 3
vim.o.sidescrolloff = 3
vim.o.swapfile = false

local map = vim.api.nvim_set_keymap
--  {
--   mode = "n", -- NORMAL mode
--   -- prefix: use "<leader>f" for example for mapping everything related to finding files
--   -- the prefix is prepended to every mapping part of `mappings`
--   prefix = "",
--   buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--   silent = true, -- use `silent` when creating keymaps
--   noremap = true, -- use `noremap` when creating keymaps
--   nowait = false, -- use `nowait` when creating keymaps
-- }
local opt = { noremap = true, silent = true }
local wk = require("which-key")

--basic Keyboard
map("i", "jk", "<Esc>", opt)
map("v", "jk", "<Esc>", opt)
map("t", "jk", [[<C-\><C-n>]], opt)

map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

map("n", "<A-.>", "30<C-w><", opt)
map("n", "<A-,>", "30<C-w>>", opt)
map("n", "<A-<>", "10<C-w>+", opt)
map("n", "<A->>", "10<C-w>-", opt)

map("i", "{", "{}<left>", opt)
map("i", "(", "()<left>", opt)
map("i", "[", "[]<left>", opt)
map("i", "'", "''<left>", opt)
map("i", "<", "<><left>", opt)
map("i", '"', '""<left>', opt)
map("i", "<A-l>", "<Right>", opt)
map("i", "<A-h>", "<Left>", opt)
map("i", "<A-j>", "<Up>", opt)
map("i", "<A-k>", "<Down>", opt)
map("i", "HH", "<Home>", opt)
map("i", "LL", "<End>", opt)
map("i", "<C-l>", "<Delete>", opt)
map("i", "<C-h>", "<Backspace>", opt)
map("n", "<A-m>", "NvimTreeToggle", opt)

-- foldmethod
map("n", "zsM", "<cmd>set foldmethod=manual<CR>", opt)
map("n", "zsi", "<cmd>set foldmethod=indent<CR>", opt)
map("n", "zse", "<cmd>set foldmethod=expr<CR>", opt)
map("n", "zsm", "<cmd>set foldmethod=marker<CR>", opt)
map("n", "zss", "<cmd>set foldmethod=syntax<CR>", opt)
map("n", "zsd", "<cmd>set foldmethod=diff<CR>", opt)

-- float
map("t", "kj", [[<C-\><C-n><cmd>FloatermToggle<CR>]], opt)
map("t", "jh", [[<C-\><C-n><cmd>FloatermPrev<CR>]], opt)
map("t", "jl", [[<C-\><C-n><cmd>FloatermNext<CR>]], opt)
map("t", "<F4>", [[<C-\><C-n><cmd>FloatermToggle<CR>]], opt)

-- a[key]
-- Aerial
wk.register({
  ["<leader>a"] = { name = "Aerial" },
  ["<leader>as"] = { "<cmd>AerialToggle<CR>", "AerialToggle", opt },
  ["<leader>an"] = { "<cmd>AerialNext<CR>", "AerialNext", opt },
  ["<leader>ap"] = { "<cmd>AerialPrev<CR>", "AerialPrev", opt },
  ["<leader>aw"] = { "<cmd>AerialNext<CR>", "AerialNext", opt },
  ["<leader>am"] = { "<cmd>AerialNext<CR>", "AerialNext", opt },
})

-- b[key]
-- bufferline
wk.register({
  ["<leader>b"] = { name = "bufferline" },
  ["<leader>bl"] = { "<cmd>BufferLineCycleNext<CR>", "CycleNext", opt },
  ["<leader>bh"] = { "<cmd>BufferLineCyclePrev<CR>", "CyclePrev", opt },
  ["<leader>bj"] = { "<cmd>BufferLineMovePrev<CR>", "MovePrev", opt },
  ["<leader>bk"] = { "<cmd>BufferLineMoveNext<CR>", "MoveNext", opt },
  ["<leader>bL"] = { "<cmd>BufferLineCloseRight<CR>", "CloseRight", opt },
  ["<leader>bH"] = { "<cmd>BufferLineCloseLeft<CR>", "CloseLeft", opt },
  ["<leader>bf"] = { "<cmd>BufferLinePick<CR>", "Pick", opt },
  ["<leader>bd"] = { "<cmd>BufferLinePickClose<CR>", "PickClose", opt },
  ["<leader>b1"] = { "<cmd>BufferLineGoToBuffer 1<CR>", "GoToBuffer 1", opt },
  ["<leader>b2"] = { "<cmd>BufferLineGoToBuffer 2<CR>", "GoToBuffer 2", opt },
  ["<leader>b3"] = { "<cmd>BufferLineGoToBuffer 3<CR>", "GoToBuffer 3", opt },
  ["<leader>b4"] = { "<cmd>BufferLineGoToBuffer 4<CR>", "GoToBuffer 4", opt },
  ["<leader>b5"] = { "<cmd>BufferLineGoToBuffer 5<CR>", "GoToBuffer 5", opt },
  ["<leader>b6"] = { "<cmd>BufferLineGoToBuffer 6<CR>", "GoToBuffer 6", opt },
  ["<leader>b7"] = { "<cmd>BufferLineGoToBuffer 7<CR>", "GoToBuffer 7", opt },
  ["<leader>b8"] = { "<cmd>BufferLineGoToBuffer 8<CR>", "GoToBuffer 8", opt },
  ["<leader>b9"] = { "<cmd>BufferLineGoToBuffer 9<CR>", "GoToBuffer 9", opt },
  ["<leader>b$"] = { "<cmd>BufferLineGoToBuffer -1<CR>", "GoToBuffer -1", opt },
})

-- c[key]
wk.register({
  ["<leader>c"] = { name = "code/change" },
  ["<leader>ca"] = {
    "<cmd>Lspsaga code_action<CR>",
    "Lspsaga code_action",
    { mode = { "n", "v" }, noremap = true, silent = true },
  },
})

-- d[key]
-- wk.register({
--   ["<leader>e"] = { name = "neotree" },
--   ["<leader>ef"] = { "<cmd>Neotree float<CR>", "Neotree float", opt },
-- })

-- e[key]
-- neotree
wk.register({
  ["<leader>e"] = { name = "neotree" },
  ["<leader>ef"] = { "<cmd>Neotree float<CR>", "Neotree float", opt },
})

-- f[key]
--  Telescope
wk.register({
  ["<leader>f"] = { name = "file/find/Telescope" },
  ["<leader>fc"] = { "<cmd>Telescope colorscheme<CR>", "Telescope ColorScheme", opt },
})

-- g[key]
wk.register({
  ["<leader>g"] = { name = "git/" },
  -- ["<leader>ef"] = { "<cmd>Neotree float<CR>", "Neotree float", opt },
})

-- h[key]
-- wk.register({
--   ["<leader>e"] = { name = "neotree" },
--   ["<leader>ef"] = { "<cmd>Neotree float<CR>", "Neotree float", opt },
-- })

-- i[key]
-- wk.register({
--   ["<leader>e"] = { name = "neotree" },
--   ["<leader>ef"] = { "<cmd>Neotree float<CR>", "Neotree float", opt },
-- })

-- j[key]
-- wk.register({
--   ["<leader>e"] = { name = "neotree" },
--   ["<leader>ef"] = { "<cmd>Neotree float<CR>", "Neotree float", opt },
-- })

-- k[key]
-- wk.register({
--   ["<leader>e"] = { name = "neotree" },
--   ["<leader>ef"] = { "<cmd>Neotree float<CR>", "Neotree float", opt },
-- })

-- l[key]
-- wk.register({
--   ["<leader>e"] = { name = "neotree" },
--   ["<leader>ef"] = { "<cmd>Neotree float<CR>", "Neotree float", opt },
-- })

-- m[key]
-- wk.register({
--   ["<leader>e"] = { name = "neotree" },
--   ["<leader>ef"] = { "<cmd>Neotree float<CR>", "Neotree float", opt },
-- })

-- n[key]
-- wk.register({
--   ["<leader>e"] = { name = "neotree" },
--   ["<leader>ef"] = { "<cmd>Neotree float<CR>", "Neotree float", opt },
-- })

-- o[key]
-- wk.register({
--   ["<leader>e"] = { name = "neotree" },
--   ["<leader>ef"] = { "<cmd>Neotree float<CR>", "Neotree float", opt },
-- })

-- p[key]
-- wk.register({
--   ["<leader>e"] = { name = "neotree" },
--   ["<leader>ef"] = { "<cmd>Neotree float<CR>", "Neotree float", opt },
-- })

-- q[key]
wk.register({
  ["<leader>w"] = { name = "quit/session" },
  -- ["<leader>ef"] = { "<cmd>Neotree float<CR>", "Neotree float", opt },
})

-- r[key]
-- wk.register({
--   ["<leader>e"] = { name = "neotree" },
--   ["<leader>ef"] = { "<cmd>Neotree float<CR>", "Neotree float", opt },
-- })

-- s[key]
wk.register({
  ["<leader>s"] = { name = "search/" },
  -- ["<leader>ef"] = { "<cmd>Neotree float<CR>", "Neotree float", opt },
})

-- t[key]
-- floaterm or translate
wk.register({
  ["<leader>t"] = { name = "floaterm translate" },
  ["<leader>te"] = { "<cmd>FloatermNew<CR>", "FloatermNew", opt },
  ["<leader>tn"] = { "<cmd>FloatermNext<CR>", "FloatermNext", opt },
  ["<leader>tp"] = { "<cmd>FloatermPrev<CR>", "FloatermPrev", opt },
  ["<leader>tc"] = { "<cmd>Ydc<CR>", "Youdao translate in the cmdline", noremap = true },
  ["<leader>ti"] = { "<cmd>Yde<CR>", "Youdao translate in the visual", noremap = true },
})

-- u[key]
wk.register({
  ["<leader>u"] = { name = "ui/" },
  -- ["<leader>ef"] = { "<cmd>Neotree float<CR>", "Neotree float", opt },
})

-- v[key]
-- wk.register({
--   ["<leader>e"] = { name = "neotree" },
--   ["<leader>ef"] = { "<cmd>Neotree float<CR>", "Neotree float", opt },
-- })

-- w[key]
wk.register({
  ["<leader>w"] = { name = "windows/" },
  -- ["<leader>ef"] = { "<cmd>Neotree float<CR>", "Neotree float", opt },
})

-- x[key]
wk.register({
  ["<leader>x"] = { name = "diagnostics/quickfix" },
  -- ["<leader>ef"] = { "<cmd>Neotree float<CR>", "Neotree float", opt },
})

-- y[key]
-- wk.register({
--   ["<leader>e"] = { name = "neotree" },
--   ["<leader>ef"] = { "<cmd>Neotree float<CR>", "Neotree float", opt },
-- })

-- z[key]
-- wk.register({
--   ["<leader>e"] = { name = "neotree" },
--   ["<leader>ef"] = { "<cmd>Neotree float<CR>", "Neotree float", opt },
-- })

-- F1-F12[key]
wk.register({
  ["<F4>"] = { "<cmd>FloatermToggle<CR>", "Floaterm", opt },
})
