How to access Feedly RSS feed from the command line on Linux
================================================================================
In case you didn't know, [Feedly][1] is one of the most popular online news aggregation services. It offers seamlessly unified news reading experience across desktops, Android and iOS devices via browser extensions and mobile apps. Feedly took on the demise of Google Reader in 2013, quickly gaining a lot of then Google Reader users. I was one of them, and Feedly has remained my default RSS reader since then.

While I appreciate the sleek interface of Feedly's browser extensions and mobile apps, there is yet another way to access Feedly: Linux command-line. That's right. You can access Feedly's news feed from the command line. Sounds geeky? Well, at least for system admins who live on headless servers, this can be pretty useful.

Enter [Feednix][2]. This open-source software is a Feedly's unofficial command-line client written in C++. It allows you to browse Feedly's news feed in ncurses-based terminal interface. By default, Feednix is linked with a console-based browser called w3m to allow you to read articles within a terminal environment. You can choose to read from your favorite web browser though.

In this tutorial, I am going to demonstrate how to install and configure Feednix to access Feedly from the command line.

### Install Feednix on Linux ###

You can build Feednix from the source using the following instructions. At the moment, the "Ubuntu-stable" branch of the official Github repository has the most up-to-date code. So let's use this branch to build it.

As prerequisites, you will need to install a couple of development libraries, as well as w3m browser.

#### Debian, Ubuntu or Linux Mint ####

    $ sudo apt-get install git automake g++ make libncursesw5-dev libjsoncpp-dev libcurl4-gnutls-dev w3m
    $ git clone -b Ubuntu-stable https://github.com/Jarkore/Feednix.git
    $ cd Feednix
    $ ./autogen.sh
    $ ./configure
    $ make
    $ sudo make install

#### Fedora ####

    $ sudo yum groupinstall "C Development Tools and Libraries"
    $ sudo yum install gcc-c++ git automake make ncurses-devel jsoncpp-devel libcurl-devel w3m
    $ git clone -b Ubuntu-stable https://github.com/Jarkore/Feednix.git
    $ cd Feednix
    $ ./autogen.sh
    $ ./configure
    $ make
    $ sudo make install

Arch Linux

On Arch Linux, you can easily install Feednix from [AUR][3].

### Configure Feednix for the First Time ###

After installing it, launch Feednix as follows.

    $ feednix

The first time you run Feednix, it will pop up a web browser window, where you need to sign up to create a Feedly's user ID and its corresponding developer access token. If you are running Feednix in a desktop-less environment, open a web browser on another computer, and go to https://feedly.com/v3/auth/dev.

![](https://farm8.staticflickr.com/7427/15825106524_42883b3e32_b.jpg)

Once you sign in, you will see your Feedly user ID generated.

![](https://www.flickr.com/photos/xmodulo/15827565143/)

To retrieve an access token, you need to follow the token link sent to your email address in your browser. Only then will you see the window showing your user ID, access token, and its expiration date. Be aware that access token is quite long (more than 200 characters). The token appears in a horizontally scrollable text box, so make sure to copy the whole access token string.

![](https://farm9.staticflickr.com/8605/16446685812_9098df494b_b.jpg)

Paste your user ID and access token into the Feednix' command-line prompt.

    [Enter User ID] >> XXXXXX
    [Enter token] >> YYYYY

After successful authentication, you will see an initial Feednix screen with two panes. The left-side "Categories" pane shows a list of news categories, while the right-side "Posts" pane displays a list of news articles in the current category.

![](https://farm8.staticflickr.com/7412/16421639256_deb8e2d276_c.jpg)

### Read News in Feednix ###

Here I am going to briefly describe how to access Feedly via Feednix.

#### Navigate Feednix ####

As I mentioned, the top screen of Feednix consists of two panes. To switch focus between the two panes, use TAB key. To move up and down the list within a pane, use 'j' and 'k' keys, respectively. These keyboard shorcuts are obviously inspired by Vim text editor.

#### Read an Article ####

To read a particular article, press 'o' key at the current article. It will invoke w2m browser, and load the article inside the browser. Once you are done reading, press 'q' to quit the browser, and come back to Feednix. If your environment can open a web browser, you can press 'O' to load an article on your default web browser such as Firefox.

![](https://farm8.staticflickr.com/7406/16445870201_b98e8da6d9_b.jpg)

#### Subscribe to a News Feed ####

You can add any arbitrary RSS news feed to your Feedly account from Feednix interface. To do so, simply press 'a' key. This will show "[ENTER FEED]:" prompt at the bottom of the screen. After typing the RSS feed, go ahead and fill in the name of the feed and its preferred category.

![](https://farm8.staticflickr.com/7324/16421639296_b52ed3c52e_c.jpg)

#### Summary ####

As you can see, Feednix is a quite convenient and easy-to-use command-line RSS reader. If you are a command-line junkie as well as a regular Feedly user, Feednix is definitely worth trying. I have been communicating with the creator of Feednix, Jarkore, to troubleshoot some issue. As far as I can tell, he is very active in responding to bug reports and fixing bugs. I encourage you to try out Feednix and let him know your feedback.

--------------------------------------------------------------------------------

via: http://xmodulo.com/feedly-rss-feed-command-line-linux.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:https://feedly.com/
[2]:https://github.com/Jarkore/Feednix
[3]:https://aur.archlinux.org/packages/feednix/