syntax on
set number
set ruler               " Show the line and column numbers of the cursor.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set modeline            " Enable modeline.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.
if !&scrolloff
set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set display+=lastline
set nostartofline       " Do not jump to first character with page commands.
set noerrorbells                " No beeps
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.
set noswapfile                  " Don't use swapfile
set nobackup            	" Don't create annoying backup files
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set showmatch                   " Do not show matching brackets by flickering
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set autoindent
set tabstop=4 shiftwidth=4 expandtab
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).
set encoding=UTF-8
set backspace=indent,eol,start
set complete-=i
set cursorline
set nocompatible
set clipboard=unnamedplus
"set completeopt=menu,menuone,popup,noselect,noinsert
set updatetime=1000
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Search and Replace
nmap <Leader>s :%s//g<Left><Left>

vnoremap <M-a> ggVG
nnoremap <M-v> "+gP
vnoremap <M-v> "+gP
" exit terminal mode
tnoremap <Esc> <C-\><C-n>
nnoremap <Tab> :call ChangeFocus()<CR>
map <S-q> :q<CR>
map <S-s> :w<CR

let g:python3_host_prog = '/usr/local/opt/python@3.9/bin/python3.9'
let g:loaded_python_provider = 0
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:session_default_to_last = 1

nmap <Space> <C-d>
nmap <S-Space> <C-u>
vmap <BS> x

set nospell

" Plugins here

call plug#begin('~/nvim/plugged')
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'hoob3rt/lualine.nvim'
Plug 'scrooloose/nerdtree' |
            \ Plug 'xuyuanp/nerdtree-git-plugin' | 
            \ Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'numirias/semshi'
Plug 'vimjas/vim-python-pep8-indent'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline-themes'
Plug 'enricobacis/vim-airline-clock'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'yuttie/comfortable-motion.vim'
Plug 'powerline/powerline'
Plug 'neoclide/coc.nvim'
Plug 'liuchengxu/vista.vim'
Plug 'frazrepo/vim-rainbow'
Plug 'lervan/vimtex', {'for': ['tex']}
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'arcticicestudio/nord-vim'
call plug#end()

" nerdtree config
map <C-n> :NERDTreeToggle<CR>
map <C-t> :Vista coc<CR>
" airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1


let g:airline_theme='nord'
let g:airline_powerline_fonts = 1
let g:powerline_symbols='unicode'
colorscheme nord


let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=1
set conceallevel=1
let g:tex_conceal='abdmg'

let g:NERDTreeDirArrowExpandable = nr2char(8200)  "sets expandable character to none - hides it
let g:NERDTreeDirArrowCollapsible = nr2char(8200) 


let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1
let g:NERDTreeSyntaxEnabledExtensions = ['go', 'js', 'css', 'py', 'sh']
let g:airline#extensions#clock#auto = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeGitStatusWithFlags = 1

let g:NERDTreeShowHidden=1
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'M',
                \ 'Staged'    :'A',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :' ',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" Other

set mouse=n
set list


let airline#extensions#coc#error_symbol = ' :'
let airline#extensions#coc#warning_symbol = ' :'
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
let g:airline#extensions#whitespace#enabled = 0
let b:interpreter = 'zsh'

function MakeTerm()
  split
  terminal
  set nonumber norelativenumber
  resize 15
  wincmd w
  call nvim_input("\<Esc>")
endfunction

function ChangeFocus()
  wincmd w
endfunction


" Select all text
vnoremap <M-a> ggVG
nnoremap <M-v> "+gP
vnoremap <M-v> "+gP
tnoremap <Esc> <C-\><C-n>
nnoremap <Tab> :call ChangeFocus()<CR>
map <S-q> :q<CR>
map <S-s> :w<CR>
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" autocmd VimEnter * :call MakeTerm()
nnoremap <silent> K :call <SID>show_documentation()<CR>
autocmd FocusLost * silent! wa

let g:coc_global_extensions =[
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-vimlsp',
    \ 'coc-snippets',
    \ 'coc-emmet',
    \ 'coc-pairs',
    \ 'coc-json',
    \ 'coc-highlight',
    \ 'coc-git',
    \ 'coc-emoji',
    \ 'coc-lists',
    \ 'coc-yaml',
    \ 'coc-tabnine',
    \ 'coc-gitignore',
    \ 'coc-db',
    \ 'coc-pyright',
    \]

let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]


