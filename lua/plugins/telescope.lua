-- if true then
--   return {}
-- end
--

return {
  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "ahmedkhalf/project.nvim",
      event = "VimEnter",
      config = function()
        require("project_nvim").setup({
          patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "manage.py", "init.lua" },
        })
        require("telescope").load_extension("projects")
      end,
    },
    keys = {
      -- add a keymap to browse plugin files
      {
        "<leader>fP",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
      { "<leader>fp", "<cmd>Telescope projects<CR>", desc = "telescope_prompt" },
      {
        "<leader>f9",
        "<cmd>lua require'telescope'.extensions.projects.prompt_position{ }<CR>",
        desc = "telescope_prompt",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      },
      projects = {
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "manage.py", "init.lua" },
      },
    },
  },
  -- add telescope-fzf-native
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      -- config = function()
      --   -- require("telescope").load_extension("fzf")
      -- end,
    },
  },
}
