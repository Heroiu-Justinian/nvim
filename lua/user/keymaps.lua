local opts = { noremap = true, silent = true }

local term_opts = { silent = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
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


-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
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




-- Telescope bindings
function telescope_find_files()
  require("telescope.builtin").find_files{
    require("telescope.themes").get_cursor(),
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.6 }
  }
end

function telescope_live_grep()
  require("telescope.builtin").live_grep{
    require("telescope.themes").get_cursor(),
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.7, height = 0.95, width = 0.9 }

  }
end



keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
--show error
keymap("n", "se", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
keymap(
"n",
"gl",
'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>',
opts
)
keymap("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

keymap("n","<leader>f","<cmd>lua telescope_find_files()<cr>",opts)
keymap("n", "<c-t>", "<cmd>lua telescope_live_grep()<cr>", opts)
keymap("n","gd","<cmd>Telescope lsp_definitions()<cr>",opts)
keymap("n","gr","<cmd>Telescope lsp_references<cr>",opts)
keymap("n","km","<cmd>Telescope keymaps<cr>",opts)


-- File navigation
keymap("n","<leader>e","<cmd>NvimTreeToggle<cr>",opts)
keymap("n","<leader>o","<cmd>NvimTreeFocus<cr>",opts)

-- Gitsings
keymap("n","gh","<cmd>Gitsigns preview_hunk<cr>",opts)
keymap("n","gi","<cmd>Gitsign preview_hunk_inline<cr>",opts)


-- Abstract syntax tree 

keymap("n","<leader>s","<cmd>SymbolsOutline<cr>",opts)


-- Spectre bindings ( fucking scary this piece of software, m8)
keymap("n", "<leader>rw", "<cmd>lua require('spectre').open_visual({select_word=true})<cr>",opts) -- search the word under cursor
keymap("n", "<leader>rf", "<cmd> lua require('spectre').open_file_search()<cr>", opts)
--keymap("n", "<leader>r" ,"lua require('spectre').open_visual() <cr>", opts) this is evil, never use



--Prettier keybindings
keymap("n","<leader>p","<cmd>Prettier<cr>")
