local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>ne", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>nf", ":NvimTreeFindFile<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)


-- Clipboard
keymap("v", "<leader>y", '"+y', opts)
keymap("v", "<leader>p", '"+p', opts)
keymap("", "<C-p>", ':FZF<CR>', opts)
keymap("", "<C-c>", ':OSCYankVisual<CR>', opts)

---- gitsigns

keymap("n", "<leader>hn", ":Gitsigns next_hunk<CR>", opts)
keymap("n", "<leader>hp", ":Gitsigns prev_hunk<CR>", opts)
keymap("n", "<leader>hv", ":Gitsigns preview_hunk<CR>", opts)
keymap("n", "<leader>hs", ":Gitsigns stage_hunk<CR>", opts)
keymap("n", "<leader>hr", ":Gitsigns reset_hunk<CR>", opts)
keymap("n", "<leader>hb", ":Gitsigns blame_line<CR>", opts)

-- buffer management
keymap("n", "<Tab>", ":bn<CR>", {noremap = true})
keymap("n", "<S-TAb>", ":bp<CR>", {noremap = true})
keymap("n", "<leader>q", ":bd<CR>", {noremap = true})

-- telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>",   {noremap = true})
keymap("n", "<C-f>", ":Ag <c-r><c-w><CR>",  {noremap = true})
keymap("n", "<leader>fb", ":Telescope buffers<CR>", {noremap = true})
keymap("n", "<leader>fB", ":BTags<CR>", {noremap = true})

--lsp
keymap('n', 'gd', ':lua vim.lsp.buf.definition()<cr>', opts)
keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<cr>', opts)
keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<cr>', opts)
keymap('n', 'gw', ':lua vim.lsp.buf.document_symbol()<cr>', opts)
keymap('n', 'gw', ':lua vim.lsp.buf.workspace_symbol()<cr>', opts)
keymap('n', 'gr', ':lua vim.lsp.buf.references()<cr>', opts)
keymap('n', 'gt', ':lua vim.lsp.buf.type_definition()<cr>', opts)
keymap('n', 'K', ':lua vim.lsp.buf.hover()<cr>', opts)
keymap('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<cr>', opts)
keymap('n', '<leader>af', ':lua vim.lsp.buf.code_action()<cr>', opts)
keymap('n', '<leader>rn', ':lua vim.lsp.buf.rename()<cr>', opts)
keymap('n', '<space>e', ':lua vim.diagnostic.open_float()<CR>', opts)
keymap('n', '[d', ':lua vim.diagnostic.goto_prev()<CR>', opts)
keymap('n', ']d', ':lua vim.diagnostic.goto_next()<CR>', opts)
keymap('n', '<space>q', ':lua vim.diagnostic.setloclist()<CR>', opts)
-- vista toggle
keymap('n', '<leader>t', ':TagbarToggle<cr>', opts)
keymap('n', '<leader>l', ':noh<cr>', opts)
-- comment toggle
keymap('', '<leader>/', ':CommentToggle<cr>', opts)
