" An example for a vimrc file.
"
" Maintainer:	Andrew Proctor <Andrew@targetcw.com>
"

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Begin my lines - ordinary
set autoindent
set sw=3
set sta
set ts=3
set et
" End of my lines -ordinary

" Begin of my lines -change indents
map #1 :s/^   //
map #2 :s/^/   /
" End of my lines -change indents

"Begin of my lines - F3 to latex current file
"                    from command or insert
map #3 :w
map! #3 :w
" End of my lines - latex

set nocompatible
set bs=2		" allow backspacing over everything in insert mode
set ai			" always set autoindenting on
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  au FileType text setlocal tw=78

  " When editing a file, always jump to the last known cursor position.
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")
