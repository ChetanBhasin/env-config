" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

    " General {{{

        set autoread " detect when file is changed	
        set encoding=utf8 " Set utf8 as standard encoding and en_US as standard language

        set history=1000
        set textwidth=120

        set backspace=indent,eol,start " make backspace behave in a sane manner
        set whichwrap+=<,>,h,l
        set clipboard+=unnamedplus

        set scrolloff=15 " keep the cursor centered vertically

        if has('mouse')
            set mouse=a
        endif

        " Searching
        set ignorecase " case insensitive searching
        set smartcase " case-sensitive if expresson contains a capital letter
        set hlsearch " highlight search results
        set incsearch " set incremental search, like modern browsers

        set magic " Set magic on, for regex

        " Replace
        set inccommand=nosplit " Live editing preview of the substitute command

        " error bells
        set noerrorbells
        set visualbell
        set t_vb=
        set tm=500

        " scroll the viewport faster
        nnoremap <C-e> 3<C-e>
        nnoremap <C-y> 3<C-y>

        " split in the correct direction
        set splitright
        set splitbelow

        " Disable backups, we have git
        set nobackup
        set nowritebackup
        set noswapfile
        set noundofile

        " Update faster
        set updatetime=300
   
        " don't give |ins-completion-menu| messages.
        set shortmess+=c
   
        " Always show signcolumns
        set signcolumn=yes

    " }}} General

    " Appearance {{{

        set number " show line numbers
        set relativenumber " Show relative line numbers
        set wrap " turn on line wrapping
        set wrapmargin=8 " wrap lines when coming within n characters from side
        set linebreak " set soft wrapping
        set showbreak=… " show ellipsis at breaking
        set autoindent " automatically set indent of new line
        set ttyfast " faster redrawing
        set diffopt+=vertical
        set laststatus=2 " show the satus line all the time
        set wildmenu " enhanced command line completion
        set so=7 " Set 7 lines to the cursor - when moving vertically using j/k
        set wildignore=*.o,*~,*.pyc " Ignore compiled files
        set ruler " Always show current position
        set hidden " current buffer can be put into background
        set showcmd " show incomplete commands
        set noshowmode " don't show which mode disabled for PowerLine
        set wildmode=list:longest " complete files like a shell
        set shell=$SHELL
        set cmdheight=1 " command bar height
        set hid " A buffer becomes hidden when abandoned
        set title " set terminal title
        set showmatch " show matching braces
        set lazyredraw " Don't redraw while executing macros (good performance config)
        set mat=2 " How many tenths of a second to blink when matching brackets

        let g:airline_theme='nord'
        let g:nord_italic = 1
        let g:nord_underline = 1
        let g:nord_italic_comments = 1
        let g:nord_uniform_status_lines = 1
        let g:nord_uniform_diff_background = 1
        let g:nord_cursor_line_number_background = 1


        " switch cursor to line when in insert mode, and block when not
        set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
        \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
        \,sm:block-blinkwait175-blinkoff150-blinkon175

        " Set extra options when running in GUI mode
        if has("gui_running")
            set guioptions-=T
            set guioptions+=e
            set t_Co=256
            set guitablabel=%M\ %t
        endif

        " If terminal colours enabled, use them
        if (has("termguicolors"))
         set termguicolors
        endif

    " }}} Appearance

    " Tabs and Spaces {{{

        set shiftwidth=2 " indent using >
        set tabstop=2 " number of visual spaces per tab
        set softtabstop=2 " edit as if the tabs are 4 characters wide
        set expandtab
        set smarttab
        set autoindent
        set copyindent
        set shiftround

        " code folding settings
        set foldmethod=syntax " fold based on indent
        syntax enable " Enable syntax highlighting
        syntax on " Enable syntax using the theme
        set foldlevelstart=99
        set foldnestmax=10 " deepest fold is 10 levels
        set nofoldenable " don't fold by default
        set foldlevel=1

        " toggle invisible characters
        set list
        set listchars=tab:→\ ,trail:⋅,extends:❯,precedes:❮
        set showbreak=↪

        " highlight conflicts
        match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

    " }}} Tabs and spaces
    "

    " Load plugins
    " VIM enhancements
    Plug 'ciaranm/securemodelines'
    Plug 'vim-scripts/localvimrc'
    Plug 'justinmk/vim-sneak'

    " Language client CoC
    Plug 'neoclide/coc.nvim', {'branch': 'release'} "Language server support
    Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'} " CoC TypeScript support
    "Plug 'fannheyward/coc-rust-analyzer' " CoC Rust support
    Plug 'puremourning/vimspector' " Debugging in vim

    " GUI enhancements
    Plug 'itchyny/lightline.vim'
    Plug 'machakann/vim-highlightedyank'
    Plug 'andymass/vim-matchup'
    Plug 'mhartington/oceanic-next'
    Plug 'scrooloose/nerdtree'
    Plug 'airblade/vim-rooter'
    Plug 'junegunn/fzf.vim'

    " Themes
    Plug 'arcticicestudio/nord-vim'
    Plug 'rakr/vim-one'
    Plug 'joshdick/onedark.vim'

    Plug 'nelstrom/vim-visual-star-search' " Use * to search for word under cursor
    Plug 'romainl/vim-cool' " Stop matching after search is done.
    Plug 'jiangmiao/auto-pairs' " Insert or delete brackets, parens, quotes in pair.
    Plug 'w0rp/ale' " Linters
    Plug 'janko-m/vim-test' " Run test under cursor
    Plug 'cloudhead/neovim-fuzzy' " Fuzzy finder / ctrl-p
    Plug 'tpope/vim-surround' " Surround selection with string
    Plug 'tpope/vim-repeat' " Repeat select commands (vim-surround) with .
    Plug 'tpope/vim-obsession' " Session management, to work with tmux resurrect
    Plug 'vim-airline/vim-airline' " Bottom status line
    Plug 'aonemd/kuroi.vim' " Color Scheme
    Plug 'tmux-plugins/vim-tmux'
	  Plug 'christoomey/vim-tmux-navigator' " Unify keyboard navigation between vim and tmux
    Plug 'justinmk/vim-sneak' " Navigate with s{char}{char} and ;/,
    Plug 'tomtom/tcomment_vim' " Commant with gc
    Plug 'tpope/vim-fugitive' " Git

    "Languages
    Plug 'reasonml-editor/vim-reason-plus'
    Plug 'HerringtonDarkholme/yats.vim'
    Plug 'vmchale/dhall-vim'
    
    " Lightline
    " let g:lightline = { 'colorscheme': 'wombat' }
    let g:lightline = {
          \ 'component_function': {
          \   'filename': 'LightlineFilename',
          \ },
    \ }
    function! LightlineFilename()
      return expand('%:t') !=# '' ? @% : '[No Name]'
    endfunction


" Initialize plugin system
call plug#end()

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Expand to the current directory
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %% <cr>
map <leader>es :sp %% <cr>
map <leader>ev :vsp %% <cr>

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" Enable formatting with LanguageClient using gq
set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()

" Enable filetype plugins
filetype plugin on
filetype indent on


" NERDCommenter
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" fuzzy finder with ctrl-p
nnoremap <C-p> :FuzzyOpen<CR>

" Use Powerline font for airline
let g:airline_powerline_fonts = 1

" Ale
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_cpp_ccls_init_options = {
\   'cache': {
\       'directory': '/tmp/ccls/cache'
\   }
\ }

" Map ctrl+move to move between split panels
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Save with \w
nnoremap <leader>w :w<cr>

" Colorscheme
set termguicolors
set background=dark
colorscheme one
highlight EndOfBuffer cterm=NONE gui=NONE

" enable vim-repeat
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
