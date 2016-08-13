set background=dark
set splitbelow
set splitright
syntax on
filetype on
filetype indent on
set mouse=a
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8                              
set fileencodings=utf8,koi8r,cp1251,cp866,ucs-2le
set laststatus=2
set statusline=%f%m%r%h%w\ %y\ enc:%{&enc}\ ff:%{&ff}\ fenc:%{&fenc}%=(ch:%3b\ hex:%2B)\ col:%2c\ line:%2l/%L\ [%2p%%]

