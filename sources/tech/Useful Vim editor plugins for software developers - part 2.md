GHLandy Translating

Useful Vim editor plugins for software developers - part 2: Syntastic
============

There's no doubt that Vim is a capable programming editor out-of-the-box, but it's the editor's plugins that help you make the most out of it. In the [first part][39] of this article series, we discussed a couple of programing-related Vim plugins (Tagbar and delimitMate). Continuing on the same path, in this article, we will discuss another useful Vim plugin aimed at software developers - Syntastic.

Please note that all the examples, commands, and instructions mentioned in this tutorial have been tested on Ubuntu 16.04, and the Vim version we've used is 7.4.

### Syntastic

If your software development work involves working with languages like C and C++, it's needless to say that resolving compile time errors would be part of your daily work. Many a times, compilation errors arise due to incorrect syntax used in source code, as developers fail to observe them while just looking at the code.

What if I tell you there exists a Vim plugin that provides information about syntax errors without you having to compile your code? Yes, such a plugin exists, and it's name is Syntastic.

"Syntastic is a syntax checking plugin for [Vim][38] that runs files through external syntax checkers and displays any resulting errors to the user. This can be done on demand, or automatically as files are saved," the [official documentation][37] of the plugin says. "If syntax errors are detected, the user is notified and is happy because they didn't have to compile their code or execute their script to find them."

Installation of this plugin is similar to the way we installed the ones that were discussed in the first part - all you need to do is to run the following commands:

```
cd ~/.vim/bundle/

git clone https://github.com/scrooloose/syntastic.git
```

Once the plugin is installed successfully (meaning the above commands are successful), you don't have to do anything else - it loads automatically when the Vim editor is launched.

Now, to use the plugin, open a source code file and save it using the :w Vim command. After a very brief pause, you'll observe that syntax errors - if any - in your code will be highlighted. For example, the following screenshot should give you an idea about how the plugin highlights the errors:

[![Vim Syntax error highlighting](https://www.howtoforge.com/images/3337/syntastic-error-highlight.png)][36]

The '>>' sign in the beginning of a line indicates that there's some problem with the code written in that line. To know what exactly the error is, or at-least get a rough idea about it, bring the cursor to that line - the error description will be displayed at the bottom of the Vim window. 

[![View Syntax errors in Vim](https://www.howtoforge.com/images/3337/syntastic-error-descr.png)][35]

So this way, you can resolve most of the syntax-related errors without even compiling the code.

Moving on, if you run the :Errors command, description of all the syntax-related errors in the current source file will be displayed. For example, running the:Errors command in my case brought up the following information:

[![Syntastic :Errors command](https://www.howtoforge.com/images/3337/syntastic-error-all-descr.png)][34]

Keep in mind that the information the :Errors command displays isn't auto-refreshed, meaning even after an error is resolved, it's description will be there at the bottom area until you run the :Errors command again.

It's worth mentioning that there are [many configuration options][33] that make Syntastic even more user-friendly. For example, you can put the following line in your .vimrc file if you want the :Errors command to automatically update its output each time an error is resolved:

```
let g:syntastic_always_populate_loc_list = 1
```

To make sure that Syntastic highlights the errors automatically when a file is opened, add the following line to your .vimrc file:

```
let g:syntastic_check_on_open = 1
```
```
let g:syntastic_auto_jump = 1
```

"When set to 2 the cursor will jump to the first issue detected, but only if this issue is an error," and "when set to 3 the cursor will jump to the first error detected, if any. If all issues detected are warnings, the cursor won't jump."

The following information should also be useful to you:

"Use :SyntasticCheck to manually check" for errors. "Use :Errors to open the location-list window, and :lclose to close it. You can clear the error list with:SyntasticReset, and you can use :SyntasticToggleMode to switch between active (checking on writing the buffer) and passive (manual) checking."

Note: Syntastic isn't just limited to code written in C and C++. It supports a huge list of other programming languages as well - head [here][32] to learn more about it.

### Conclusion

Undoubtedly, Syntastic is a very useful Vim plugin as it saves you from the hassle of frequent compilation at-least when it comes to syntax-related errors. And not to mention that a lot of your time gets saved as well. 

As you would have observed, Syntastic becomes even more useful once you've configured some of its main options.  To help you get started with this, the official documentation contains a 'Recommended settings' section - do go through that. There is a nice little FAQ section as well in case you face some errors or have some doubts or queries.

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/vim-editor-plugins-for-software-developers-2-syntastic/

作者：[Ansh][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.howtoforge.com/tutorial/vim-editor-plugins-for-software-developers-2-syntastic/
[1]:[https://www.youtube.com/channel/UCOfXyFkINXf_e9XNosTJZDw]
[2]:[https://www.youtube.com/user/desainew]
[3]:[https://www.youtube.com/channel/UCEQXp_fcqwPcqrzNtWJ1w9w]
[4]:[http://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Ffreedompenguin.com%2Farticles%2Fopinion%2Fopen-source-design-thing%2F]
[5]:[http://twitter.com/intent/tweet/?text=Is+Open+Source+Design+a+Thing%3F&url=https%3A%2F%2Ffreedompenguin.com%2Farticles%2Fopinion%2Fopen-source-design-thing%2F]
[6]:[https://plus.google.com/share?url=https%3A%2F%2Ffreedompenguin.com%2Farticles%2Fopinion%2Fopen-source-design-thing%2F]
[7]:[https://atom.io/]
[8]:[http://froont.com/]
[9]:[https://webflow.com/]
[10]:[https://gravit.io/]
[11]:[http://getbootstrap.com/]
[12]:[https://inkscape.org/en/]
[13]:[https://www.gimp.org/]
[14]:[https://en.wikipedia.org/wiki/Free_and_open-source_software]
[15]:[https://medium.com/dawn-capital/why-leverage-the-power-of-open-source-to-build-a-successful-software-business-8aba6f665bc4#.ggmn2ojxp]
[16]:[https://github.com/majutsushi/tagbar]
[17]:[http://ctags.sourceforge.net/]
[18]:[https://github.com/majutsushi/tagbar/zipball/70fix]
[19]:[https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim]
[20]:[http://www.vim.org/scripts/script.php?script_id=2332]
[21]:[https://www.howtoforge.com/tutorial/vim-editor-plugins-for-software-developers-2-syntastic/]
[22]:[https://www.howtoforge.com/images/vim-editor-plugins-for-software-developers/big/vimplugins-delimitmate-help.png]
[23]:[https://github.com/Raimondi/delimitMate]
[24]:[https://www.howtoforge.com/images/vim-editor-plugins-for-software-developers/big/vimplugins-tagbar-visibility.png]
[25]:[https://www.howtoforge.com/images/vim-editor-plugins-for-software-developers/big/vimplugins-tagbar-ex2.png]
[26]:[https://www.howtoforge.com/images/vim-editor-plugins-for-software-developers/big/vimplugins-tagbar-example.png]
[27]:[http://www.tldp.org/LDP/intro-linux/html/sect_06_02.html]
[28]:[http://majutsushi.github.io/tagbar/]
[29]:[http://vi.stackexchange.com/questions/388/what-is-the-difference-between-the-vim-plugin-managers]
[30]:[https://www.howtoforge.com/images/vim-editor-plugins-for-software-developers/big/vimplugins-vimrc.png]
[31]:[http://www.vim.org/]
[32]:[https://github.com/scrooloose/syntastic]
[33]:[https://github.com/scrooloose/syntastic/blob/master/doc/syntastic.txt]
[34]:[https://www.howtoforge.com/images/3337/big/syntastic-error-all-descr.png]
[35]:[https://www.howtoforge.com/images/3337/big/syntastic-error-descr.png]
[36]:[https://www.howtoforge.com/images/3337/big/syntastic-error-highlight.png]
[37]:[https://github.com/scrooloose/syntastic]
[38]:[http://www.vim.org/]
[39]:[https://www.howtoforge.com/tutorial/vim-editor-plugins-for-software-developers/]
