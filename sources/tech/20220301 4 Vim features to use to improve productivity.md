[#]: subject: "4 Vim features to use to improve productivity"
[#]: via: "https://opensource.com/article/22/3/vim-features-productivity"
[#]: author: "Hunter Coleman https://opensource.com/users/hunterc"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

4 Vim features to use to improve productivity
======
Vim has so many tricks up its sleeve that even people who have used it
for years can still learn new things.
![Person using a laptop][1]

There's always Vim. Vim is one of the most popular text editors in use today. This is in large part because it's available everywhere. When you SSH into another system, you may not find [Emacs][2], [Nano][3], or [VSCodium][4] installed, but you can rest assured that Vim is there for you. 

In this article, I cover some intermediate things that you can do with Vim to speed up your workflow and generally make your day easier. This article assumes that you have used Vim before, already know the editor's basics, and are looking to take your Vim skills up a notch. Vim is full of useful tricks, and no one ever truly masters it, but the five tips in this article can boost your skills and, hopefully, make you fall just a bit more in love with one of the most popular and loved text editors.

### Vim bookmarks

Vim provides an easy way to add bookmarks to your text. Suppose that you are editing a large file, and your current edit session requires you to jump back and forth between two sections of text in different locations within the file. 

First, you set a bookmark to your current location by typing `m` (for mark) and then give it a name. For example, if the file I'm editing has a list of names in it that I will want to jump back to later, I could use `mn` (n for names) to add a bookmark to that part of the file. 

Later, I have two options when editing another part of the file and wish to jump back to that list of names. I can type ``n` (backtick-n) to go to the bookmark's location, or I can type `'n` (single quote-n) to go to the beginning of the line that the bookmark is on.

When I no longer need the bookmark, I can delete it with `:delmarks n`. And `:marks` shows me all of my bookmarks.

Notice above that I use a lowercase letter to name my bookmark. This was deliberate. You use lowercase letters for local bookmarks and capital letters to make a bookmark global across several files.

### Vim user-defined abbreviations

If the text you are working on has a long word or phrase that appears several times, then typing it out in full each time could quickly grow irritating. Luckily, Vim provides a simple way to create abbreviations. 

To set a user-defined abbreviation for _Acme Painted Fake Roadways, Inc._ to _apfr_, you type `:ab apfr Acme Painted Fake Roadways, Inc.` Now, when in edit mode, and you type the letters _apfr_ followed by a space, _apfr_ gets converted to _Acme Painted Fake Roadways, Inc._

Any abbreviations you set with `:ab` get lost when you close your Vim session. If you want to unset the abbreviation before then, you can simply type `:una apfr`.

### Vim autocomplete

Many people don't realize that Vim comes with an autocomplete feature. If you are typing a long word you used before in the file, this is a handy tool. 

Suppose you are writing an article that uses the word _Antarctica_ multiple times. After you have used it once, the next time you can type just the first few letters. For example, you type _Ant_ and then use **Ctrl+P**. Vim either completes the word (if there is only one option that it could be) or provides you with a list of words that you can select with the arrow keys—keep typing to narrow down the search further and use the **Tab** key to select the word. 

### Vim range selection

With Vim, you can easily perform an action on a range of lines in your file. You indicate ranges by a starting line number, a comma, and an ending line number (inclusive). In addition to literal line numbers, you can use a period (`.`) to represent the current line, a dollar sign (`$`) to represent the last line in the file buffer, and a percent sign (`%`) to represent the entire file.

Here are a few examples for clarification.

If you want to delete lines 2 through 10, then type (in command mode):


```
`:2,10d`
```

To delete every line from line 25 to the end of the file:


```
`:25,$d`
```

You can delete every line with:


```
`:%d`
```

To copy (or transfer) lines 5 through 10 to just after line 15:


```
`:5,10t 15`
```

To move lines 5 through 10 to just after line 15 (instead of copying):


```
`:5,10m 15`
```

### Vim for productivity

I hope this article has taught you something new about the Vim text editor. Vim has so many tricks up its sleeve that even people who have used it for years can still learn new things. There is always something new and useful to learn.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/3/vim-features-productivity

作者：[Hunter Coleman][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hunterc
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://opensource.com/article/20/3/getting-started-emacs
[3]: https://opensource.com/article/20/12/gnu-nano
[4]: https://opensource.com/article/20/6/open-source-alternatives-vs-code
