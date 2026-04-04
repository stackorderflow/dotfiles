vim.g.mapleader      = " "
vim.g.maplocalleader = " "

local map = function(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

-- ── Editor ───────────────────────────────────────────────────────────────────
map("i", "jk",         "<Esc>",              "Exit insert mode")
map("n", "<leader>w",  "<cmd>w<cr>",         "Save")
map("n", "<leader>q",  "<cmd>q<cr>",         "Quit")
map("n", "<leader>Q",  "<cmd>qa!<cr>",       "Force quit all")

-- Move lines up/down in visual mode
map("v", "J", ":m '>+1<cr>gv=gv", "Move selection down")
map("v", "K", ":m '<-2<cr>gv=gv", "Move selection up")

-- Keep cursor centered when scrolling / searching
map("n", "<C-d>", "<C-d>zz", "Scroll down (centered)")
map("n", "<C-u>", "<C-u>zz", "Scroll up (centered)")
map("n", "n",     "nzzzv",   "Next match (centered)")
map("n", "N",     "Nzzzv",   "Prev match (centered)")

-- Paste without clobbering register
map("x", "<leader>p", '"_dP', "Paste without clobbering register")

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<cr>", "Clear highlights")

-- ── Windows ───────────────────────────────────────────────────────────────────
-- (C-h/j/k/l are handled by vim-tmux-navigator)
map("n", "<leader>|", "<C-w>v",          "Split vertical")
map("n", "<leader>-", "<C-w>s",          "Split horizontal")
map("n", "<leader>x", "<cmd>close<cr>",  "Close split")

-- Resize with arrows
map("n", "<Up>",    "<cmd>resize +2<cr>",          "Resize up")
map("n", "<Down>",  "<cmd>resize -2<cr>",          "Resize down")
map("n", "<Left>",  "<cmd>vertical resize -2<cr>", "Resize left")
map("n", "<Right>", "<cmd>vertical resize +2<cr>", "Resize right")

-- ── Buffers ───────────────────────────────────────────────────────────────────
map("n", "<S-h>", "<cmd>bprevious<cr>", "Prev buffer")
map("n", "<S-l>", "<cmd>bnext<cr>",     "Next buffer")
map("n", "<leader>bd", "<cmd>bdelete<cr>", "Delete buffer")

-- ── Diagnostics ──────────────────────────────────────────────────────────────
map("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
map("n", "<leader>e", vim.diagnostic.open_float, "Show diagnostic")
