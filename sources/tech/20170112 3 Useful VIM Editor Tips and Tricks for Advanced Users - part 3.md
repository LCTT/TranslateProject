ucasFL translating
3 Useful VIM Editor Tips and Tricks for Advanced Users
============================================================

![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/01/vim-featured.jpg "3 Useful VIM Editor Tips and Tricks for Advanced Userss")

This article is part of the [VIM User Guide][12] series:

*   [The Beginner’s Guide to Start Using Vim][3]
*   [Vim Keyboard Shortcuts Cheatsheet][4]
*   [5 Vim Tips and Tricks for Experienced Users][5]
*   3 Useful VIM Editor Tips and Tricks for Advanced Users

Vim is undoubtedly a very powerful text editor. It offers a plethora of features which means that studying and remembering every Vim functionality isn’t practically possible. But what we can do at least is keep learning easier ways of doing things so that our experience with the editor keeps on getting better with time.

With that in mind, in this article we will discuss some Vim editor tips/tricks that are aimed at advanced users.

**Note**: If you are completely new to Vim, you can first go through our [getting started guide][14]. For those who’ve just started using the editor, I’m sure our [Vim keyboard shortcuts cheatsheet][15] will be extremely useful to you. And if you’re already an experienced user, you might also want to find out [some tips and tricks for experienced users][16].

Please note that all the tips mentioned in this article have been mostly explained using easy-to-understand coding situations, as they come in really handy while software development. But that does not mean normal users (who aren’t coders and use Vim for general text editing) can’t use them in their work.

### 1\. Set file specific variables

There may be times when – in a particular file – you would want any tab character that you type to get replaced by spaces. Or you may want a source code file to use two spaces for indentation even if the editor’s default indentation is set to four spaces.

Basically we’re talking about file-specific changes here. There’s a feature that Vim provides which allows you to change certain settings only for a particular file. That feature is called “Modeline.”

For example, to make sure that each tab you type gets replaced by spaces, all you have to do is to add the following modeline in the first or last few lines of the file in question:

```
# vim: set expandtab:
```

And to change the indentation from default (4) to 2, use the following modeline in the source file:

```
// vim: noai:ts=2:sw=2
```

Here are some important points that you need to keep in mind when dealing with modelines:

*   Modelines should only be added in the first or last five lines of the file.
*   The “modeline” option must be set (`:set modeline`) in the “.vimrc” file order to take advantage of this feature.
*   The feature is off by default when editing as root.

For more information, head to the feature’s [official documentation][17].

### 2\. Keyword completion

As you start writing more and more complex code or start working on large source files, you deal with several variable names. Sometimes it’s not easy to remember all the names, so whenever you have to write a variable name you usually copy it from where it’s already used.

Thankfully, with Vim you can just write some initial letters of the variable. Without leaving the Insert mode, press “Ctrl + n” or “Ctrl + p” to get a list of matching keywords. While “Ctrl + n” is used to insert the next matching word, “Ctrl + p” gives you a list of previous matching words.

Here’s this feature in action.

 ![vim-keyword-completion1](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/01/vim-keyword-completion1.jpg "vim-keyword-completion1")

As is clear from the screenshot above, the list that pops up also contains words from other source files. For more information on this feature, head [here][18].

### 3\. Searching

Suppose you are debugging your code, and as part of that you need to quickly see all the occurrences of a variable in a file. A commonly used way to do this is to come out of the Insert mode, write `/[var-name]`, press Enter, and then go back and forth using the “n” and “p” keys.

There’s no problem with the aforementioned approach, per se, but there’s a slightly more easier and quicker way to do this kind of search. For that, first you have to make sure that you are out of Insert mode and that the cursor is under the word/variable you’re trying to search, which isn’t time consuming at all. And next, all you have to do is press “Shift + *.”

Do this repeatedly, and the editor will quickly take you to all the places where the word/variable is used in the file.

### Conclusion

Although aimed at advanced users, the tips/tricks discussed here aren’t difficult to understand and use. If your basics are clear, you can really benefit from them. Needless to say, as with any new feature or concept, you need to practice these tips to make them a habit.


--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/vim-tips-tricks-advanced-users/

作者：[Himanshu Arora][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/himanshu/
[1]:https://www.maketecheasier.com/author/himanshu/
[2]:https://www.maketecheasier.com/vim-tips-tricks-advanced-users/#respond
[3]:https://www.maketecheasier.com/start-with-vim-linux/
[4]:https://www.maketecheasier.com/vim-keyboard-shortcuts-cheatsheet/
[5]:https://www.maketecheasier.com/vim-tips-tricks-for-experienced-users/
[6]:https://www.maketecheasier.com/category/linux-tips/
[7]:http://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.maketecheasier.com%2Fvim-tips-tricks-advanced-users%2F
[8]:http://twitter.com/share?url=https%3A%2F%2Fwww.maketecheasier.com%2Fvim-tips-tricks-advanced-users%2F&text=3+Useful+VIM+Editor+Tips+and+Tricks+for+Advanced+Users
[9]:mailto:?subject=3%20Useful%20VIM%20Editor%20Tips%20and%20Tricks%20for%20Advanced%20Users&body=https%3A%2F%2Fwww.maketecheasier.com%2Fvim-tips-tricks-advanced-users%2F
[10]:https://www.maketecheasier.com/opt-out-google-personalized-ads/
[11]:https://www.maketecheasier.com/wi-fi-vs-ethernet-vs-4g/
[12]:https://www.maketecheasier.com/series/vim-user-guide/
[13]:https://support.google.com/adsense/troubleshooter/1631343
[14]:https://www.maketecheasier.com/start-with-vim-linux/
[15]:https://www.maketecheasier.com/vim-keyboard-shortcuts-cheatsheet/
[16]:https://www.maketecheasier.com/vim-tips-tricks-for-experienced-users/
[17]:http://vim.wikia.com/wiki/Modeline_magic
[18]:http://vim.wikia.com/wiki/Any_word_completion
