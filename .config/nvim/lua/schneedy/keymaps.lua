local map = vim.keymap

vim.g.mapleader = " "

-- exit insert mode
map.set("i", "jj", "<ESC>")

-- exit visual mode
map.set("v", "<leader>jj", "<ESC>")

-- dont copy to buffer on deleting char
map.set("n", "x", '"_x')

-- clear search highlights
map.set("n", "<leader>nh", ":nohl<CR>")

-- increment / decrement
map.set("n", "+", "<C-a>")
map.set("n", "-", "<C-x>")

-- tabs
map.set("v", "<", "<gv")
map.set("v", ">", ">gv")

-- window management
map.set("n", "<leader>sv", "<C-w>v") -- split window vertically
map.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
map.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
map.set("n", "<leader>sx", ":close<CR>") -- close current split window

map.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
map.set("n", "<leader>tx", ":bd<CR>") -- close current tab
map.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
map.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- PLUGIN KEYBINDSJ

map.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- map.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
map.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
map.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
map.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
map.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
map.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
map.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
map.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
map.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
map.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
map.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- bufferline
map.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
map.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})

map.set("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>")
map.set("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>")
map.set("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>")
map.set("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>")
map.set("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>")
map.set("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>")
map.set("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>")
map.set("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>")
map.set("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>")
map.set("n", "<leader>$", "<Cmd>BufferLineGoToBuffer -1<CR>")
