ucasFL translating

Python-mode – A Vim Plugin to Develop Python Applications in Vim Editor
============================================================


Python-mode is a vim plugin that enables you to write Python code in [Vim editor][1] in a fast manner by utilizing libraries including pylint, rope, pydoc, pyflakes, pep8, autopep8, pep257 and mccabe for coding features such as static analysis, refactoring, folding, completion, documentation, and more.

**Suggested Read:** [Bash-Support – A Vim Plugin That Converts Vim Editor to Bash-IDE][2]

This plugin contains all the features that you can use to develop python applications in Vim editor.

#### Python-mode Features

It has the following notable features:

*   Support Python version 2.6+ and 3.2+.

*   Supports syntax highlighting.

*   Offers virtualenv support.

*   Supports python folding.

*   Offers enhanced python indentation.

*   Enables running of python code from within Vim.

*   Enables addition/removal of breakpoints.

*   Supports python motions and operators.

*   Enables code checking (pylint, pyflakes, pylama, …) that can be run simultaneouslyi>

*   Supports autofixing of PEP8 errors.

*   Allows searching in python documentation.

*   Supports code refactoring.

*   Supports strong code completion.

*   Supports going to definition.

In this tutorial, we will show you how to setup Vim to use Python-mode in Linux to develop Python applications in Vim editor.

### How to Install Python-mode for Vim in Linux

Start by installing [Pathogen][3] (makes it super easy to install plugins and runtime files in their own private directories) for easy installation of Python-mode.

Run the commands below to get the pathogen.vim file and the directories it needs:

```
# mkdir -p ~/.vim/autoload ~/.vim/bundle && \
# curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

Then add the following lines below to your ~/.vimrc file:

```
execute pathogen#infect()
syntax on
filetype plugin indent on
```

Once you have installed pathogen, and you can now put Python-mode into ~/.vim/bundle as follows.

```
# cd ~/.vim/bundle 
# git clone https://github.com/klen/python-mode.git
```

Then rebuild helptags in vim like this.

```
:helptags
```

You need to enable filetype-plugin (:help filetype-plugin-on) and filetype-indent (:help filetype-indent-on) to use python-mode.

### Install Python-mode in Debian and Ubuntu

Another way you can install python-mode in Debian and Ubuntu systems using PPA as shown.

```
$ sudo add-apt-repository https://klen.github.io/python-mode/deb main
$ sudo apt-get update
$ sudo apt-get install vim-python-mode
```

If you you encounter the message: “The following signatures couldn’t be verified because the public key is not available”, run the command below:

```
$ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B5DF65307000E266
```

Now enable python-mode using vim-addon-manager like so.

```
$ sudo apt install vim-addon-manager
$ vim-addons install python-mode
```

### Customizing Python-mode in Linux

To override the default key bindings, redefine them in the .vimrc files, for instance:

```
" Override go-to.definition key shortcut to Ctrl-]
let g:pymode_rope_goto_definition_bind = "<C-]>"
" Override run current python file key shortcut to Ctrl-Shift-e
let g:pymode_run_bind = "<C-S-e>"
" Override view python doc key shortcut to Ctrl-Shift-d
let g:pymode_doc_bind = "<C-S-d>"
```

Note that python-mode uses python 2 syntax checking by default. You can enable python 3 syntax checking by adding this in your .vimrc.

```
let g:pymode_python = 'python3'
```

You can find additional configuration options on the Python-mode Github Repository: [https://github.com/python-mode/python-mode][4]

That’s all for now! In this tutorial, we will show you how to integrate Vim to with Python-mode in Linux. Share your thoughts with us via the feedback form below.

--------------------------------------------------------------------------------

作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

------------------

via: https://www.tecmint.com/python-mode-a-vim-editor-plugin/

作者：[Aaron Kili  ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.tecmint.com/author/aaronkili/
[1]:https://www.tecmint.com/vi-editor-usage/
[2]:https://www.tecmint.com/use-vim-as-bash-ide-using-bash-support-in-linux/
[3]:https://github.com/tpope/vim-pathogen
[4]:https://github.com/python-mode/python-mode
[5]:https://www.tecmint.com/author/aaronkili/
[6]:https://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[7]:https://www.tecmint.com/free-linux-shell-scripting-books/
