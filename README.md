## About

This is my vim configuration. Until recently I didn't use any plugins at all -
not because there aren't any good out there, but because vim's default plugin
management does not exist. Then I found vundle: https://github.com/gmarik/vundle.git

## How to use it

```
$ git clone git://github.com/irock/vim-config.git <path>
$ git clone git://github.com/gmarik/vundle.git <path>/vim/bundle/vundle
$ ln -s <path>/vim ~/.vim
$ ln -s <path>/vimrc ~/.vimrc
$ ln -s <path>/gvimrc ~/.gvimrc
$ vim +BundleInstall +qall
```

Finally, restart vim.
