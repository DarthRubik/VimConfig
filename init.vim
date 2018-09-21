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

    Plug 'https://github.com/kien/ctrlp.vim'

call plug#end()


:set list
:set tabstop=4
:set shiftwidth=4
:set expandtab
:set colorcolumn=80
:let mapleader=';'


:let g:ctrlp_map = '<leader>t'
:let g:ctrlp_custom_ignore = 'boost_fh'
:let g:ctrlp_working_path_mode = ''

let g:ctrlp_prompt_mappings = {
    \ 'PrtBS()':              ['<bs>', '<c-]>'],
    \ 'PrtDelete()':          ['<del>'],
    \ 'PrtDeleteWord()':      ['<c-w>'],
    \ 'PrtClear()':           ['<c-u>'],
    \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
    \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
    \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
    \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
    \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
    \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
    \ 'PrtHistory(-1)':       ['<c-n>'],
    \ 'PrtHistory(1)':        ['<c-p>'],
    \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
    \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>', '<Tab>'],
    \ 'AcceptSelection("t")': ['<c-t>'],
    \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>', '<Esc>'],
    \ 'ToggleFocus()':        ['<s-tab>'],
    \ 'ToggleRegex()':        ['<c-r>'],
    \ 'ToggleByFname()':      ['<c-d>'],
    \ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
    \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
    \ 'PrtExpandDir()':       [''],
    \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
    \ 'PrtInsert()':          ['<c-\>'],
    \ 'PrtCurStart()':        ['<c-a>'],
    \ 'PrtCurEnd()':          ['<c-e>'],
    \ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
    \ 'PrtCurRight()':        ['<c-l>', '<right>'],
    \ 'PrtClearCache()':      ['<F5>'],
    \ 'PrtDeleteEnt()':       ['<F7>'],
    \ 'CreateNewFile()':      ['<c-y>'],
    \ 'MarkToOpen()':         ['<c-z>'],
    \ 'OpenMulti()':          ['<c-o>'],
    \ 'PrtExit()':            ['<c-c>', '<c-g>'],
    \ }
