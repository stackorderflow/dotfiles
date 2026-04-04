return {
  -- ── Theme ──────────────────────────────────────────────────────────────────
  {
    "catppuccin/nvim",
    name     = "catppuccin",
    priority = 1000,
    opts     = { flavour = "mocha", integrations = {
      bufferline  = true,
      gitsigns    = true,
      mason       = true,
      neo_tree    = true,
      telescope   = true,
      treesitter  = true,
      which_key   = true,
    }},
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- ── Status line ────────────────────────────────────────────────────────────
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" },
    opts = {
      options = {
        theme           = "catppuccin-mocha",
        globalstatus    = true,
        component_separators = { left = "|", right = "|" },
        section_separators  = { left = "", right = "" },
      },
    },
  },

  -- ── Buffer tabs ────────────────────────────────────────────────────────────
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      options = {
        diagnostics        = "nvim_lsp",
        offsets            = {{ filetype = "neo-tree", text = "Explorer", highlight = "Directory" }},
        show_buffer_close_icons = false,
      },
    },
  },

  -- ── Indent guides ──────────────────────────────────────────────────────────
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = { scope = { enabled = true } },
  },

  -- ── Keybinding discovery ───────────────────────────────────────────────────
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts  = { delay = 400 },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.add({
        { "<leader>f", group = "find" },
        { "<leader>g", group = "git" },
        { "<leader>l", group = "lsp" },
        { "<leader>b", group = "buffer" },
      })
    end,
  },

  -- ── Better notifications & command line ────────────────────────────────────
  {
    "folke/noice.nvim",
    event        = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    opts = {
      lsp = { override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"]                = true,
        ["cmp.entry.get_documentation"]                  = true,
      }},
      presets = { bottom_search = true, command_palette = true, long_message_to_split = true },
    },
  },
}
