function ColorMyPencils(color)
	color = color or "tokyonight" or "rose-pine"
	vim.cmd.colorscheme(color)
end

ColorMyPencils()
