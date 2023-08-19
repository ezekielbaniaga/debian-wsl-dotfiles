local status_catp, catp = pcall(require, "catppuccin")
if not status_catp then
    return
end

catp.setup({

    flavour = "mocha",

    transparent_background = true,

	-- colors like rosewater can be checked in https://github.com/catppuccin/catppuccin/blob/main/docs/style-guide.md
	-- Keywords reference can be checked on any theme.lua like https://github.com/folke/tokyonight.nvim/blob/ed89c01ea0b9a1a6a6c4ae6223f7c178b352ca3f/lua/tokyonight/theme.lua#L295
	-- NVimTree color keywords are defined at HIGHLIGHT GROUPS section @ https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt
	custom_highlights = function(colors)
		return {
			Comment = { fg = colors.rosewater },
			LineNr = { fg = colors.crust },
			NvimTreeCursorLine = { bg = colors.crust},
			Visual = { bg = colors.crust},
		}
	end,

    color_overrides = {
		all = {
			-- text = "#ffffff",
		},
        mocha = {

        }
    }
})


-- colorscheme catpuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha"

local status, _ = pcall(vim.cmd, "colorscheme catppuccin")
if not status then
    print("Catppuccin colorscheme not found!")
    return
end


