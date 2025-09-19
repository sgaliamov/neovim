" ============= GENERAL COMMANDS ==============

" Mapping double pressing of the leader key to Escape provides a quick way to exit various modes.
map <leader> <NOP>
map <leader><leader> <NOP>
map <leader><leader><leader> <NOP>

" To normal mode
inoremap jj <Esc>`^

" ============= TEXT MANIPULATIONS =============

inoremap <C>x

" Copy the whole word
nnoremap <leader>c "+yiwe

" Cut the whole word
nnoremap <leader>x "+ciw

" Replace word with the buffer but without copying the deleted text
noremap <leader>r viw"_dP

" Select whole word
noremap <leader>v "+viw

" Delete whole word without placing it into a buffer
noremap <leader>d "_daw

" Split a line after the cursor and move to the new line.
nnoremap <leader>j a<CR><Esc>==

" Split a line after the cursor and stay.
nnoremap <leader>J m`a<CR><Esc>==``

" When replace text, don't copy replaced text
vnoremap p "_dP
