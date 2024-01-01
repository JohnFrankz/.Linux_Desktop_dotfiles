function! SetCustomIndent()
    if &filetype == 'asm'
        set noexpandtab
	" elseif &filetype == 'c' || &filetype == 'h'
	" 	set expandtab
	" 	set tabstop=4
	" 	set shiftwidth=4
	" 	set softtabstop=4
    else
        set expandtab
		set tabstop=4
        set shiftwidth=4
        set softtabstop=4
    endif
endfunction

function! ReplaceChineseChars()
    %s/，/, /ge
    %s/。/. /ge
    %s/（/(/ge
    %s/）/)/ge
    %s/；/; /ge
    %s/：/: /ge
    %s/“/"/ge
    %s/”/"/ge
    %s/‘/'/ge
    %s/’/'/ge
    %s/【/[/ge
    %s/】/]/ge
endfunction

