let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/workspace/myapp
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +25 src/main/java/com/example/myapp/DemoApplication.java
badd +1 ~/workspace/myapp
badd +20 src/main/java/com/example/myapp/model/Coffee.java
badd +10 src/main/java/com/example/myapp/repository/Coffeerepository.java
badd +23 src/main/java/com/example/myapp/controller/HomeController.java
badd +26 src/main/java/com/example/myapp/controller/ScopeController.java
badd +2 src/main/resources/schema.sql
badd +13 ~/.config/nvim/lua/custom/plugins/override/treesitter-setup.lua
badd +19 ~/.config/nvim/lua/custom/plugins/configs/lspconfig.lua
badd +16 ~/.config/nvim/lua/custom/plugins/configs/null-ls.lua
argglobal
%argdel
set lines=38 columns=174
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit src/main/resources/schema.sql
argglobal
balt src/main/java/com/example/myapp/controller/ScopeController.java
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 4 - ((3 * winheight(0) + 17) / 35)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4
normal! 02|
tabnext
edit ~/.config/nvim/lua/custom/plugins/configs/null-ls.lua
argglobal
balt ~/.config/nvim/lua/custom/plugins/configs/lspconfig.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 16 - ((15 * winheight(0) + 17) / 35)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 16
normal! 025|
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
