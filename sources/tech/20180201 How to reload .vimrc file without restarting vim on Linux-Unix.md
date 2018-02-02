How to reload .vimrc file without restarting vim on Linux/Unix
======

I am a new vim text editor user. I usually load ~/.vimrc usingfor configuration. Once edited my .vimrc file I need to reload it without having to quit Vim session. How do I edit my .vimrc file and reload it without having to restart Vim on Linux or Unix-like system?

Vim is free and open source text editor that is upwards compatible to Vi. It can be used to edit all kinds of good old text. It is especially useful for editing programs written in C/Perl/Python. One can use it for editing Linux/Unix configuration files. ~/.vimrc is your personal Vim initializations and customization file.

### How to reload .vimrc file without restarting vim session

The procedure to reload .vimrc in Vim without restart:

  1. Start vim text editor by typing: `vim filename`
  2. Load vim config file by typing vim command: `Esc` followed by `:vs ~/.vimrc`
  3. Add customization like:
  ```
  filetype indent plugin on
  set number
  syntax on
  ```
  4. Use `:wq` to save a file and exit from ~/.vimrc window.
  5. Reload ~/.vimrc by typing any one of the following command:
  ```
  :so $MYVIMRC
  ```
  OR
  ```
  :source ~/.vimrc
  ```

[![How to reload .vimrc file without restarting vim][1]][1]
Fig.01: Editing ~/.vimrc and reloading it when needed without quiting vim so that you can continuing editing program

The `:so[urce]! {file}` vim command read vim configfileor ommands from given file such as ~/.vimrc. These are commands that are executed from Normal mode, like you type them. When used after :global, :argdo, :windo, :bufdo, in a loop or when another command follows the display won't be updated while executing the commands.

### How to may keys for edit and reload ~/.vimrc

Append the following in your ~/.vimrc file
```
" Edit vimr configuration file
nnoremap confe :e $MYVIMRC<CR>
"

 Reload vims configuration file
nnoremap confr :source $MYVIMRC<CR>
```

" Edit vimr configuration file nnoremap confe :e $MYVIMRC<CR> " Reload vims configuration file nnoremap confr :source $MYVIMRC<CR>

Now just press `Esc` followed by `confe` to edit ~/.vimrc file. To reload type `Esc` followed by `confr`. Some people like to use the <Leader> key in a .vimrc file. So above mapping becomes:
```
" Edit vimr configuration file
nnoremap <Leader>ve :e $MYVIMRC<CR>
"
" Reload vimr configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>
```

" Edit vimr configuration file nnoremap <Leader>ve :e $MYVIMRC<CR> " " Reload vimr configuration file nnoremap <Leader>vr :source $MYVIMRC<CR>

The <Leader> key is mapped to \ by default. So you just press \ followed by ve to edit the file. To reload the ~/vimrc file you press \ followed by vr
And there you have it, you just reload .vimrc file without restarting vim ever.


### About the author

The author is the creator of nixCraft and a seasoned sysadmin and a trainer for the Linux operating system/Unix shell scripting. He has worked with global clients and in various industries, including IT, education, defense and space research, and the nonprofit sector. Follow him on [Twitter][2], [Facebook][3], [Google+][4]. Get the **latest tutorials on SysAdmin, Linux/Unix and open source topics via[my RSS/XML feed][5]**.

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/how-to-reload-vimrc-file-without-restarting-vim-on-linux-unix/

作者：[Vivek Gite][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz/
[1]:https://www.cyberciti.biz/media/new/faq/2018/02/How-to-reload-.vimrc-file-without-restarting-vim.jpg
[2]:https://twitter.com/nixcraft
[3]:https://facebook.com/nixcraft
[4]:https://plus.google.com/+CybercitiBiz
[5]:https://www.cyberciti.biz/atom/atom.xml
