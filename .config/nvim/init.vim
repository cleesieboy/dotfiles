" allow working with different buffers without saving changes hide abandoned buffers
set hidden

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=400

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved.
set signcolumn=yes:2

" enable backup files
set backup

" locations for storing backup files
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" do not keep backups for files in the following folders.
set backupskip=/tmp/*,/private/tmp/*

" display a visible line for columns
set cursorcolumn

" display a visible line for rows
set cursorline

set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set encoding=utf8

" ignore case in command line
set wildignorecase

" expand tabs to spaces
set expandtab           

" enable folding, using ident level
set foldenable          

" open most folds by default
set foldlevelstart=10   

" fold based on syntax
set foldmethod=syntax

" 10 nested fold max
set foldnestmax=10      

" highlight search matches (default in nvim)
set hlsearch

" ignore case when searching, unless explicitly used
set ignorecase
set smartcase

" redraw only when we need to.
set lazyredraw          

" never wrap long lines
set nowrap

" show line numbers
set number

" number of lines to display around cursor when scrolling
set scrolloff=6

" indent depth
set shiftwidth=2

" highlight matching [{()}]
set showmatch           

" set tab width
set softtabstop=4
set tabstop=4

" enable undo
set undodir=~/.vim-tmp
set undofile

" let's use a decent shell
set shell=zsh

" allow backspacing over intends, eol and before insert point
set backspace=indent,eol,start

" disable vi compatibility (allows neovim improvements)
set nocompatible

" enable neovim's built-in syntax highlighting
syntax on "<-- disabled for trying out treesitter

" Access colors present in 256 colorspace
let base16colorspace=256  

" plugins 
call plug#begin('~/.config/nvim/plugged')

" Visual marks, basically useless in neovim since marks cannot be deleted
" properly thanks to how shada works. Still useful enough to stay in.
" ---> UPDATE: forcing shada to be written on neovim exit via autocmd remedies
"  this.
Plug 'kshenoy/vim-signature'

" Generic Programming Support, lazy loads needed plugins.
Plug 'sheerun/vim-polyglot'

" Auto close html tags
Plug 'alvan/vim-closetag'

" Conquer of completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" floating terminal window
Plug 'voldikss/vim-floaterm'

" Display verical lines for indention
Plug 'yggdroot/indentLine'

" Surround actions, must have
Plug 'tpope/vim-surround'

" git support
Plug 'tpope/vim-fugitive'

" visually highlight yanked area
Plug 'machakann/vim-highlightedyank'

"Theme/Interface
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" some extra (awesome!) colorschemes.
Plug 'rafi/awesome-vim-colorschemes'

" ayu theme
Plug 'ayu-theme/ayu-vim'

" Startify start screen
Plug 'mhinz/vim-startify'

" filesystem browser, note!! needs python 3.8.2+ !!!
"Plug 'ms-jpq/chadtree', {'branch': 'legacy', 'do': 'python3 -m chadtree deps'}
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

" Helpful comment-commands/mappings
Plug 'scrooloose/nerdcommenter' 

" fzf fuzzy searching
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release/rpc' }

" Rainbow matching pairs ([{}])
Plug 'luochen1990/rainbow'

" old as hell, needed for fzf-preview
Plug 'LeafCage/yankround.vim'

" Quick access to a bunch of useful mappings. https://github.com/tpope/vim-unimpaired
Plug 'tpope/vim-unimpaired'

" Python syntax highlighting and more.
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

"Plug 'vim-ctrlspace/vim-ctrlspace'

" Tender colorscheme
Plug 'jacoborus/tender.vim'

" Palenight theme
Plug 'drewtempelmeyer/palenight.vim'

" Add icons
Plug 'kyazdani42/nvim-web-devicons'

" Tagbar
Plug 'preservim/tagbar'

call plug#end()

" enable true-colors
if (has("termguicolors"))
  set termguicolors
endif

" CtrlSpace
"let g:CtrlSpaceDefaultMappingKey = "<C-space> "
"let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }

let g:spacegray_underline_search = 1
let g:spacegray_italicize_comments = 1

" IndentLine
let g:indentLine_char ='▏'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0

" Vim-Airline Configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:airline_theme='tender'
let g:two_firewatch_italics=1

let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1

" Github Issues Configuration
let g:github_access_token = "e6fb845bd306a3ca7f086cef82732d1d5d9ac8e0"

"autocmd StdinReadPre * let s:std_in=1

" Save position in file on quit
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Set colorscheme
set background=dark
let ayucolor="mirage"
colorscheme ayu

" Force shada to be written on exit, otherwise deleted marks etc will be
" persistent. Fuggly!
autocmd VimLeave * wshada!

"""""""""""""""""""""""""""""""""""""
" Keyboard mappings
"""""""""""""""""""""""""""""""""""""
" Set leader key to space
let mapleader = "\<Space>"

" Map jj as Esc for convinience
inoremap jj <Esc>

"nnoremap <leader><leader> <c-^>

"  -- custom keyboard mappings
"    --- ctrl-s
" Next buffer in list
nmap <C-s>j :bn<CR> 

" Previous buffer in list
nmap <C-s>k :bp<CR>

" Close current buffer 
nmap <C-s>d :bd<CR>

" fzf-preview
"nnoremap <C-s>f :CocCommand fzf-preview.DirectoryFiles<CR>
nnoremap <C-s>b :CocCommand fzf-preview.Buffers<CR>
nnoremap <C-s>B :CocCommand fzf-preview.AllBuffers<CR>
nnoremap <C-s>t :CocCommand fzf-preview.BufferTags<CR>
nnoremap <C-s>m :CocCommand fzf-preview.Marks<CR>
nnoremap <C-s>y :CocCommand fzf-preview.Yankround<CR>
nnoremap <C-s>h :CocCommand fzf-preview.CommandPalette<CR>
nnoremap <C-s>l :CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
nnoremap <C-s>g :CocCommand fzf-preview.ProjectGrep<Space>
nnoremap <C-s>/ :CocCommand fzf-preview.Lines<CR>
nnoremap <C-s>* :CocCommand fzf-preview.Lines  --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap <C-s>q :CocCommand fzf-preview.QuickFix<CR>

" CHADTree config
nnoremap <C-s>f :CHADopen<CR>

" floaterm config
let g:floaterm_autoclose = 1

" since byobu uses F2-F9 and F12, we're limited to using F10/F11
let g:floaterm_keymap_new    = '<F10>'
let g:floaterm_keymap_toggle = '<F11>'

let g:fzf_preview_command = 'bat --color=always --plain {-1}' " Installed bat
let g:fzf_preview_lines_command = 'bat --color=always --plain --number' " Installed bat

" Use vim-devicons
let g:fzf_preview_use_dev_icons = 1
let g:fzf_preview_dev_icon_prefix_string_length = 3

nnoremap <C-s>e :CocCommand explorer<CR>

" tagbar
nmap <C-s>pb :TagbarOpenAutoClose<CR>

"let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Quickly move current line up/down
nnoremap <C-k> : <c-u>execute 'move -2'<cr>
nnoremap <C-j> : <c-u>execute 'move +1'<cr>

" Testing visual mode move:
xnoremap <C-k> dkP`[V`] 
xnoremap <C-j> dp`[V`]

" insert empty lines above/below cursor in normal mode 
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Autocompletion
nnoremap gV `[v`]

" the coc-config below is a frickin mess.
" Use <tab> to trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Use <c-space> to trigger completion.
"if has('nvim')
"  inoremap <silent><expr> <c-space> coc#refresh()
"else
"  inoremap <silent><expr> <c-@> coc#refresh()
"endif

" temporary remove to try using §§ mapped to ~
inoremap <silent><expr> §§ coc#refresh()

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" CtrlSpace should use 'ag' (silver surfer)
if executable("ag")                                                                                                                       
  let g:ctrlspaceglobcommand = 'ag -l --nocolor -g ""'                                                                                  
endif

" Disable preview in airline for ctrlspace
let g:airline_exclude_preview = 1

" change colors for highlighting matching pairs ({}) etc.
hi MatchParen ctermbg=yellow guibg=lightgreen

" Enable rainbow pairs for all filetypes, toggle manually with :RainboToggle
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" LeaderF
let g:Lf_PreviewInPopup = 1

" NerdCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Keep text selected after indentation in visual mode
vnoremap < <gv
vnoremap > >gv

" ----> CoC
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)

"nmap <C-c>c <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

"Remap <C-f> and <C-b> for scrolling float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.3 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>" 

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

let airline#extensions#coc#error_symbol = 'Err:'
let airline#extensions#coc#warning_symbol = 'Warn:'
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

" Mappings for CoCList
" Show all diagnostics.
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
"nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
" .....  removed!!   nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc ist.
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>l
" <---- CoC

" CoC extensions to use, keep them here for easy bootstrapping, these
" extensions will automatically install if they don't already exist.
let g:coc_global_extensions = [
      \'coc-yank',
      \'coc-tag',
      \'coc-syntax',
      \'coc-snippets',
      \'coc-prettier',
      \'coc-pairs',
      \'coc-marketplace', 
      \'coc-html', 
      \'coc-highlight',
      \'coc-fzf-preview',
      \'coc-floatinput',
      \'coc-explorer',
      \'coc-eslint',
      \'coc-actions',
      \'coc-yaml',
      \'coc-xml',
      \'coc-sql',
      \'coc-sh',
      \'coc-pyright',
      \'coc-json',
      \'coc-css'
      \]
