How to access/view Python help when using vim
======

I am a new Vim text editor user. I am writing Python code. Is there is a way to see Python documentation within vim and without visiting the Internet? Say my cursor is under the print Python keyword, and I press F1. I want to look at the help for the print keyword. How do I show python help() inside vim? How do I call pydoc3/pydoc to seek help without leaving vim?

The pydoc or pydoc3 command show text documentation on the name of a Python keyword, topic, function, module, or package, or a dotted reference to a class or function within a module or module in a package. You can call pydoc from vim itself. Let us see how to access Python documentation using pydoc within vim text editor.

### Access python help using pydoc

The syntax is:
```
pydoc keyword
pydoc3 keyword
pydoc len
pydoc print
```
Edit your ~/.vimrc:
`$ vim ~/.vimrc`
Append the following configuration for pydoc3 (python v3.x docs). Create a mapping for H key that works in normal mode:
```
nnoremap <buffer> H :<C-u>execute "!pydoc3 " . expand("<cword>")<CR>
```


Save and close the file. Open vim text editor:
`$ vim file.py`
Write some code:
```
#!/usr/bin/python3
x=5
y=10
z=x+y
print(z)
print("Hello world")
```

Position cursor under the print Python keyword and press Shift followed by H. You will see output as follows:

[![Access Python Help Within Vim][1]][1]
Gif.01: Press H to view help for the print Python keyword

### How to view python help when using vim

[jedi-vim][2] is a VIM binding to the autocompletion library Jed. It can do many things including display help for keyword when you press Shift followed by K i.e. press capital K.

#### How to install jedi-vim on Linux or Unix-like system

Use [pathogen][3], [vim-plug][4] or [Vundle][5] to install jedi-vim. I am using Vim-Plug. Add the following line in ~/vimrc:
`Plug 'davidhalter/jedi-vim'`
Save and close the file. Start vim and type:
`PlugInstall`
On Arch Linux, you can also install jedi-vim from official repositories as vim-jedi using pacman command:
`$ sudo pacman -S vim-jedi`
It is also available on Debian (?8) and Ubuntu (?14.04) as vim-python-jedi using [apt command][6]/[apt-get command][7]:
`$ sudo apt install vim-python-jedi`
On Fedora Linux, it is available as vim-jedi using dnf command:
`$ sudo dnf install vim-jedi`
Jedi is by default automatically initialized. So no further configuration needed on your part. To see Documentation/Pydoc press K. It shows a popup with assignments:
[![How to view python help when using vim][8]][8]

### about the author

The author is the creator of nixCraft and a seasoned sysadmin and a trainer for the Linux operating system/Unix shell scripting. He has worked with global clients and in various industries, including IT, education, defense and space research, and the nonprofit sector. Follow him on [Twitter][9], [Facebook][10], [Google+][11].

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/how-to-access-view-python-help-when-using-vim/

作者：[Vivek Gite][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/media/new/faq/2018/01/Access-Python-Help-Within-Vim.gif
[2]:https://github.com/davidhalter/jedi-vim
[3]:https://github.com/tpope/vim-pathogen
[4]:https://www.cyberciti.biz/programming/vim-plug-a-beautiful-and-minimalist-vim-plugin-manager-for-unix-and-linux-users/
[5]:https://github.com/gmarik/vundle
[6]:https://www.cyberciti.biz/faq/ubuntu-lts-debian-linux-apt-command-examples/ (See Linux/Unix apt command examples for more info)
[7]:https://www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html (See Linux/Unix apt-get command examples for more info)
[8]:https://www.cyberciti.biz/media/new/faq/2018/01/How-to-view-Python-Documentation-using-pydoc-within-vim-on-Linux-Unix.jpg
[9]:https://twitter.com/nixcraft
[10]:https://facebook.com/nixcraft
[11]:https://plus.google.com/+CybercitiBiz
