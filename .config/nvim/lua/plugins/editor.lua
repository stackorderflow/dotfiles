return {
  -- ── Auto-close brackets / quotes ──────────────────────────────────────────
  {
    "windwp/nvim-autopairs",
    event  = "InsertEnter",
    config = function()
      local autopairs = require("nvim-autopairs")
      autopairs.setup({ check_ts = true })
      -- Integrate with cmp so <CR> doesn't leave an extra closing bracket
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  -- ── Surround (ys, cs, ds) ─────────────────────────────────────────────────
  {
    "kylechui/nvim-surround",
    version = "*",
    event   = "VeryLazy",
    opts    = {},
  },

  -- ── Comment / uncomment (gcc, gc in visual) ───────────────────────────────
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts  = {},
  },

  -- ── Git signs in gutter ───────────────────────────────────────────────────
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts  = {
      signs = {
        add          = { text = "▎" },
        change       = { text = "▎" },
        delete       = { text = "" },
        topdelete    = { text = "" },
        changedelete = { text = "▎" },
      },
      on_attach = function(bufnr)
        local gs  = package.loaded.gitsigns
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        -- Navigation
        map("n", "]h", gs.next_hunk,  "Next hunk")
        map("n", "[h", gs.prev_hunk,  "Prev hunk")

        -- Actions
        map("n", "<leader>gs", gs.stage_hunk,         "Stage hunk")
        map("n", "<leader>gr", gs.reset_hunk,         "Reset hunk")
        map("v", "<leader>gs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage hunk")
        map("n", "<leader>gS", gs.stage_buffer,       "Stage buffer")
        map("n", "<leader>gu", gs.undo_stage_hunk,    "Undo stage hunk")
        map("n", "<leader>gR", gs.reset_buffer,       "Reset buffer")
        map("n", "<leader>gp", gs.preview_hunk,       "Preview hunk")
        map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame line")
        map("n", "<leader>gd", gs.diffthis,           "Diff this")
        map("n", "<leader>gD", function() gs.diffthis("~") end,               "Diff this ~")
        map("n", "<leader>tb", gs.toggle_current_line_blame, "Toggle blame")
      end,
    },
  },

  -- ── Better % matching (HTML tags, etc.) ───────────────────────────────────
  {
    "andymass/vim-matchup",
    event = { "BufReadPost" },
    init  = function() vim.g.matchup_matchparen_offscreen = { method = "popup" } end,
  },

  -- ── Highlight word under cursor ───────────────────────────────────────────
  {
    "RRethy/vim-illuminate",
    event  = { "BufReadPost", "BufNewFile" },
    opts   = { delay = 200, large_file_cutoff = 2000 },
    config = function(_, opts) require("illuminate").configure(opts) end,
  },

  -- ── Jump anywhere on screen (s + 2 chars) ─────────────────────────────────
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts  = {},
    keys  = {
      { "s",     function() require("flash").jump() end,              mode = { "n", "x", "o" }, desc = "Flash" },
      { "S",     function() require("flash").treesitter() end,        mode = { "n", "x", "o" }, desc = "Flash Treesitter" },
      { "r",     function() require("flash").remote() end,            mode = "o",               desc = "Remote Flash" },
      { "<C-s>", function() require("flash").toggle() end,            mode = "c",               desc = "Toggle Flash Search" },
    },
  },
}
