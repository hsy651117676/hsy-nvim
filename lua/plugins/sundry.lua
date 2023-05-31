return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
      -- colorscheme = "morning",
    },
  },
  { "voldikss/vim-floaterm", event = "VeryLazy"
 },
  { "ianva/vim-youdao-translater", event = "VeryLazy" },
  {
    "stevearc/aerial.nvim",
    event = "VeryLazy",
    config = function()
      -- code
      require("aerial").setup({
        -- on_attach = function(bufnr)
        --   -- Jump forwards/backwards with '{' and '}'
        --   vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        --   vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        -- end,
      })
    end,
  },
  -- {
  --   "nvim-tree/nvim-tree.lua",
  --   event = "VeryLazy",
  --   config = function()
  --     -- code
  --     require("nvim-tree").setup({
  --       sort_by = "case_sensitive",
  --       view = {
  --         adaptive_size = true,
  --         mappings = {
  --           list = {
  --             --{ key = "u", action = "dir_up" },
  --           },
  --         },
  --       },
  --       renderer = {
  --         group_empty = true,
  --       },
  --       filters = {
  --         dotfiles = true,
  --       },
  --       sync_root_with_cwd = true,
  --       respect_buf_cwd = true,
  --       update_focused_file = {
  --         enable = true,
  --         update_root = true,
  --       },
  --     })
  --   end,
  -- },
}
