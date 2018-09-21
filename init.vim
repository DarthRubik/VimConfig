set background=dark
set number
set mouse=v

call plug#begin('~/.local/share/nvim/plugged')
	
	" Language Server Protocol Client
	" Plug 'autozimu/LanguageClient-neovim', {'do': ':UpdateRemotePlugins' }

	Plug 'https://github.com/scrooloose/nerdtree.git'

	" Auto complete handler
	Plug 'https://github.com/roxma/nvim-completion-manager.git'

	" Multi-entry UI
	Plug 'Shougo/denite.nvim'

	" Inline documentation
	Plug 'Shougo/echodoc.vim'

	" Async Library
	Plug 'Shougo/vimproc.vim', {'do' : 'make'}

	" GDB Integration
	Plug 'https://github.com/idanarye/vim-vebugger'

	" Git
	Plug 'https://github.com/tpope/vim-fugitive'

call plug#end()


:set list
:set tabstop=4
:set shiftwidth=4
:set expandtab
:set colorcolumn=80
