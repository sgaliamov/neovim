let mapleader = " " " does not work in vscodevim.vim
let maplocalleader = " "

" ================= SETTINGS ==================

" need `unnamed` for visual studio
set clipboard=unnamed,unnamedplus
set smartcase
set ignorecase

" nvim and vscode have it by default, but visual studio does not
set hlsearch
set incsearch
set number
set relativenumber

" ============= GENERAL COMMANDS ==============

" Mapping double pressing of the leader key to Escape provides a quick way to exit various modes.
map <leader> <NOP>
" map <leader><leader><leader> <NOP>

" conflicts with easymotions
" map <leader><leader> <Esc>

" <Esc>:noh<CR> <- does not work in some cases in normal mode.
inoremap <Esc> <Esc>:noh<CR>

" vs and vscode use native shortcut
" noremap <C-s> <Esc>:w<CR>

" vcode [-]: have to use the custom script in `settings.json`:
" "vscode-neovim.compositeKeys": {
"   "jj": {
"     "command": "vscode-neovim.lua",
"     "args": [["vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>`^', true, true, true), 'n', true)"]]
"   }
" },
imap jj <Esc>`^

" ============= TEXT MANIPULATIONS =============

" use standard binding for all modes for vs and vscode
" inoremap <C-x> <C-o>"_dd

nnoremap <leader>c <Esc>ciw
noremap <leader>d <Esc>"_daw
noremap <leader>r <Esc>viw"_dP
noremap <leader>v <Esc>viw
noremap <leader>y <Esc>yiwe
nnoremap x "_x


" Split a line after the cursor and move to the new line.
nnoremap <leader>j a<CR><Esc>==

" Split a line after the cursor and stay.
nnoremap <leader>J m`a<CR><Esc>==``

" When replace text, don't copy replaced text
vnoremap p "_dP

" repeat in normal mode
" nnoremap <C-y> <C-r>

" by default it copies the character from the line above the cursor position in insert mode;
" in normal and in visual modes: scroll N lines downwards.
" remap to regular redo.
" noremap does not work in VS.
" inoremap <C-y> <C-o><C-r>

" by default, in the normal and the visual modes this command suspends the Vim process and puts it in the background,
" in the insert mode it inputs ^Z.
" remap to relular undo.
" noremap <C-z> u
" inoremap <C-z> <C-o>u

" Initiating visual mode from regular selection with Shift and arrows.
" need to configure `keybindings.json` in vscode to enable vim bindings.
" in vs S-Left and S-Right are handled well by default
" todo: setup only for VS
" inoremap <S-Right> <Esc><Right>viw
" inoremap <S-Left> <Esc>viwo
" inoremap <S-Up> <Esc>`^vk
" inoremap <S-Down> <Esc>`^vj
" vnoremap <S-Up> k
" vnoremap <S-Down> j
" inoremap <S-Home> <Esc>v^
" inoremap <S-End> <Esc>`^v$
" noremap zm m`zM``

" noremap <leader>a GVgg^

" =============== LEFT STANDARD SHORTCUTS ==================

" C-a
" C-c
" C-f
" C-h
" C-o
" C-r as the unnamed register is used by default
" C-s
" C-v
" C-x
" C-z is not available in vsvim

" " surrounding workaround
" noremap s <NOP>
" noremap sd <NOP>

" " surround inner word
" nnoremap s" <Esc>ciw"<C-r>""<Esc>
" nnoremap s' <Esc>ciw'<C-r>"'<Esc>
" nnoremap s| <Esc>ciw|<C-r>"|<Esc>
" nnoremap s` <Esc>ciw`<C-r>"`<Esc>
" nnoremap s, <Esc>ciw<<C-r>"><Esc>
" nnoremap s9 <Esc>ciw(<C-r>")<Esc>
" nnoremap s[ <Esc>ciw[<C-r>"]<Esc>
" nnoremap s{ <Esc>ciw{<C-r>"}<Esc>

" " surround visual selected text
" vnoremap s" c"<C-r>""<Esc>
" vnoremap s' c"<C-r>"'<Esc>
" vnoremap s| c"<C-r>"|<Esc>
" vnoremap s` c"<C-r>"`<Esc>
" vnoremap s, c<<C-r>"><Esc>
" vnoremap s9 c(<C-r>")<Esc>
" vnoremap s[ c[<C-r>"]<Esc>
" vnoremap s{ c{<C-r>"}<Esc>

" " delete surround
" nnoremap sd" di"h"_2s<C-r>"<Esc>
" nnoremap sd' di'h"_2s<C-r>"<Esc>
" nnoremap sd| di|h"_2s<C-r>"<Esc>
" nnoremap sd` di`h"_2s<C-r>"<Esc>
" nnoremap sd, di<h"_2s<C-r>"<Esc>
" nnoremap sd9 di(h"_2s<C-r>"<Esc>
" nnoremap sd[ di[h"_2s<C-r>"<Esc>
" nnoremap sd{ di{h"_2s<C-r>"<Esc>

" " " change surround
" nnoremap '" di'h"_2s"<C-r>""<Esc>
" nnoremap "' di"h"_2s'<C-r>"'<Esc>

" NOTES:
" - vim.fn.col function does not work in vscode
" - noremap! <Esc> <Esc>:noh<CR> does not work if press c and <Esc> in normal mode
" - <silent> is not supported in visual studio
" - `^ moves cursor to the original postion after entering normal mode preventing default shifting when Esc is pressed.

" TO DO:
" inoremap <S-PageUp> <Esc>v<PageUp>
" inoremap <S-PageDown> <Esc>v<PageDown>

" vs [+]: need to remove other commmands from this binding
" vcode [-]: moves schroll but not the cursor
" page back
" noremap <C-b> <C-b>zz
" " 1/2 page up
" noremap <C-u> <C-u>zz
" " 1/2 page down
" noremap <C-d> <C-d>zz
" " page forward
" noremap <C-f> <C-f>zz
