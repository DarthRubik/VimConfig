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

function SetDebugMode()
	call SetDefaultMode()
	noremap <space> :VBGtoggleBreakpointThisLine <CR>
	noremap i :VBGstepIn <CR>
	noremap o :VBGstepOver <CR>
	noremap s :VBGstartGDB
endfunction
function SetDefaultMode()
	mapclear | mapclear <buffer> | mapclear! | mapclear! <buffer>
	noremap <F1> :call SetDefaultMode() <CR>
	noremap <F2> :call SetDebugMode() <CR>
	noremap <c-t> :NERDTreeToggle <CR>
	noremap <c-n> :set invnumber <CR>

	inoremap <c-p> <ESC>pli


endfunction
call SetDefaultMode()
