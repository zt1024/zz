" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.

"nnoremap <silent> <leader>ss :source ~/.vimrc<cr>

"autocmd! bufwritepost .vimrc source ~/.vimrc 
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
let mapleader = ","
noremap <silent> <leader>ee :e ~/.vimrc<cr>
set number
set cursorline
set laststatus=2
set ignorecase
set tabstop=4
set shiftwidth=4
set expandtab
set pastetoggle=<F9>
hi Cursorline cterm=bold ctermbg=black ctermfg=green guibg=green


nmap <Leader>f :CtrlPMRUFiles<CR>
nmap <Leader>b :CtrlPBuffer<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc|o|a)$',
    \ }
let g:ctrlp_regexp = 1
inoremap jj <esc>
map <silent> <F7> :TlistToggle<cr> 
map <F2> :NERDTreeToggle<CR>

nnoremap _ :vertical resize -2<CR>
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'
nnoremap + :vertical resize +2<CR>
nmap <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr> 
nnoremap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
autocmd VimEnter * NERDTree
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"let g:NERDTreeFileLines = 1
nnoremap ff :NERDTreeFind<CR>
let g:NERDTreeIgnore = ['\.o$','\.a$','\.so$']
"let g:NERDTreeWinSize = 25
let NERDTreeShowHidden=1
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口 
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let Tlist_Use_SingleClick = 1
let Tlist_Auto_Open = 0 
let Tlist_Process_File_Always = 1
let Tlist_WinWidth=50
if filereadable("tags")       
    set tags=tags
elseif $TAG_DB != ""
    set tags=$TAG_DB
endif
""""""""""""""""""""""""""""""

if has("cscope")
	set csprg=/usr/local/bin/cscope
	set csto=1
	set cst
	set nocsverb
    "set cscopequickfix=s-,c-
    if filereadable("cscope.out")       
            cs add cscope.out
    elseif $CSCOPE_DB != ""
            cs add $CSCOPE_DB
    endif
	" add any database in current directory
	set csverb
endif

let g:netrw_winsize = 30


" toggle between terminal and vim mouse
map <silent><F12> :let &mouse=(&mouse == "a"?"":"a")<CR>:call ShowMouseMode()<CR>
"imap <silent><F12> :let &mouse=(&mouse == "a"?"":"a")<CR>:call ShowMouseMode()<CR>
function ShowMouseMode()
    if (&mouse == 'a')
        echo "mouse-vim"
    else
        echo "mouse-xterm"
    endif
endfunction

"" 创建一个新的 MyTabSpace 组,并设置它的颜色
"highlight MyTabSpace guifg=darkgrey ctermfg=darkgrey
"" 指定tab字符和空格的颜色组为MyTabSpace,不同字符串之间用|隔开,要使用\|转义.
"match MyTabSpace /\t\| /
"" 针对特定类型的代码文件,设置显示Tab键和行尾空格以便在查看代码时注意到它们
"autocmd FileType c,cpp,java,xml setlocal list | set listchars=tab:>~,trail:.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if v:progname =~? "evim"
	finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode

set backspace=indent,eol,start

if has("vms")
	set nobackup		" do not keep a backup file, use versions instead
else
	set nobackup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.

"if has('mouse')
"	set mouse=a
"endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

	" Enable file type detection.
	" Use the default filetype settings, so that mail gets 'tw' set to 72,
	" 'cindent' is on in C files, etc.
	" Also load indent files, to automatically do language-dependent indenting.
	filetype plugin indent on

	" Put these in an autocmd group, so that we can delete them easily.
	augroup vimrcEx
		au!

		" For all text files set 'textwidth' to 78 characters.
		autocmd FileType text setlocal textwidth=78

		" When editing a file, always jump to the last known cursor position.
		" Don't do it when the position is invalid or when inside an event handler
		" (happens when dropping a file on gvim).
		" Also don't do it when the mark is in the first line, that is the default
		" position when opening a file.
		autocmd BufReadPost *
					\ if line("'\"") > 1 && line("'\"") <= line("$") |
					\   exe "normal! g`\"" |
					\ endif

	augroup END

else

	set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
				\ | wincmd p | diffthis
endif
