Translating---geekpi

Non-Linux FOSS: Homebrew
================================================================================
I use OS X quite often during my day job. I'm able to tolerate it largely due to the terminal. If I couldn't do my work with green text on a black background, I think I'd go crazy (or crazier). Unfortunately, OS X doesn't come with all the command-line tools I need. That's where Homebrew comes in to save the day. 

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/imagecache/large-550px-centered/u1002061/11811fossf1.png)

Homebrew acts like the package management system OS X is lacking. Using commands very similar to apt-get, it allows the installation of hundreds of applications. A perfect example is the wget program. I was surprised to find that OS X doesn't include wget, but with Homebrew, it's a simple one-liner away.

The best part is that Homebrew installs everything in the /usr/local file space. There's no reason to worry about Homebrew corrupting your system, because it doesn't touch anything outside of /usr/local. OS X system updates won't overwrite your programs, and because /usr/local/bin is already in the PATH, installed Homebrew apps just work!

Homebrew uses Ruby to manage its packages and functions, but it doesn't require any programming knowledge to use. And the installation procedure is literally a copy/paste on the command line. If you use OS X, but you wish you could install packages as easily as in Linux, give Homebrew a try: [http://brew.sh][1]. 

--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/non-linux-foss-homebrew

作者：[Shawn Powers][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linuxjournal.com/users/shawn-powers
[1]:http://brew.sh/
