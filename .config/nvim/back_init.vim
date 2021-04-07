set nocompatible
filetype on
filetype plugin on
filetype plugin indent on
syntax on

call plug#begin('~/.local/share/nvim/site/autoload/')

Plug 'reedes/vim-pencil'
Plug 'preservim/nerdtree'
Plug 'vim-latex/vim-latex'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'lingnand/pandoc-preview.vim'
Plug 'ferrine/md-img-paste.vim'
Plug 'jakykong/vim-zim'
Plug 'dbeniamine/todo.txt-vim'
Plug 'vim-voom/voom'
Plug 'mbbill/undotree'
Plug 'raimondi/delimitmate'
Plug 'rhysd/vim-clang-format', {'for' : ['c', 'cpp']}
Plug 'https://github.com/kana/vim-operator-user'
Plug 'bfrg/vim-cpp-modern'
Plug 'iamcco/Markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'lervag/vimtex'
Plug 'miyakogi/seiya.vim'
Plug 'lilydjwg/colorizer'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ycm-core/youcompleteme'
Plug 'tpope/vim-surround'
Plug 'kevinhwang91/rnvimr'

call plug#end()

let g:mapleader=" "

" General Options
set laststatus=1
set number 
set relativenumber 
set nu
set ignorecase
set smartcase
set noswapfile
set incsearch

set mouse=a

set t_Co=256
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark
let g:deus_termcolors=256

" Plugin Options 

"seiya
let g:seiya_auto_enable=1
let g:seiya_target_groups = has('nvim') ? ['guibg'] : ['ctermbg']

" markdown
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_browser = 'qutebrowser'
let g:mkdp_markdown_css = '~/node_modules/github-markdown-css'


"clangd
let g:clang_format#auto_format=1
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11",
            \ "BreakBeforeBraces" : "Stroustrup"}

"vim-cpp-modern
let g:cpp_attributes_highlight = 1
let g:cpp_member_highlight = 1
"let g:cpp_simple_highlight = 1

" YouCompleteMe & ultisnips & snippets
let g:ycm_filetype_blacklist = {}

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]
"autocmd! User UltiSnipsEnterFirstSnippet

" Undo
set undodir=~/.vim/undodir
set undofile

" nerdtree
nnoremap <F4> :NERDTreeToggle<CR>
let g:NERDTreeChDirMode=2
set completeopt=menuone,noinsert

" Colorizer
let g:colorizer_auto_color = 1
let g:colorizer_auto_filetype='css,html,conf,vim'

" LaTeX
set shellslash
let g:tex_flavor ='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_compiler_progname='nvr'

set laststatus=1
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=1
        set showcmd
    endif
endfunction

set rulerformat=%25(%)
set rulerformat+=%=
"set rulerformat+=%{&modified?'*':''}
set rulerformat+=\ %v:%l\ ~\ %p%%
set rulerformat+=\ \|\ %Y%*

" Keybindings
noremap <leader>h :wincmd h<CR>
noremap <leader>j :wincmd j<CR>
noremap <leader>k :wincmd k<CR>
noremap <leader>l :wincmd l<CR>
noremap <leader>f :RnvimrToggle<CR>
    " FOLDING
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

" Set colorscheme at end to prevent pandoc from overriding
set termguicolors
colorscheme sayo
