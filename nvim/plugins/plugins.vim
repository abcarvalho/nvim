
" PLUGINS {{{1 
" Automatically Install Vim-Plug
if empty(glob('$HOME/.config/nvim/autoload/plug.vim'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('$HOME/.config/nvim/plugged')
	" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
	Plug 'junegunn/vim-easy-align'

	" Files and Folders: NERDTree
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

	" Files and Folders: Fuzzy Finder
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'

	" Languages: Julia
	Plug 'JuliaEditorSupport/julia-vim'

	" Languages: LaTeX
  Plug 'lervag/vimtex'

	" Language: Python
	" Plug 'python-mode/python-mode', { 'branch': 'develop' }

  " Language: Markdown
	Plug 'plasticboy/vim-markdown'
  Plug 'vim-pandoc/vim-pandoc-syntax'

	" Languages: Autocompletion
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

	" Code Editing: Commenting
  Plug 'tpope/vim-commentary'

	" Task Management:
	Plug 'jceb/vim-orgmode'

	" Appearance: Airline
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" Appearance: Themes
	Plug 'dracula/vim',{ 'as': 'dracula' }
	" Plug 'skreek/skeletor.vim'
	Plug 'altercation/vim-colors-solarized'
  Plug 'kjssad/quantum.vim'

  " Tex Conceal
  Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}

	" Track the engine.
	Plug 'SirVer/ultisnips'

	" Snippets are separated from the engine. Add this if you want them:
	Plug 'honza/vim-snippets'

  " Initialize plugin system
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" Press gx to open the GitHub URL for a plugin or a commit with the default browser.
function! s:plug_gx()
  let line = getline('.')
  let sha  = matchstr(line, '^  \X*\zs\x\{7,9}\ze ')
  let name = empty(sha) ? matchstr(line, '^[-x+] \zs[^:]\+\ze:')
                      \ : getline(search('^- .*:$', 'bn'))[2:-2]
  let uri  = get(get(g:plugs, name, {}), 'uri', '')
  if uri !~ 'github.com'
    return
  endif
  let repo = matchstr(uri, '[^:/]*/'.name)
  let url  = empty(sha) ? 'https://github.com/'.repo
                      \ : printf('https://github.com/%s/commit/%s', repo, sha)
  call netrw#BrowseX(url, 0)
endfunction

augroup PlugGx
  autocmd!
  autocmd FileType vim-plug nnoremap <buffer> <silent> gx :call <sid>plug_gx()<cr>
augroup END


source $HOME/.config/nvim/plugins/coc.vim

" Themes {{{1
source $HOME/.config/nvim/plugins/airline.vim
source $HOME/.config/nvim/plugins/themes.vim

" File Explorer {{{1 
source $HOME/.config/nvim/plugins/netrw.vim
source $HOME/.config/nvim/plugins/nerdtree.vim

" Languages {{{1
source $HOME/.config/nvim/plugins/markdown.vim
source $HOME/.config/nvim/plugins/julia.vim
source $HOME/.config/nvim/plugins/vimtex.vim
" Tex Conceal
let g:tex_conceal='abdmg'

" Snippets {{{1
source $HOME/.config/nvim/plugins/ultisnips.vim
