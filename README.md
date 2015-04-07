# Vim folding for Forth

This plugin implements a basic fold expression for Forth code. It compresses
each word definition to a single line showing that word's colon-word (usually :
or :noname) and name (if applicable) and stack comment (if present) as well as
the line count of each definition.

## Installation

This git repo is [Vundle](https://github.com/gmarik/Vundle.vim)- and
[Pathogen](https://github.com/tpope/vim-pathogen)-friendly, so just include it
in your `.vimrc`.

## Configuration

None needed. However, there are a couple of useful optional bits.

### Single-line definitions

By default, single-line definitions are folded. If you hate that, add this to
your `~/.vimrc`:

    set foldminlines=1

and only multi-line definitions will be folded.


## Contributions

Very welcome! People write with different styles. This plugin is working with my
style, but if it's mishandling some code of yours please file a bug or send a
PR.
