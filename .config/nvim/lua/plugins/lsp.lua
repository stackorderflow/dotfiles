return {
  -- ── Mason: installs LSP servers, linters, formatters ─────────────────────
  {
    "williamboman/mason.nvim",
    opts = { ui = { border = "rounded" } },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      -- Servers to auto-install. Add/remove as needed.
      ensure_installed = {
        "lua_ls", "ts_ls", "pyright", "gopls", "rust_analyzer",
        "cssls", "html", "jsonls", "bashls",
      },
      automatic_installation = true,
    },
  },

  -- ── nvim-lspconfig ────────────────────────────────────────────────────────
  {
    "neovim/nvim-lspconfig",
    event        = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      { "folke/neodev.nvim", opts = {} },  -- nvim API completions for lua_ls
    },
    config = function()
      -- Set capabilities globally for all servers
      vim.lsp.config("*", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      -- Keymaps that only make sense when an LSP is active
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local map = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
          end

          map("gd",         vim.lsp.buf.definition,       "Go to definition")
          map("gD",         vim.lsp.buf.declaration,      "Go to declaration")
          map("gr",         vim.lsp.buf.references,       "References")
          map("gI",         vim.lsp.buf.implementation,   "Go to implementation")
          map("gy",         vim.lsp.buf.type_definition,  "Go to type definition")
          map("K",          vim.lsp.buf.hover,            "Hover docs")
          map("<C-s>",      vim.lsp.buf.signature_help,   "Signature help")
          map("<leader>lr", vim.lsp.buf.rename,           "Rename symbol")
          map("<leader>la", vim.lsp.buf.code_action,      "Code action")
          map("<leader>lf", function() vim.lsp.buf.format({ async = true }) end, "Format")
        end,
      })

      -- Per-server settings (only servers that need overrides)
      vim.lsp.config("lua_ls", {
        settings = { Lua = {
          diagnostics  = { globals = { "vim" } },
          workspace    = { checkThirdParty = false },
          telemetry    = { enable = false },
        }},
      })

      -- Enable all servers (nvim-lspconfig provides their cmd/filetypes via runtimepath)
      vim.lsp.enable({
        "lua_ls", "ts_ls", "pyright", "gopls", "rust_analyzer",
        "cssls", "html", "jsonls", "bashls",
      })

      -- Diagnostic signs & style
      vim.diagnostic.config({
        virtual_text  = { prefix = "●" },
        signs         = true,
        underline     = true,
        update_in_insert = false,
        float         = { border = "rounded", source = "always" },
      })
    end,
  },

  -- ── Formatting ────────────────────────────────────────────────────────────
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts  = {
      format_on_save = { timeout_ms = 500, lsp_fallback = true },
      formatters_by_ft = {
        lua        = { "stylua" },
        python     = { "black", "isort" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        json       = { "prettier" },
        css        = { "prettier" },
        html       = { "prettier" },
        markdown   = { "prettier" },
        go         = { "gofmt" },
        rust       = { "rustfmt" },
        sh         = { "shfmt" },
      },
    },
  },
}
