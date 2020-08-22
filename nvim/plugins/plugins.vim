
" PLUGINS {{{1 
" Automatically Install Vim-Plug
if empty(glob('$HOME/.config/nvim/autoload/plug.vim'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('$HOME/.config/nvim/plugged')
    " Languages: Julia
    Plug 'JuliaEditorSupport/julia-vim'
   
   	" Language: Python
   	" Plug 'python-mode/python-mode', { 'branch': 'develop' }
   
    " Language: Markdown
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'dhruvasagar/vim-table-mode'
   
    " Languages: LaTeX
    Plug 'lervag/vimtex'
   
   	" Code Editing:
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-commentary'
    Plug 'junegunn/vim-easy-align'
   
    " Note Taking Task Management:
    Plug 'dkarter/bullets.vim'
    Plug 'lervag/wiki.vim'
   
   	" Files Folders: 
   	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
   	Plug 'junegunn/fzf.vim'
   	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
   
   	" Coc Extensions: Autocompletion, File Explorer, Snippets
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
   
    " Snippets: are separated from the engine. Add this if you want them:
   	Plug 'honza/vim-snippets'
   
    " Writing Experience: LaTeX
    Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
    Plug 'junegunn/goyo.vim'
    " Plug 'junegunn/limelight.vim'
   
   	" Appearance: Themes
   	Plug 'dracula/vim',{ 'as': 'dracula' }
    Plug 'haishanh/night-owl.vim'
    Plug 'fenetikm/falcon'
    " Plug 'wadackel/vim-dogrun'
   
    " Appearance: Airline
    Plug 'itchyny/lightline.vim'

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


source $HOME/.mars/.config/nvim/plugins/vimtex.vim

" File Explorer {{{1 
source $HOME/.mars/.config/nvim/plugins/netrw.vim
source $HOME/.mars/.config/nvim/plugins/nerdtree.vim

" " Note Taking {{{1
source $HOME/.mars/.config/nvim/plugins/bullets.vim
source $HOME/.mars/.config/nvim/plugins/wikivim.vim

" Coc Autocompletion and Explorer {{{1
source $HOME/.mars/.config/nvim/plugins/coc.vim

" Languages {{{1
source $HOME/.mars/.config/nvim/plugins/markdown.vim
source $HOME/.mars/.config/nvim/plugins/easy-align.vim
source $HOME/.mars/.config/nvim/plugins/julia.vim

" Appearance: Themes & Airline/Lightline {{{1
source $HOME/.mars/.config/nvim/plugins/themes.vim

" Writing {{{1
source $HOME/.mars/.config/nvim/plugins/goyo.vim
