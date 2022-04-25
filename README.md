kevzc's dotfiles
======================

Here are quickstart instructions to downloading my dotifles for macOS
that may or may not completely ruin everything.
(Hopefully this works for any mac device, but i doubt i am that skillful...)

For this to even have a chance of working, you should probably have the following:

- [macOS](https://en.wikipedia.org/wiki/MacOS) as an OS
- [Vim](https://en.wikipedia.org/wiki/Vim_(text_editor)) as a text editor
    - [MacVim](https://github.com/macvim-dev/macvim) as a GUI
    - [vim-plug](https://github.com/junegunn/vim-plug) as a plugin manager
- [MacTeX](http://tug.org/mactex/) as a TeX distribution
    - [Skim](https://skim-app.sourceforge.io/) as a PDF viewer for backward search
- [Xcode](https://en.wikipedia.org/wiki/Xcode) for C-family languages
    (there are definitely better ways of doing this, but i'm lazy)
- [zsh](https://en.wikipedia.org/wiki/Z_shell) as a shell
    (but [Bash](https://en.wikipedia.org/wiki/Bash_(Unix_shell)) might work as well)

If you somehow don't know how to install any of the above, see [requirements](#requirements).

If you have almost everything here and are daring enough, you can try to run
```
./install.sh
```
What this does is create a bunch of symlinks from wherever you clone this repo to `$HOME`.
There are two things to watch out for though:

- If terminal says you don't have permision to execute `install.sh`, try running `chmod +x install.sh`
before running `./install.sh`.

- Sometimes when running `./install.sh`, if `.vim` already exists in `$HOME`, there might be errors when
trying to remove some of the plugins (in either `$HOME/.vim/plugged` or wherever you keep your plugins).
For instance, some YCM stuff might not give you permission to remove it. Because of this, it might be better
to remove `$HOME/.vim` manually before running `./install.sh`.

After successfully running `./install.sh`, go to [Vim plugins](#vim-plugins).


Contents
--------
- [Requirements](#requirements)
- [Vim plugins](#vim-plugins)
- [Optional stuff](#optional-stuff)
    - [pyenv](#pyenv)
    - [Changing TEXMFHOME](#changing-texmfhome)


Requirements
------------

1. Install [Homebrew](https://brew.sh/).
2. Use Homebrew to install a bunch of stuff that macOS does not have for some reason:
```
brew install python java vim
```
3. Install [MacVim](https://github.com/macvim-dev/macvim).
4. Install [MacTeX](http://tug.org/mactex/).
5. Install [Xcode](https://en.wikipedia.org/wiki/Xcode) from App Store.


Vim plugins
-----------

1. Install [vim-plug](https://github.com/junegunn/vim-plug).
2. Run `:PlugInstall` in Vim.
3. Set up backward search for [VimTeX](https://github.com/lervag/vimtex).
    If your PDF viewer is Skim, do the following:
    1. Go to preferences in Skim.
    2. In presets, select MacVim.
4. Install [powerline fonts](https://github.com/powerline/fonts) for [vim-airline](https://github.com/vim-airline/vim-airline)
```
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
```
5. Install [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe#macos).
    1. Use Homebrew to install the following:
    ```
    brew install cmake go nodejs mono
    ```
    2. Compile YCM in terminal:
    ```
    cd ~/.vim/plugged/YouCompleteMe
    python3 install.py --all
    ```


Optional stuff
--------------

Everything here is optional and may be outdated.

### pyenv

*(Note: pyenv does not make terminal have python 3 support.
Also, you should probably only use this if `brew install python` doesn't install Python 3.)*

Installing this is very very optional.
In fact, this section is only included in case I screw up
installing python.

Go [here](https://github.com/pyenv/pyenv#choosing-the-python-version).

### Changing TEXMFHOME

*(Note: this is kind of needless because the `.zshrc` file takes care of this,
but I kept this for my own knowledge.)*

The variable `TEXMFHOME` stores the custom package directory.
To find the location of `TEXMFHOME`, run the followin in terminal:
```
kpsewhich -var-value TEXMFHOME
```
By default, the output will be:
```
/Users/[name]/Library/texmf
```
If you are in a rush (and the `.zshrc` files isn't working), put your files in there.
Otherwise, you can change the defaul location as follows:


(References: see [here](https://tex.stackexchange.com/questions/1137/where-do-i-place-my-own-sty-or-cls-files-to-make-them-available-to-all-my-te),
[here](https://tex.stackexchange.com/a/438811), and [here](https://askubuntu.com/questions/562310/how-to-edit-read-only-file-in-etc).)

1. Go on terminal and change directory to the following location:
```
cd /usr/local/texlive
```
2. Type ls. There should be a folder with the current year on it (e.g. 2020). Change directory to that folder (e.g. cd 2020).
3. Edit the file texmf.cnf by typing the following code in terminal:
```
sudo vi texmf.cnf
```
4. Change the 10th line from
```
TEXMFHOME = ~/Library/texmf
```
to
```
TEXMFHOME = ~/.texmf
```
5. Save and quit.
