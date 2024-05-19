# epitech-header.nvim

A Neovim plugin to insert Epitech headers into your files with a simple keybinding.

## Installation

### Using `lazy.nvim` or `plug`
`ZKAW/vim-epitech-header`

## Usage

* The default keybinding to generate the header is `<Leader>EH`.
* To generate using command line, use `:EpitechHeader`.
* To change the default keymap, pass `keymap = '<keymap>'` to the setup function.

##### Example of setup function:
```lua
require('epitech_header').setup {
    keymap = '<leader>eh'
}
```
