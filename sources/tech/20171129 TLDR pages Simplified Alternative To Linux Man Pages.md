TLDR pages: Simplified Alternative To Linux Man Pages
============================================================

 [![](https://fossbytes.com/wp-content/uploads/2017/11/tldr-page-ubuntu-640x360.jpg "tldr page ubuntu")][22] 
 
 Working on the terminal and using various commands to carry out important tasks is an indispensable part of a Linux desktop experience. This open-source operating system possesses an [abundance of commands][23] that **makes** it impossible for any user to remember all of them. To make things more complex, each command has its own set of options to bring a wider set of functionality.

To solve this problem, [Man Pages][12], short for manual pages, were created. First written in English, it contains tons of in-depth information about different commands. Sometimes, when you’re looking for just basic information on a command, it can also become overwhelming. To solve this issue,[ TLDR pages][13] was created.

 _Before going ahead and knowing more about it, don’t forget to check a few more terminal tricks:_ 

*   _**[Watch Star Wars in terminal ][1]**_ 

*   _**[Use StackOverflow in terminal][2]**_ 

*   _**[Get Weather report in terminal][3]**_ 

*   _**[Access Google through terminal][4]**_ 

*   [**_Use Wikipedia from command line_**][7] 

*   _**[Check Cryptocurrency Prices From Terminal][5]**_ 

*   _**[Search and download torrent in terminal][6]**_ 

### What are TLDR pages?

The GitHub page of TLDR pages for Linux/Unix describes it as a collection of simplified and community-driven man pages. It’s an effort to make the experience of using man pages simpler with the help of practical examples. For those who don’t know, TLDR is taken from common internet slang _ Too Long Didn’t Read_ .

In case you wish to compare, let’s take the example of tar command. The usual man page extends over 1,000 lines. It’s an archiving utility that’s often combined with a compression method like bzip or gzip. Take a look at its man page:

 [![tar man page](https://fossbytes.com/wp-content/uploads/2017/11/tar-man-page.jpg)][14] On the other hand, TLDR pages lets you simply take a glance at the command and see how it works. Tar’s TLDR page simply looks like this and comes with some handy examples of the most common tasks you can complete with this utility:

 [![tar tldr page](https://fossbytes.com/wp-content/uploads/2017/11/tar-tldr-page.jpg)][15] Let’s take another example and show you what TLDR pages has to offer when it comes to apt:

 [![tldr-page-of-apt](https://fossbytes.com/wp-content/uploads/2017/11/tldr-page-of-apt.jpg)][16] Having shown you how TLDR works and makes your life easier, let’s tell you how to install it on your Linux-based operating system.

### How to install and use TLDR pages on Linux?

The most mature TLDR client is based on Node.js and you can install it easily using NPM package manager. In case Node and NPM are not available on your system, run the following command:

```
sudo apt-get install nodejs

sudo apt-get install npm 
```

In case you’re using an OS other than Debian, Ubuntu, or Ubuntu’s derivatives, you can use yum, dnf, or pacman package manager as per your convenience.

Now, by running the following command in terminal, install TLDR client on your Linux machine:

```
sudo npm install  -g  tldr 
```

Once you’ve installed this terminal utility, it would be a good idea to update its cache before trying it out. To do so, run the following command:

```
tldr  --update 
```

After doing this, feel free to read the TLDR page of any Linux command. To do so, simply type:

```
tldr  <commandname> 
```

 [![tldr kill command](https://fossbytes.com/wp-content/uploads/2017/11/tldr-kill-command.jpg)][17] 

You can also run the following help command to see all different parameters that can be used with TLDR to get the desired output. As usual, this help page is also accompanied with examples.

### TLDR web, Android, and iOS versions

You would be pleasantly surprised to know that TLDR pages isn’t limited to your Linux desktop. Instead, it can also be used in your web browser, which can be accessed from any machine.

To use TLDR web version, visit [tldr.ostera.io][18] and perform the required search operation.

Alternatively, you can also download the [iOS][19] and [Android][20] apps and keep learning new commands on the go.

 [![tldr app ios](https://fossbytes.com/wp-content/uploads/2017/11/tldr-app-ios.jpg)][21] 

Did you find this cool Linux terminal trick interesting? Do give it a try and let us know your feedback.

--------------------------------------------------------------------------------

via: https://fossbytes.com/tldr-pages-linux-man-pages-alternative/

作者：[Adarsh Verma ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fossbytes.com/author/adarsh/
[1]:https://fossbytes.com/watch-star-wars-command-prompt-via-telnet/
[2]:https://fossbytes.com/use-stackoverflow-linux-terminal-mac/
[3]:https://fossbytes.com/single-command-curl-wttr-terminal-weather-report/
[4]:https://fossbytes.com/how-to-google-search-in-command-line-using-googler/
[5]:https://fossbytes.com/check-bitcoin-cryptocurrency-prices-command-line-coinmon/
[6]:https://fossbytes.com/review-torrench-download-torrents-using-terminal-linux/
[7]:https://fossbytes.com/use-wikipedia-termnianl-wikit/
[8]:http://www.facebook.com/sharer.php?u=https%3A%2F%2Ffossbytes.com%2Ftldr-pages-linux-man-pages-alternative%2F
[9]:https://twitter.com/intent/tweet?text=TLDR+pages%3A+Simplified+Alternative+To+Linux+Man+Pages&url=https%3A%2F%2Ffossbytes.com%2Ftldr-pages-linux-man-pages-alternative%2F&via=%40fossbytes14
[10]:http://plus.google.com/share?url=https://fossbytes.com/tldr-pages-linux-man-pages-alternative/
[11]:http://pinterest.com/pin/create/button/?url=https://fossbytes.com/tldr-pages-linux-man-pages-alternative/&media=https://fossbytes.com/wp-content/uploads/2017/11/tldr-page-ubuntu.jpg
[12]:https://fossbytes.com/linux-lexicon-man-pages-navigation/
[13]:https://github.com/tldr-pages/tldr
[14]:https://fossbytes.com/wp-content/uploads/2017/11/tar-man-page.jpg
[15]:https://fossbytes.com/wp-content/uploads/2017/11/tar-tldr-page.jpg
[16]:https://fossbytes.com/wp-content/uploads/2017/11/tldr-page-of-apt.jpg
[17]:https://fossbytes.com/wp-content/uploads/2017/11/tldr-kill-command.jpg
[18]:https://tldr.ostera.io/
[19]:https://itunes.apple.com/us/app/tldt-pages/id1071725095?ls=1&mt=8
[20]:https://play.google.com/store/apps/details?id=io.github.hidroh.tldroid
[21]:https://fossbytes.com/wp-content/uploads/2017/11/tldr-app-ios.jpg
[22]:https://fossbytes.com/wp-content/uploads/2017/11/tldr-page-ubuntu.jpg
[23]:https://fossbytes.com/a-z-list-linux-command-line-reference/
