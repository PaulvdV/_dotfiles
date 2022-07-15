"window movement

nnoremap <silent><C-Left> :wincmd h<cr>
nnoremap <silent><C-Right> :wincmd l<cr>
nnoremap <silent><C-Up> :wincmd k<cr>
nnoremap <silent><C-Down> :wincmd j<cr>

"general
nnoremap <leader>w :w<CR>
nnoremap <leader>h :split<CR>
nnoremap <leader>v :vsplit<CR>

" xnoremap < <gv
" xnoremap > >gv

" nnoremap Y y$
" nnoremap Q :bd<CR>
" nnoremap gk yiwPa=<ESC>

" nnoremap n nzz
" nnoremap N nzz
" nnoremap J mjJ'j
vnoremap <silent><C-Down>  :m '>+1<CR>gv=gv
vnoremap <silent><C-Up>  :m '<-2<CR>gv=gv

"vimrc
" nnoremap <leader>.e :e $MYVIMRC<CR>
" nnoremap <leader>.r :source $MYVIMRC<CR>:lua vim.notify("Config file reloaded.")<CR>

" allow project config files
set exrc
set secure
