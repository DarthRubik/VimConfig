set background=dark
set number
set mouse=v

call plug#begin('~/.local/share/nvim/plugged')
	
	" Language Server Protocol Client
	" Plug 'autozimu/LanguageClient-neovim', {'do': ':UpdateRemotePlugins' }

	Plug 'https://github.com/scrooloose/nerdtree.git'

	" Auto complete handler
	" Plug 'https://github.com/roxma/nvim-completion-manager.git'

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


nnoremap ;, :set opfunc=DR_LocalSearch<CR>g@
vnoremap ;, :<C-U>call DR_LocalSearch(visualmode(),1)<CR>

nnoremap ;< :set opfunc=DR_LocalSearchNoMatchWord<CR>g@
vnoremap ;< :<C-U>call DR_LocalSearchNoMatchWord(visualmode(),1)<CR>

nnoremap ;; :set opfunc=DR_GlobalSearch<CR>g@
vnoremap ;; :<C-U>call DR_GlobalSearch(visualmode(),1)<CR>

nnoremap ;: :set opfunc=DR_GlobalSearchNoMatchWord<CR>g@
vnoremap ;: :<C-U>call DR_GlobalSearchNoMatchWord(visualmode(),1)<CR>

nnoremap ;. :set opfunc=DR_GlobalSearchUpADirectory<CR>g@
vnoremap ;. :<C-U>call DR_GlobalSearchUpADirectory(visualmode(),1)<CR>

nnoremap ;> :set opfunc=DR_GlobalSearchUpADirectory<CR>g@
vnoremap ;> :<C-U>call DR_GlobalSearchUpADirectory(visualmode(),1)<CR>

function! DR_GetMovementSelection(type,is_visual_mode)
    let sel_save = &selection
    let &selection = "inclusive"
    let reg_save = @@

    if a:is_visual_mode  " Invoked from Visual mode, use gv command.
        silent exe "normal! gvy"
    elseif a:type == 'line'
        silent exe "normal! '[V']y"
    else
        silent exe "normal! `[v`]y"
    endif

    let ret = @@


    let &selection = sel_save
    let @@ = reg_save

    return ret
endfunction

function! DR_GenericSearch(str, opts, search_file)
    let l:ext_list = ["c", "h", "cpp", "hpp", "mk", "vim"]
    let l:inc_list = ""
    for l:ext in l:ext_list
        let l:inc_list = l:inc_list . "--include \*." . l:ext . " "
    endfor
    let l:s = "silent grep! -I " . l:inc_list . " " . a:opts . " '" . a:str . "' " . a:search_file
    execute l:s
endfunction
function! DR_GenericMoveSearch(type, opts, search_file, mode)
    :call DR_GenericSearch(DR_GetMovementSelection(a:type,a:mode),a:opts,a:search_file)
endfunction
function! DR_LocalSearch(type, ...)
    :call DR_GenericMoveSearch(a:type,"-w","%",a:0)
endfunction
function! DR_LocalSearchNoMatchWord(type, ...)
    :call DR_GenericMoveSearch(a:type,"","%",a:0)
endfunction
function! DR_GlobalSearch(type, ...)
    :call DR_GenericMoveSearch(a:type,"-w -r",".",a:0)
endfunction
function! DR_GlobalSearchNoMatchWord(type, ...)
    :call DR_GenericMoveSearch(a:type,"-r",".",a:0)
endfunction
function! DR_GlobalSearchUpADirectory(type, ...)
    :call DR_GenericMoveSearch(a:type,"-w -r","%:p:h/..",a:0)
endfunction
function! DR_GlobalSearchUpADirectoryNoMatchWord(type, ...)
    :call DR_GenericMoveSearch(a:type,"-r","%:p:h/..",a:0)
endfunction

nnoremap ;f :call DR_GenericSearch("","-w -r",".")<LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
nnoremap ;F :call DR_GenericSearch("","-r",".")<LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>

nnoremap ;v :call DR_GenericSearch("","-w -r","%:p:h/..")<LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
nnoremap ;V :call DR_GenericSearch("","-r","%:p:h/..")<LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>

nnoremap ;q :botright copen<CR>
nnoremap ;a :cclose<CR>

nnoremap ;c zR:cc<CR>viw"hp
nnoremap ;n zR:cn<CR>viw"hp


nnoremap ;y :set opfunc=DR_YankToClip<CR>g@
vnoremap ;y :<C-U>call DR_YankToClip(visualmode(),1)<CR>

function! DR_YankToClip(type, ...)
    let @y = DR_GetMovementSelection(a:type,a:0)
    call system("clip.exe",@y)
endfunction

:tnoremap <Esc> <C-\><C-n>

nnoremap ++ ggVG"hy:let @h = system("gcc -xc -fpreprocessed -dD -E -", @h)<CR>:let @h = system("clang-format", @h)<CR>ggVG"hp:g/^\s*$/d<CR>

nnoremap ;r :so $MYVIMRC<CR>

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
