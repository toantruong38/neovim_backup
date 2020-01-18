if v:version < 700 || exists('loaded_switchcolor') || &cp
	finish
endif

let loaded_switchcolor = 1

let paths = split(globpath(&runtimepath, 'airline_themes/*.vim'), "\n")
let s:swcolors = map(paths, 'fnamemodify(v:val, ":t:r")')
let s:swskip = [ '256-jungle', '3dglasses', 'calmar256-light', 'coots-beauty-256', 'grb256' ]
let s:swback = 0    " background variants light/dark was not yet switched
let s:swindex = 0

function! SwitchColor(swinc)

	" if have switched background: dark/light
	if (s:swback == 1)
		let s:swback = 0
		let s:swindex += a:swinc
		let i = s:swindex % len(s:swcolors)

		" in skip list
		if (index(s:swskip, s:swcolors[i]) == -1)
			execute "AirlineTheme " . s:swcolors[i]
		else
			return SwitchColor(a:swinc)
		endif

	else
		let s:swback = 1
		if (&background == "light")
			execute "set background=dark"
		else
			execute "set background=dark"
		endif

		" roll back if background is not supported
		if (!exists('g:colors_name'))
			return SwitchColor(a:swinc)
		endif
	endif

	" show current name on screen. :h :echo-redraw
	redraw
	execute "AirlineTheme"
endfunction

 map <F7>        :call SwitchColor(1)<CR>
imap <F7>   <Esc>:call SwitchColor(1)<CR>

 map <S-F7>      :call SwitchColor(-1)<CR>
imap <S-F7> <Esc>:call SwitchColor(-1)<CR>