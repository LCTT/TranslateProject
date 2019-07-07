[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Copy and paste at the Linux command line with xclip)
[#]: via: (https://opensource.com/article/19/7/xclip)
[#]: author: (Scott Nesbitt https://opensource.com/users/scottnesbitt)

Copy and paste at the Linux command line with xclip
======
Learn how to get started with the Linux xclip utility.
![Green paperclips][1]

How do you usually copy all or part of a text file when working on the Linux desktop? Chances are you open the file in a text editor, select all or just the text you want to copy, and paste it somewhere else.

That works. But you can do the job a bit more efficiently at the command line using the [xclip][2] utility. xclip provides a conduit between commands you run in a terminal window and the clipboard in a Linux graphical desktop environment.

### Installing xclip

xclip isn't standard kit with many Linux distributions. To see if it's installed on your computer, open a terminal window and type **which xclip**. If that command returns output like _/usr/bin/xclip_, then you're ready to go. Otherwise, you need to install xclip.

To do that, use your distribution's package manager. Or, if you're adventurous, [grab the source code][2] from GitHub and compile it yourself.

### Doing the basics

Let's say you want to copy the contents of a file to the clipboard. There are two ways to do that with xclip. Type either:


```
`xclip file_name`
```

or


```
`xclip -sel clip file_name`
```

What's the difference between the two commands (aside from the second one being longer)? The first command works if you use the middle button on the mouse to paste text. However, not everyone does. Many people are conditioned to use a right-click menu or to press Ctrl+V to paste text. If you're one of those people (I am!), using the **-sel clip** option ensures you can paste what you want to paste.

### Using xclip with other applications

Copying the contents of a file directly to the clipboard is a neat parlor trick. Chances are, you won't be doing that very often. There are other ways you can use xclip, and those involve pairing it with another command-line application.

That pairing is done with a _pipe_ (|). The pipe redirects the output of one command line application to another. Doing that opens several possibilities. Let's take a look at three of them.

Say you're a system administrator and you need to copy the last 30 lines of a log file into a bug report. Opening the file in a text editor, scrolling down to the end, and copying and pasting is a bit of work. Why not use xclip and the [tail][3] utility to quickly and easily do the deed? Run this command to copy those last 30 lines:


```
`tail -n 30 logfile.log | xclip -sel clip`
```

Quite a bit of my writing goes into some content management system (CMS) or another for publishing on the web. However, I never use a CMS's WYSIWYG editor to write—I write offline in [plain text][4] formatted with [Markdown][5]. That said, many of those editors have an HTML mode. By using this command, I can convert a Markdown-formatted file to HTML using [Pandoc][6] and copy it to the clipboard in one fell swoop:


```
`pandoc -t html file.md | xclip -sel clip`
```

From there, I paste away.

Two of my websites are hosted using [GitLab Pages][7]. I generate the HTTPS certificates for those sites using a tool called [Certbot][8], and I need to copy the certificate for each site to GitLab whenever I renew it. Combining the [cat][9] command and xclip is faster and more efficient than using an editor. For example:


```
`cat /etc/letsencrypt/live/website/fullchain.pem | xclip -sel clip`
```

Is that all you can do with xclip? Definitely not. I'm sure you can find more uses to fit your needs.

### Final thoughts

Not everyone will use xclip. That's fine. It is, however, one of those little utilities that really comes in handy when you need it. And, as I've discovered on a few occasions, you don't know when you'll need it. When that time comes, you'll be glad xclip is there.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/xclip

作者：[Scott Nesbitt][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/life_paperclips.png?itok=j48op49T (Green paperclips)
[2]: https://github.com/astrand/xclip
[3]: https://en.wikipedia.org/wiki/Tail_(Unix)
[4]: https://plaintextproject.online
[5]: https://gumroad.com/l/learnmarkdown
[6]: https://pandoc.org
[7]: https://docs.gitlab.com/ee/user/project/pages/
[8]: https://certbot.eff.org/
[9]: https://en.wikipedia.org/wiki/Cat_(Unix)
