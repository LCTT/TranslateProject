How To Switch Between Different Versions Of Commands In Linux
======

![](https://www.ostechnix.com/wp-content/uploads/2018/08/alt-tool-720x340.png)

A couple days ago, we discussed how to [**switch between multiple PHP versions**][1]. In that method, we used **‘update-alternatives’** command to switch from one PHP version to another. That means, the update-alternatives commands helps you to set which system wide version of PHP you want to use by default. To put this in layman terms, you can change the version of a command system wide using ‘update-alternatives’ command. What if you want to change command versions dynamically depending on what directory you’re in? This is where **‘alt’** utility comes in help. The alt is a command line tool that helps you to switch between different versions of commands in Unix-like systems. It is a simple, free, open source tool written in **Rust** programming language.

### Installation

Installing alt utility is trivial.

To install alt on your Linux machine, just run the following command:
```
$ curl -sL https://github.com/dotboris/alt/raw/master/install.sh | bash -s

```

Next, add the shims directory to your PATH environment variable depending upon the SHELL you are use.

For BASH:
```
$ echo 'export PATH="$HOME/.local/alt/shims:$PATH"' >> ~/.bashrc
$ source ~/.bashrc

```

For ZSH:
```
$ echo 'export PATH="$HOME/.local/alt/shims:$PATH"' >> ~/.zshrc
$ source ~/.zshrc

```

For FISH:
```
$ echo 'set -x PATH "$HOME/.local/alt/shims" $PATH' >> ~/.config/fish/config.fish

```

Alt is installed!

### Switch Between Different Versions Of Commands Using Alt Tool In Linux

Like I mentioned earlier, alt works with the current directory. That means, when you switch from one version to another, you do so for the current working directory only, not system wide.

Let us see an example. I have installed two PHP versions in my Ubuntu system, PHP 5.6 and PHP 7.2 respectively and I have some PHP applications in a directory called **‘myproject’**.

First, let us see the globally installed PHP version using command:
```
$ php -v

```

**Sample output:**

![Find PHP version][3]

As you see in the above screenshot, my system wide default version is PHP7.2.

Next, I am gong to “myproject” directory where I have kept my PHP applications.
```
$ cd myproject

```

Scan the available PHP versions using the following command:
```
$ alt scan php

```

**Sample output:**

![alt scan php][4]

As you can see, I have two PHP versions, PHP5.6 and PHP7.2. Now press **< SPACEBAR>** key to select all available versions. After selecting all available versions, you will see a cross mark behind each version as shown below picture. Use UP/DOWN arrows to move between the versions. Finally press ENTER to save the changes.

![Select php version][5]

Next run the following command to choose which PHP version you want to use inside the ‘myproject’ directory:
```
$ alt use php

```

I am going to use PHP5.6 version, so I selected it(use arrow keys to select) and hit ENTER key.

![set php version][6]

You can now use php 5.6 (/usr/bin/php5.6) when in /home/sk/myproject directory.

Let us check if the PHP5.6 is set as default inside the myproject directory:
```
$ php -v

```

**Sample output:**

![Check PHP version][7]

It will stay as 5.6 version until you change to different version. Got it? Good! Please note that we use php5.6 version only inside this directory. On system level, PHP7.2 is still the default version. Have a look at the following image.

![Check PHP version 1][8]

As you can see in the above screenshot, I have two different versions of PHP. Inside the ‘myproject’ directory, I got PHP5.6 and outside the myproject, PHP version is 7.2.

Similarly, you can set any version of your choice in each directory. I used PHP for the demonstration purpose. You can, however, use any software of your choice, for example NodeJS.

Here is the demonstration video for NodeJS.

![][9]

The alt utility can be useful when you wanted to test your applications under different versions of applications.

And, that’s all for now. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-switch-between-different-versions-of-commands-in-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/how-to-switch-between-multiple-php-versions-in-ubuntu/
[2]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]:http://www.ostechnix.com/wp-content/uploads/2018/08/Find-PHP-version.png
[4]:http://www.ostechnix.com/wp-content/uploads/2018/08/alt-scan-php.png
[5]:http://www.ostechnix.com/wp-content/uploads/2018/08/Select-php-version.png
[6]:http://www.ostechnix.com/wp-content/uploads/2018/08/set-php-version.png
[7]:http://www.ostechnix.com/wp-content/uploads/2018/08/Check-PHP-version.png
[8]:http://www.ostechnix.com/wp-content/uploads/2018/08/Check-PHP-version-1.png
[9]:http://www.ostechnix.com/wp-content/uploads/2018/08/Alt-NodeJS-demo.gif
