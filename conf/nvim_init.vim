" Plugins here
call plug#begin('~/.config/nvim/plugged')
" Themes
Plug 'haishanh/night-owl.vim'
Plug 'rakr/vim-one'
Plug 'sainnhe/edge'
" End themes

Plug 'folke/zen-mode.nvim'

Plug 'Yggdroot/indentLine'

Plug 'scr1pt0r/crease.vim'

Plug 'liuchengxu/vim-which-key'

Plug 'itchyny/lightline.vim'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

Plug 'kyazdani42/nvim-tree.lua'

Plug 'romainl/vim-cool' " Stop matching after search is done.

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'hashivim/vim-terraform'

Plug 'kosayoda/nvim-lightbulb'

Plug 'windwp/nvim-autopairs' " Pair parentheses

Plug 'codota/tabnine-vim'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'fannheyward/coc-rust-analyzer'
"Plug 'dense-analysis/ale'
call plug#end()


" Configuration
let $NVIM_TUI_ENABLE_TRUE_COLOR=1 
syntax on
colorscheme edge
set nu			" Enable line numbers
set relativenumber " Enable relative line numbers
let mapleader=";"                 
set ruler               " Show the line and column numbers of the cursor.
set textwidth=0         " Hard-wrap long lines as you type them.
set modeline            " Enable modeline.
set mouse=a                       
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.
nnoremap <silent> <C-j> <C-W>j<CR>
nnoremap <silent> <C-k> <C-W>k<CR>
nnoremap <silent> <C-h> <C-h>h<CR>
nnoremap <silent> <C-l> <C-l>l<CR>
if (has("termguicolors"))
    set termguicolors                                               
endif                               
if !&scrolloff
    set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set display+=lastline
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
set tabstop=8 shiftwidth=4 expandtab
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).

" Configure file tree
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
let g:nvim_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:nvim_tree_auto_resize = 0 "1 by default, will resize the tree to its saved width when opening a file
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_lsp_diagnostics = 1 "0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
let g:nvim_tree_update_cwd = 1 "0 by default, will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.

" Configure BarBar
" Move to previous/next
nnoremap <silent>    <C-[> :BufferPrevious<CR>
nnoremap <silent>    <C-]> :BufferNext<CR>
nnoremap <silent>    <C-c> :BufferClose<CR>
" Goto buffer in position...
nnoremap <silent>    <C-1> :BufferGoto 1<CR>
nnoremap <silent>    <C-2> :BufferGoto 2<CR>
nnoremap <silent>    <C-3> :BufferGoto 3<CR>
nnoremap <silent>    <C-4> :BufferGoto 4<CR>
nnoremap <silent>    <C-5> :BufferGoto 5<CR>
nnoremap <silent>    <C-6> :BufferGoto 6<CR>
nnoremap <silent>    <C-7> :BufferGoto 7<CR>
nnoremap <silent>    <C-8> :BufferGoto 8<CR>
nnoremap <silent>    <C-9> :BufferLast<CR>
" Magic buffer-picking mode
nnoremap <silent> <C-s>    :BufferPick<CR>

" Configure whichkey
nnoremap <silent> <leader> <M> :WhichKey '<Space>'<CR>

" Configure Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Configure CoC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Symbol renaming.
nmap <leader> rn <Plug>(coc-rename)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Configure ZenMode
nnoremap <silent> <C-r> :ZenMode<CR>

" Configure lightbulb
autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()

"Ale configuration
let g:ale_linters = {'rust': ['analyzer']}

" External configuration
lua << EOF
--require'lsp'
require'treesitter'

require("zen-mode").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}
EOF

