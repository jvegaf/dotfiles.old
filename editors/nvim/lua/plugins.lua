-- check if packer is installed (~/local/share/nvim/site/pack)
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
	if vim.fn.input("Hent packer.nvim? (y for yada)") ~= "y" then
		return
	end

	local directory = string.format(
	'%s/site/pack/packer/opt/',
	vim.fn.stdpath('data')
	)

	vim.fn.mkdir(directory, 'p')

	local git_clone_cmd = vim.fn.system(string.format(
	'git clone %s %s',
	'https://github.com/wbthomason/packer.nvim',
	directory .. '/packer.nvim'
	))

	print(git_clone_cmd)
	print("Henter packer.nvim...")

	return
end

return require('packer').startup(function()
	-- if packer == nil then
	-- 	packer = require('packer')
	-- 	packer.init()
	-- end
	-- Packer can manage itself as an optional plugin
	use {'wbthomason/packer.nvim', opt = true}


	-- Deoplete ++
	-- use {'Shougo/deoplete.nvim', run = ':UpdateRemotePlugins'}
	use 'deoplete-plugins/deoplete-tag'
	use {'deathlyfrantic/deoplete-spell', branch = 'main'}
	-- Deoplete relatives
	use 'Shougo/neco-syntax'
	use 'Shougo/context_filetype.vim'

	-- UltiSnips
	use 'SirVer/ultisnips'

	-- Rust
	use 'rust-lang/rust.vim'
	use 'rhysd/rust-doc.vim'

	use {'autozimu/LanguageClient-neovim',
	branch = 'next',
	run = 'bash install.sh'}

	-- Arduino ()
	use 'stevearc/vim-arduino'

	-- Multi cursor
	use {'mg979/vim-visual-multi', branch = 'master'}

	-- Clap
	use 'liuchengxu/vim-clap'

	-- Close tags
	use 'alvan/vim-closetag'

	-- fzf
	-- use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
	-- use {'junegunn/fzf.vim'}

	-- skim
	-- use {'lotabout/skim', dir = '~/.skim', run = './install' }
	-- use 'lotabout/skim.vim'

	-- GoYo
	use 'junegunn/goyo.vim'

	-- Easy Align
	use 'junegunn/vim-easy-align'

	-- Limelight
	use 'junegunn/limelight.vim'

	-- Auto pairs
	-- !! -> breaks visual-multi (multi-cursor)
	use 'jiangmiao/auto-pairs'

	-- Indentline
	use 'vim-scripts/indentLine.vim'

	-- Neoformat
	use 'sbdchd/neoformat'

	-- Commentary
	use 'tpope/vim-commentary'

	-- Easymotion
	use 'easymotion/vim-easymotion'

	-- Surround
	use 'tpope/vim-surround'

	-- Repeat
	use 'tpope/vim-repeat'

	-- Vim sensible
	use 'tpope/vim-sensible'

	-- Git
	use 'airblade/vim-gitgutter'
	use 'tpope/vim-fugitive'

	-- Highlighted yank
	use 'machakann/vim-highlightedyank'

	-- Galaxyline
	-- use {
	-- 	'glepnir/galaxyline.nvim',
	-- 	-- some optional icons baby
	-- 	requires = {'kyazdani42/nvim-web-devicons', opt = true}
	-- }

	-- Colorizer
	use 'norcalli/nvim-colorizer.lua'

	-- Color schemes
	use 'chriskempson/base16-vim'
	use 'morhetz/gruvbox'
	use 'junegunn/seoul256.vim'

	use 'dracula/vim'

end)
