return {
  {
    "nvim-treesitter/nvim-treesitter",
    build        = ":TSUpdate",
    event        = { "BufReadPost", "BufNewFile" },
    main         = "nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = {
      ensure_installed = {
        "bash", "c", "css", "go", "html", "javascript",
        "json", "lua", "markdown", "markdown_inline",
        "python", "rust", "toml", "tsx", "typescript",
        "vim", "vimdoc", "yaml",
      },
      auto_install  = true,
      highlight     = { enable = true },
      indent        = { enable = true },
      textobjects   = {
        select = {
          enable    = true,
          lookahead = true,
          keymaps   = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
          },
        },
        move = {
          enable              = true,
          set_jumps           = true,
          goto_next_start     = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
        },
      },
    },
  },
}
