function SetupColor(color)
	color = color or "tender"
	vim.cmd.colorscheme(color)
end

SetupColor()
