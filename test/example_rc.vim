" Not sure how to do testing here - it is very environment dependent
"
" nvim -u 'test/example_rc.vim' \ 
"   -c ':PlugInstall' \
"   -c ':UpdateRemotePlugins' \ 
"   -c ':IPython' \

call plug#begin('./test')

Plug 'ivan-krukov/nvim-ipy'

call plug#end()

set cmdheight=5
