[#]: subject: "Cut, Copy and Paste in Vim"
[#]: via: "https://itsfoss.com/vim-cut-copy-paste/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Cut, Copy and Paste in Vim
======

Cutting, copying, and pasting text is one of the most basic tasks in text editing and we all know Vim has a different way of doing things.

This means until you get a hang of it, you fear it and once you get a grip, it is nothing but a rabbit hole.

While I'll address cut, copy, and paste in detail, here's a basic summary of this tutorial to get things started:

**Action** | **Description**
---|---
`yiw` | Copy the current word.
`yy` | Copy the whole line.
`diw` | Cut the current word.
`dd` | Cut the whole line.
`p` | Paste text.

Don't worry, Vim gives you much more options than what I've mentioned above.

In this tutorial, I will walk you through the following:

  * How to copy text in Vim
  * How to cut text in Vim
  * How to paste text in Vim
  * How to cut and copy text in Vim using Visual mode



So let's start with the first one.

### How to copy the text in the Vim editor

While we use the term copy, Vim has a different term called `yank` so from now on, I will be using Yank instead of copy.

As I mentioned earlier, you get multiple ways to yank text in Vim, and here are some useful ones:

Command | Description
---|---
`nyy` or `nY` | Yanks (copies) the current line and the next `n-1` lines. For example, `3yy` copies the current line and the two lines below it.
`yaw` | Yanks (copies) the current word the cursor is on.
`yy` or `Y` | Yanks (copies) the entire current line.
`y$` | Yanks (copies) text from the cursor to the end of the line.
`y^` or `y0` | Yanks (copies) text from the cursor to the beginning of the line.

To yank in Vim, follow 3 simple steps:

  1. Press the `Esc` key to switch to the normal mode
  2. Navigate to a line or a word that you want to copy
  3. Press the relative command from the above table and your text will be copied



Want to learn the interactive way to copy lines? Skip to the last section of this tutorial.

### How to cut text in the Vim editor

In Vim, you don't have any option to delete the text. Instead, you cut the text so you the delete and cut the text are similar things in Vim.

To cut text in Vim, you press the `d` command. But you never use the `d` command without any opinions. You always add something to it to get more out of it.

So here are some practical ways you can cut the text using the `d` command:

Command | Description
---|---
`dd` | Cuts the entire current line.
`d$` | Cuts text from the cursor to the end of the line.
`d^` or `d0` | Cuts text from the cursor to the beginning of the line.
`ndd` or `dN` | Cuts the current line and the next `n-1` lines. For example, `3dd` cuts the current line and the two lines below it.
`daw` | Cuts the current word the cursor is on.

Let's say I want to cut the first 4 lines from my file, then I need to use `4dd` and here's how I did it:

![][1]

### How to paste text in the Vim editor

After copying or cutting text in Vim, you can simply paste it by pressing the `p` key.

You can press the `p` key multiple times to paste text multiple times or use `np` where the `n` is the number of how many times you want to paste the text.

For example, here, I pasted lines that I copied previously three times:

![][2]

It's that easy!

### How to cut and copy text by selecting it

If you are coming from GUI text editors, you must be used to copying and cutting text by selecting it.

So let's start with how you copy text by selecting it in Vim.

#### Copy the text by selecting it

To copy the text in visual mode, follow 3 simple steps:

  1. Go to the point from where you want to start the selection
  2. Press `Ctrl + v` to enable the visual mode
  3. Use arrow keys to make a selection
  4. Press the `y` key to copy the selected text



For example, here, I copied 4 lines using the visual mode:

![][3]

If you notice, once I pressed the `y` key, it showed how many lines were yanked (copied). In my case, 4 lines were yanked.

#### Cut the text by selecting it in Vim

To cut the text in Vim in visual mode, all you have to do is follow 4 simple steps:

  1. Navigate to a point from where you want to cut lines
  2. Press `Ctrl + v` to switch to visual mode
  3. Use arrow keys to select the lines you want to cut
  4. Press the `d` key to cut the selected lines



So let's say I want to cut 4 lines, then, this is how I'd do it:

![][4]

Pretty easy. Right?

### More on Vim

Did you know that there are multiple modes in Vim? [Learn more about different modes in Vim:][5]

![][6]

Want to step up your Vim game? Refer to [tips and tricks to become a pro-Vim user][7]:

![][6]

I hope you will find this guide helpful.

--------------------------------------------------------------------------------

via: https://itsfoss.com/vim-cut-copy-paste/

作者：[Sagar Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/content/images/2023/10/Cut-multiple-lines-in-the-Vim-editor.gif
[2]: https://itsfoss.com/content/images/2023/10/paste-lines-in-Vim-editor.gif
[3]: https://itsfoss.com/content/images/2023/10/Copy-lines-in-vim-by-selecting-them.gif
[4]: https://itsfoss.com/content/images/2023/10/Cut-lines-in-Vim-by-selecting-them.gif
[5]: https://linuxhandbook.com/vim-modes/
[6]: https://linuxhandbook.com/content/images/size/w256h256/2021/08/Linux-Handbook-New-Logo.png
[7]: https://linuxhandbook.com/pro-vim-tips/
