let g:full_screen = 0

GuiPopupmenu 0
GuiLinespace 0
GuiTabline   0

" nnoremap <leader>fs  :call ToggleFullScreen()<CR>
nnoremap <leader>fs  :let g:full_screen=!g:full_screen <bar> call GuiWindowFullScreen(g:full_screen) <bar> echom "fullscreen toggled"<CR> 
nnoremap <C-->       :call AdjustFontSize(-1)<CR>
nnoremap <C-=>       :call AdjustFontSize(1)<CR>
nnoremap <C-0>       :call AdjustFontSize(1)<CR>

function! ToggleFullScreen()  "{{{
    if s:fullscreen == 0
        call GuiWindowFullScreen(1)
        let s:fullscreen = 1
    else
        call GuiWindowFullScreen(0)
        let s:fullscreen = 0
    endif
endfunction
let s:fullscreen = 0  "}}}

function! AdjustFontSize(amount) "{{{
    let s:fontsize = s:fontsize+a:amount
    let execstr = "GuiFont! Hack Nerd Font Mono:h" . s:fontsize
    :execute execstr
endfunction
let s:fontsize = 11 "}}}

"{{{ Host specific
let hostname = substitute(system('hostname'), '\n', '', '')

if hostname == "ASUS_DESKTOP"
    " Guifont! Hack Nerd Font Mono:h8
    " colorscheme edar
    hi ActiveWindow            guibg=black    ctermbg=white
    hi InactiveWindow          guibg=gray205  ctermbg=grey
    let s:fontsize = 12
    call AdjustFontSize(0)
    call ToggleFullScreen()
endif

if hostname == "CAR-LT-C50626B"  " Work Setup. configured to be in light mode, then inverted.
    let s:fontsize = 10
    call AdjustFontSize(0)
    " hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white   guibg=clear guifg=clear
    " hi CursorLine              ctermbg=grey    guibg=lightgray guibg=clear
    " echo "HOSTNAME C50626"
endif

if hostname == "VivoBook"
    " Guifont! Hack Nerd Font Mono:h8
    " colorscheme edar
    hi ActiveWindow            guibg=black    ctermbg=white
    hi InactiveWindow          guibg=gray205  ctermbg=grey
    let s:fontsize = 10
    call AdjustFontSize(0)
    call ToggleFullScreen()
endif

if hostname == "xps13"
    " Guifont! Hack Nerd Font Mono:h8
    " colorscheme edar
    " hi ActiveWindow            guibg=black    ctermbg=white
    " hi InactiveWindow          guibg=gray200  ctermbg=grey
    let s:fontsize = 10
    call AdjustFontSize(0)
    call ToggleFullScreen()
endif
 "}}}
