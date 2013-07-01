Dotfiles
========

Personal, stripped-down, bare-bone dotfile collection. This will probably be useless to almost anybody. For a full-featured set of dotfiles, I recommend [https://github.com/mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles) and [https://github.com/paulirish/dotfiles](https://github.com/paulirish/dotfiles).

Credit to [Michael
Smalley](http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/) for the symlink script.

## Notes

To add/update any git submodules, follow this guide by [sanmai](http://stackoverflow.com/a/5828396/695454)

The git submodule update command actually tells git that you want to use whatever commit state is currently checked out in your submodules. If you want to update the submodules, you will need to do this directly in your submodules.

So in summary:

Get the submodule initially
    
    git submodule add ssh://bla submodule_dir
    git submodule init

Time passes, submodule upstream is updated and you now want to update; change to the submodule directory
    
    cd submodule_dir

Checkout desired branch
    
    git checkout master

Update
    
    git pull

Get back to your project root
    
    cd ..

Now the submodules are in the state you want, so
    
    git commit -am "Pulled down update to submodule_dir"

Or, if you're a quite busy person:

    git submodule foreach git pull origin master
