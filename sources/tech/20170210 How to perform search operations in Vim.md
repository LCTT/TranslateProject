How to perform search operations in Vim
============================================================

### On this page

1.  [Customize your search][5]
    1.  [1\. Search highlighting][1]
    2.  [2\. Making search case-insensitive][2]
    3.  [3\. Smartcase search][3]
    4.  [4\. Incremental search][4]
2.  [Some other cool Vim search tips/tricks][6]
3.  [Conclusion][7]

While we've already [covered][8] several features of Vim until now, the editor's feature-set is so vast that no matter how much you learn, it doesn't seem to be enough. So continuing with our Vim tutorial series, in this write-up, we will discuss the various search techniques that the editor offers.

But before we do that, please note that all the examples, commands, and instructions mentioned in this tutorial have been tested on Ubuntu 14.04, and the Vim version we've used is 7.4.

### Basic search operations in Vim

If you have opened a file in the Vim editor, and want to search a particular word or pattern, the first step that you have to do is to come out of the Insert mode (if you that mode is currently active). Once that is done, type '**/**' (without quotes) followed by the word/pattern that you want to search.

For example, if the word you want to search is 'linux', here's how it will appear at the bottom of your Vim window:

[
 ![Search for words in vim](https://www.howtoforge.com/images/perform-search-operations-in-vim/vim-basic-search.png) 
][9]

After this, just hit the Enter key and you'll see that Vim will place the cursor on the first line (containing the word) that it encounters beginning from the line where the cursor was when you were in Insert mode. If you've just opened a file and began searching then the search operation will start from the very first line of the file.

To move on to the next line containing the searched word, press the '**n**' key. When you've traversed through all the lines containing the searched pattern, pressing the '**n**' key again will make the editor to repeat the search, and you'll be back to the first searched occurrence again.

[
 ![Move to next search hit](https://www.howtoforge.com/images/perform-search-operations-in-vim/vim-search-end.png) 
][10]

While traversing the searched occurrences, if you want to go back to the previous occurrence, press '**N**' (shift+n). Also, it's worth mentioning that at any point in time, you can type '**ggn**' to jump to the first match, or '**GN**' to jump to the last.

In case you are at the bottom of a file, and want to search backwards, then instead of initiating the search with **/**, use **?**. Here's an example:

[
 ![search backwards](https://www.howtoforge.com/images/perform-search-operations-in-vim/vim-search-back.png) 
][11]

### Customize your search

### 1\. Search highlighting

While jumping from one occurrence of the searched word/pattern to another is easy using 'n' or 'N,' things become more user-friendly if the searched occurrences get highlighted. For example, see the screenshot below:

[
 ![Search Highlighting in VIM](https://www.howtoforge.com/images/perform-search-operations-in-vim/vim-highlight-search.png) 
][12]

This can be made possible by setting the 'hlsearch' variable, something which you can do by writing the following in the normal/command mode:

```
:set hlsearch
```

[
 ![set hlsearch](https://www.howtoforge.com/images/perform-search-operations-in-vim/vim-set-hlsearch.png) 
][13]

### 2\. Making search case-insensitive

By default, the search you do in Vim is case-sensitive. This means that if I am searching for 'linux', then 'Linux' won't get matched. However, if that's not what you are looking for, then you can make the search case-insensitive using the following command:

```
:set ignorecase
```

So after I set the 'ignorecase' variable using the aforementioned command, and searched for 'linux', the occurrences of 'LINUX' were also highlighted:

[
 ![search case-insensitive](https://www.howtoforge.com/images/perform-search-operations-in-vim/vim-search-case.png) 
][14]

### 3\. Smartcase search

Vim also offers you a feature using which you can ask the editor to be case-sensitive only when the searched word/pattern contains an uppercase character. For this you need to first set the 'ignorecase' variable and then set the 'smartcase' variable.

```
:set ignorecase
:set smartcase
```

For example, if a file contains both 'LINUX' and 'linux,' and smartcase is on, then only occurrences of the word LINUX will be searched if you search using '/LINUX'. However, if the search is '/linux', then all the occurrences will get matched irrespective of whether they are in caps or not.

### 4\. Incremental search

Just like, for example, Google, which shows search results as you type your query (updating them with each alphabet you type), Vim also provides incremental search. To access the feature, you'll have to execute the following command before you start searching:

```
:set incsearch
```

### Some other cool Vim search tips/tricks

There are several other search-related tips tricks that you may find useful.

To start off, if you want to search for a word that's there in the file, but you don't want to type it, you can just bring your cursor below it and press ***** (or **shift+8**). And if you want to launch a partial search (for example: search both 'in' and 'terminal'), then you can bring the cursor under the word (in our example, in) and search by pressing **g*** (press 'g' once and then keep pressing *) on the keyboard.

Note: Press **#** or **g#** in case you want to search backwards.

Next up, if you want, you can get a list of all occurrences of the searched word/pattern along with the respective lines and line numbers at one place. This can be done by type **[I** after you've initiated the search. Following is an example of how the results are grouped and displayed at the bottom of Vim window:

[
 ![grouped search results](https://www.howtoforge.com/images/perform-search-operations-in-vim/vim-results-list.png) 
][15]

Moving on, as you might already know, the Vim search wraps by default, meaning after reaching the end of the file (or to the last occurrence of the searched word), pressing "search next" brings the cursor to the first occurrence again. If you want, you can disable this search wrapping by running the following command:

```
:set nowrapscan
```

To enable wrap scan again, use the following command:

```
:set wrapscan
```

Finally, suppose you want to make a slight change to an already existing word in the file, and then perform the search operation, then one way is to type **/** followed by that word. But if the word in long or complicated, then it may take time to type it.

An easy way out is to bring the cursor under the word you want to slightly edit, then press '/' and then press Ctrl-r followed by Ctrl-w. The word under the cursor will not only get copied, it will be pasted after '/' as well, allowing you to easily edit it and go ahead with the search operation.

For more tricks (including how you can use your mouse to make things easier in Vim), head to the [official Vim documentation][16].

### Conclusion

Of course, nobody expects you to mug up all the tips/tricks mentioned here. What you can do is, start with the one you think will be the most beneficial to you, and practice it regularly. Once it gets embedded in your memory and becomes a habit, come here again, and see which one you should learn next.

Do you know any more such tricks? Want to share it with everyone in the HTF community? Then leave it as a comment below.

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/perform-search-operations-in-vim/

作者：[Himanshu Arora][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/perform-search-operations-in-vim/
[1]:https://www.howtoforge.com/tutorial/perform-search-operations-in-vim/#-search-highlighting
[2]:https://www.howtoforge.com/tutorial/perform-search-operations-in-vim/#-making-searchnbspcaseinsensitive
[3]:https://www.howtoforge.com/tutorial/perform-search-operations-in-vim/#-smartcase-search
[4]:https://www.howtoforge.com/tutorial/perform-search-operations-in-vim/#-incremental-search
[5]:https://www.howtoforge.com/tutorial/perform-search-operations-in-vim/#customize-your-search
[6]:https://www.howtoforge.com/tutorial/perform-search-operations-in-vim/#some-other-cool-vim-search-tipstricks
[7]:https://www.howtoforge.com/tutorial/perform-search-operations-in-vim/#conclusion
[8]:https://www.howtoforge.com/tutorial/vim-editor-modes-explained/
[9]:https://www.howtoforge.com/images/perform-search-operations-in-vim/big/vim-basic-search.png
[10]:https://www.howtoforge.com/images/perform-search-operations-in-vim/big/vim-search-end.png
[11]:https://www.howtoforge.com/images/perform-search-operations-in-vim/big/vim-search-back.png
[12]:https://www.howtoforge.com/images/perform-search-operations-in-vim/big/vim-highlight-search.png
[13]:https://www.howtoforge.com/images/perform-search-operations-in-vim/big/vim-set-hlsearch.png
[14]:https://www.howtoforge.com/images/perform-search-operations-in-vim/big/vim-search-case.png
[15]:https://www.howtoforge.com/images/perform-search-operations-in-vim/big/vim-results-list.png
[16]:http://vim.wikia.com/wiki/Searching
