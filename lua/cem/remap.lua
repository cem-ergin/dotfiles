vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") 
vim.keymap.set("n", "<leader>rt", ":NvimTreeRefresh<CR>")
vim.keymap.set("n", "<leader>tf", ":NvimTreeFindFile<CR>")

-- save
vim.keymap.set("n", "<C-s>", ":w<CR>") -- save/write
vim.keymap.set("n", "<leader>w", ":w<CR>") -- save/write
vim.keymap.set("n", "<leader>W", ":w<CR>") -- save/write

-- insert mode movements
vim.keymap.set("i", "<C-h>", "<Left>") -- move left
vim.keymap.set("i", "<C-j>", "<Down>") -- move down
vim.keymap.set("i", "<C-k>", "<Up>") -- move up
vim.keymap.set("i", "<C-l>", "<Right>") -- move right

--- Primeagen
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move v to below
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move v to above

--- Trouble
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)

--- Neotest
vim.keymap.set("n", "<leader>nf", '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>')
vim.keymap.set("n", "<leader>ni", '<cmd>lua require("neotest").summary.toggle()<CR>')
vim.keymap.set("n", "<leader>nr", '<cmd>lua require("neotest").run.run()<CR>')
vim.keymap.set("n", "<leader>nl", '<cmd>lua require("neotest").run.run_last()<CR>')
vim.keymap.set("n", "<leader>no", '<cmd>lua require("neotest").output.open({ enter = true })<CR>') 
vim.keymap.set("n", "<leader>ns", '<cmd>lua require("neotest").run.stop()<CR>') 
