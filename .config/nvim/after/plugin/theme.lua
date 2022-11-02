local status, tokyonight = pcall(require, "tokyonight")
if (not status) then return end

tokyonight.setup({
  style = "night",
  terminal_colors = true,
  styles = {
    comments = { italic = false },
    keywords = { italic = false },
    sidebars = "dark",
    floats = "dark",
    sidebars = { "qf", "vista_kind", "terminal", "packer" },
  }
})

vim.cmd('colorscheme tokyonight')

