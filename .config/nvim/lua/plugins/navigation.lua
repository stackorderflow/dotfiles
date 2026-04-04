return {
  -- ── Telescope fuzzy finder ─────────────────────────────────────────────────
  {
    "nvim-telescope/telescope.nvim",
    branch       = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local telescope = require("telescope")
      local actions   = require("telescope.actions")

      telescope.setup({
        defaults = {
          mappings = { i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          }},
          file_ignore_patterns = { "node_modules", ".git/" },
        },
      })
      telescope.load_extension("fzf")

      local builtin = require("telescope.builtin")
      local map = function(lhs, rhs, desc)
        vim.keymap.set("n", lhs, rhs, { desc = desc })
      end

      map("<leader>ff", builtin.find_files,               "Find files")
      map("<leader>fg", builtin.live_grep,                "Live grep")
      map("<leader>fb", builtin.buffers,                  "Buffers")
      map("<leader>fh", builtin.help_tags,                "Help tags")
      map("<leader>fr", builtin.oldfiles,                 "Recent files")
      map("<leader>fc", builtin.grep_string,              "Find word under cursor")
      map("<leader>fd", builtin.diagnostics,              "Diagnostics")
      map("<leader>fs", builtin.lsp_document_symbols,     "Document symbols")
      map("<leader>fS", builtin.lsp_workspace_symbols,    "Workspace symbols")
      map("<leader>/",  builtin.current_buffer_fuzzy_find,"Fuzzy find in buffer")
    end,
  },

  -- ── File explorer ──────────────────────────────────────────────────────────
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch       = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>",           desc = "Toggle explorer" },
      { "<leader>o", "<cmd>Neotree focus<cr>",            desc = "Focus explorer" },
      { "<leader>E", "<cmd>Neotree reveal<cr>",           desc = "Reveal current file" },
    },
    opts = {
      window = { width = 35 },
      filesystem = {
        follow_current_file = { enabled = true },
        hijack_netrw_behavior = "open_current",
        use_libuv_file_watcher = true,
      },
    },
  },

  -- ── Quick file marks ───────────────────────────────────────────────────────
  {
    "ThePrimeagen/harpoon",
    branch       = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

      local map = function(lhs, rhs, desc)
        vim.keymap.set("n", lhs, rhs, { desc = desc })
      end

      map("<leader>ha", function() harpoon:list():add() end,                                 "Harpoon add")
      map("<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,         "Harpoon menu")
      map("<leader>1",  function() harpoon:list():select(1) end,                             "Harpoon file 1")
      map("<leader>2",  function() harpoon:list():select(2) end,                             "Harpoon file 2")
      map("<leader>3",  function() harpoon:list():select(3) end,                             "Harpoon file 3")
      map("<leader>4",  function() harpoon:list():select(4) end,                             "Harpoon file 4")
      map("<leader>]",  function() harpoon:list():next() end,                                "Harpoon next")
      map("<leader>[",  function() harpoon:list():prev() end,                                "Harpoon prev")
    end,
  },

  -- ── Tmux ↔ Nvim navigation ─────────────────────────────────────────────────
  {
    "christoomey/vim-tmux-navigator",
    cmd  = { "TmuxNavigateLeft", "TmuxNavigateDown", "TmuxNavigateUp", "TmuxNavigateRight" },
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>",  desc = "Navigate left" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>",  desc = "Navigate down" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>",    desc = "Navigate up" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Navigate right" },
    },
  },
}
