-- More on these settings @ https://github.com/josean-dev/dev-environment-files/blob/main/.config/nvim/lua/josean/plugins-setup.lua

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


-- auto command that reloads neovim whenever you save this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])


local status, packer = pcall(require, "packer")
if not status then
    return
end

return packer.startup(function(use)

    use("wbthomason/packer.nvim")

    -- prefered color scheme
    use({"catppuccin/nvim", as = "catppuccin"})

    -- allows ctrl J,K,H,L to navigate between windows 
    use("christoomey/vim-tmux-navigator")

    -- maximizes and restores current window
    use("szw/vim-maximizer")

    -- surrounding word but too "complex"
    -- use("tpope/vim-surround") 

    -- yw copy text then grw replace
    use("vim-scripts/ReplaceWithRegister")

    -- commenting plugin (gcc = comment/uncomment line, gc3j = comment 3 lines below, gbc = comment block)
    use("numToStr/Comment.nvim")

    -- file explorer
    use("nvim-tree/nvim-tree.lua")
    use("nvim-tree/nvim-web-devicons")

    -- statusline
    use("nvim-lualine/lualine.nvim")

    -- fuzzy finding
    -- rg is used and installed separately at C:\BIN\ripgrep-13.0.0-x86_64-pc-windows-msvc
	-- on my debian machine, rg is intalled via `sudo apt-get install ripgrep`
    -- :checkhealth telescope to see more information about setup
    use({
        "nvim-telescope/telescope.nvim", branch = "0.1.x",
        requires = { {
            'nvim-lua/plenary.nvim',
            'BurntSushi/ripgrep'
        } }
    })

	-- fzf native - e.g. searches like ^core go$ | rb$ | py$
	-- on my debian machine, I'm using GNU Make 
	use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })

    -- configuring lsp servers
    use("neovim/nvim-lspconfig")

    -- auto completion
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")

    --snippets
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")


    -- managing & installing lsp servers, linters and formatters
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")

	-- allows to configure lsp servers so they appear on auto completion
    use("hrsh7th/cmp-nvim-lsp")

	-- add enhanced ui's to our LSP experience
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        requires = {
            { "nvim-tree/nvim-web-devicons" },
            { "nvim-treesitter/nvim-treesitter" },
        }
    })

	-- to add further functionality to our typescript-language-server LSP like renaming a file 
	-- and updating all of its imports
    --use("jose-elias-alvarez/typescript.nvim")

	-- add VSCode like icons to our auto completion window
    use("onsails/lspkind.nvim")

    -- formatting and linting
	-- disabled null-ls since we don't want to auto format on save
    use("jose-elias-alvarez/null-ls.nvim")
    use("jayp0521/mason-null-ls.nvim")

    -- treesitter configuration
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    })

    -- auto closing braces,brackets, tags
    use("windwp/nvim-autopairs")
    use("windwp/nvim-ts-autotag")

    -- git signs plugin
    use("lewis6991/gitsigns.nvim")

    if packer_bootstrap then
        require("packer").sync()
    end
end)

