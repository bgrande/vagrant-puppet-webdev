
" formerly found at http://github.com/faithfulgeek/dotfiles/blob/master/.vimrc

set nocompatible              "don't need to keep compatibility with Vi
set background=dark           "make vim use colors that look good on a dark background

syntax on                     "turn on syntax highlighting

"only show the cursorline/col in gui mode
if has("gui_running")
  set cursorline                "highlight current line
  set cursorcolumn              "highlight current column
end

set showcmd                   "show incomplete cmds down the bottom
set showmode                  "show current mode down the bottom

set incsearch                 "find the next match as we type the search
set hlsearch                  "hilight searches by default

set nowrap                    "dont wrap lines
set linebreak                 "wrap lines at convenient points
set wildmenu                  "make tab completion act more like bash
set cmdheight=2               "make the command line a little taller to hide "press enter to viem more" text

filetype plugin indent on     "enable automatic filetype detection, filetype-specific plugins/indentation

set expandtab                 "spaces instead of tabs for better cross-editor compatibility
set autoindent                "keep the indent when creating a new line
set smarttab                  "use shiftwidth and softtabstop to insert or delete (on <BS>) blanks
set cindent                   "recommended seting for automatic C-style indentation
set autoindent                "automatic indentation in non-C files
set wrap                      "wrap entire words, don't break them; much easier to read!

"custom status line (across the bottom of the screen)
" See http://vimdoc.sourceforge.net/htmldoc/options.html#'statusline' for more
" details on statusline
set statusline=%F%m%r%h%w\ [TYPE=%Y]\ \ \ \ \ \ \ \ \ \ \ \ [POS=%2l,%2v][%p%%]\ \ \ \ \ \ \ \ \ \ \ \ [LEN=%L]
set laststatus=2

"set the kind of invisible characters to show
" for tabs, trailing spaces, non breaking spaces
"set lcs=tab:>.,trail:•,nbsp:%

"show invisible characters. Use "set nolist" to turn off.
set list

":hi link helpbar Identifier

" Make tabs work like we're used to
map <C-Tab> :tabnext<CR>
map <C-S-Tab> :tabprev<CR>

" toggle linenumbers
:nmap <C-N><C-N> :set invnumber <CR> 

" Auto surround using mapped surroundings in visual mode
vmap ) s)
vmap ] s]
vmap ' s'
vmap } s}

