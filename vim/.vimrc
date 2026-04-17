" to reset all settings to default:
" :mapclear!
" :set all&

let mapleader = " " " does not work in vscodevim.vim
let maplocalleader = " "

" " ================= SETTINGS ==================

set clipboard=unnamed,unnamedplus " need `unnamed` for visual studio
set smartcase      " Use case sensitivity in searches when uppercase letters are used
set ignorecase     " Ignore case when searching
set incsearch      " Incremental search
set hlsearch       " Highlight search results
" "set wildmenu       " Enhanced command-line completion - does not work in vs
set number         " Show line numbers
set relativenumber " Show relative line numbers

" ============= GENERAL COMMANDS ==============

" Mapping double pressing of the leader key to Escape provides a quick way to exit various modes.
" conflict with EasyMotion
" map <leader> <NOP>
" map <leader><leader> <NOP>
" map <leader><leader><leader> <NOP>

" To normal mode
" inoremap jj <Esc>`^

" ==== NAVIGATION ================================================================

nnoremap E $
vnoremap E $<Left>
noremap B ^

" Visual mode with Shift+Arrows
noremap <S-End> <Esc>v$
noremap <S-Home> <Esc>v^

" ============= TEXT MANIPULATIONS =============

" Copy the whole word
noremap <leader>y "+yiw

" Cut the whole word
noremap <leader>c "+ciw

" Replace word with the buffer but without copying the deleted text
noremap <leader>r viw"_dP

" Select whole word
noremap <leader>v "+viw

" Cut whole
noremap <leader>d "+daw

" Split a line after the cursor and move to the new line.
nnoremap <leader>j a<CR><Esc>==

" Split a line after the cursor and stay.
nnoremap <leader>J m`a<CR><Esc>==``

" When replace text, don't copy replaced text
vnoremap p "_dP

" " ================ NAVIGATION MAPPINGS ===================
inoremap <Home> <Esc>^i
inoremap <End> <Esc>$a

" <Esc>:noh<CR> <- does not work in some cases in normal mode.
" inoremap <Esc> <Esc>:noh<CR>

" " todo: support all arrows and visual mode
" " inoremap <silent> <expr> <S-Right> (col('.') == 1 ? '<Esc>v/[^a-z]<CR><Left>' : '<Esc><Right>v/[^a-z]<CR><Left>')

" " by default it copies the character from the line above the cursor position in insert mode;
" " in normal and in visual modes: scroll N lines downwards.
" " remap to regular redo.
" " noremap does not work in VS.
" " inoremap <C-y> <C-o><C-r>

" " by default, in the normal and the visual modes this command suspends the Vim process and puts it in the background,
" " in the insert mode it inputs ^Z.
" " remap to relular undo.

" " noremap <C-z> u
" " inoremap <C-z> <C-o>u

" " Initiating visual mode from regular selection with Shift and arrows.
" " need to configure `keybindings.json` in vscode to enable vim bindings.
" " in vs S-Left and S-Right are handled well by default
" " todo: setup only for VS
" " inoremap <S-Right> <Esc><Right>viw
" " inoremap <S-Left> <Esc>viwo
" " inoremap <S-Up> <Esc>`^vk
" " inoremap <S-Down> <Esc>`^vj
" " vnoremap <S-Up> k
" " vnoremap <S-Down> j
" " inoremap <S-Home> <Esc>v^
" " inoremap <S-End> <Esc>`^v$
" " noremap zm m`zM``

" " noremap <leader>a GVgg^

" " =============== LEFT STANDARD SHORTCUTS ==================

" " C-a
" " C-c
" " C-f
" " C-h
" " C-o
" " C-r as the unnamed register is used by default
" " C-s
" " C-v
" " C-x
" " C-z is not available in vsvim

" " " surrounding workaround
" " noremap s <NOP>
" " noremap sd <NOP>

" " " surround inner word
" " nnoremap s" <Esc>ciw"<C-r>""<Esc>
" " nnoremap s' <Esc>ciw'<C-r>"'<Esc>
" " nnoremap s| <Esc>ciw|<C-r>"|<Esc>
" " nnoremap s` <Esc>ciw`<C-r>"`<Esc>
" " nnoremap s, <Esc>ciw<<C-r>"><Esc>
" " nnoremap s9 <Esc>ciw(<C-r>")<Esc>
" " nnoremap s[ <Esc>ciw[<C-r>"]<Esc>
" " nnoremap s{ <Esc>ciw{<C-r>"}<Esc>

" " " surround visual selected text
" " vnoremap s" c"<C-r>""<Esc>
" " vnoremap s' c"<C-r>"'<Esc>
" " vnoremap s| c"<C-r>"|<Esc>
" " vnoremap s` c"<C-r>"`<Esc>
" " vnoremap s, c<<C-r>"><Esc>
" " vnoremap s9 c(<C-r>")<Esc>
" " vnoremap s[ c[<C-r>"]<Esc>
" " vnoremap s{ c{<C-r>"}<Esc>

" " " delete surround
" " nnoremap sd" di"h"_2s<C-r>"<Esc>
" " nnoremap sd' di'h"_2s<C-r>"<Esc>
" " nnoremap sd| di|h"_2s<C-r>"<Esc>
" " nnoremap sd` di`h"_2s<C-r>"<Esc>
" " nnoremap sd, di<h"_2s<C-r>"<Esc>
" " nnoremap sd9 di(h"_2s<C-r>"<Esc>
" " nnoremap sd[ di[h"_2s<C-r>"<Esc>
" " nnoremap sd{ di{h"_2s<C-r>"<Esc>

" " " " change surround
" " nnoremap '" di'h"_2s"<C-r>""<Esc>
" " nnoremap "' di"h"_2s'<C-r>"'<Esc>

" " NOTES:
" " - vim.fn.col function does not work in vscode
" " - noremap! <Esc> <Esc>:noh<CR> does not work if press c and <Esc> in normal mode
" " - <silent> is not supported in visual studio
" " - `^ moves cursor to the original postion after entering normal mode preventing default shifting when Esc is pressed.

" " TO DO:
" " inoremap <S-PageUp> <Esc>v<PageUp>
" " inoremap <S-PageDown> <Esc>v<PageDown>

" " vs [+]: need to remove other commmands from this binding
" " vcode [-]: moves schroll but not the cursor
" " page back
" " noremap <C-b> <C-b>zz
" " " 1/2 page up
" " noremap <C-u> <C-u>zz
" " " 1/2 page down
" " noremap <C-d> <C-d>zz
" " " page forward
" " noremap <C-f> <C-f>zz
