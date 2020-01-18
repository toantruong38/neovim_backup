if &compatible
set nocompatible
endif

set runtimepath+=~/.vim/bundle/dein.vim
set runtimepath+=C:/Neovim/share/nvim/runtime

set number
set showtabline=0
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc
set guifont=Lucida_Console:h9:cANSI
set guifontwide=Lucida_Console:h12
set ts=4 sw=4 et  "I dont know this
" if hidden is not set, TextEdit might fail.
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes


let g:ycm_auto_trigger=0 "Dont need ycm anymore,using coc instead



" Begin Color or theme config
    set t_Co=256   " This is may or may not needed.
    let g:PaperColor_Theme_Options = {
      \   'theme': {
      \     'default.dark': {
      \       'transparent_background': 1
      \     }
      \   }
      \ }
	let g:airline_theme='ayu_mirage'
    let g:airline#extensions#tabline#formatter='jsformatter'
    "let g:airline_left_sep='➤'
    "let g:airline_left_alt_sep='>'
    "let g:airline_right_sep='<'
    "let g:airline_right_alt_sep='<'
    let g:airline_powerline_fonts=1
    :source C:\Users\Admin\.vim\setcolors.vim
    let g:airline#extensions#tagbar#enabled = 1
" End Color or theme config

" Begin statusline config
    if has("gui_running")
        " Settings for MacVim and Inconsolata font
        let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }
    endif

    augroup ALEProgress
        autocmd!
        autocmd User ALELintPre hi Statusline ctermfg=darkgrey
        autocmd User ALELintPost hi Statusline ctermfg=NONE
    augroup END

    "let g:airline_section_b='%{strftime("%c")}'
	"let g:airline_section_y='BN: %{bufnr("%")}'
	let g:airline#extensions#tabline#enabled = 1

    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*


    " Add status line support, for integration with other plugin, checkout `:h coc-status`
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" End statusline config




" Begin code folding
    augroup javascript_folding
        au!
        au FileType javascript setlocal foldmethod=syntax
    augroup END

    " Use `:Fold` to fold current buffer
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" End code folding




" Begin indent config
    let g:indent_guides_start_level=2
	let g:indent_guides_enable_on_vim_startup = 0
" End indent config


		
" Begin directories control
    let g:NERDTreeDirArrowExpandable = '▸'
    let g:NERDTreeDirArrowCollapsible = '▾'

    let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
    let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
    let g:CtrlSpaceSaveWorkspaceOnExit = 1

     let g:ctrlp_map = '<c-p>'
     let g:ctrlp_cmd = 'CtrlP'
     let g:ctrlp_working_path_mode = 'ra'
     set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe
     let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
     let g:ctrlp_custom_ignore = {
                 \ 'dir':  '\v[\/]\.(git|hg|svn)$',
                 \ 'file': '\v\.(exe|so|dll)$',
                 \ 'link': 'some_bad_symbolic_links',
                 \ }
      let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d' 
" End directories control
	

" Begin syntax config
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_aggregate_errors = 1
    let g:syntastic_java_checkers=['javac']
    let g:syntastic_java_javac_exec='~/.vim/pack/bundle/start/repos/github.com/scrooloose/syntastic/syntax_checkersjava/javac'

" End syntax config
		


" Begin code completion config

" End code completion config


" Begin code format config
    augroup mygroup
        autocmd!
        " Setup formatexpr specified filetype(s).
        autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
        " Update signature help on jump placeholder
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Use `:Format` to format current buffer
    command! -nargs=0 Format :call CocAction('format')


" End code format config


" Begin code highlight config
    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')

" End   code highlight config

    "let g:ale_lint_on_text_changed
    "let g:ale_lint_on_insert_leave
    let g:ale_linters={'javascript':['eslint']}

    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    
    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction


    " use `:OR` for organize import of current buffer
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" End unknown config


" Begin keymapping
	"nnoremap : 
    nnoremap <C-Right> :tabnext<CR>
    nnoremap <C-Left> :tabprevious<CR>
    nnoremap <C-t> :tabnew<CR>
    "nnoremap <C-w> :tabclose<CR>
    "nnoremap <C-p> :call dein#install()<CR>
    nnoremap <C-n> :NERDTreeToggle C:\Users\Admin\Downloads\Documents\CodeGym<CR>
    nmap <F8> :TagbarToggle<CR>
    nnoremap <C-space> :CtrlSpace<CR>



    " Use tab for trigger completion with characters ahead and navigate.
    " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()
    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
    " Coc only does snippet and additional edit on confirm.
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    " Or use `complete_info` if your vim support it, like:
    " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

    " Remap for rename current word
    nmap <leader>rn <Plug>(coc-rename)

    " Remap for format selected region
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)


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


    " Use `[g` and `]g` to navigate diagnostics
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window
    nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list
    nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" End keymapping





if dein#load_state('~/.vim/pack/bundle/start')
	call dein#begin('~/.vim/pack/bundle/start')
	"call dein#add('file:///~/.vim/plugin')
    

    " Begin colors/themes plugin
        call dein#add('vim-airline/vim-airline')
        call dein#add('vim-airline/vim-airline-themes')
        call dein#add('altercation/vim-colors-solarized')

        call dein#add('NLKNguyen/papercolor-theme')
    " End   colors/themes plugin
    "
    "
    " Begin syntax plugin
        call dein#add('scrooloose/syntastic')
    " End   syntax plugin
    "
    "
    "
    " Begin code indent/folding plugin
        call dein#add('nathanaelkane/vim-indent-guides')

    " End   code indent/folding plugin
    "
    "
    " Begin directories control
        call dein#add('scrooloose/nerdtree')

        call dein#add('vim-ctrlspace/vim-ctrlspace')

        call dein#add('kien/ctrlp.vim')
    " End   directories control
    "
    "
    " Begin code completion plugin
        call dein#add('valloric/youcompleteme')
        call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})
        call dein#add('Shougo/deoplete.nvim') " :call deoplete#enable()

        call dein#add('tpope/vim-surround') " quoting, using below
    " End   code completion plugin

	" Begin git plugin
        call dein#add('tpope/vim-fugitive')
    " End   git plugin

	call dein#add('wincent/command-t')

	call dein#add('rstacruz/sparkup', {'rtp': 'vim/'})

	call dein#add('jmcantrell/vim-virtualenv')
	
	call dein#add('pangloss/vim-javascript')
	
	call dein#add('majutsushi/tagbar')
	
	call dein#add('w0rp/ale')
	
	call dein#add('raimondi/delimitmate')
	
	call dein#add('rodjek/vim-puppet')
	
	
	
	
	if !has('nvim')
		call dein#add('roxma/nvim-yarp')
		call dein#add('roxma/vim-hug-neovim-rpc')
	endif
	
	call dein#end()
	call dein#save_state()
	
endif

filetype plugin indent on
syntax enable


" colo:
" papercolor,airline_theme:ayu_mirage,batcat(dark),badwolf(light),base16_ashes, 

" These document below describe the using of those plugins above
"
" fugitive is a github plugin
" :Gedit
" :Gdiffsplit -> bring up the staged version
" :Gmerge,commit,rebase
" :Gpush,pull,fetch
"
"
" vim-surround 
" cs"' -> change \"hello\" to \'hello\'
" cst"
" ds"
" ysiw] [Hello] world
" cs]} for more space than cs]{
" wrap the entire line w/
" yssb yss)
" press V then insert command S<p class="important">
" to wrap selected line w/ 
" note: ds cs yss work w/ '.' command if install repeat.vim plug
"
" Ctrlp
" :CtrlP or :CtrlP[dir] invoke ctrl p
" :CtrlPBuffer or :CtrlPMRU invoke find buffer or MRU file mode
" :CtrlPMixed
" Once entered CtrlP :
" <F5> refresh
" <c-f> or <c-b> cycle between modes
" <c-d> switch to filename search only
" <c-r> switch to regexp mode
" <c-j> or <c-k> navigate in result list
" <c-t> or <c-v> or <c-x> open selected entry in new tab,split 
" <c-n>,<c-p>
" <c-y> new file
" <c-z> mark file(s) <c-o> to open
" .. go up directorie(s)
