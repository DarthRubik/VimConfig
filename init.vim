set background=dark
set number
set mouse=v

noremap <F1> :set nonumber <CR>
noremap <F2> :set number <CR>


call plug#begin('~/.local/share/nvim/plugged')
	
	" Language Server Protocol Client
	Plug 'autozimu/LanguageClient-neovim', {'do': ':UpdateRemotePlugins' }	

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


let g:LanguageClient_serverCommands = {
			\ 'cpp' : ['/home/drubik/llvm_avr_build/bin/clangd'],
			\ 'c'   : ['/home/drubik/llvm_avr_build/bin/clangd']
			\ }

" let g:LanguageClient_autoStart = 1
noremap <F3> :call LanguageClient_textDocument_definition() <CR>
noremap <space> :VBGtoggleBreakpointThisLine <CR>
noremap <c-i> :VBGstepIn <CR>
noremap <c-o> :VBGstepOver <CR>
