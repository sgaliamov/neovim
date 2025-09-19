# Neovim

My `Neovim` config.

``` cmd
git clone -b main https://github.com/sgaliamov/vim

mklink /D C:\tools\neovim\nvim-win64\bin\lua %userprofile%\AppData\Local\nvim
```

Create hard links for vim files:


``` cmd
mklink /H %userprofile%\.vimrc .\vim\.vimrc
mklink /H %userprofile%\.ideavimrc .\vim\.ideavimrc
```

``` pwsh
$src = ".\vim"
$dst = $env:USERPROFILE

Get-ChildItem $src -File | ForEach-Object {
  $l = Join-Path $dst $_.Name
  if (Test-Path $l) { Remove-Item $l -Force }
  New-Item -ItemType HardLink -Path $l -Target $_.FullName | Out-Null
}
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
  "when": "editorTextFocus && focusedView == 'workbench.panel.output'"
}

```

For some reason we need the full condition including `focusedView == 'workbench.panel.output'`.

After that regular key bindings in `.vimrc`  just work:

``` vim
imap jj <Esc>
```
