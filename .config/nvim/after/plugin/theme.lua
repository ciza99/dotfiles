local status, poimandres = pcall(require, "poimandres")
if not status then
	return
end

poimandres.setup({
	disable_italics = true,
})

vim.cmd("colorscheme poimandres")
