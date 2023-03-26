return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
      "hrsh7th/cmp-buffer", -- LSP source for buffer
      --"hrsh7th/cmp-nvim-lua", -- LSP source for
      "hrsh7th/cmp-path", -- LSP source for path
      --"hrsh7th/cmp-calc", -- LSP source for calc
      --"hrsh7th/cmp-emoji", -- LSP source for emoji
      "hrsh7th/cmp-cmdline", -- LSP source for cmdline
      "hrsh7th/cmp-vsnip", -- LSP source for
      "hrsh7th/vim-vsnip", -- LSP source for
      "rafamadriz/friendly-snippets", -- LSP source for
      "octaltree/cmp-look", -- LSP source for look,English word
      "f3fora/cmp-spell", -- LSP source for
      "onsails/lspkind-nvim", -- LSP source for
      "glepnir/lspsaga.nvim",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")
      local kind_icons = {
        Text = "",
        Method = "m",
        Function = "",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "",
        Interface = "",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
      }
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        -- ["<CR>"] = cmp.mapping(function()
        --   cmp.complete()
        -- end, { "i", "s" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- they way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })

      opts.sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "spell" },
        { name = "path" },
        --{name = 'nvim_lua'},
        --{name = 'calc'},
        --{name = 'emoji'},
        { name = "cmdline" },
        { name = "vsnip" },
        { name = "snippets" },
        { name = "lspsaga" },
        { name = "look" },
      })

      opts.formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          -- Kind icons
          vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
          vim_item.menu = ({
            nvim_lsp = "[nvim_lsp]",
            buffer = "[Buffer]",
            spell = "[spell]",
            path = "[Path]",
            cmdline = "[cmdline]",
            vsnip = "[vsnip]",
            snippets = "[Snippet]",
            lspsaga = "[lspsaga]",
            look = "[look]",
          })[entry.source.name]
          return vim_item
        end,
      }

      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "buffer" },
        }),
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })

      -- end
    end,
  },
}
