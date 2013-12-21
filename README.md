My `.vimrc` and `/.vim/` files.

The `vimrc` file is not missing a dot prefix - my actual `.vimrc` file
in my root directory "forwards" the config to my `~/.vim/vimrc` file.

You can do this too by having the `.vimrc` file contain just one line:

    runtime vimrc

Taken from: [here](http://vim.wikia.com/wiki/Version_Control_for_Vimfiles).

This way I can just do `git push/pull` to keep my `vim` stuff in sync!
