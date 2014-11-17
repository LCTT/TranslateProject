wangjiezhe translating...

What are some obscure but useful Vim commands
================================================================================
If my [latest post on the topic][1] did not tip you off, I am a Vim fan. So before some of you start stoning me, let me present you a list of "obscure Vim commands." What I mean by that is: a collection of commands that you might have not encountered before, but that might be useful to you. As a second disclaimer, I do not know which commands you might know and which one you find useful. So this list really is a collection of relatively less known Vim commands, but which can still probably be useful.

### Saving a file and exiting ###

I am a bit ashamed of myself for that one, but I only recently learned that the command

    :x

is equivalent to:

    :wq

which is saving and quitting the current file.

### Basic calculator ###

While in insert mode, you can press Ctrl+r then type '=' followed by a simple calculation. Press ENTER, and the result will be inserted in the document. For example, try:

    Ctrl+r '=2+2' ENTER

![](https://farm8.staticflickr.com/7486/15543918097_fbcf33ee6b.jpg)

And 4 will be inserted in the document.

### Finding duplicate consecutive words ###

When you type something quickly, it happens that you write a word twice in a row. Just like this this. This kind of error can fool anyone, even when re-reading yourself. Hopefully, there is a simple regular expression to prevent this. Use the search ('/' by default) and type:

    \(\<\w\+\>\)\_s*\1

This should display all the duplicate words. And for maximum effect, don't forget to place:

    set hlsearch

in your .vimrc file to highlight all search hits.

![](https://farm8.staticflickr.com/7531/15730650082_c2764857e2.jpg)

### Abbreviations ###

Probably one of the most impressive tricks, you can define abbreviations in Vim, which will replace what you type with somethig else in real time. The syntax is the following:

    :ab [abbreviation] [what to replace it with]

The generic example is:

    :ab asap as soon as possible

Which will replace "asap" with "as soon as possible" as you write.

### Save a file that you forgot to open as root ###

This is maybe an all time favorite in the forums. Whenever you open a file that you do not have permission to write to (say a system configuration file for example) and make some changes, Vim will not save them with the normal command: ':w'

Instead of redoing the changes after opening it again as root, simply run:

    :w !sudo tee %

Which will save it as root directly.

### Crypt your text on the go ###

If you do not want someone to be able to read whatever is on your screen, Vim has the built in option to [ROT13][2]-encode your text with the following command:

    ggVGg?

![](https://farm8.staticflickr.com/7487/15727174681_7773a97ea2.jpg)

'gg' for moving the cursor to the first line of the Vim buffer, 'V' for entering visual mode, and 'G' for moving the cursor to the last line of the buffer. So 'ggVG' will make the visual mode cover the entire buffer. Finally 'g?' applies ROT13 encoding to the selected region.

Notice that this should be mapped to a key for maximum efficiency. It also works best with alphabetical characters. And to undo it, the best is simply to use the undo command: 'u'

### Auto-completion ###

Another one to be ashamed of, but I see a lot of people around me not knowing it. Vim has by default an auto-completion features. Yes it is very basic, and can be enhanced by plugins, but it can still help you. The process is simple. Vim can try to guess the end of your word based on the word you wrote earlier. If you are typing the word "compiler" for the second time in the same file for example, just start typing "com" and still in insertion mode, press Ctrl+n to see Vim finish your word for you. Simple but handy.

### Look at the diff between two files ###

Probably a lot of you know about vimdiff command, which allows you to open Vim in split mode and compare two files with the syntax:

    $ vimdiff [file1] [file2] 

But the same result is achievable with the Vim command:

    :diffthis

First open your initial file in Vim. Then open the second one in split mode with:

    :vsp [file2]

Finally launch:

    :diffthis

in the first buffer, switch buffer with Ctrl+w and type:

    :diffthis

again.

The two files will then be highlighted with focus on their differences.

To turn the diff off, simply use:

    :diffoff

### Revert the document in time ###

Vim keeps track of the changes you make to a file, and can easily revert it to what it was earlier in time. The command is quite intuitive. For example:

    :earlier 1m

will revert the document to what it was a minute ago.

Note that you can inverse this with the command:

    :later

### Delete inside markers ###

Something that I always wanted to be comfortable doing when I started using Vim: easily delete text between brackets or parenthesis. Go to the first marker and simply use the syntax:

    di[marker]

So for example, deleting between parenthesis would be:

    di(

once your cursor is on the first parenthesis. For brackets or quotation marks, it would be:

    di{

and:

    di"

### Delete until a specific maker ###

A bit similar to deleting inside a marker but for different purpose, the command:

    dt[marker]

will delete everything in between your cursor and the marker (leaving it safe) if the marker is found on the same line. For example:

    dt.

will delete the end of your sentence, leaving the '.' intact.

### Turn Vim into a hex editor ###

This is not my favorite trick, but some might find it interesting. You can chain Vim and the xxd utility to convert the text into hexadecimal with the command:

    :%!xxd

![](https://farm6.staticflickr.com/5607/15109142674_e99466f2db_z.jpg)

And similarly, you can revert this with:

    :%!xxd -r

### Place the text under your cursor in the middle of the screen ###

Everything is in the title. If you want to force the screen to scroll and place whatever is under your cursor in the middle, use the command:

    zz

in visual mode.

### Jump to previous/next position ###

When editing a very big file, it is frequent to make changes somewhere, and jump to another place right after. If you wish to jump back simply, use:

    Ctrl+o

to go back to where you were.

And similarly:

    Ctrl+i

will revert such jump back.

### Render the current file as a web page ###

This will generate an HTML page displaying your text, and show the code in a split screen:

    :%Tohtml

![](https://farm8.staticflickr.com/7550/15727174701_c405f85a84_z.jpg)

Very basic but so fancy.

To conclude, this list was assembled after reading some various forum threads and the [Vim Tips wiki][3], which I really recommend if you want to boost your knowledge about the editor.

If you know any Vim command that you find useful and that you think most people do not know about, feel free to share it in the comments. As said in the introduction, an "obscure but useful" command is very subjective, but sharing is always good.

--------------------------------------------------------------------------------

via: http://xmodulo.com/useful-vim-commands.html

作者：[Adrien Brochard][a]
译者：[wangjiezhe](https://github.com/wangjiezhe)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/adrien
[1]:http://xmodulo.com/turn-vim-full-fledged-ide.html
[2]:https://en.wikipedia.org/wiki/ROT13
[3]:http://vim.wikia.com/wiki/Vim_Tips_Wiki
