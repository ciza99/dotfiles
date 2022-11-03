local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

local rainbow_colors = {
	"#f5e63d",
	"#e246d0",
	"#4199ec",
	"#f5e63d",
	"#e246d0",
	"#4199ec",
	"#ececfd",
}

treesitter.setup({
	highlight = {
		enable = true,
	},
	indent = { enable = true },
	autotag = { enable = true },
	rainbow = {
		enable = true,
		extended_mode = false,
		colors = rainbow_colors,
	},
	ensure_installed = {
		"json",
		"javascript",
		"typescript",
		"tsx",
		"yaml",
		"html",
		"css",
		"markdown",
		"svelte",
		"graphql",
		"bash",
		"lua",
		"vim",
		"dockerfile",
		"gitignore",
	},
	auto_install = true,
})

-- p00f/rainbow#81
for i, c in ipairs(rainbow_colors) do
	vim.cmd(("hi rainbowcol%d guifg=%s"):format(i, c))
end
