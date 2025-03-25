local plugins = {
  -- Language and Syntax
  {"lervag/vimtex"},
  {"jalvesaq/Nvim-R"},
  {"luckasRanarison/tree-sitter-hyprlang",
    dependencies = {"nvim-treesitter/nvim-treesitter"}
  },
  {"nvim-neorg/neorg",
    ft = "norg",
    build = ":Neorg sync parsers",
    lazy = false,
    version = "*",
    config = function()
      require("plugins.configs.neorg")
    end,
    dependencies = {"vhyrro/luarocks.nvim"}
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },

  -- Colorscheme
  {"oncomouse/lushwal.nvim",
    cmd = {"LushwalCompile"},
    dependencies = {
      {"rktjmp/lush.nvim"},
      {"rktjmp/shipwright.nvim"}
    }
  },
  {"EdenEast/nightfox.nvim"},

  -- UI and Visualization
  {"nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("plugins.configs.dashboard")
    end,
    dependencies = {"nvim-tree/nvim-web-devicons"}
  },
  {"echasnovski/mini.indentscope",
    version = false,
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "alpha", "dashboard", "fzf", "help", "lazy",
          "lazyterm", "mason", "neo-tree", "notify",
          "toggleterm", "Trouble", "trouble", "oil"
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },

  -- Utility and Navigation
  {"folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      {"rcarriga/nvim-notify",
        config = function()
          require("notify").setup({
            background_colour = "#000000",
          })
        end
      },
    }
  },
  {"stevearc/oil.nvim",
    lazy = false,
    opts = function()
      return require("plugins.configs.oil")
    end,
    dependencies = {"nvim-tree/nvim-web-devicons"}
  },

  -- Development Tools
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig")
      require("plugins.configs.lspconfig")
    end
  },
  {"williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black", "pyright", "mypy",
        "ruff", "clangd",
        "typescript-language-server",
        "clang-format", "codelldb", "bash-language-server"
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = false,
    opts = function()
      return require("plugins.configs.neo-tree")
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  },
  {"nvimtools/none-ls.nvim",
    ft = {"python"},
    opts = function()
      return require("plugins.configs.null-ls")
    end
  },
  
  -- Miscellaneous
  {"michaelrommel/nvim-silicon",
    cmd = "Silicon",
    config = function()
      require("silicon").setup({
        font = "JetBrainsMono Nerd Font=34;Noto Color Emoji=34",
        theme = "Dracula",
        background = "#141B1E"
      })
    end
  },
  {"vhyrro/luarocks.nvim",
    priority = 1000,
    config = true
  },
-- {
--   "m4xshen/hardtime.nvim",
--   lazy = false,
--   dependencies = { "MunifTanjim/nui.nvim" },
--   opts = {}
-- }
}

return plugins
