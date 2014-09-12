Install UberWriter Markdown Editor In Ubuntu 14.04
================================================================================
Quick tutorial to show you **how to install UberWriter markdown editor in Ubuntu 14.04** for free via official PPA.

[UberWriter][1] is a [markdown][2] editor for Ubuntu with a clean interface with focus on writing only. UberWriter utilizes [pandoc][3] markdown. The UI is based on GTK3 which is not yet fully integrated with Unity. A quick list of features for UberWriter is as following:

- Clean interface
- pandoc markdown
- Preview option
- Distraction free “focus mode”
- Spell check
- Syntax highlighting and math in html and pdf
- Option to export as PDF, HTML, ODT etc

### Install UberWriter in Ubuntu 14.04 ###

UberWriter is available in [Ubuntu Software Center][4] but it costs $5. I would really recommend that you buy it, if you like it and if you can afford it to support the developer.

UberWriter is also available for free via its official PPA. You can install it using the following commands in terminal:

    sudo add-apt-repository ppa:w-vollprecht/ppa
    sudo apt-get update
    sudo apt-get install uberwriter

Once installed, you can run it from Unity Dash. Write down your document in UberWriter. As you can see, it highlights the markdown syntax:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/UberWriter_Ubuntu.jpeg)

You can use the preview feature to see how your document will actually look like:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/UberWriter_Ubuntu_1.jpeg)

I tried to export it as PDF but it asked me to install texlive.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/UberWriter_Ubuntu_PDF_Export.png)

Export to HTML and ODT was fine though.

There are several other markdown editors available for Linux. [Remarkable][5] is one of them which has the feature of real time preview, which is not in UberWriter. But overall it is a nice application. If you are looking for document writing tool, you can also use [Texmaker LaTeX editor][6].

I hope this tutorial helped you to **install UberWriter in Ubuntu 14.04**. I haven’t tried but I presume that it should also work in Ubuntu 12.04, Linux Mint 17, Elementary OS and other Linux distributions based on Ubuntu.


--------------------------------------------------------------------------------

via: http://itsfoss.com/install-uberwriter-markdown-editor-ubuntu-1404/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:http://uberwriter.wolfvollprecht.de/
[2]:http://en.wikipedia.org/wiki/Markdown
[3]:http://johnmacfarlane.net/pandoc/
[4]:apt://uberwriter
[5]:http://itsfoss.com/remarkable-markdown-editor-linux/
[6]:http://itsfoss.com/install-latex-ubuntu-1404/