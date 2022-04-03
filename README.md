kevzc's dotfiles
======================

Here are quick start instructions to downloading my dotifles for macOS
that may or may not completely ruin everything.
(Hopefully this works for any mac device, but i doubt i am that skillful...)

Sections that are marked with stars (\*) are optional and may be outdated.

Homebrew
--------

There are probably ways other than Homebrew to achieve the same thing,
but I'm too lazy to do anything else.

1. Install [Homebrew](https://brew.sh/).
2. Use Homebrew to install a bunch of stuff that macOS does not have for some reason:
```
brew install python java vim
```
3. If Xcode isn't installed, then maybe install gcc as well.
```
brew install gcc
```

MacVim and plugins
------------------

1. Install [MacVim](https://github.com/macvim-dev/macvim).
2. Install [powerline fonts](https://github.com/powerline/fonts).
```
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
```
3. Install [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe#macos).
    1. Use Homebrew to install the following:
    ```
    brew install cmake go nodejs mono
    ```
    2. Compile YCM in terminal:
    ```
    cd ~/.vim/bundle/YouCompleteMe
    python3 install.py --all
    ```

LaTeX
-----

1. Install [MacTeX](http://tug.org/mactex/).
2. Download PDF viewer [Skim](https://skim-app.sourceforge.io/).
3. Set up backward search for Skim.
    1. Go to preferences in Skim.
    2. In presets, select MacVim.

pyenv (\*)
----------

*(Note: pyenv does not make terminal have python 3 support.
Also, you should probably only use this if `brew install python` doesn't install Python 3.)*

Installing this is very very optional.
In fact, this section is only included in case I screw up
installing python.

Go [here](https://github.com/pyenv/pyenv#choosing-the-python-version).

Changing TEXMFHOME (\*)
-----------------------

*(Note: this section is kind of needless because the `.zshrc` file takes care of this,
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
