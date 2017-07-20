翻译中 by WuXiao(toyijiu)
============================================================
Bash prompt tips and tricks
============================================================

### Here are a few hidden treasures you can use to customize your Bash prompt.

![Bash prompt tips and tricks](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/osdc_terminals.png?itok=QmkPW7P1 "Bash prompt tips and tricks")
Image by : 

[ajmexico][8]. Modified by [Jason Baker][9]. [CC BY-SA 2.0][10].

Anyone who has started a terminal in Linux is familiar with the default Bash prompt:

```
[user@$host ~]$
```

But did you know is that this is completely customizable and can contain some very useful information? Here are a few hidden treasures you can use to customize your Bash prompt.

### How is the Bash prompt set?

The Bash prompt is set by the environment variable **PS1** (Prompt String 1), which is used for interactive shell prompts. There is also a **PS2** variable, which is used when more input is required to complete a Bash command.

```
[dneary@dhcp-41-137 ~]$ export PS1="[Linux Rulez]$ "
[Linux Rulez] export PS2="... "
[Linux Rulez] if true; then
... echo "Success!"
... fi
Success!
```

### Where is the value of PS1 set?

PS1 is a regular environment variable.

The system default value is set in **/etc/bashrc**. On my system, the default prompt is set with this line:

```
[ "$PS1" = "\\s-\\v\\\$ " ] && PS1="[\u@\h \W]\\$ "
```

This tests whether the value of PS1 is **\s-\v$** (the system default value), and if it is, it sets PS1 to the value **[\u@\h \W]\\$**.

If you want to see a custom prompt, however, you should not be editing **/etc/bashrc**. You should instead add it to **.bashrc** in your **Home** directory.

### What do \u, \h, \W, \s, and \v mean?

More Linux resources

*   [What is Linux?][1]

*   [What are Linux containers?][2]

*   [Download Now: Linux commands cheat sheet][3]

*   [Advanced Linux commands cheat sheet][4]

*   [Our latest Linux articles][5]

In the **PROMPTING** section of **man bash**, you can find a description of all the special characters in **PS1** and **PS2**. The following are the default options:

*   **\u**: Username

*   **\h**: Short hostname

*   **\W**: Basename of the current working directory (**~** for home, the end of the current directory elsewhere)

*   **\s**: Shell name (**bash** or **sh**, depending on how the shell is called)

*   **\v**: The shell's version

### What other special strings can I use in the prompts?

There are a number of special strings that can be useful.

*   **\d**: Expands to the date in the format "Tue Jun 27"

*   **\D{fmt}**: Allows custom date formats—see **man strftime** for the available options

*   **\D{%c}**: Gives the date and time in the current locale

*   **\n**: Include a new line (see multi-line prompts below)

*   **\w**: The full path of the current working directory

*   **\H**: The full hostname for the current machine

*   **\!**: History number—you can run any previous command with its history number by using the shell history event designator **!** followed by the number for the specific command you are interested in. (Using Linux history is yet another tutorial...)

There are many other special characters—you can see the full list in the **PROMPTING**section of the **Bash man page**.

### Multi-line prompts

If you use longer prompts (say if you include **\H** or **\w** or a full **date-time**), you may want to break things over two lines. Here is an example of a multi-line prompt, with the date, time, and current working directory on one line, and **username @hostname** on the second line:

```
PS1="\D{%c} \w\n[\u@\H]$ "
```

### Are there any other interesting things I can do?

One thing people occasionally do is create colorful prompts. While I find them annoying and distracting, you may like them. For example, to change the date-time above to display in red text, the directory in cyan, and your username on a yellow background, you could try this:

```
PS1="\[\e[31m\]\D{%c}\[\e[0m\]
    \[\e[36m\]\w\[\e[0m\]\n[\[\e[1;43m\]\u\[\e[0m\]@\H]$ "
```

To dissect this:

*   **\[..\]** declares some non-printed characters

*   **\e[..** is an escape character. What follows is a special escape sequence to change the color (or other characteristic) in the terminal

*   **31m** is red text (**41m** would be a red background)

*   **36m** is cyan text

*   **1;43m** declares a yellow background (**1;33m** would be yellow text)

*   **\[\e[0m\]** at the end resets the colors to the terminal defaults

You can find more colors and tips in the [Bash prompt HOWTO][11]. You can even make text inverted or blinking! Why on earth anyone would want to do this, I don't know. But you can!

What are your favorite Bash prompt customizations? And which ones have you seen that drive you crazy? Let me know in the comments.

--------------------------------------------------------------------------------

作者简介：

Dave Neary - Dave Neary is a member of the Open Source and Standards team at Red Hat, helping make Open Source projects important to Red Hat be successful. Dave has been around the free and open source software world, wearing many different hats, since sending his first patch to the GIMP in 1999.

via: https://opensource.com/article/17/7/bash-prompt-tips-and-tricks

作者：[Dave Neary  ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/dneary
[1]:https://opensource.com/resources/what-is-linux?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[2]:https://opensource.com/resources/what-are-linux-containers?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[3]:https://developers.redhat.com/promotions/linux-cheatsheet/?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[4]:https://developers.redhat.com/cheat-sheet/advanced-linux-commands-cheatsheet?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[5]:https://opensource.com/tags/linux?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[6]:https://opensource.com/article/17/7/bash-prompt-tips-and-tricks?rate=7o5TkSbm_tDUEANDpxTZJU3LgEg0EK-j4xPuNL79m3M
[7]:https://opensource.com/user/16681/feed
[8]:https://www.flickr.com/photos/15587432@N02/3281139507/
[9]:https://opensource.com/users/jason-baker
[10]:https://creativecommons.org/licenses/by/2.0/
[11]:http://tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
[12]:https://opensource.com/users/dneary
[13]:https://opensource.com/users/dneary
[14]:https://opensource.com/article/17/7/bash-prompt-tips-and-tricks#comments
