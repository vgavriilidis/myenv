syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set relativenumber
set nowrap
"set wrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set incsearch
set laststatus=2
set colorcolumn=80
set hlsearch
set ttymouse=xterm2 
set mouse=a
set backspace=indent,eol,start
set so=5
set re=0 " typescript is slow without this one

highlight ColorColumn ctermbg=0 guibg=lightgrey

" install pluging if not already installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'morhetz/gruvbox'
"Plug 'Valloric/YouCompleteMe'
Plug 'tmhedberg/SimpylFold'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'zivyangll/git-blame.vim'
Plug 'vim-python/python-syntax'
Plug 'majutsushi/tagbar'
Plug 'szw/vim-maximizer'
Plug 'AndrewRadev/undoquit.vim'
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }
Plug 'hashivim/vim-terraform'  " :TerraformFmt
Plug 'preservim/vim-markdown'
Plug 'mechatroner/rainbow_csv'      " to query csv
Plug 'speshak/vim-cfn'              " for cloud formation templates
Plug 'christoomey/vim-tmux-navigator'
"Plug 'puremourning/vimspector' " for debugging
call plug#end()

" format with goimport instead of gofmt golang
let g:go_fmt_command = "goimports"

" nerdtree options
"
" when having only one window also close the nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" python syntax
let g:python_highlight_all = 1

" coc also needs the following after install to detect defititions
" :CocInstall coc-python
" :CocInstall coc-pyright

" the followins are prerequisites for jupyter-vim
" : space + X sends it to jupyter
" https://blogs.aalto.fi/marijn/2017/11/13/integrating-vim-and-jupyter-qtconsole/

" disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" this is what is called leader
let mapleader=","

" experimental since I cannot setup jupyter vim yet
let maplocalleader="\<space>"

" toggle nerd tree
map <C-b> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=40

" toggle git hightlighting gitgutter
map <C-g> :GitGutterLineHighlightsToggle<CR>
" nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

" toggle tagbar
" let g:tagbar_left=1
" let g:tagbar_vertical = 25
map <C-h> :TagbarToggle<CR>
let g:tagbar_show_tag_count = 1

"maximizer plugin
map <C-l> :MaximizerToggle<CR>

" show how many occurancies when searching
set shortmess-=S

" set higher dold leve on start
set foldlevel=10
let g:SimpylFold_docstring_preview = 1
set foldmethod=syntax

colorscheme gruvbox
set background=dark
set t_Co=256

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_use_cashing = 0

" On results press ctrl_v to open in new window
" Select multiple results by ctrl+z and then open them by ctrl+o
" F5 to refresh project
"
"
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

let g:gitgutter_enabled = 1

" In your ~/.vimrc
" This is to move up or down
" Normal mode
"nnoremap <C-J> :m .+1<CR>==
"nnoremap <C-K> :m .-2<CR>==
"
"" Insert mode
"inoremap <C-J> <ESC>:m .+1<CR>==gi
"inoremap <C-K> <ESC>:m .-2<CR>==gi
"
"" Visual mode
"vnoremap <C-J> :m '>+1<CR>gv=gv
"vnoremap <C-K> :m '<-2<CR>gv=gv

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


" mapping window movements with arrow keys
nnoremap <Right> <C-w>l
nnoremap <Left> <C-w>h
nnoremap <Up> <C-w>k
nnoremap <Down> <C-w>j

"let g:coc_enable_locationlist = 0
"autocmd User CocLocationsChange CocList --normal location

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

" custom to open coc definition in new tab
nmap <silent> gD <C-w>v<C-w><C-w>gd

" open file under cursor
nmap <silent> of <C-w>v<C-w><C-w>gF

filetype plugin on

" Able to insert space in normal mode
nnoremap <space> i<space><esc>

" search inside vim
command! -nargs=+ Grep execute 'silent grep! -I -r -n --exclude *.{json,pyc} . -e <args>' | copen | execute 'silent /<args>'

" yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

"gotags for golang
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }


" run current python file
command R !clear; python3 %
command B !clear; black %
