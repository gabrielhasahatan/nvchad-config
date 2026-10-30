return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "folke/which-key.nvim",
    lazy = false
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require "cmp"
      local luasnip = require "luasnip"
      opts = opts or {}
      opts.mapping = opts.mapping or {}

      opts.mapping["<C-j>"] = cmp.mapping.complete()
      opts.mapping["<C-l>"] = cmp.mapping(function(fallback)
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" })

      opts.mapping["<C-h>"] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" })

      opts.view = opts.view or {}
      opts.view.docs = opts.view.docs or {}
      opts.view.docs.auto_open = false

      opts.window = opts.window or {}
      opts.window.documentation = cmp.config.disable

      opts.enabled = function()
        local line = vim.api.nvim_get_current_line()
        local col = vim.api.nvim_win_get_cursor(0)[2]
        local prev_char = col > 0 and line:sub(col, col) or ""

        if prev_char == "{" then
          return false
        end

        return true
      end

      return opts
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "html",
        "css",
        "tsx",
        "typescript",
        "rust",
        "dart",
        "ruby"
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      filters = {
        custom = { ".next" },
      },
      view = {
        width = 45, -- 👈 ini yang kamu cari
      },
      git = {
        ignore = false,
      },
      renderer = {
        icons = {
          git_placement = "after"
        }
      }
    },
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },

  {
    "rmagatti/goto-preview",
    dependencies = { "rmagatti/logger.nvim" },
    event = "BufEnter",
    config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
  },
  {
    'nvim-pack/nvim-spectre',
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    init = function()
      local function set_blame_hl()
        vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", {
          fg = "#F5F5F5",
          -- bg = "#792CA2",
          -- bold = true,
          -- blink = true,
          underdotted = true,
          italic = true,
        })
      end

      vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
        callback = set_blame_hl,
      })
    end,
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 0,
        ignore_whitespace = true,
      },
      current_line_blame_formatter = " ❓ <author>, <author_time:%R> - <summary>",
    },
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  {
    'stevearc/overseer.nvim',
    lazy = false,
    opts = {},
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    lazy = false,
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              -- even more custom stuff here
            })
          }
        }
      })
      -- Load the extension after setting it up
      require("telescope").load_extension("ui-select")
    end,
  },
  {
    "folke/ts-comments.nvim",
    opts = {},
    -- lazy = false,
    event = "VeryLazy",
    enabled = true,
  },

  {
    'echasnovski/mini.animate',
    lazy = false,
    version = '*',
  },

  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     -- add any options here
  --   },
  --   dependencies = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     "rcarriga/nvim-notify",
  --   }
  -- },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = false },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  },

  {
    "amitds1997/remote-nvim.nvim",
    version = "*",                     -- Pin to GitHub releases
    dependencies = {
      "nvim-lua/plenary.nvim",         -- For standard functions
      "MunifTanjim/nui.nvim",          -- To build the plugin UI
      "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
    },
    config = true,
  },

  {
    'nvim-java/nvim-java',
    config = function()
      require('java').setup()
      vim.lsp.enable('jdtls')
    end,
  },
  {
    "barrettruth/live-server.nvim",
    url = "https://forge.barrettruth.com/barrettruth/live-server.nvim",
    cmd = { "LiveServerStart", "LiveServerStop", "LiveServerToggle" },
    init = function()
      vim.g.live_server = {
        port = 5500,
        browser = true,
      }
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
  -- -- These are some examples, uncomment them if you want to see them work!
  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     require "configs.treesitter"
  --   end,
  -- },
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = {
  --     ensure_installed = {
  --       "lua",
  --       "html",
  --       "css",
  --       "tsx",
  --       "javascript",
  --       "typescript",
  --       "ruby",
  --       "dart",
  --     },
  --   },
  -- },
  --



  --   {
  --   "sphamba/smear-cursor.nvim",
  --   lazy = false,
  --   opts = {
  --     stiffness = 0.8,                      -- 0.6      [0, 1]
  --     trailing_stiffness = 0.5,             -- 0.45     [0, 1]
  --     stiffness_insert_mode = 0.7,          -- 0.5      [0, 1]
  --     trailing_stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
  --     damping = 0.95,                       -- 0.85     [0, 1]
  --     damping_insert_mode = 0.95,           -- 0.9      [0, 1]
  --     distance_stop_animating = 0.5,        -- 0.1      > 0
  --   },
  -- },
  --
  -- {
  --   "kndndrj/nvim-dbee",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --   },
  --   build = function()
  --     -- Install tries to automatically detect the install method.
  --     -- if it fails, try calling it with one of these parameters:
  --     --    "curl", "wget", "bitsadmin", "go"
  --     require("dbee").install()
  --   end,
  --   config = function()
  --     require("dbee").setup( --[[optional config]])
  --   end,
  -- },
}
