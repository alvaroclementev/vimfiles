VIMFILES
========

Files and other settings for my windows (gVim) configuration
------------------------------------------------------------

### Prerequisites
  * This folder should be under gVim's *$HOME* location (*C:\Users\USERNAME* by
default). 
  * There should be, at the same level as *vimfiles*, another folder called
*vimbackups*. This is where the temporary backups lives.
  * gVim will look for the *_vimrc* file under *$HOME\\_vimrc*. There needs to be a
  file there with that name that sources the *_vimrc* in here:

```vim
source ~\vimfiles\_vimrc
```

### Plugins
Vundle is configured in the _vimrc file, but needs to be installed manually in
each new machine using this file. To install navigate to *$HOME\vimfiles* and
run in cmd:
```
git clone https://github.com/VundleVim/Vundle.vim.git ./bundle/Vundle.vim
```

After Vundle is installed, run from inside vim
```vim
:PluginInstall
```

#### List of plugins installed
  * **Vundle.vim**: Plugin manager
  * **NERDTree**: Tree filesystem display
  * **Command-T**: File fuzzy finder
