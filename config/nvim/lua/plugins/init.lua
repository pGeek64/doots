local plugins = {
  -- Language and Syntax
  {"lervag/vimtex"},
  {"jalvesaq/Nvim-R"},
  {"luckasRanarison/tree-sitter-hyprlang",
    dependencies = {"nvim-treesitter/nvim-treesitter"}
  },
  {
    "nvim-neorg/neorg",
    ft = "norg",
    build = ":Neorg sync parsers",
    lazy = false,
    version = "*",
    config = function()
      require("plugins.configs.neorg")
    end,
    dependencies = {
      "nvim-neorg/lua-utils.nvim",
      "pysan3/pathlib.nvim",
    },
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    lazy = false,
    opts = {},
    config = function()
      return require("plugins.configs.render-markdown")
    end,
  },
  {
    'ron-rs/ron.vim', -- FOR RMPC CONFIG
    lazy = false
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
  {'aliqyan-21/darkvoid.nvim',
    lazy = false,
  },

  -- UI and Visualization
  {"nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("plugins.configs.dashboard")
    end,
    dependencies = {"nvim-tree/nvim-web-devicons"}
  },
  {
    "nvim-mini/mini.indentscope",
    lazy = false,
    version = false,
    config = function ()
      require("plugins.configs.indent-scope")
    end,
    init = function ()
      vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "alpha", "dashboard", "fzf", "help", "man", "lazy",
        "lazyterm", "mason", "neo-tree", "notify",
        "toggleterm", "Trouble", "trouble", "oil"
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
    end
  },
  -- {
  --   "nvim-mini/mini.indentscope",
  --     -- Symbol used for drawing scope indicator
  --     symbol = "╎",
  --   },
  --
  --   init = function()
  --     vim.api.nvim_create_autocmd("FileType", {
  --       pattern = {
  --         "alpha", "dashboard", "fzf", "help", "lazy",
  --         "lazyterm", "mason", "neo-tree", "notify",
  --         "toggleterm", "Trouble", "trouble", "oil"
  --       },
  --       callback = function()
  --         vim.b.miniindentscope_disable = true
  --       end,
  --     })
  --   end,
  -- },

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
    opts = {'echasnovski/mini.icons'},
    config = function()
      return require("plugins.configs.oil")
    end,
    dependencies = {"nvim-tree/nvim-web-devicons"}
  },

  -- Development Tools
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.configs.lspconfig")
      require("configs.lspconfig")
    end
  },
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- optional: run format on save
    lazy = false,
    opts = require("configs.conform"), -- this loads your file
  },

  {"williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright", "mypy",
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
    config = function()
      return require("plugins.configs.neo-tree")
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  },
  -- {"nvimtools/none-ls.nvim",
  --   ft = {"python"},
  --   opts = function()
  --     return require("plugins.configs.null-ls")
  --   end
  -- },
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
  -- {
  --   "m4xshen/hardtime.nvim",
  --   lazy = false,
  --   dependencies = { "MunifTanjim/nui.nvim" },
  --   opts = {}
  -- }
}

return plugins
