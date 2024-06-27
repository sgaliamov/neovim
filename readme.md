# Neovim

My `Neovim` config.

``` bash
git clone -b main https://github.com/sgaliamov/nvim
mklink ./nvim/.vimrc %userprofile%/.vimrc
```

## To do

1. debug in rust.
1. spell checks.
1. disable some keybindings in insert mode (C-w, C-h).
1. navigation in telescope with <C-j/k>

## Nice to have

1. hide the nesting number in the fold column.
1. setup for c#.
1. tree view in telescope.
1. one tree view for all tabs. configure edgy.
1. <https://stackoverflow.com/questions/5481028/vim-open-each-buffer-in-a-new-tab>

## Known issues

- When can't save file, use `:w!`.

## VSCode

In `asvetliakov.vscode-neovim` to enable input mode bindings we need to disable corresponding keyboard shortcuts:

``` json
  {
    "key": "j",
    "command": "vscode-neovim.send",
    "args": "j",
    "when": "editorTextFocus && neovim.init && focusedView == 'workbench.panel.output'"
  }

```

For some reason we need the full condition: `"when": "editorTextFocus && neovim.init && focusedView == 'workbench.panel.output'"`.

After that regular `.vimrc` key bindings just work:

``` vim
imap jj <Esc>
```
