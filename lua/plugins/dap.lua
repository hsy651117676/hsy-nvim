return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    event = "VeryLazy",
    config = function()
      local dapui = require("dapui")
      dapui.setup({})

      local dap = require("dap")
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({})
      end

      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close({})
      end

      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close({})
      end
      local dap_breakpoint_color = {
        breakpoint = {
          ctermbg = 0,
          fg = "#993939",
          bg = "#31353f",
        },
        logpoing = {
          ctermbg = 0,
          fg = "#61afef",
          bg = "#31353f",
        },
        stopped = {
          ctermbg = 0,
          fg = "#98c379",
          bg = "#31353f",
        },
      }

      vim.api.nvim_set_hl(0, "DapBreakpoint", dap_breakpoint_color.breakpoint)
      vim.api.nvim_set_hl(0, "DapLogPoint", dap_breakpoint_color.logpoing)
      vim.api.nvim_set_hl(0, "DapStopped", dap_breakpoint_color.stopped)

      local dap_breakpoint = {
        error = {
          text = "",
          texthl = "DapBreakpoint",
          linehl = "DapBreakpoint",
          numhl = "DapBreakpoint",
        },
        condition = {
          text = "ﳁ",
          texthl = "DapBreakpoint",
          linehl = "DapBreakpoint",
          numhl = "DapBreakpoint",
        },
        rejected = {
          text = "",
          texthl = "DapBreakpint",
          linehl = "DapBreakpoint",
          numhl = "DapBreakpoint",
        },
        logpoint = {
          text = "",
          texthl = "DapLogPoint",
          linehl = "DapLogPoint",
          numhl = "DapLogPoint",
        },
        stopped = {
          text = "",
          texthl = "DapStopped",
          linehl = "DapStopped",
          numhl = "DapStopped",
        },
      }

      vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
      vim.fn.sign_define("DapBreakpointCondition", dap_breakpoint.condition)
      vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
      vim.fn.sign_define("DapLogPoint", dap_breakpoint.logpoint)
      vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)

      dap.adapters.python = {
        type = "executable",
        command = "/usr/bin/python3",
        args = { "-m", "debugpy.adapter" },
      }
      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "launch file",
          program = "${file}",
          pythonPath = function()
            return "/usr/bin/python3"
          end,
        },
      }
      dap.adapters.cppdbg = {
        id = "cppdbg",
        type = "executable",
        command = "/root/.local/share/nvim/mason/bin/OpenDebugAD7",
        --command = "~/.local/share/nvim/mason/bin/OpenDebugAD7",
      }
      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "cppdbg",
          request = "launch",
          program = function()
            return vim.fn.input(
              "Path to executable: "
              -- "Path to executable: ", vim.fn.getcwd() .. "/" , "file"
            )
          end,

          cwd = "${workspaceFolder}",
          stopAtEntry = true,
        },
      }
      dap.configurations.c = dap.configurations.cpp
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    event = "VeryLazy",
    config = function()
      require("nvim-dap-virtual-text").setup({
        enabled = true,
        enable_commands = true,
        highlight_changed_variables = true,
        highlight_new_as_changed = false,
        show_stop_reason = true,
        commented = false,
        only_first_definition = true,
        all_references = false,
        filter_references_pattern = "<module",
        virt_text_pos = "eol",
        all_frames = false,
        virt_lines = false,
        virt_text_win_col = nil,
      })
    end,
  },
}
