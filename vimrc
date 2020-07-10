"~/fdf/vimrc - BEGIN
" NOTE: Vim fold commands: zr - unfold / zm - fold

" let/set {{{
let mapleader=","
let g:python3_host_prog = 'C:\Python38\python.EXE'
let g:loaded_python_provider=0
let g:EasyMotion_smartcase = 1
let g:tagbar_ctags_bin = 'c:\Users\C50626\\bin\ctags.exe'

" let g:UltiSnipsExpandTrigger='<Nop>'
" let g:UltiSnipsJumpForwardTrigger = '<TAB>'
" let g:UltiSnipsJumpBackwardTrigger = '<S-TAB>'
let g:coc_snippet_next = '<M-Right>'
let g:coc_snippet_prev = '<M-Left>'

let g:center_screen = 1   " <Space>C to goggle
let g:smooth_scroll = 0   " <Space>S to toggle
let g:zen_mode      = 0   " <Space>Z to toggle
let g:jk_mode       = "line"   " <Space>PL to toggle jk screen/page at a time
let g:superJK_mode   = "line"   " <line/paragraph/paragraph2/page
let g:superJK_offset = "25%"    " top is default is 25
let g:superJK_scroll = "1"      " top is default is 25
let g:screen_offset = 1.0/4.0 " 25%
" let g:screen_offset = 0

set autochdir  " auto change directory to current file
set cindent
set cursorline
set foldmethod=marker   " zm/zr - fold/unfold
set foldmarker={{{,}}}
set clipboard+=unnamedplus " need for copying and pasting from windows clipboard
set expandtab      " On pressing tab, insert 4 spaces
set inccommand=split
set incsearch
set hlsearch
set number
set pyx=3
set viminfo='30  " limit old files to 20
" set shadafile='30  " limit old files to 20
" set scrolloff=999
set scrolloff=0
set shiftwidth=4   " when indenting with '>', use 4 spaces width
set softtabstop=4  " Sets the number of columns for a TAB.
set splitbelow     " ss splits to bottom :split
set splitright     " sS splits to right :vsplit
set tabstop=4      " show existing tab with 4 spaces width
set tags=./tags;/
set titlestring=Dir:\ \ %{strpart(expand(\"%:p:h\"),stridx(expand(\"%:p:h\"),\"/\",strlen(expand(\"%:p:h\"))-12))}%=%n.\ \ %{expand(\"%:t:r\")}\ %m\ %Y\ \ \ \ %l\ of\ %L\ - 
set encoding=UTF-8
" Search configuration
set ignorecase                    " ignore case when searching
set smartcase                     " turn on smartcase
" set backupdir=.backup/,~/.backup/,/tmp//
" set directory=.swp/,~/.swp/,/tmp//
" set undodir=.undo/,~/.undo/,/tmp//
"}}}

" nnoremap <leader> section {{{
nnoremap <leader>1 	 :!
nnoremap <leader><leader> 	 :!
nnoremap <leader>3 	 :buffer! #<cr>
nnoremap <leader>5 	 :source %<cr>
nnoremap <leader>S   :SmoothScrollingToggle<cr>
nnoremap <leader>bb   :buffers!<cr>:buffer!<Space>
nnoremap <leader>bd   :bdelete!<cr>
nnoremap <leader>bn   :bnext!<cr>
nnoremap <leader>bl   :bnext!<cr>
nnoremap <leader>bp   :bprev!<cr>
nnoremap <leader>bh   :bprev!<cr>
nnoremap <leader>dw   diw
nnoremap <leader>ec  :edit!   c:/<cr>
nnoremap <leader>eb  :edit!   ~/fdf/ExecutorBuffer.java<cr>
nnoremap <leader>ee  :edit!   ~/fdf/eQWERTY.ahk<cr>
nnoremap <leader>eg  :edit!   ~/fdf/nvim/ginit.vim<cr>
nnoremap <leader>ei  :edit!   ~/fdf/.gitignore<cr>
nnoremap <leader>el  :edit!   c:/sandbox/MTR/Libraries<cr>
nnoremap <leader>ep  :edit!   ~/fdf/profile.ps1<cr>
nnoremap <leader>es  :edit!   ~/src/<cr>
nnoremap <leader>et  :edit!   ~/fdf/tap.ahk<cr>
nnoremap <leader>ev  :edit!   ~/fdf/vimrc<cr>
nnoremap <leader>v   :edit!   ~/fdf/vimrc<cr>
nnoremap <leader>ex  :exe getline(line('.'))<cr>
nnoremap <leader>os  :silent ! cmd /c start  ..\AppData\Local\nvim-data\swap<cr>
nnoremap <leader>of  :silent ! start %<cr>
nnoremap <leader>ft  :set ft=

nnoremap <leader>h   :noh<cr>
nnoremap <leader>j   :jumps<cr>
nnoremap <leader>k   :48vs ergolaptop<cr>:set nonumber<cr><c-w>h
nnoremap <leader>l   :source ~/df/nvim/session.vim<cr>
nnoremap <leader>m   :marks<cr>
nnoremap <leader>pi  :PlugInstall<cr>
nnoremap <leader>q   :quit!<cr>
nnoremap <leader>ef  :edit ~/fdf/fayevimrc<cr>
nnoremap <leader>sf  :source ~/fdf/fayevimrc<cr>
nnoremap <leader>st  vip:sort<cr>
nnoremap <leader>sv  :source ~/fdf/vimrc<cr>
nnoremap <leader>sg  :source ~/fdf/nvim/ginit.vim<cr>
nnoremap <leader>ss  :w<cr>:source ~/fdf/vimrc<cr>:source ~/fdf/nvim/ginit.vim<cr>
nnoremap <leader>t   :vsplit<cr>:set nonumber<cr>:terminal bash<cr>i
nnoremap <leader>w   :w<cr>
nnoremap <leader>z   :color zellner<cr>
nnoremap <leader>(	 f)ci(
nnoremap <leader>[	 f]ci[
nnoremap <leader>{	 f}ci{
nnoremap <leader>"	 ci"
nnoremap <leader>'	 ci'
nnoremap <leader>dp  :normal ggVG"+P<cr>
nnoremap <leader>p   :normal "+P<cr>
nnoremap <A-v>       :normal "+P<cr>
" nnoremap <leader>zz  :let &scrolloff=999-&scrolloff<cr>
nnoremap <leader>y   :normal gg"+yG
nnoremap <leader>s   :%s/\<<C-r><C-w>\>//g<Left><Left>

" Center search results
let g:line=2
" nnoremap n :execute "normal nzt" . g:line . "\<Down>\<CR>"
" nnoremap n :execute "normal nzt"
"
nnoremap <c-i> <c-o>
nnoremap <c-o> <c-i>
nnoremap n nzz7<C-e>
nnoremap N Nzz7<C-e>
nnoremap * *zz7<C-e>
nnoremap # #zz7<C-e>
nnoremap g* g*zz7<C-e>
nnoremap g# g#zz7<C-e>

" change from 1 slash to 2 slashes
nnoremap \\   :!
nnoremap \1   :s!\\\\!\\!g<cr>
nnoremap \2   :s!\\!\\\\!g<cr>

" nnoremap <expr><silent> <leader>, &showtabline ? ":set showtabline=0\<cr>" : ":set showtabline=2\<cr>"
nnoremap <expr> <leader>st &showtabline ? ":set showtabline=0\<cr>" : ":set showtabline=2\<cr>"
"}}}

" g mappings {{{
" change inside the followings: ([{"'
nnoremap   g=          :<C-r>=
nnoremap   g,	       /><CR>ci<
nnoremap   g0	       /)<CR>ci(
nnoremap   g9	       /)<CR>ci(
nnoremap   gH          H
nnoremap   gL          L
nnoremap   gM          M
nnoremap   gm          `
nnoremap   g[          /]<CR>ci[
nnoremap   g]          /]<CR>ci[
nnoremap   gbb         :buffers<cr>:buffer<space>
nnoremap   gbd         :bdelete!<cr>
nnoremap   gbh         :bprev!<cr>
nnoremap   gbl         :bnext!<cr>
nnoremap   gcl         :set cursorline!<cr>
nnoremap   gdc         :edit ~/Documents<cr>
nnoremap   gdf         :edit ~/fdf<cr>
nnoremap   gdl         :edit ~/Downloads<cr>
nnoremap   ged         :call NavigateLeftHanded()<cr>
nnoremap   gh          :noh<cr>
nnoremap   gi          mZgg=G`Z                           " global indent
" nnoremap   gk	       :w<CR>>:<UP><CR>
nnoremap   gnl         :call NavigateLeftHanded()<cr>
nnoremap   go          :browse oldfiles<cr>
nnoremap   gS          :Startify<cr>
nnoremap   gt          <C-]>ww
nnoremap   g{	       /}<CR>ci{

"xml mapping
" Edit text in <Tag> in a vsplit buffer (asumed right)
" transfer <Tag> Buffer back to xml buffer (assumed left)
nnoremap   get         vity:vsplit tag.java<cr>P:echo "Type 'gtt' to transfer text back to xml/html"<cr>
nnoremap   gtt         mTggvG$hy:quit!<cr><C-W>hvitp

" CD location
nnoremap   gbr         :cd C:\sandbox\mtc\ExecutorSuites\SystemValidation\Dual Port Backup Restore<cr>:edit!.<cr>
nnoremap   g.          :edit! .<cr>

" copy and paste at local location
" nnoremap     <leader>v       my:echo "highlight text, then press 'v' to paste at this location."<cr>
vnoremap   v            y`YP
vnoremap   yy           Y

" swap ; with :
nnoremap   :            ;
nnoremap   ;            :
vnoremap   :            ;
vnoremap   ;            :

" A mappings
nnoremap   A            <Nop>
nnoremap   AA           A

" D mappings
nnoremap   D            <Nop>
nnoremap   DD           D
nnoremap   Db           :bdelete!<CR>
nnoremap   dB           :bdelete!<CR>
nnoremap   Da           :%d_<CR>
nnoremap   dA           :%d_<CR>

" F mappings
nnoremap   F            <Nop>
nnoremap   FF	        :CtrlP<cr>
nnoremap   FS	        :let g:full_screen=!g:full_screen <bar> call GuiWindowFullScreen(g:full_screen) <bar> echom "fullscreen toggled"<CR> 

" G mappings
nnoremap   G            <Nop>
nnoremap   GG          G
nnoremap   Gg	       :G log<cr>
nnoremap   G.          :G add .<cr>
nnoremap   Gac         :G add .<cr>:Gcommit -m ""<Left>
nnoremap   Ga5         :w<cr>:G add %<cr>
nnoremap   Gc          :Gcommit -m ""<Left>
nnoremap   G5          :w<cr>:G add %<cr>:Gcommit -m ""<Left>
nnoremap   Gd	       :Gdiff<cr>
nnoremap   G_down      <Down>
nnoremap   G_up        <Up>
nnoremap   Gh	       :Gpush<cr>:Gstatus<cr>
nnoremap   Gl	       :Gpull<cr>:Gstatus<cr>
nnoremap   G_pagedown  <PageDown>
nnoremap   G_pageup    <PageUp>
nnoremap   gy          :Goyo 100%<cr>
nnoremap   g9          {:<C-u>call search('^.\+')<cr>
nnoremap   g)          }k
nnoremap   Gr          :Grep \<<C-r><C-w>\><CR>
nnoremap   Gs	       :Gstatus<cr>
nnoremap   GS          :call Google()<CR>
map        Gj          <Plug>(GitGutterNextHunk)zz
map        Gk          <Plug>(GitGutterPrevHunk)zz

" h mappings
" nnoremap   H            <Nop>
" nnoremap   HH           H

" m mappings
nnoremap   MM           M
nnoremap   ML           ml
nnoremap   Ms           m
nnoremap   m            `
nnoremap   m            `
nnoremap   `            m

" s mappings
map        s2           <Plug>(easymotion-overwin-f2)
nnoremap   S            <Nop>
nnoremap   SF           :Startify<cr>
nnoremap   SS           S
nnoremap   SW           :w<cr>:source %<cr>
nnoremap   s            <Nop>
nnoremap   s=           <C-w>=
nnoremap   sH 	        :vertical resize -5<cr>
nnoremap   sJ 	        :resize -5<cr>
nnoremap   sK 	        :resize +5<cr>
nnoremap   sL 	        :vertical resize +5<cr>
nnoremap   sN           :new<cr>
nnoremap   sS           :split<cr>
nnoremap   sb           ?
nnoremap   sdg          :diffget<CR>
vnoremap   sdg          :diffget<CR>
nnoremap   sdk          [czz
nnoremap   sdj          ]czz
nnoremap   sdp          :diffput<CR>
vnoremap   sdp          :diffput<CR>
nnoremap   sdu          :diffupdate<CR>
     map   fn           <Plug>(easymotion-next)
nnoremap   sh           <C-w>h
nnoremap   sj           <C-w>j
nnoremap   sk           <C-w>k
nnoremap   sl           <C-w>l
nnoremap   sn           :vnew<cr>
nnoremap   sq           :call QuitIfNotLastWindow()<cr>
nnoremap   ss           :vsplit<cr>
nnoremap   sr           :%s/\<<C-r><C-w>\>/<C-r><C-w>/g<Left><Left>
nnoremap   svn          :new<cr>
nnoremap   svd          :vertical diffsplit<Space>
nnoremap   sw           *
nnoremap   sz           :ZoomToggle<cr>
 
" t mappings
nnoremap   tb          :TagbarToggle<cr>
nnoremap   t           *<C-]>wwzz
nnoremap   tt          *<C-]>wwzz
nnoremap   tl          #*:vsp<cr>:exec("tag ".expand("<cword>"))<cr>ww
nnoremap   tj          #*:sp <cr>:exec("tag ".expand("<cword>"))<cr>ww
nnoremap   tcl         :silent !.\bin\ctags -R --language-force=java -f tags.java C:\sandbox\MTR\Libraries\*.bsh<cr>
nnoremap   tc.         :!.\bin\ctags --recurse=yes --append<cr>
nnoremap   TT          zt3<C-y>
nnoremap   TS          :call Thesaurus()<CR>
nnoremap   To          zt <bar> let offset = string(float2nr(winheight('%') * g:center_screen_offset)) <bar> echo offset 

nnoremap   gb          :echo "; does the same"<cr>`Bzz
"nnoremap   gm	       `mzz

nnoremap   <Enter>         zx
nnoremap   <BS>            <right>x<left>
nnoremap   <Del>           x
" nnoremap   <Tab>           #

" y mappings
nnoremap   Y            <Nop>
nnoremap   YY           yy
nnoremap   Yk           <Up>yyp

" z mappings
nnoremap   Z            <Nop>
" nnoremap   Z            zz

"if !exists('$TMUX')     " if not inside tmux, then map Alt-direction keys
"        nnoremap <M-h>      <C-w>h
"        inoremap <M-h>      <C-o><C-w>h
"        nnoremap <M-l>      <C-w>l
"        inoremap <M-l>      <C-o><C-w>l
"        map <M-j>      J
"        inoremap <M-j>      <C-o><C-w>j
"        map <M-k>      K
"        inoremap <M-k>      <C-o><C-w>k
"        nnoremap <M-z>      :ZoomToggle<cr>
"endif
""}}}

" C- A- M- mappings {{{
"
"paste from buffer command/insert mode
cnoremap   <M-v>       <C-r>*
cnoremap   <M-j>       <Down>
cnoremap   <M-k>       <Up>
inoremap   <M-v>       <C-r>+

" inoremap   <C-v>       <C-r>*
inoremap   jk      l    <Esc>
inoremap   kk          <Esc>
inoremap   kl          <Esc>
vnoremap   <C-c>       "+y
" C-Space (ctrl-space)
inoremap   <C-BS>      <C-w>
nnoremap   <C-BS>      bdaW
inoremap  <M-j>        <C-n>
inoremap  <M-k>        <C-p>
inoremap  <M-h>        <C-k>
inoremap  <M-l>        <C-k>

nnoremap   <M-j>       <C-e>j
nnoremap   <M-k>       <C-y>k

nnoremap   <Down>      <C-e>j
nnoremap   <Up>        <C-y>k
" nnoremap   <M-h>       <C-w>h
" nnoremap   <M-j>       <C-w>j
" nnoremap   <M-k>       <C-w>k
" nnoremap   <M-l>       <C-w>l
" nnoremap   H           <C-o>
" nnoremap   L           <C-i>
" nnoremap     <C-i>     <C-o>
" nnoremap     <C-o>     <C-i>

nnoremap   <silent> h            :call PrevParagraph()<CR>
nnoremap   <silent> l            :call NextParagraph()<CR>

nnoremap   +                  J
" nnoremap   <A-S> 	          :new<cr>
nnoremap   <A-a> 	          za
nnoremap   <A-f> 	          vip:fold<cr>
" nnoremap   <A-h> 	          <C-w>h
" nnoremap   <A-l> 	          <C-w>l
" nnoremap   <A-s> 	          :vnew<cr>
" nnoremap   <C-h> 	          <C-w>h
" nnoremap   <C-k>              K
" nnoremap   <C-h> 	          :vertical resize -5<cr>
" nnoremap   <C-j> 	          :resize -5<cr>
" nnoremap   <C-l> 	          :vertical resize +5<cr>
" nnoremap   <C-k> 	          :resize +5<cr>

nnoremap <C-3>      :buffer #<cr>
inoremap <A-n>      <C-n>
nnoremap <A-=>      gg=G<C-o><C-o>
" mappying to copy text to current cursor location
" mappying to copy text to current cursor location
" nnoremap <A-i>      :tabp<cr>
" nnoremap <A-o>      :tabn<cr>
nnoremap <M-i>      <C-o>zz
nnoremap <M-o>      <C-i>zz
nnoremap <A-c>      :tabe<cr>
nnoremap <A-9>      :tabp<cr>
nnoremap <A-0>      :tabn<cr>
nnoremap <A-1>      1gT
nnoremap <A-2>      2gT
nnoremap <A-3>      3gT
nnoremap <A-4>      4gT
nnoremap <A-5>      5gT

" Re-run command on right split. Switch windows and press {UP} {Enter}, then switch back
inoremap <M-r>                <Esc>:w<cr><C-w>li<Up><cr><c-\><C-n><C-w>ha
nnoremap <M-r>                <Esc>:w<cr><C-w>li<Up><cr><c-\><C-n><C-w>h
nnoremap gr                   <Esc>:w<cr><C-w>li<Up><cr><c-\><C-n><C-w>h

"}}}

" nnoremap {{{
"nnoremap   H                  :noh<cr>
" nnoremap   K                  :<C-u>call search('^.\+', 'b')<cr>{jzz
" nnoremap   K                  :call search('^.\+', 'b')<cr>{jzz
" nnoremap   J                  }jzz
" nnoremap   <silent> J                  :call UpperJ()<CR>
" nnoremap   <silent> <PageDown>         :call SimulateScroll()<CR>

" nnoremap   <silent> K                  :call UpperK()<CR>
"nnoremap   K                 
"nnoremap   M                  :call cursor(0, len(getline('.'))/2)<cr>
nnoremap   Q 	              :quit!<cr>
nnoremap   cw	              ciw
" nnoremap   gp	              <C-o>]p
" nnoremap   gp                 :vsplit<cr>:set nonumber<cr>:terminal powershell -executionpolicy bypass<cr>i
nnoremap   gu                 :vsplit<cr>:set nonumber<cr>:terminal ubuntu1804<cr>i
nnoremap   gv                 :silent !start bin\\kitty_portable -ssh root@rvl-pv-ply-ub1804vm.rvl.mscc.lab -pw ff<cr>
nnoremap   q 	              :call QuitIfNotLastWindow()<cr>

" nnoremap   j                  :call PageDown()<cr>
" nnoremap   k                  :call PageUp()<cr>
" nnoremap   k                  ma:let &scrolloff=999<cr>:call PageUp()<cr>:let &scrolloff=0<cr>
" nnoremap   j                  ma:let &scrolloff=999<cr>:call PageDown()<cr>
" nnoremap   k                  ma:let &scrolloff=999<cr>:call PageUp()<cr>
" nnoremap   k                  ma<C-b><C-y><C-y>
" nnoremap   j                  ma:let &scrolloff=999<cr><C-f><C-e><C-e>:let &scrolloff=0<cr>
" nnoremap   k                  ma:let &scrolloff=999<cr><C-b><C-y><C-y>:let &scrolloff=0<cr>
" nnoremap   j                  ma<C-f><C-e><C-e>
" nnoremap   k                  ma<C-b><C-y><C-y>
nnoremap     <silent> j                  :call PageDown()<CR>
nnoremap     <silent> k                  :call PageUp()<CR>
" nnoremap     k                  ma<C-b><C-y><C-y>zz
"}}}

" vnoremap {{{
vnoremap   H                  ^
vnoremap   L                  $
" vnoremap   J                  }k
vnoremap   M                  :call cursor(0, len(getline('.'))/2)<cr>
vnoremap   K                  {j
vnoremap   s  :sort<cr>
vnoremap   O  vip
"}}}

" Terminal mappings {{{
if has('nvim')
    tnoremap <C-w><C-w> <c-\><c-n><c-w><c-w>
    tnoremap <C-c>      <cr>
    tnoremap <C-e>      <c-\><c-n>
    tnoremap <M-e>      <c-\><c-n>
    tnoremap Sh         <c-\><c-n><C-w>h
    tnoremap Sl         <c-\><c-n><C-w>l
    tnoremap Sj         <c-\><c-n><C-w>j
    tnoremap Sk         <c-\><c-n><C-w>k
    tnoremap Sz         <c-\><c-n>:ZoomToggle<cr>
    " if has('win32') || has('win64')
    "     tnoremap <M-h>      <c-\><c-n><C-w>h
    "     tnoremap <M-l>      <c-\><c-n><C-w>l
    "     tnoremap <M-j>      <c-\><c-n><C-w>j
    "     tnoremap <M-k>      <c-\><c-n><C-w>k
    "     tnoremap <M-z>      <c-\><c-n>:ZoomToggle<cr>
    " endif
endif
"}}}
 
" functions {{{

" mapped to ged - toggle d & e to navigate page up and page down
let s:NavigateLeftHanded = 0
function! NavigateLeftHanded()
    if s:NavigateLeftHanded == 0
        let s:NavigateLeftHanded = 1
        nnoremap   d                  <nop>
        nnoremap   d                  ma<C-f><C-e><C-e>
        nnoremap   e                  ma<C-b><C-y><C-y>
        echom "NavLeftMode: d->Page down e->Page up, type 'ged' to revert"
    else
        let s:NavigateLeftHanded = 0
        unmap      d
        unmap      e
        echom "NavLeftMode: off, type 'ged' to activate"
    endif
endfunction

function! ExecutorBufferPush()
    " Save cursor position to Reg E
    execute "normal mE"
    execute "1g,//Executor Buffer,d"
    "
    " Comment out line below to remove // Executor Buffer time stamp
    execute "normal ggO//Executor Buffer - " . strftime('%x %X')
    " execute "normal ggO//Executor Buffer"
    "    
    execute 'normal gg"+yG'
    " Restore position from Reg E
    "
    execute "normal `E"
    "
    " Execute PushScript
    execute "silent !.\\bin\\autohotkey ExecutorBufferPush.ahk"
endfunction

function! PrevParagraph()
    execute "normal {{"
    if (line('.') == 1 )
        " echo "top reached, return"
        return
    endif
    "execute "normal \<Down>"
    if (g:screen_offset != 0)
        let offset = string(float2nr(winheight('%') * g:screen_offset))
        echo offset
        if (line('.') > offset * 2 )
            execute "normal zz"
            execute "normal " . offset . "\<C-e>" . "\<Down>"
        else
            " execute "normal gg"
            execute "normal " . offset . "\<C-y>"
        endif
    endif 
endfunction

function! SS()
    call NextParagraphSS()
    redraw
    " call ScrollUp()
endfunction
command! SS         :call SS()

let g:save_line = 0
function! NextParagraphSS()
    " if (g:smooth_scroll == 1)
        let g:save_line = line('.')
        execute "normal! MS}"
        call search('^.\+')
        let g:current_line = line('.') 
        " execute "normal! `S}"
        let g:scroll = g:current_line - g:save_line
        echo "current_line: " . g:current_line
        " call smooth_scroll#up(scroll, 5, 1)
        execute "normal! " . g:scroll . "\<Up>"
        let i = 1
        while i <= g:scroll
            execute "normal! \<C-e>"
            redraw
            sleep 10ms
            let i = i + 1
        endwhile
endfunction

function! NextParagraph()
    execute "normal }"
    call search('^.\+')
    if (g:screen_offset != 0)
        let offset = string(float2nr(winheight('%') * g:screen_offset)) 
        if(line('.') > offset * 2)
            " echo offset
            execute "normal zz" . offset . "\<C-e>"
        endif
    endif 
endfunction

" Page down / smooth

function! PageDown()
    let top_line = string(float2nr(winheight('%') * g:screen_offset)) + 1
    "if (line('.') > offset * 2 )
    "let top_line = 10
    if (g:smooth_scroll == 1)
        execute "normal! H" . top_line. "\<Down>"
        call smooth_scroll#down(winheight('%'), 5, 1)
    else
        execute "normal! \<Pagedown>2\<C-e>"
        execute "normal! H" . top_line. "\<Down>"
        return
    endif
endfunction

function! PageUp()
    "let top_line = 10
    let top_line = string(float2nr(winheight('%') * g:screen_offset)) + 1
    if (g:smooth_scroll == 1)
        execute "normal! H" . top_line. "\<Down>"
        call smooth_scroll#up(winheight('%'), 5, 1)
    else
        execute "normal! \<Pageup>2\<C-y>"
        execute "normal! H" . top_line. "\<Down>"
        return
    endif
endfunction

function! OffsetCenter ()
    let offset = string(float2nr(winheight('%') * g:center_screen_offset)) 
    execute "normal zz" . offset . "\<C-e>"
endfunction

function! SaveSess()
    execute 'call mkdir(%:p:h/.vim)'
    execute 'mksession! %:p:h/nvim/session.vim'
endfunction

function! RestoreSess()
    execute 'so %:p:h/nvim/session.vim'
    if bufexists(1)
        for l in range(1, bufnr('$'))
            if bufwinnr(l) == -1
                exec 'sbuffer ' . l
            endif
        endfor
    endif
endfunction

function! GitAddCommitPush()
  " let curline = getline('.')
  " call inputsave()
  commitMsg = input('Enter commit message: ')
  execute ":echom commitMsg"
  " call inputrestore()
  " call setline('.', curline . ' ' . name)
endfunction

function! QuitIfNotLastWindow()
    if winnr('$') != 1
        execute ":q!"
        echo "Window closed with 'q'."
    else
        echo "NOTE: last window, use 'Q' to quit."
    endif
endfunction

"<== Zoom / Restore window. ===
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle 	call s:ZoomToggle()
" nnoremap <silent><A-z>  :ZoomToggle<cr>
"<=== Zoom / Restore window. ===

function! DumpVar(fileName)
    redir! > a:fileName
    " local variables
    let
    " globals
    let g:
    " vim variables
    let v:
    redir END
endfunction

function! SimulateScroll()
    let i = 1
    let winheight = winheight(0) * 1.0
    " let ifloat = 1.0
    " let sleep_time = 1.0
    while i < winheight + 1
        execute "normal \<C-e>"
        " let ifloat = i * 1.0
        " let sleep_time = float2nr( 1 + ifloat * (ifloat / winheight) / 10)
        execute "sleep " . float2nr( 2 + i * (i / 10.0 ) . "ms"
        " sleep 20ms
        echo    "sleep " . float2nr( 2 + i * (i / 10.0 ) . "ms"
        " sleep 10ms
        redraw
        let i = i + 1
    endwhile
    " echo "simulatescroll " . string(winheight) . " lines"
endfunction

" this clue good http://news.com 
vnoremap gs <esc>:call WebSearchSelected()<CR>

nnoremap <leader>T :call Thesaurus()<CR>
function! Thesaurus()
    let keyword      = expand("<cword>")
    let url          = "http://thesaurus.com/browse/" . keyword
    let program_path = "C:/Program Files (x86)/Google/Chrome/Application/chrome.exe"
    exec 'silent !"' . program_path . '" '  .  url
endfunction

function! GotoJump()
    jumps
    let j = input("Please select your jump: ")
    if j != ''
        let pattern = '\v\c^\+'
        if j =~ pattern
            let j = substitute(j, pattern, '', 'g')
            execute "normal " . j . "\<c-i>"
        else
            execute "normal " . j . "\<c-o>"
        endif
    endif
endfunction
nmap <leader>j :call GotoJump()<cr>
"}}}

" autocmd {{{
autocmd BufEnter *.bsh :set filetype=java
autocmd VimLeave * call SaveSess()
autocmd BufEnter term://* startinsert
autocmd FileType java set tags=~/fdf/tags.java
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" autocmd VimEnter * call RestoreSess()
" au FileType netrw hi CursorLine gui=underline
" au FileType netrw au BufEnter <buffer> map h -
" au FileType netrw au BufEnter <buffer> map l <Enter>
" au FileType netrw au BufEnter <buffer> map j <Down>
" au FileType netrw au BufEnter <buffer> map k <Up>
" au FileType netrw au BufEnter <buffer> map w p
" au FileType netrw au BufEnter <buffer> hi ActiveWindow        guibg=white
" au FileType netrw au BufLeave <buffer> hi clear CursorLine
"}}}

" Hilights {{{
hi EasyMotionTarget        ctermbg=none ctermfg=green   gui=bold guifg=purple
hi EasyMotionTarget2First  cterm=bold   ctermfg=40      gui=bold guifg=#7fbf00 " purple inverse
hi EasyMotionTarget2Second cterm=bold   ctermfg=40      gui=bold guifg=#7fbf00 " purple inverse

hi Visual              gui=bold      guibg=grey25
hi ActiveWindow        guibg=white ctermbg=white
hi InactiveWindow      guibg=grey10 ctermbg=grey
if has('nvim')
    set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
endif
"}}}

" host specific code {{{
let hostname = substitute(system('hostname'), '\n', '', '')

if hostname == "ASUS_DESKTOP"
    source ~/fdf/nvim/shady.vim   " Light vim color theme
    colorscheme edar
    hi ActiveWindow            guibg=black    ctermbg=white
    hi InactiveWindow          guibg=gray205  ctermbg=grey
    " nnoremap <leader>n :Guifont! Hack Nerd Font Mono:15h:l<cr>
    echom "hostname: " . hostname
endif

if hostname == "CAR-LT-C50626B"  " Work Setup. configured to be in light mode, then inverted.
    let g:airline_theme='sol'    " Light mode
    source ~/fdf/nvim/vadelma.vim   " Light vim color theme
    hi MsgArea                 guibg=lightgray guifg=purple ctermbg=white 
    hi Keyword                 guibg=clear     guifg=Blue   ctermbg=white 
    hi Comment                 guibg=clear     guifg=Green  ctermbg=white 
    hi Statement               guibg=clear     guifg=Blue   ctermbg=white 
    hi Normal                  guibg=clear     guifg=Black  ctermbg=white 
    hi String                  guibg=clear     guifg=Purple ctermbg=white 
    hi javaC_JavaLang          guibg=clear     guifg=Blue   ctermbg=white 
    hi ActiveWindow            guibg=white     ctermbg=white
    hi InactiveWindow          guibg=lightgray ctermbg=grey

    hi EasyMotionTarget2First  cterm=bold      ctermfg=40     gui=bold guifg=green
    hi EasyMotionTarget2Second cterm=bold      ctermfg=40     gui=bold guifg=green
    hi EasyMotionTarget        ctermbg=none    ctermfg=green  gui=bold guifg=purple
    hi Folded                  ctermbg=grey    guifg=clear    guibg=#dddddd
    hi CursorLine              ctermbg=grey    guifg=clear    guibg=lightgray
    " hi Number                  guibg=grey      guifg=#5f8787  ctermbg=grey
    " hi Normal=white guifg=white
    " au CmdLineEnter * hi Normal ctermfg=cyan guifg=cyan
    " au CmdLineLeave * hi Normal ctermfg=white guifg=white
    " hi StatusLine       ctermbg=none ctermfg=green   gui=bold guifg=purple
    " hi EasyMotionShade  ctermbg=none ctermfg=blue    gui=bold guifg=purple
    " nnoremap <leader>ct  !%:p:h/nvim/session.vim//bin/ctags -V -f tags --language-force=java -R C:\sandbox\MTR\Libraries\*.bsh<cr>
    nnoremap <leader>ct  :silent !c:\Users\C50626\\bin\ctags -V -f tags --language-force=java -R C:\sandbox\MTR\Libraries\*.bsh<cr>

    source ~/fdf/nvim/plug.vim    " call directly instead of using "autoload" directory
    echo "759 Plug.vim: loading for host " . hostname
    call plug#begin('~/fdf/nvim/plugged')
        Plug 'bling/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'easymotion/vim-easymotion'
        Plug 'michaeljsmith/vim-indent-object'      " https://github.com/michaeljsmith/vim-indent-object
        Plug 'tpope/vim-commentary'
        Plug 'tpope/vim-fugitive'
        Plug 'ryanoasis/vim-devicons'
        Plug 'kien/ctrlp.vim'                       " Fuzzy file finder / map to F
        Plug 'airblade/vim-gitgutter'
        " Plug 'yuttie/comfortable-motion.vim'        " Physic Motion
        Plug 'terryma/vim-smooth-scroll'
        Plug 'vim-scripts/matchit.zip'
        Plug 'vim-scripts/svn-diff.vim'
        " Plug 'machakann/vim-highlightedyank'
        Plug 'MattesGroeger/vim-bookmarks'          " https://vimawesome.com/plugin/vim-bookmarks
        Plug 'tpope/vim-vinegar'
        Plug 'mtdl9/vim-log-highlighting'
        " Plug 'majutsushi/tagbar'
        Plug 'craigemery/vim-autotag'
        Plug 'junegunn/goyo.vim'        " just text
        Plug 'junegunn/limelight.vim'   " only highlight focus
        Plug 'kassio/neoterm'
        Plug 'neoclide/coc.nvim'     " new completion
        Plug 'reedes/vim-pencil'
        Plug 'beloglazov/vim-online-thesaurus'
        Plug 'fudesign2008/websearch.vim'
        Plug 'morhetz/gruvbox'
    call plug#end()
    echom "hostname: " . hostname

    " ExecutorBuffer Pull/Push
    inoremap <M-r>                <Esc>:call ExecutorBufferPush()<cr>
    nnoremap <M-r>                <Esc>:call ExecutorBufferPush()<cr>
    inoremap <A-t>                <Esc>:edit! ExecutorBuffer.java<cr>:silent !ExecutorBufferPull.ahk<cr>
    nnoremap <A-t>                <Esc>:edit! ExecutorBuffer.java<cr>:%d_<cr>:silent !ExecutorBufferPull.ahk<cr>

    " Plug 'mtdl9/vim-log-highlighting' settings
    syn keyword logLevelError Error
endif 

if hostname == "rvl-pv-ply-ub1804vm"  " VM at Microchip
    colorscheme zellner
    hi ActiveWindow            ctermbg=white
    hi CursorLine              cterm=none       ctermbg=248
    hi EasyMotionTarget        cterm=bold       ctermfg=black ctermbg=14
    hi EasyMotionTarget2First  cterm=bold       ctermfg=black ctermbg=14
    hi EasyMotionTarget2Second cterm=bold       ctermfg=black ctermbg=14
    hi ErrorMsg                cterm=bold       ctermfg=red   ctermbg=grey
    hi Folded                  ctermfg=black    ctermbg=7        
    hi InactiveWindow          ctermbg=252
    " map      <Space>     <Plug>(easymotion-bd-f)
    " nnoremap <leader>ss  :w<cr>:source ~//vimrc<cr>
    source ~/fdf/nvim/plug.vim    " call directly instead of using "autoload" directory
    echo "814 Plug.vim: loading for host " . hostname
    call plug#begin('~/fdf/nvim/plugged')
        Plug 'bling/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'easymotion/vim-easymotion'
        Plug 'michaeljsmith/vim-indent-object'      " https://github.com/michaeljsmith/vim-indent-object
        Plug 'tpope/vim-commentary'
        Plug 'tpope/vim-fugitive'
        Plug 'airblade/vim-gitgutter'
        " Plug 'ryanoasis/vim-devicons'
        " Plug 'kien/ctrlp.vim'                       " Fuzzy file finder / map to F
        " Plug 'scrooloose/nerdtree'
        " Plug 'yuttie/comfortable-motion.vim'        " Physic Motion
        " Plug 'vim-scripts/matchit.zip'
        " Plug 'vim-scripts/svn-diff.vim'
        " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        " Plug 'zchee/deoplete-jedi'
        " Plug 'jiangmiao/auto-pairs'
        " Plug 'machakann/vim-highlightedyank'
    call plug#end()
endif

if hostname == "rvl-pv-vault"  " log server at MC
    colorscheme zellner
    hi ActiveWindow            ctermbg=white
    hi CursorLine              cterm=none       ctermbg=248
    hi EasyMotionTarget        cterm=bold       ctermfg=black ctermbg=14
    hi EasyMotionTafrget2First  cterm=bold       ctermfg=black ctermbg=14
    hi EasyMotionTarget2Second cterm=bold       ctermfg=black ctermbg=14
    hi ErrorMsg                cterm=bold       ctermfg=red   ctermbg=grey
    hi Folded                  ctermfg=black    ctermbg=7        
    hi InactiveWindow          ctermbg=252
    nnoremap <leader>ev  :edit!   /nvm/users/ply/fdf/vimrc<cr>
    source /nvm/users/ply/fdf/nvim/plug.vim    " call directly instead of using "autoload" directory
    echo "848 Plug.vim: loading for host " . hostname
    call plug#begin('/nvm/users/ply/fdf/nvim/plugged')
        Plug 'bling/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'easymotion/vim-easymotion'
        Plug 'michaeljsmith/vim-indent-object'      " https://github.com/michaeljsmith/vim-indent-object
        Plug 'tpope/vim-commentary'
        Plug 'tpope/vim-fugitive'
        Plug 'airblade/vim-gitgutter'
        " Plug 'ryanoasis/vim-devicons'
        " Plug 'kien/ctrlp.vim'                       " Fuzzy file finder / map to F
        " Plug 'scrooloose/nerdtree'
        " Plug 'yuttie/comfortable-motion.vim'        " Physic Motion
        " Plug 'vim-scripts/matchit.zip'
        " Plug 'vim-scripts/svn-diff.vim'
        " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        " Plug 'zchee/deoplete-jedi'
        " Plug 'jiangmiao/auto-pairs'
        " Plug 'machakann/vim-highlightedyank'
    call plug#end()
endif

if hostname == "TC"  " text gateway
    colorscheme zellner
    hi ActiveWindow            ctermbg=white
    hi CursorLine              cterm=none       ctermbg=248
    hi EasyMotionTarget        cterm=bold       ctermfg=black ctermbg=14
    hi EasyMotionTarget2First  cterm=bold       ctermfg=black ctermbg=14
    hi EasyMotionTarget2Second cterm=bold       ctermfg=black ctermbg=14
    hi ErrorMsg                cterm=bold       ctermfg=red   ctermbg=grey
    hi Folded                  ctermfg=black    ctermbg=7        
    hi InactiveWindow          ctermbg=252
    map      <Space>     <Plug>(easymotion-bd-f)
    source ~/df/nvim/plug.vim    " call directly instead of using "autoload" directory
    echo "Plug.vim: loading for host " . hostname
    call plug#begin('~/df/nvim/plugged')
        Plug 'bling/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'easymotion/vim-easymotion'
        Plug 'michaeljsmith/vim-indent-object'      " https://github.com/michaeljsmith/vim-indent-object
        Plug 'tpope/vim-commentary'
        Plug 'tpope/vim-fugitive'
        " Plug 'ryanoasis/vim-devicons'
        " Plug 'kien/ctrlp.vim'                       " Fuzzy file finder / map to F
        " Plug 'airblade/vim-gitgutter'
        " Plug 'scrooloose/nerdtree'
        " Plug 'yuttie/comfortable-motion.vim'        " Physic Motion
        " Plug 'vim-scripts/matchit.zip'
        " Plug 'vim-scripts/svn-diff.vim'
        " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        " Plug 'zchee/deoplete-jedi'
        " Plug 'jiangmiao/auto-pairs'
        " Plug 'machakann/vim-highlightedyank'
    call plug#end()
endif

if hostname == "SurfacePro"
    source ~/fdf/nvim/hyper.vim
    " colorscheme edar
    hi ActiveWindow            guibg=black    ctermbg=white
    hi InactiveWindow          guibg=gray205  ctermbg=grey
    echom "hostname: " . hostname
endif

"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plug.vim {{{
if !exists('g:loaded_plug')  " Only load if it hasn't been loaded.
    source ~/fdf/nvim/plug.vim    " call directly instead of using "autoload" directory
    "echo "919 Plug.vim: loading for host " . hostname
    call plug#begin('~/fdf/nvim/plugged')
        Plug 'bling/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'easymotion/vim-easymotion'
        Plug 'michaeljsmith/vim-indent-object'      " https://github.com/michaeljsmith/vim-indent-object
        Plug 'tpope/vim-commentary'
        Plug 'tpope/vim-fugitive'
        Plug 'ryanoasis/vim-devicons'
        Plug 'kien/ctrlp.vim'                       " Fuzzy file finder / map to F
        Plug 'airblade/vim-gitgutter'
        " Plug 'scrooloose/nerdtree'
        Plug 'yuttie/comfortable-motion.vim'        " Physic Motion
        Plug 'vim-scripts/matchit.zip'
        Plug 'vim-scripts/svn-diff.vim'
        " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        " Plug 'zchee/deoplete-jedi'
        " Plug 'jiangmiao/auto-pairs'
        " Plug 'machakann/vim-highlightedyank'
        Plug 'MattesGroeger/vim-bookmarks'          " https://vimawesome.com/plugin/vim-bookmarks
        Plug 'tpope/vim-vinegar'
        Plug 'honza/vim-snippets'
        Plug 'beloglazov/vim-online-thesaurus'
        Plug 'mhinz/vim-startify'
        Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
        Plug 'junegunn/goyo.vim'        " just text
        Plug 'junegunn/limelight.vim'   " only highlight focus
        Plug 'tpope/vim-sensible'
        Plug 'rking/ag.vim'
        Plug 'tpope/vim-surround'
        Plug 'scrooloose/syntastic'
        Plug 'tpope/vim-repeat'
        Plug 'jceb/vim-orgmode'
        Plug 'reedes/vim-pencil'
        Plug 'terryma/vim-smooth-scroll'
        Plug 'fudesign2008/websearch.vim'
        Plug 'morhetz/gruvbox'
        Plug 'neoclide/coc.nvim'     " new completion
    call plug#end()
endif

if hostname == "vivobook"
    " source ~//nvim/hyper.vim   " Light vim color theme
    " colorscheme edar
    colorscheme default
    colorscheme gruvbox
    hi ActiveWindow            guibg=black    ctermbg=white
    hi InactiveWindow          guibg=Grey13   ctermbg=grey
    hi Visual                  guibg=Grey30   guifg=clear
    hi Folded                  ctermfg=gray   ctermbg=NONE guibg=gray15
    echom "hostname: " . hostname
endif

" airline settings
let g:airline#extensions#tabline#formatter    = 'default'
let g:airline#extensions#tabline#left_sep     = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline_theme='sol'  " light
" let g:airline_theme='light'  " light
let g:airline_theme='minimalist' " dark
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:deoplete#enable_at_startup = 1
hi  HighlightedyankRegion cterm=reverse gui=reverse
map          <Space><Space>  <Plug>(easymotion-bd-f)
nnoremap     <Space>C        :let g:screen_offset=!g:screen_offset<CR>:echo "g:screen_offset: " . string(g:screen_offset)<CR>
nnoremap     <Space>ZZ       :Goyo <bar> Goyo 100%x100% <bar> let g:zen_mode=!g:zen_mode <bar> call GuiWindowFullScreen(1) <bar> echom "g:zen_mode: " . g:zen_mode<CR>
nnoremap     <Space>ZX       :Goyo <bar> echom "g:zen_mode: " . g:zen_mode<CR>
nnoremap     <Space>LL       :Limelight!!<CR>
nnoremap     <Space>Lg       :let g:limelight_conceal_ctermfg="gray"<CR>
nnoremap     <Space>N        :set nonumber!<CR>
nnoremap     <Space>S        :let g:smooth_scroll=!g:smooth_scroll<CR>:echo "g:smooth_scroll: " . g:smooth_scroll<CR>
nnoremap     <Space>W        :set nowrap!<CR>

map          <Space>         <Plug>(easymotion-bd-f2)
map          <BS>            :<Up><Cr>

map          vai             vaI

" nnoremap <silent> <C-f> :call comfortable_motion#flick(200)<cr>
" nnoremap <silent> <C-b> :call comfortable_motion#flick(-200)<cr>
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key   = "k"

"}}}

if has('gui_running')
    echo "has('gui_running')"
endif

" New things to try

"\<<C-r><C-w>\> :CocInstall coc-snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" nnoremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
" nnoremap <silent> <c-d> :call smooth_scroll#down(75, 5, 1)<CR>
" nnoremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
" nnoremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 5, 1)<CR>gH3<Down>
" Distance: This is the total number of lines you want to scroll
" Duration: This is how long you want each frame of the scrolling animation to last in milliseconds. Each frame will take at least this amount of time. It could take more if Vim's scrolling itself is slow
" Speed: This is how many lines to scroll during each frame of the scrolling animation

" Notes for line("below arguments"):
" $       the last line in the current buffer                 
" 'x      position of mark x (if the mark is not set, 0 is returned)                                           
" w0      first line visible in current window                
" w$      last line visible in current window                 
" v       In Visual mode: the start of the Visual area (the   
"         cursor is the end).  When not in Visual mode        
"         returns the cursor position.  Differs from '< in    
"         that it's updated right away.

nnoremap <silent> gly :silent !start bin\\kitty_portable -ssh root@ly95843.ddns.net<cr>
nnoremap <silent> gv  :silent !start bin\\kitty_portable -ssh root@rvl-pv-ply-ub1804vm.rvl.mscc.lab<cr>
nnoremap <silent> gs  :silent !start /max c:\\Progra~1\\Git\\git-bash.exe<cr>
nnoremap  gq      q
nnoremap ,of          :%s//'/g
nnoremap ,oc          :r !python \%userprofile\%\\fdf\\ocr.py<CR>:%s//'/g<CR>


"Gstatus

" Test area:
   "in quotes"
   " (in side paranes)  
   " [this is a test]
   " {this is a test}
   " <arrows string>
" paranthasess 1st 2nd 3rd 
" This is a line of text. A second text line. Make this the third sentence. 
" http://news.com
" ~/fdf/vimrc - END
