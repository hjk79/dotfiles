" Basic options
" set textwidth=79
" execute "set colorcolumn=" . join(range(81,335), ',')
set autoindent
set autoread
set autowrite
set colorcolumn=80
set cursorline
set encoding=utf-8
set expandtab
set fo-=t
set guioptions-=L
set guioptions-=m
set guioptions-=r
set guioptions-=T
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set list
set nobackup
set noswapfile
set nowrap
set nowritebackup
set nrformats=bin,hex
set number
set relativenumber
set ruler
set shiftround
set shiftwidth=4
set showbreak=â†ª
set smartcase
set softtabstop=4
set splitbelow
set splitright
set tabstop=4
set timeoutlen=300
set title
set ttyfast
set undolevels=1000
set undoreload=10000
set visualbell

" Fontstettings
" set guifont=Luxi\ Mono\ 12
set guifont=Courier\ New\ 14

" make dot-command work in visual mode
:vnoremap . :'<,'> normal .<CR>

runtime ~/.vim/bundle/pathogen/autoload/pathogen.vim

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Mouse and backspace
set bs=2 " make backspace behave like normal again

" Rebind <Leader> key
nnoremap <SPACE> <Nop>
let mapleader = " "

" Removes highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" bind Ctrl+<movement> keys to move around windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" bind Alt+<movement> keys to move around fast
nnoremap <A-h> 20h
nnoremap <A-j> 20j
nnoremap <A-k> 20k
nnoremap <A-l> 20l

" easier indentation of blocks
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Color scheme
set t_Co=256
" color solarized
" color molokai
color deus

" Pathogen load
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on
set nocompatible
set nocp

" Settings for vim-powerline
set laststatus=2

" Settings for ctrlp
let g:ctrlp_max_height = 20
set wildignore+=*.pyc

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
  if pumvisible()
    if a:action == 'j'
      return "\<C-N>"
    elseif a:action == 'k'
      return "\<C-P>"
    endif
  endif
  return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Python folding
" set nofoldenable

" set clipboard=unnamedplus

" load up the nerd tree
map <Leader>t :NERDTreeToggle<CR>
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:NERDTreeWinPos = "right"

" Save when losing focus
" au FocusLost * :silent! wall

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Sort lines
nnoremap <leader>s vip:!sort<cr>
vnoremap <leader>s :!sort<cr>

" Clean trailing whitespace
nnoremap <leader>dw mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" 'Uppercase word' mapping.
inoremap <C-u> <esc>mzgUiw`za

" Substitute
nnoremap <c-s> :%s/
vnoremap <c-s> :s/

" Don't move on *
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Meine Erguesse --------------------------------------------------------------

au BufRead,BufNewFile *.mac set filetype=mac
au! Syntax mac source $VIMRUNTIME\syntax\litscr.vim

au BufRead,BufNewFile *.litscr set filetype=litscr
au! Syntax litscr source $VIMRUNTIME\syntax\litscr.vim
let g:xml_syntax_folding=1

au FileType xml setlocal foldmethod=syntax

" quick editing of special files
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>ec :e $HOME\vimfiles\colors\deus.vim<cr>
nnoremap <leader>eh :e c:\home\skripte\html\hilfe.html<cr>
nnoremap <leader>ed :e c:\home\skripte\shell\mydoskeymacros.bat<cr>
nnoremap <leader>en :e c:\home\notes.md<cr>
nnoremap <leader>hv :!start "c:\Program Files\Google\Chrome\Application\chrome.exe"  C:\home\skripte\html\gvim_cheatsheet.html --incognito <CR>
nnoremap <leader>hl :!start "c:\Program Files\Google\Chrome\Application\chrome.exe"  C:\home\skripte\html\litscr_cheatsheet.html --incognito <CR>
nnoremap <leader>hs :!start "c:\Program Files\Google\Chrome\Application\chrome.exe"  C:\home\skripte\html\svn_cheatsheet.html --incognito <CR>
nnoremap <leader>hd :!start "c:\Program Files\Google\Chrome\Application\chrome.exe"  C:\home\skripte\html\dos_cheatsheet.html --incognito <CR>
nnoremap <leader>cr :!start "c:\Program Files\Google\Chrome\Application\chrome.exe" %:p --incognito <CR>

map <leader>n :silent execute '!start gvim' shellescape(expand("<cfile>"), 1)<cr>
" map <c-c> "+y<cr>
" map <c-v> "+p<cr>
map occ *<cr> :%s///gn<cr>
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>

map <F9> :w<CR> :let @"=@%<CR> :new<CR> :read !python <c-r>"<CR> :set buftype=nofile<CR>gg
map <F5> :w<CR> :let @"=@%<CR> :new<CR> :read !c:\mt\exe\litscr.exe <c-r>"<CR> :set buftype=nofile<CR>
"map <F12> :let @"=@%<CR> :vnew<CR>:read !svn diff <c-r>" <CR>:set syntax=diff buftype=nofile<CR>gg

if has("gui_running")
    winpos 160 100
    set lines=42
    set columns=150
endif

" Search in all files recursively the word under the cursor
map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

" Set mark before jumping to first or last Line in Document
nnoremap G mbG
nnoremap gg mbgg
nnoremap <leader>b 'b

" Toggle Goyo View
nnoremap <leader>g :Goyo<CR>

" easy switching between buffers
nnoremap <C-B> :bn<CR>

" Insert html template
nnoremap ,html :-1read $HOME/vimfiles/templates/skeleton.html<CR>3jwf<i

" close current buffer
nnoremap <leader>q :bd<cr>

" insert line below/above
nnoremap - o<ESC>
nnoremap + O<ESC>

:autocmd CursorMoved * exe printf('match VarHL /\V\<%s\>/', escape(expand('<cword>'), '/\'))

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" Highlighting for certain fileextentions in NERDTree
call NERDTreeHighlightFile('litscr', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('bat', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('m', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('xml', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('py', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" enable folding for xml-files
augroup XML
    autocmd!
    autocmd FileType xml setlocal foldmethod=syntax foldlevelstart=0 foldminlines=0
augroup END

" Show svn diff of current file in split window
map <leader>svd :let @"=@%<CR> :vnew<CR>:read !svn diff <c-r>" <CR>:set syntax=diff buftype=nofile<CR>gg
map <leader>svs :vnew<CR>:read !svn status<CR>:set buftype=nofile<CR>gg
map <leader>svc :!svn commit % -m "
map <leader>svl :let @"=@%<CR> :vnew<CR>:read !svn log <c-r>" -l 10 <CR>:set buftype=nofile<CR>gg

" rename files
map <leader>ren gg0<c-v>G$yA                 <ESC>pgg0<c-v>GIren <ESC>

" Keep proportions of split when resizing the window
:au VimResized * wincmd =

" Insert date in current line
nnoremap <leader>dat :-1put=strftime('%c')<CR>A<CR><ESC>
" Insert a horizontal line
nnoremap <leader>l I================================================================================<CR><ESC>
" Insert brackets as checkbox at beginning of line
noremap <leader>a I[] (KW
noremap <leader>x ^ax<ESC>
noremap <leader>ter :read !python c:\home\skripte\python\test_outlook.py<CR>:call UnderlineHeading(1);<CR>
noremap <leader>v vg_
noremap <leader>y "+y
noremap <leader>f 080lbi<CR><ESC>
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" If doing a diff. Upon writing changes to file, automatically update the
" differences
autocmd BufWritePost * if &diff == 1 | diffupdate | endif

" Map ctrl+Up or Down for setting the fontsize
nnoremap <C-Up> :silent! let &guifont = substitute(
 \ &guifont,
 \ ':h\zs\d\+',
 \ '\=eval(submatch(0)+1)',
 \ '')<CR>
nnoremap <C-Down> :silent! let &guifont = substitute(
 \ &guifont,
 \ ':h\zs\d\+',
 \ '\=eval(submatch(0)-1)',
 \ '')<CR>

" Enable Spellcheck German
map <leader>spd :setlocal spell spelllang=de_de<CR>
"
" Enable Spellcheck English
map <leader>spe :setlocal spell spelllang=en_us<CR>

" Automatically load spellcheck
au BufNewFile,BufRead,BufEnter   *.wiki    setlocal spell    spelllang=de_de
au BufNewFile,BufRead,BufEnter   *.md      setlocal spell    spelllang=de_de
au BufNewFile,BufRead,BufEnter   *.txt     setlocal spell    spelllang=de_de

map <leader>c z=
" ____        _                   _
"/ ___| _ __ (_)_ __  _ __   __ _| |_ ___
"\___ \| '_ \| | '_ \| '_ \ / _ \| __/ __|
" ___) | | | | | |_) | |_) |  __/| |_\__ \
"|____/|_| |_|_| .__/| .__/ \___|\___|___/
"              |_|   |_|

"""HTML
    autocmd FileType html inoremap ,b <b></b><Space><++><Esc>0f>a
    autocmd FileType html inoremap ,it <em></em><Space><++><Esc>0f>a
    autocmd FileType html inoremap ,1 <h1></h1><Esc>0f>a
    autocmd FileType html inoremap ,2 <h2></h2><Esc>0f>a
    autocmd FileType html inoremap ,3 <h3></h3><Esc>0f>a
    autocmd FileType html inoremap ,p <p></p><Esc>0f>a
    autocmd FileType html inoremap ,a <a<Space>href=""></a><Esc>0f"
    autocmd FileType html inoremap ,e <a<Space>target="_blank"<Space>href=""><++></a><Space><++><Esc>14hi
    autocmd FileType html inoremap ,ul <ul><Enter><li></li><Enter></ul><Esc>k0f>a
    autocmd FileType html inoremap ,li <Esc><li></li><Esc>0f>a
    autocmd FileType html inoremap ,ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i
    autocmd FileType html inoremap ,im <img src="" alt="<++>"><++><esc>Fcf"a
    autocmd FileType html inoremap ,td <td></td><++><Esc>Fdcit
    autocmd FileType html inoremap ,tr <tr></tr><Enter><++><Esc>kf<i
    autocmd FileType html inoremap ,th <th></th><++><Esc>Fhcit
    autocmd FileType html inoremap ,tab <table><Enter></table><Esc>O
    autocmd FileType html inoremap ,gr <font color="green"></font><Esc>0f>a
    autocmd FileType html inoremap ,rd <font color="red"></font><Esc>0f>a
    autocmd FileType html inoremap ,yl <font color="yellow"></font><Esc>0f>a
    autocmd FileType html inoremap ,dt <dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit
    autocmd FileType html inoremap ,dl <dl><Enter><Enter></dl><enter><enter><++><esc>3kcc
    autocmd FileType html inoremap &<space> &amp;<space>

"""Markdown
    autocmd FileType markdown inoremap ,b ****<ESC>hi
    autocmd FileType markdown inoremap ,it **<ESC>i
    autocmd FileType markdown inoremap ,im ![alt text]()<ESC>i

"""General
    autocmd FileType * inoremap ue ü
    autocmd FileType * inoremap oe ö
    autocmd Filetype * inoremap ae ä
    autocmd FileType * inoremap Ue Ü
    autocmd FileType * inoremap Oe Ö
    autocmd Filetype * inoremap Ae Ä
