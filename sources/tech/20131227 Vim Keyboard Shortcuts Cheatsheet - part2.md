Martin translating...

Vim Keyboard Shortcuts Cheatsheet
============================================================
 ![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2013/12/vim-shortcut-cheatsheet-featured.jpg "Vim Keyboard Shortcuts Cheatsheets") 

This article is part of the [VIM User Guide][12] series:

*   [The Beginner’s Guide to Start Using Vim][3]
*   Vim Keyboard Shortcuts Cheatsheet
*   [5 Vim Tips and Tricks for Experienced Users][4]
*   [3 Useful VIM Editor Tips and Tricks for Advanced Users][5]

The Vim editor is a command-line based tool that’s an enhanced version of the venerable vi editor. Despite the abundance of graphical rich text editors, familiarity with Vim will help every Linux user — from an experienced system administrator to a newbie Raspberry Pi user.


The light-weight editor is a very powerful tool. In the hands of an experienced operator, it can do wonders. Besides regular text editing functions, the editor also supports advanced features such as find & replace based on regular expressions and encoding conversion as well as programming features such as syntax highlighting and code folding.

One important thing to note when using Vim, is that the function of a key depends on the “mode” the editor is in. For example, pressing the alphabet “j” will move the cursor down one line in the “command mode”. You’ll have to switch to the “insert mode” to make the keys input the character they represent.

Here’s a cheatsheet to help you get the most out of Vim.




### Main

| Shortcut Keys | Function |
| --- | --- |
| Escape key | Gets out of the current mode into the “command mode”. All keys are bound of commands. |
| i | “Insert mode” for inserting text. Keys behave as expected. |
| : | “Last-line mode” where Vim expects you to enter a command such as to save the document. |



### Navigation keys

| Shortcut Keys | Function |
| --- | --- |
| h | moves the cursor one character to the left. |
| j or Ctrl + J | moves the cursor down one line. |
| k or Ctrl + P | moves the cursor up one line. |
| l | moves the cursor one character to the right. |
| 0 | moves the cursor to the beginning of the line. |
| $ | moves the cursor to the end of the line. |
| ^ | moves the cursor to the first non-empty character of the line |
| w | move forward one word (next alphanumeric word) |
| W | move forward one word (delimited by a white space) |
| 5w | move forward five words |
| b | move backward one word (previous alphanumeric word) |
| B | move backward one word (delimited by a white space) |
| 5b | move backward five words |
| G | move to the end of the file |
| gg | move to the beginning of the file. |



### Navigate around the document

| Shortcut Keys | Function |
| --- | --- |
| ( | jumps to the previous sentence |
| ) | jumps to the next sentence |
| { | jumps to the previous paragraph |
| } | jumps to the next paragraph |
| [[ | jumps to the previous section |
| ]] | jumps to the next section |
| [] | jump to the end of the previous section |
| ][ | jump to the end of the next section |



### Insert text

| Shortcut Keys | Function |
| --- | --- |
| a | Insert text after the cursor |
| A | Insert text at the end of the line |
| i | Insert text before the cursor |
| o | Begin a new line below the cursor |
| O | Begin a new line above the cursor |



### Special inserts

| Shortcut Keys | Function |
| --- | --- |
| :r [filename] | Insert the file [filename] below the cursor |
| :r ![command] | Execute [command] and insert its output below the cursor |



### Delete text

| Shortcut Keys | Function |
| --- | --- |
| x | delete character at cursor |
| dw | delete a word. |
| d0 | delete to the beginning of a line. |
| d$ | delete to the end of a line. |
| d) | delete to the end of sentence. |
| dgg | delete to the beginning of the file. |
| dG | delete to the end of the file. |
| dd | delete line |
| 3dd | delete three lines |

### Simple replace text

| Shortcut Keys | Function |
| --- | --- |
| r{text} | Replace the character under the cursor with {text} |
| R | Replace characters instead of inserting them |

### Copy/Paste text

| Shortcut Keys | Function |
| --- | --- |
| yy | copy current line into storage buffer |
| ["x]yy | Copy the current lines into register x |
| p | paste storage buffer after current line |
| P | paste storage buffer before current line |
| ["x]p | paste from register x after current line |
| ["x]P | paste from register x before current line |

### Undo/Redo operation

| Shortcut Keys | Function |
| --- | --- |
| u | undo the last operation. |
| Ctrl+r | redo the last undo. |

### Search and Replace keys

| Shortcut Keys | Function |
| --- | --- |
| /search_text | search document for search_text going forward |
| ?search_text | search document for search_text going backward |
| n | move to the next instance of the result from the search |
| N | move to the previous instance of the result |
| :%s/original/replacement | Search for the first occurrence of the string “original” and replace it with “replacement” |
| :%s/original/replacement/g | Search and replace all occurrences of the string “original” with “replacement” |
| :%s/original/replacement/gc | Search for all occurrences of the string “original” but ask for confirmation before replacing them with “replacement” |

### Bookmarks

| Shortcut Keys | Function |
| --- | --- |
| m {a-z A-Z} | Set bookmark {a-z A-Z} at the current cursor position |
| :marks | List all bookmarks |
| `{a-z A-Z} | Jumps to the bookmark {a-z A-Z} |


### Select text

| Shortcut Keys | Function |
| --- | --- |
| v | Enter visual mode per character |
| V | Enter visual mode per line |
| Esc | Exit visual mode |


### Modify selected text

| Shortcut Keys | Function |
| --- | --- |
| ~ | Switch case |
| d | delete a word. |
| c | change |
| y | yank |
| > | shift right |
| < | shift left |
| ! | filter through an external command |


### Save and quit

| Shortcut Keys | Function |
| --- | --- |
| :q | Quits Vim but fails when file has been changed |
| :w | Save the file |
| :w new_name | Save the file with the new_name filename |
| :wq | Save the file and quit Vim. |
| :q! | Quit Vim without saving the changes to the file. |
| ZZ | Write file, if modified, and quit Vim |
| ZQ | Same as :q! Quits Vim without writing changes |

### Download VIM Keyboard Shortcuts Cheatsheet

Can’t get enough of this? We have prepared a downloadable cheat sheet for you so you can access to it when you need it.

[Download it here!][14]

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/vim-keyboard-shortcuts-cheatsheet/

作者：[Himanshu Arora][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/himanshu/
[1]:https://www.maketecheasier.com/author/mayank/
[2]:https://www.maketecheasier.com/vim-keyboard-shortcuts-cheatsheet/#comments
[3]:https://www.maketecheasier.com/start-with-vim-linux/
[4]:https://www.maketecheasier.com/vim-tips-tricks-for-experienced-users/
[5]:https://www.maketecheasier.com/vim-tips-tricks-advanced-users/
[6]:https://www.maketecheasier.com/category/linux-tips/
[7]:http://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.maketecheasier.com%2Fvim-keyboard-shortcuts-cheatsheet%2F
[8]:http://twitter.com/share?url=https%3A%2F%2Fwww.maketecheasier.com%2Fvim-keyboard-shortcuts-cheatsheet%2F&text=Vim+Keyboard+Shortcuts+Cheatsheet
[9]:mailto:?subject=Vim%20Keyboard%20Shortcuts%20Cheatsheet&body=https%3A%2F%2Fwww.maketecheasier.com%2Fvim-keyboard-shortcuts-cheatsheet%2F
[10]:https://www.maketecheasier.com/locate-system-image-tool-in-windows-81/
[11]:https://www.maketecheasier.com/create-system-image-in-windows8/
[12]:https://www.maketecheasier.com/series/vim-user-guide/
[13]:https://support.google.com/adsense/troubleshooter/1631343
[14]:http://www.maketecheasier.com/cheatsheet/vim-keyboard-shortcuts-cheatsheet/
