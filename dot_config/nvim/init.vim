call plug#begin()
Plug 'neovim/nvim-lspconfig'
Plug 'vim-airline/vim-airline'
Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'ojroques/vim-oscyank'
"Plug 'neomake/neomake'
Plug 'vim-syntastic/syntastic', {'for': 'yaml'}

Plug 'sergii4/gomotion.vim'

"Plug 'hrsh7th/cmp-nvim-lsp'
"Plug 'hrsh7th/cmp-buffer'
"Plug 'hrsh7th/nvim-cmp'

" For ultisnips user.
"Plug 'quangnguyen30192/cmp-nvim-ultisnips'
" test
" Plug 'vim-test/vim-test'
Plug 'AndrewRadev/splitjoin.vim'
" Plug 'tpope/vim-fugitive'
call plug#end()

" lua require("nvim_cmp")
lua require("lsp_config")
lua require("treesitter_config")
"nnoremap <silent> ff    <cmd>lua vim.lsp.buf.formatting()<CR>
autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
autocmd BufWritePre *.go lua OrgImports(1000)

" https://stackoverflow.com/questions/6991638/how-to-auto-save-a-file-every-1-second-in-vim
autocmd TextChanged,TextChangedI <buffer> silent write
" let g:autosave_time = 1

set ttyfast                     " Indicate fast terminal conn for faster redraw
" color
set termguicolors
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_contrast_light = "hard"

" ChangeBackground changes the background mode based on macOS's `Appearance`
" setting. We also refresh the statusline colors to reflect the new mode.
function! ChangeBackground()
  if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
    set background=dark   " for dark version of theme
  else
    set background=light  " for light version of theme
  endif
  colorscheme gruvbox

  try
    execute "AirlineRefresh"
  catch
  endtry
endfunction

" initialize the colorscheme for the first run
call ChangeBackground()


let mapleader = ","

set number                      " Show line numbers
set ignorecase                  " Search case insensitive...
set noswapfile                  " Don't use swapfile                                                                           
set autoread                    " Automatically read changed files
set nobackup                    " Don't create annoying backup files             
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set autowrite                   " Automatically save before :next, :make etc.
set noshowmode                  " We show the mode with airline or lightline
" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif


" This enables us to undo files even if you exit Vim.
if has('persistent_undo')
  set undofile
  set undodir=~/.config/vim/tmp/undo//
endif

"map <leader>c "+y<CR>
vnoremap <leader>c :OSCYank<CR>

" let g:go_list_type = "quickfix"
" Jump to next error with Ctrl-n and previous error with Ctrl-m. Close the
" quickfix window with <leader>a
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" location list navigation
map <space>n :lnext<CR>
map <space>l :lprevious<CR>
nnoremap <space>a :lclose<CR>

" FZF:
"
map <C-p> :FZF<CR>
let g:fzf_preview_window = ['right:70%', 'ctrl-/']
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }


" FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_localrmdir='rm -r' " delete directories

nnoremap <leader>e :Explore<cr>

" FOLDING
set foldmethod=syntax
set foldnestmax=1  
set foldlevel=100

" Reload my vimrc file whenever I pressed ,sv
map <leader>sv :source $MYVIMRC<CR>
map <leader>rg :Rg<CR>

" Skeleton
autocmd BufNewFile *.go 0r ~/vim/skeletons/template.go

" quick edit init.vim
nnoremap <leader>vv :vsplit $MYVIMRC<cr>


"add these lines to your vimrc to configure syntastic & yamllint
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


let g:syntastic_always_populate_loc_list = 1            " automatically load errors into the location list
let g:syntastic_auto_loc_list = 1

let g:syntastic_check_on_open = 1                       " check for errors when a file is loaded

let g:syntastic_check_on_wq = 0
let g:syntastic_yaml_checkers = [ "yamllint" ]
let g:syntastic_quiet_messages = { "type": "style" }

" vim-test
"nmap <silent> <leader>t :TestNearest<CR>
"nmap <silent> <leader>T :TestFile<CR>
"nmap <silent> <leader>a :TestSuite<CR>
"nmap <silent> <leader>l :TestLast<CR>
"nmap <silent> <leader>g :TestVisit<CR>
"
"let test#strategy = 'neovim'
" let g:python3_host_prog = '/Users/sgetman/.pyenv'

" fzf test
" command! LS call fzf#decls#ls()
