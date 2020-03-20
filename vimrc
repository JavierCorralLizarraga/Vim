call plug#begin('~/vimfiles/bundle')
"Plug 'vim-pandoc/vim-rmarkdown'
"Plug 'vim-pandoc/vim-pandoc-syntax'
"Plug 'vim-pandoc/vim-pandoc'
Plug 'easymotion/vim-easymotion'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
call plug#end()
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"autocmd BufRead,BufNewFile *.rmd set filetype=rmarkdown
"el autocmd de arriba hace que el archivo se cargue directamente como .rmd
" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim
augroup pandoc_syntax
   au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END
"_________________________________________________________________________________
" Esto lo meto yo de algun lado literalmente son mis tests 
nnoremap <silent> <C-L> <C-L>:nohls<C-L><enter>
"el remap de arriba quita los hightlights al refrescar la pantalla
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | \ exe "normal! g`\"" | endif
" el autocmd de arriba abre el archivo donde en la parte donde te quedaste 
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>
set background=dark
set ignorecase
set wildmenu
set wildmode=list:longest,full
set mouse=a
set number relativenumber
set nuw=4
set autoindent 
set confirm
set visualbell 
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab 
set tabstop
set virtualedit
set ruler
set directory=.,$TEMP
"working with tabs 
nnoremap nt :tabnew<space>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>
nnoremap tf :tabfirst<CR>
nnoremap tl :tablast<CR>
"fin tabs
"clipbpard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
"fin clipboard
syntax on
imap Î <backspace> 
"navegacion por guias 
inoremap <space><space>  <Esc>/<++><Enter>c4l<esc><C-L>:nohls<C-L><enter>i<right>
nnoremap <leader>vim :tabnew $MYVIMRC<CR>
" LATEX 
imap {{ \left\{<enter>\begin{array}{ll}<enter><tab><++>&<++>&<++>\\<enter><++>&<++>&<++><enter><backspace>\end{array}<enter>\right.
imap FF \frac{<++>}{<++>}<++>
imap RR \sqrt[<++>]{<++>}<++>
imap ;_ _{<++>}<++>
imap ;^ ^{<++>}<++>
"imap |^ \Uparrow (no jala)
"imap |v \Downarrow (no jala)
imap ^} \overbrace{<++>}{<++>}<++>
imap _} \underbrace{<++>}{<++>}<++>
imap -> \rightarrow
imap => \Rightarrow
imap <- \lefarrow
imap <-> \leftrightarrow
imap <=> \Leftrightarrow
imap >= \geq
imap =< \leq
imap <= \leq
"imap _|_ \perp (no jala)
"imap || \parallel (no jala)
imap =/= \neq
imap =~ \approx
imap ;; \
"intento de imap -- buscar el "\" e insertar al lado un n para significar que ese simbolo
"se niega
imap -- <esc>/<leader><enter>i<right>n
"
imap :. \therefore 
imap /> \nearrow
imap \> \searrow
imap AA \forall
imap EE \exists
imap losreales \mathbb{R}
imap losnaturales \math{N}
imap .... \cdots
imap SS \int
imap SUMA \sum
imap +- \pm
imap /_ \angle
imap ALFA \alpha 
imap BETA \beta
imap DELTA \delta
imap TETA \theta 
imap PI \Pi
imap EPS \epsilon
imap OO \infty
cmap ,, $$<left>
"FIN LATEX  


"aqui acaban mis mamadas, worst case scenario se borra desde el renglon de
" comillas anterior hasta este 
"____________________________________________________________________________________


" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
     let &shellxquote=l:shxq_sav
 endif
endfunction
