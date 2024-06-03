-- Customize Mason plugins
-- Load environment variables from.env file
local function load_env_from_file(file_path)
  local env_vars = {}
  for line in io.lines(file_path) do
    local key, value = string.match(line, "([^=]+)=%s*(.*)")
    if key and value then table.insert(env_vars, { key, value }) end
  end
  return env_vars
end

-- Function to set environment variables in nvim-dap configuration
local function set_env_in_dap_config(config, env_vars)
  if not config.env then config.env = {} end
  for _, var in ipairs(env_vars) do
    config.env[var[1]] = var[2]
  end
end

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "lua_ls",
        "helm_ls",
        -- add more arguments for adding more language servers
      })
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "prettier",
        "stylua",
        -- add more arguments for adding more null-ls sources
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    handlers = {
      go = function(config)
        -- Path to your.env file
        local env_file_path = vim.fn.expand "%:p:h" .. "/.env"
        print("env path is ", env_file_path)

        -- Load environment variables from.env file
        local env_vars = load_env_from_file(env_file_path)
        config.adapters = {
          type = "executable",
          command = "dlv", -- Path to delve executable
          args = { "dap" },
        }
        config.configurations = {
          {
            type = "go",
            request = "launch",
            name = "Launch",
            program = "${file}", -- Launch the current file
          },
        }
        set_env_in_dap_config(config, env_vars)

        require("mason-nvim-dap").default_setup(config) -- Apply default setup
      end,
    },

    opts = {
      ensure_installed = { "python", "golang" },
    },
  },
}
