local plugins = {
  {
    "luckasRanarison/tree-sitter-hyprlang",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    config = function()
      require("silicon").setup({
        -- Configuration here, or leave empty to use defaults
        font = "JetBrainsMono Nerd Font=34;Noto Color Emoji=34",
        theme = "Dracula",
        background = "#141B1E"
      })
    end
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        hover = {
          enabled = false
        },
        signature = {
          enabled = false
        },
      },
      routes = {
        {
          filter = { event = "notify", find = "No information available" },
          opts = { skip = true },
        },
      },
      presets = {
        lsp_doc_border = true,
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('custom.configs.dashboard')
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts={
      handlers = {},
    },
  },
  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    -- event = "LazyFile",
    opts = {
      -- symbol = "▏",
      symbol = "│",
      options = { try_as_border = true },
    },
  },
  {
    "nvim-neorg/neorg",
    -- build = ":Neorg sync-parsers",
    dependencies = { "luarocks.nvim" },
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = function()
      require("custom.configs.neorg")
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "jalvesaq/Nvim-R",
    lazy = false,
  },
  {"lervag/vimtex"},
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "pyright",
        "mypy",
        "ruff",
        "clangd",
        "typescript-language-server",
        "clang-format",
        "codelldb",
      },
    },
  },
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
},
  {
    "oncomouse/lushwal.nvim",
    cmd = { "LushwalCompile" },
    dependencies = {
      { "rktjmp/lush.nvim" },
      { "rktjmp/shipwright.nvim" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "m4xshen/hardtime.nvim",
    command = "Hardtime",
    -- event = "BufEnter",
    lazy = false,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("core.utils").load_mappings("hardtime")
    end,
    opts = {}
  },
  {
    "nvimtools/none-ls.nvim",
    ft = {"python"},
    opts = function ()
      return require "custom.configs.null-ls"
    end,
  },
  { "EdenEast/nightfox.nvim" },
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter'
  },
  {
    'stevearc/oil.nvim',
    lazy = false,
    opts = function ()
     return require "custom.configs.oil"
    end,
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  }
}
return plugins

