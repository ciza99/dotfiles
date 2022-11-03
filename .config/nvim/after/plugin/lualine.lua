local status, lualine = pcall(require, "lualine")
if not status then
	return
end

-- configure lualine with theme
lualine.setup({
	options = {
		theme = "poimandres",
	},
})
