# ryz' Vim configuration / vim-ryz #
Author: Steve Haßenpflug <ryzawy@gmail.com>

My personal Vim/gVim configuration, flavored by pathogen and some plugins.
It should work platform independend. At least thats what I'm aiming for ;)

Plugins are included via git submodules, one of them needs [Exuberant Ctags](http://ctags.sourceforge.net/).


## Download & Installation ##
Optional: If you haven't already, install [Exuberant Ctags](http://ctags.sourceforge.net/) and make sure it
comes first in `$PATH`. Alternatively, set the absolute path in your vimrc via `let Tlist_Ctags_Cmd = <PATH>`.

### Quick Installation ###
Use curl (for Mac OS X):

     curl -o - https://raw.github.com/ryz/vim-ryz/master/auto-install.sh | sh

or wget (for most UNIX platforms):

     wget -O - https://raw.github.com/ryz/vim-ryz/master/auto-install.sh | sh

### Manually via Git ###
If you're using MAC OS X or GNU/Linux (or any other "POSIX compliant" system really) and Git v1.6.5 or later simply copy and paste these lines:

    cd ~
    git clone --recursive git://github.com/ryz/vim-ryz.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc

Everything should be set now.

#### Detailed Description ####
Clone this repository into your home directory (`~/`) via `git clone --recursive git://github.com/ryz/vim-ryz.git ~/.vim`. Don't forget the `--recursive` flag, as it's needed to recursively clone plugins included via submodules!

To keep things tidy, create a symbolic link pointing to the vimrc file in your home directory: 

    ln -s ~/.vim/vimrc ~/.vimrc

Everything should be set up now.

### Manually via download package ###
Download my ready-made package, submodules included. Just unzip into your vim directory (`~/.vim/` or `$HOME/vimfiles` respectively, dependend on your OS). rename 'vimrc' to '.vimrc' on linux or '_vimrc' on Windows, done.

## Plugin Descriptions ##
Here's a short overview for the plugins I'm using and how i've customized them to my needs. I'll add descriptions over time.

* [NERDTree](http://www.vim.org/scripts/script.php?script_id=1658): A tree explorer plugin for navigating the filesystem.

  Useful commands:   
    `:Bookmark [name]` - bookmark any directory as name   
    `:NERDTree [name]` - open the bookmark [name] in Nerd Tree   
  Custom commands:
    `<Leader>n` - Open NERDTree

* [MRU](https://github.com/vim-scripts/mru.vim): Easy access to a list of recently opened/edited files in Vim.
  Custom commands:
    `<Leader>m` - Run MRU for fast access to recent files.
