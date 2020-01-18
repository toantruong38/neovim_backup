set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=C:/Neovim/share/nvim/runtime

set conceallevel=1 "Javascript plug
set encoding=utf-8

set ts=4 sw=4 et 
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1



syntax enable
"set background=light
colorscheme delek


:set number
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-n> :tabnew<CR>
"nnoremap <C-w> :tabclose<CR>
nnoremap <C-p> :PluginInstall<CR>
nnoremap <C-l> :NERDTreeToggle C:\Users\Admin\Downloads\Documents\CodeGym<CR>
nmap <F8> :TagbarToggle<CR>




augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END


call vundle#begin('~/.vim/plugin')



Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'

Plugin 'git://git.wincent.com/command-t.git'

Plugin 'file:///~/.vim/plugin'

Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_section_b='%{strftime("%c")}'
let g:airline_section_y='BN: %{bufnr("%")}'
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1


Plugin 'jmcantrell/vim-virtualenv'

Plugin 'pangloss/vim-javascript'
let g:javascript_plugin_jsdoc = 1
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"



Plugin 'valloric/youcompleteme'


Plugin 'altercation/vim-colors-solarized'


Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1

Plugin 'scrooloose/syntastic'


Plugin 'scrooloose/nerdtree'
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


Plugin 'majutsushi/tagbar'



call vundle#end()
filetype plugin indent on
