translating---geekpi

The Vrms Program Helps You To Find Non-free Software In Debian
======

![](https://www.ostechnix.com/wp-content/uploads/2018/04/vrms-1-720x340.png)
The other day I was reading an interesting guide that explained the [**difference between free and open source software on Digital ocean**][1]. Until then, I thought both are more or less same. Oh man, I was wrong. There are few significant differences between them. While reading that article, I was wondering how to find non-free software in Linux, hence this post.

### Say hello to “Virtual Richard M. Stallman”, a Perl script to find Non-free Software in Debian

The **Virtual Richard M. Stallman** , shortly **vrms** , is a program, written in Perl, that analyzes the list of installed software on your Debian-based systems and reports all of the packages from non-free and contrib trees which are currently installed. For those wondering, a free software should meet the following [**four essential freedoms**][2].

  * **Freedom 0** – The freedom to run the program as you wish, for any purpose.
  * **Freedom 1** – The freedom to study how the program works, and adapt it to your needs. Access to the source code is a precondition for this.
  * **Freedom 2** – The freedom to redistribute copies so you can help your neighbor.
  * **Freedom 3** – The freedom to improve the program, and release your improvements to the public, so that the whole community benefits. Access to the source code is a precondition for this.



Any software that doesn’t meet the above four conditions are not considered as a free software. In a nutshell, a **Free software means the users have the freedom to run, copy, distribute, study, change and improve the software.**

Now let us find if the installed software is free or non-free, shall we?

The Vrms package is available in the default repositories of Debian and its derivatives like Ubuntu. So, you can install it using apt package manager using the following command.
```
$ sudo apt-get install vrms

```

Once installed, run the following command to find non-free software in your debian-based system.
```
$ vrms

```

Sample output from my Ubuntu 16.04 LTS desktop.
```
 Non-free packages installed on ostechnix

unrar Unarchiver for .rar files (non-free version)

1 non-free packages, 0.0% of 2103 installed packages.

```

![][4]

As you can see in the above screenshot, I have one non-free package installed in my Ubuntu box.

If you don’t have any non-free packages on your system, you should see the following output instead.
```
No non-free or contrib packages installed on ostechnix! rms would be proud.

```

Vrms can able to find non-free packages not just on Debian but also from Ubuntu, Linux Mint and other deb-based systems as well.

**Limitations**

The Vrms program has some limitations though. Like I already mentioned, it lists the packages from the non-free and contrib sections installed. However, some distributions doesn’t follow the policy which ensures proprietary software only ends up in repository sections recognized by vrms as “non-free” and they make no effort to preserve this separation. In such cases, Vrms won’t recognize the non-free software and will always report that you have non-free software installed on your system. If you’re using distros like Debian and Ubuntu that follows the policy of keeping proprietary software in a non-free repositories, Vrms will definitely help you to find the non-free packages.

And, that’s all. Hope this was useful. More good stuffs to come. Stay tuned!

Happy Tamil new year wishes to all Tamil folks around the world!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/the-vrms-program-helps-you-to-find-non-free-software-in-debian/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.digitalocean.com/community/tutorials/Free-vs-Open-Source-Software
[2]:https://www.gnu.org/philosophy/free-sw.html
[3]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[4]:http://www.ostechnix.com/wp-content/uploads/2018/04/vrms.png
