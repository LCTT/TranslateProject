[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (You can Surf Internet in Linux Terminal With These Command Line Browsers)
[#]: via: (https://itsfoss.com/terminal-web-browsers/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

You can Surf Internet in Linux Terminal With These Command Line Browsers
======

I’m guessing that you are probably using Firefox or a Chrome-based browser like [Brave][1] to read this article. Or, maybe, Google Chrome or [Chromium][2].

In other words, you are utilizing a GUI-based approach to browse the web. However, back in the days, people used the terminal to fetch resources and browse the web because everything was mostly text-based information.

Even though you cannot get every information from a terminal now, you can still try the command line browsers for some text-based information and open a web page from the Linux terminal.

Not just limited to that, but if you are accessing a remote server or stuck in a terminal without a GUI, a terminal web browser can prove to be useful as well.

So, in this article, I will be mentioning some terminal based web browsers that you can try on Linux.

### Best Terminal-based Web Browsers for Linux Users

_**Note:** The list is in no particular order of ranking._

#### 1\. W3M

![][3]

w3m is a popular open-source text-based web browser for the terminal. Even though the original project is no longer active, an active version of it is being maintained by a different developer Tatsuya Kinoshita.

w3m is quite simple, supports SSL connections, colors, and in-line images as well. Of course, depending on what resource you are trying to access, things might look different on your end. As per my quick test, it didn’t seem to load up [DuckDuckGo][4] but I could [use Google in terminal][5] just fine.

You can simply type **w3m** in the terminal to get help after installation. If you’re curious, you can also check out the repository at [GitHub][6].

##### How to install and use w3m?

W3M is available on most of the default repositories for any Debian-based Linux distribution. If you have an Arch-based distro, you might want to check [AUR][7] if it’s not available directly.

For Ubuntu, you can install it by typing in:

```
sudo apt install w3m w3m-img
```

Here, we are installing the w3m package along with image extension for in-line image support. Next, to get started, you have to simply follow the command below:

```
w3m xyz.com
```

Of course, you need to replace xyz.com to any website that you want to browse/test. Finally, you should know that you can use the keyboard arrow keys to navigate and press enter when you want to take an action.

To quit, you can press **SHIFT+Q**, and to go back to the previous page — **SHIFT+B**. Additional shortcuts include **SHIFT + T** to open a new tab and **SHIFT + U** to open a new URL.

You can explore more about it by heading to its man page as well.

#### 2\. Lynx

![][8]

Lynx is yet another open source command line browser which you can try. Fortunately, more websites tend to work when using Lynx, so I’d say it is definitely better in that aspect. I was able to load up DuckDuckGo and make it work.

In addition to that, I also noticed that it lets you accept/deny cookies when visiting various web resources. You can set it to always accept or deny as well. So, that’s a good thing.

On the other hand, the window does not re-size well while using it from the terminal. I haven’t looked for any solutions to that, so if you’re trying this out, you might want to do that. In either case, it works great and you get all the instructions for the keyboard shortcuts right when you launch it in the terminal.

Note that it does not match the system terminal theme, so it will look different no matter how your terminal looks like.

##### How to install Lynx?

Unlike w3m, you do get some Win32 installers if you’re interested to try. But, on Linux, it is available on the most of the default repositories.

For Ubuntu, you just need to type in:

```
sudo apt install lynx
```

To get started, you just have to follow the command below:

```
lynx examplewebsite.com
```

Here, you just need to replace the example website with the resource you want to visit.

If you want to explore the packages for other Linux distros, you can check out their [official website resources][9].

#### 3\. Links2

![][10]

Links2 is an interesting text-based browser that you can easily utilize on your terminal with a good user experience. It gives you a nice interface to type in the URL and then proceed as soon as you launch it.

![][11]

It is worth noting that the theme will depend on your terminal settings, I have it set as “black-green”, hence this is what you see. Once you launch it as a command line browser, you just need to press any key to bring the URL prompt or Q to quit it. It works good enough and renders text from most of the sites.

Unlike Lynx, you do not get the ability to accept/reject cookies. Other than that, it seems to work just fine.

##### How to install Links2?

As you’d expect, you will find it available in the most of the default repositories. For Ubuntu, you can install it by typing the following command in the terminal:

```
sudo apt install links2
```

You can refer to its [official][12] [][12][website][12] for packages or documentations if you want to install it on any other Linux distribution.

#### 4\. eLinks

![][13]

eLinks is similar to Links2 — but it is no longer maintained. You will still find it in the default repositories of various distributions, hence, I kept it in this list.

It does not blend in with your system terminal theme. So, this may not be a pretty experience as a text-based browser without a “dark” mode if you needed that.

##### How to install eLinks?

On Ubuntu, it is easy to install it. You just have to type in the following in the terminal:

```
sudo apt install elinks
```

For other Linux distributions, you should find it available on the standard repositories. But, you can refer to the [official installation instructions][14] if you do not find it in the repository.

### Wrapping Up

It’s no surprise that there aren’t a lot of text-based web browsers to run on the terminal. Some projects like [Browsh][15] have tried to present a modern Linux command-line browser but it did not work in my case.

While tools like curl and wget allow you to [download files from the Linux command line][16], these terminal-based web browsers provide additional features.

In addition to command-line browsers, you may also like to try some [command line games for Linux][17], if you want to play around in the terminal.

What do you think about the text-based web browsers for Linux terminal? Feel free to let me know your thoughts in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/terminal-web-browsers/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/brave-web-browser/
[2]: https://itsfoss.com/install-chromium-ubuntu/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/10/w3m-google.jpg?resize=800%2C463&ssl=1
[4]: https://duckduckgo.com/
[5]: https://itsfoss.com/review-googler-linux/
[6]: https://github.com/tats/w3m
[7]: https://itsfoss.com/aur-arch-linux/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/10/lynx-terminal.jpg?resize=800%2C497&ssl=1
[9]: https://lynx.invisible-island.net/lynx-resources.html
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/links2-terminal.jpg?resize=800%2C472&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/links2-terminal-welcome.jpg?resize=800%2C541&ssl=1
[12]: http://links.twibright.com/download.php
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/elinks-terminal.jpg?resize=800%2C465&ssl=1
[14]: http://elinks.or.cz/documentation/installation.html
[15]: https://www.brow.sh/
[16]: https://itsfoss.com/download-files-from-linux-terminal/
[17]: https://itsfoss.com/best-command-line-games-linux/
