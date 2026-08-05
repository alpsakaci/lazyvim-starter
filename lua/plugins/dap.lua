return {
  {
    "mfussenegger/nvim-dap",
    recommended = true,
    desc = "Debugging support",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },
    },
    config = function()
      local dap = require("dap")

      -- Helper to recursively resolve ${workspaceRoot}, ${workspaceFolder}, etc. in both keys and values
      local function expand_workspace_vars(val, root)
        if type(val) == "string" then
          val = val:gsub("%${workspaceRoot}", root)
          val = val:gsub("%${workspaceFolder}", root)
          val = val:gsub("%${workspaceFolderBasename}", vim.fn.fnamemodify(root, ":t"))
          return val
        elseif type(val) == "table" then
          local res = {}
          for k, v in pairs(val) do
            local new_k = expand_workspace_vars(k, root)
            local new_v = expand_workspace_vars(v, root)
            res[new_k] = new_v
          end
          return res
        end
        return val
      end

      -- Dynamic variable expansion handler for all DAP configs before start
      dap.listeners.on_config = dap.listeners.on_config or {}
      dap.listeners.on_config["expand_workspace_root"] = function(config)
        local root = (LazyVim and LazyVim.root and LazyVim.root()) or vim.uv.cwd()
        return expand_workspace_vars(config, root)
      end

      -- Delve varsayılan olarak outputMode="local" kullanır: debug edilen programın
      -- stdout/stderr'i dlv'nin kendi (detached) terminaline gider ve hiçbir yerde
      -- görünmez. "remote" ile delve çıktıyı DAP output event'i olarak gönderir,
      -- böylece loglar dap-ui'ın REPL panelinde akar.
      -- .vscode/launch.json'dan gelen konfiglerde bu alan olmadığı için burada set ediyoruz.
      dap.listeners.on_config["go_output_mode"] = function(config)
        if config.type == "go" and config.request == "launch" and config.outputMode == nil then
          config = vim.tbl_extend("force", config, { outputMode = "remote" })
        end
        return config
      end

      -- PHP Xdebug Adapter Configuration (Correct Mason VSCode extension path)
      local mason_path = vim.fn.stdpath("data") .. "/mason/packages/php-debug-adapter"
      local php_debug_js = mason_path .. "/extension/out/phpDebug.js"
      if vim.fn.filereadable(php_debug_js) == 0 then
        php_debug_js = mason_path .. "/out/phpDebug.js"
      end

      dap.adapters.php = {
        type = "executable",
        command = "node",
        args = { php_debug_js },
      }

      dap.configurations.php = {
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug (Port 9003)",
          port = 9003,
          pathMappings = {
            ["${workspaceRoot}"] = "${workspaceRoot}",
          },
        },
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug (Port 9000)",
          port = 9000,
          pathMappings = {
            ["${workspaceRoot}"] = "${workspaceRoot}",
          },
        },
      }

      -- Function to auto-load .vscode/launch.json
      local function load_launch_json()
        if vim.fn.filereadable(".vscode/launch.json") == 1 then
          pcall(function()
            require("dap.ext.vscode").load_launchjs(nil, {
              php = { "php" },
              python = { "python" },
              go = { "go" },
            })
          end)
        end
      end

      -- Initial load
      load_launch_json()
    end,
    keys = {
      {
        "<F5>",
        function()
          if vim.fn.filereadable(".vscode/launch.json") == 1 then
            pcall(function()
              require("dap.ext.vscode").load_launchjs(nil, {
                php = { "php" },
                python = { "python" },
                go = { "go" },
              })
            end)
          end
          require("dap").continue()
        end,
        desc = "Debug: Start/Continue (Auto-reads .vscode/launch.json)",
      },
      { "<F10>", function() require("dap").step_over() end, desc = "Debug: Step Over" },
      { "<F11>", function() require("dap").step_into() end, desc = "Debug: Step Into" },
      { "<F12>", function() require("dap").step_out() end, desc = "Debug: Step Out" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "Breakpoint Condition" },
      { "<leader>du", function() require("dapui").toggle({}) end, desc = "Toggle DAP UI" },
      {
        "<leader>dl",
        function()
          if vim.fn.filereadable(".vscode/launch.json") == 1 then
            require("dap.ext.vscode").load_launchjs(nil, {
              php = { "php" },
              python = { "python" },
              go = { "go" },
            })
            vim.notify("Loaded .vscode/launch.json successfully", vim.log.levels.INFO)
          else
            vim.notify(".vscode/launch.json file not found", vim.log.levels.WARN)
          end
        end,
        desc = "Reload .vscode/launch.json",
      },
    },
  },
}
