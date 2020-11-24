set compatible              " be iMproved, required
filetype off                  " required
set nocompatible
set exrc
set mouse=a
filetype plugin on
syntax on
set termguicolors
set t_Co=256

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set clipboard=unnamedplus
set smarttab
set smartcase
set autoindent
set expandtab
set smartindent
set cindent
set laststatus=2
set undodir=~/.vim/undodir
set undofile
set showcmd
set number
set autowrite
set autoread
set incsearch
set relativenumber
set nowrap


call plug#begin('~/.vim/plugged')

" let Vundle manage Vundle, required

" React Native code snippets
Plug 'morgsmccauley/vim-react-native-snippets'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'HerringtonDarkholme/yats.vim'
Plug 'neoclide/coc.nvim'

Plug 'davidhalter/jedi-vim'
Plug 'godlygeek/tabular'
Plug 'posva/vim-vue'

Plug 'ctrlp/ctrlp.vim'
Plug 'jacoborus/tender.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
Plug 'morhetz/gruvbox'
Plug 'leafgarland/typescript.vim'
Plug 'mbbill/undotree'

" All of your Plugins must be added before the following line
call plug#end()            " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
let mapleader = " "

nmap <leader>h :wincmd h<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>k :wincmd k<CR>
nmap <leader>l :wincmd l<CR>
nmap <leader>n :NERDTreeToggle<CR>
nmap <C-a> ggVG

if (has("termguicolors"))
 set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Theme
syntax enable
colorscheme tender
let g:lightline = { 'colorscheme': 'tender' }
" coc Config
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


let g:ctrlp_map = '<leader>p'
let g:go_fmt_command = "goimports"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" if hidden is not set, TextEdit might fail.
set hidden


" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup


" Better display for messages
set cmdheight=2


" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c


" always show signcolumns
set signcolumn=yes


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

let g:VimTodoListsUndoneItem = '- [X]'
let g:VimTodoListsDoneItem = '- [V]'

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"



" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)


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


" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)



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

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

vnoremap <C-c> "+y
map <C-p> "+p
map <leader>c :<C-U>!g++ -O2 -DLOCAL -std=c++11 -Wall -Wextra -Wno-unused-result -static %:r.cpp -o %:r<CR>
map <leader>r :<C-U>!./%:r<CR>
