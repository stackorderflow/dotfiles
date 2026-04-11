return {
  {
    "aserowy/tmux.nvim",
    opts = {
      navigation = {
        enable_default_keybindings = false, -- set manually below to override LazyVim's C-hjkl
        cycle_navigation = false,
      },
    },
    keys = {
      { "<C-h>", function() require("tmux").move_left() end,   desc = "Navigate left (tmux/nvim)" },
      { "<C-j>", function() require("tmux").move_bottom() end, desc = "Navigate down (tmux/nvim)" },
      { "<C-k>", function() require("tmux").move_top() end,    desc = "Navigate up (tmux/nvim)" },
      { "<C-l>", function() require("tmux").move_right() end,  desc = "Navigate right (tmux/nvim)" },
    },
  },
}
