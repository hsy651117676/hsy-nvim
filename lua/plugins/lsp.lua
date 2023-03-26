return {
  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pylsp = {
          single_file_support = false,
          root_dir = function(fname)
            local lspconfig = require("lspconfig")
            local root_files = {
              "setup.py",
              "manage.py",
            }
            return lspconfig.util.root_pattern(unpack(root_files))(fname)
              or lspconfig.util.find_get_ancestor(fname)
              or lspconfig.util.path.dirname(fname)
          end,
          settings = {
            pylsp = {
              plugins = {
                pycodestyle = {
                  ignore = { "W391" },
                  maxLineLength = 100,
                },
              },
            },
          },
        },

        clangd = {
          cmd = { "clangd" },
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
          root_dir = require("lspconfig").util.root_pattern(
            ".clangd",
            ".clang-tidy",
            ".clang-format",
            "compile_commands.json",
            "compile_flags.txt",
            "configure.ac",
            ".git"
          ),
        },
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        },
      },
    },
  },
  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    config = function()
      require("lspsaga").setup({})
    end,
    keys = {
      -- LSP finder - Find the symbol's definition
      -- If there is no definition, it will instead be hidden
      -- When you use an action in finder like "open vsplit",
      -- you can use <C-t> to jump back
      { "gh", "<cmd>Lspsaga lsp_finder<cr>", desc = "Lspsaga lsp_finder" },
      { "gr", "<cmd>Lspsaga rename<cr>", desc = "Lspsaga rename" },
      { "gd", "<cmd>Lspsaga peek_definition<cr>", desc = "Lspsaga peek_definition" },
      { "gD", "<cmd>Lspsaga goto_definition<cr>", desc = "Lspsaga goto_definition" },
      { "gt", "<cmd>Lspsaga peek_type_definition<cr>", desc = "Lspsaga peek_type_definition" },
      { "gT", "<cmd>Lspsaga goto_type_definition<cr>", desc = "Lspsaga goto_type_definition" },
    },
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
}
