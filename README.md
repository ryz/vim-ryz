# vim-ryz #

My personal Vim/gVim configuration, flavored by pathogen and some plugins.
It should work platform independend. At least thats what I'm aiming for ;)

Plugins are included via git submodules, some of them need [Exuberant Ctags](http://ctags.sourceforge.net/).


## Download & Installation ##
Optional: If you haven't already, install [Exuberant Ctags](http://ctags.sourceforge.net/) and make sure it
comes first in `$PATH`. Alternatively, set the absolute path in your vimrc via `let Tlist_Ctags_Cmd = <PATH>`.

### Via git ###
If you're using MAC OS X or GNU/Linux (or any other "POSIX compliant" system really) and Git v1.6.5 or later simply copy and paste these lines:

    cd ~
    git clone --recursive git://github.com/ryz/vim-ryz.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc

Everything should be set now.

#### Description ####
Clone this repository into your home directory (`~/`) via `git clone --recursive git://github.com/ryz/vim-ryz.git ~/.vim`. Don't forget the `--recursive` flag, as it's needed to recursively clone plugins included via submodules!

To keep things tidy, create a symbolic link pointing to the vimrc file in your home directory: 

    ln -s ~/.vim/vimrc ~/.vimrc

Everything should be set up now.

### Via download package ###
Download my ready-made package, submodules included. Just unzip into your vim directory (`~/.vim/` or `$HOME/vimfiles` respectively, dependend on your OS). rename 'vimrc' to '.vimrc' on linux or '_vimrc' on Windows, done.

## Plugin Descriptions ##
Here's a short overview for the plugins I'm using and how i've customized them to my needs. I'll add descriptions over time.

### NERDTree ###
The NERD tree allows you to explore your filesystem and to open files and directories. It presents the filesystem to you in the form of a tree which you manipulate with the keyboard and/or mouse. It also allows you to perform simple filesystem operations.

### MRU ###
Most Recently Used (MRU) plugin provides an easy access to a list of recently opened/edited files in Vim.

The `<Leader>m` mapping will run MRU for fast access to recent files.
