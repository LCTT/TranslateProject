[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Winterize your Bash prompt in Linux)
[#]: via: (https://opensource.com/article/18/12/linux-toy-bash-prompt)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)

Winterize your Bash prompt in Linux
======
Your Linux terminal probably supports Unicode, so why not take advantage of that and add a seasonal touch to your prompt?
![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-bash-prompt.png?itok=HK_kVn37)

Hello once again for another installment of the Linux command-line toys advent calendar. If this is your first visit to the series, you might be asking yourself what a command-line toy even is? Really, we're keeping it pretty open-ended: It's anything that's a fun diversion at the terminal, and we're giving bonus points for anything holiday-themed.

Maybe you've seen some of these before, maybe you haven't. Either way, we hope you have fun.

Today's toy is super-simple: It's your Bash prompt. Your Bash prompt? Yep! We've got a few more weeks of the holiday season left to stare at it, and even more weeks of winter here in the northern hemisphere, so why not have some fun with it.

Your Bash prompt currently might be a simple dollar sign ( **$** ), or more likely, it's something a little longer. If you're not sure what makes up your Bash prompt right now, you can find it in an environment variable called $PS1. To see it, type:

```
echo $PS1
```

For me, this returns:

```
[\u@\h \W]\$
```

The **\u** , **\h** , and **\W** are special characters for username, hostname, and working directory. There are others you can use as well; for help building out your Bash prompt, you can use [EzPrompt][1], an online generator of PS1 configurations that includes lots of options including date and time, Git status, and more.

You may have other variables that make up your Bash prompt set as well; **$PS2** for me contains the closing brace of my command prompt. See [this article][2] for more information.

To change your prompt, simply set the environment variable in your terminal like this:

```
$ PS1='\u is cold: '
jehb is cold:
```

To set it permanently, add the same code to your **/etc/bashrc **using your favorite text editor.

So what does this have to do with winterization? Well, chances are on a modern machine, your terminal support Unicode, so you're not limited to the standard ASCII character set. You can use any emoji that's a part of the Unicode specification, including a snowflake ❄, a snowman ☃, or a pair of skis 🎿. You've got plenty of wintery options to choose from.

```
🎄 Christmas Tree
🧥 Coat
🦌 Deer
🧤 Gloves
🤶 Mrs. Claus
🎅 Santa Claus
🧣 Scarf
🎿 Skis
🏂 Snowboarder
❄ Snowflake
☃ Snowman
⛄ Snowman Without Snow
🎁 Wrapped Gift
```

Pick your favorite, and enjoy some winter cheer. Fun fact: modern filesystems also support Unicode characters in their filenames, meaning you can technically name your next program **"❄❄❄❄❄.py"**. That said, please don't.

Do you have a favorite command-line toy that you think I ought to include? The calendar for this series is mostly filled out but I've got a few spots left. Let me know in the comments below, and I'll check it out. If there's space, I'll try to include it. If not, but I get some good submissions, I'll do a round-up of honorable mentions at the end.

Check out yesterday's toy, [Snake your way across your Linux terminal][3], and check back tomorrow for another!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-bash-prompt

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: http://ezprompt.net/
[2]: https://access.redhat.com/solutions/505983
[3]: https://opensource.com/article/18/12/linux-toy-snake
