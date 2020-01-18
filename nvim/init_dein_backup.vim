if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=C:/Neovim/share/nvim/site/pack/dein.vim
set runtimepath+=C:/Neovim/share/nvim/site/pack

if dein#load_state('C:/Neovim/share/nvim/site/pack/dein.vim')
  call dein#begin('C:/Neovim/share/nvim/site/pack/dein.vim')

  call dein#add('C:/Neovim/share/nvim/site/pack/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#add('valloric/youcompleteme')
  call dein#add('scrooloose/nerdtree')
  call dein#add('OmniSharp/omnisharp-vim')
  call dein#add('Shougo/vimproc.vim')
  call dein#add('SirVer/ultisnips')
  call dein#add('honza/vim-snippets')
  call dein#add('prabirshrestha/asyncomplete.vim')
  call dein#add('prabirshrestha/async.vim')
  call dein#add('prabirshrestha/vim-lsp')
  call dein#add('prabirshrestha/asyncomplete-lsp.vim')
  call dein#add('scrooloose/syntastic')
  call dein#add('ervandew/supertab')
  call dein#add('tomasr/molokai')
  call dein#add('bling/vim-bufferline')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('majutsushi/tagbar')
  call dein#add('w0rp/ale')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:OmniSharp_server_stdio = 1

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:molokai_original = 1
let g:rehash256 = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
nmap <F8> :TagbarToggle<CR>
colo molokai
set tags=C:/Neovim/share/nvim/site/pack/ctags58/
let g:syntastic_cs_checkers = ['code_checker']
set number

call deoplete#custom#option('sources', {
\ '_': ['ale', 'foobar'],
\})
set omnifunc=ale#completion#OmniFunc
let g:airline#extensions#ale#enabled = 1
nmap ,x :!tidy -q -i --show-errors 0<CR>

