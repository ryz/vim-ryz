# vim-ryz #

My personal Vim/gVim configuration, flavored by pathogen and some plugins.
It should work out-of-box, platform independend. At least thats what I'm aiming for ;)

Plugins are included via git submodules, some of them need [Exuberant Ctags][http://ctags.sourceforge.net/].


## Download & Installation ##
If you haven't already, install [Exuberant Ctags][http://ctags.sourceforge.net/] and make sure it
comes first in `$PATH`.

### Via download package ###
Download my ready-made package, submodules included. Just unzip into your vim directory (`~/.vim/` or `$HOME/vimfiles` respectively, dependend on your OS), rename 'vimrc' to '.vimrc' on linux or '_vimrc' on Windows, done.

### Via git ###
Clone this repository into your vim directory (`~/.vim/` or `$HOME/vimfiles` respectively, dependend on your OS) via `git clone --recursive`. Dont forget the `--recursive` flag, as it's needed to clone the plugins included via submodules!

Also, 'vimrc' should be renamed to '.vimrc' on linux or '_vimrc' on Windows.

