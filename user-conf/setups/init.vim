"" PLUGINS
call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/auto-pairs-gentle'

Plug 'vim-airline/vim-airline-themes'
Plug 'ayu-theme/ayu-vim'

call plug#end()

"" THEMES
set termguicolors
let ayucolor = 'dark'
let g:airline_theme = 'ayu-dark'
colorscheme ayu
