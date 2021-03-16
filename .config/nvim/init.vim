set nocompatible
filetype on
filetype plugin on
filetype plugin indent on
syntax on

call plug#begin('~/.local/share/nvim/site/autoload/')

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'reedes/vim-pencil'
Plug 'preservim/nerdtree'
Plug 'vim-latex/vim-latex'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'ferrine/md-img-paste.vim'
Plug 'jakykong/vim-zim'
Plug 'dbeniamine/todo.txt-vim'
Plug 'vim-voom/voom'
Plug 'mbbill/undotree'
"Plug 'raimondi/delimitmate'
Plug 'rhysd/vim-clang-format', {'for' : ['c', 'cpp']}
Plug 'bfrg/vim-cpp-modern'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'lervag/vimtex'
Plug 'miyakogi/seiya.vim'
Plug 'lilydjwg/colorizer'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ycm-core/youcompleteme'
"Plug 'ervandew/supertab'

call plug#end()

let g:mapleader=" "

" General Options
set laststatus=1
set number 
set relativenumber 
set noerrorbells 
set nu
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

" goyo.vim & limeligh.vim
noremap <leader>g :Goyo<CR>:Limelight!!<CR>
autocmd! User GoyoEnter Limelight 
autocmd! User Goyo Leave Limelight! 
let g:limelight_conceal_ctermfg=240 
"let g:templates_directory = '~/.config/nvim/templates'

"seiya
let g:seiya_auto_enable=1
let g:seiya_target_groups = has('nvim') ? ['guibg'] : ['ctermbg']

" markdown
let g:mkdp_auto_start = 0

"clangd
let g:clang_format#auto_format=1

"vim-cpp-modern
let g:cpp_attributes_highlight = 1
let g:cpp_member_highlight = 1
let g:cpp_simple_highlight = 1

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

" Pandoc-markdown
let g:pandoc#filetypes#pandoc_markdown = 0
let g:pandoc#folding#fold_yaml = 1
let g:pandoc#syntax#conceal#blacklist = ["dashes", "atx"]

" Pandoc Preview plugin
"let g:pandoc_preview_pdf_cmd="zathura"
"nnoremap <leader>v :PandocPreview<cr>
let g:md_pdf_viewer="zathura"
let g:vimtex_view_method = "zathura"

" STATUSLINE

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
noremap <leader>f :FZF<CR>
nnoremap <C-a> :call ToggleHiddenAll()<CR>
    " FOLDING
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

" Set colorscheme at end to prevent pandoc from overriding
set termguicolors
colorscheme sayo
