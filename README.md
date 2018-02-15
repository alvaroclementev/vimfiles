VIMFILES
========

Files and other settings for my windows (gVim) configuration
------------------------------------------------------------

### Prerequisites
  * This folder should be under gVim's *$HOME* location (*C:\Users\USERNAME* by
default). 
  * There should be, in the same at the same level, another folder:
"vimbackups". This is where the temporary backups live.
  * gVim will look for the *_vimrc* file under *$HOME\\_vimrc*. There needs to be a
  file there with that name that sources the *_vimrc* in here:

```vim
source ~\vimfiles\_vimrc
```
