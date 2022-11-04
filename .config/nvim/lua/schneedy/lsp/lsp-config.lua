local status, lspconfig = pcall(require, "lspconfig")
if not status then
	return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local map = vim.keymap

---@diagnostic disable-next-line: unused-local
local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- keybinds
	map.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
	map.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
	map.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
	map.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
	map.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
	map.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
	map.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	map.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	map.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
	map.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	map.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
	map.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side
end

local capabilities = cmp_nvim_lsp.default_capabilities()

-- change diagnostic symbols
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- CONFIGURE SERVERS

lspconfig["html"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig["cssls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig["tsserver"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig["rust_analyzer"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig["tailwindcss"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig["sumneko_lua"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})
