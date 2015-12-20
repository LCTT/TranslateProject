translating---geekpi

Linux / UNIX Desktop Fun: Terminal ASCII Aquarium
================================================================================
You can now enjoy mysteries of the sea from the safety of your own terminal using ASCIIQuarium. It is an aquarium/sea animation in ASCII art created using perl.

### Install Term::Animation ###

First, you need to install Perl module called Term-Animation. Open a command-line terminal (select Applications > Accessories > Terminal), and then type:

    $ sudo apt-get install libcurses-perl
    $ cd /tmp
    $ wget http://search.cpan.org/CPAN/authors/id/K/KB/KBAUCOM/Term-Animation-2.4.tar.gz
    $ tar -zxvf Term-Animation-2.4.tar.gz
    $ cd Term-Animation-2.4/
    $ perl Makefile.PL && make && make test
    $ sudo make install

### Download and Install ASCIIQuarium ###

While still at bash prompt, type:

    $ cd /tmp
    $ wget http://www.robobunny.com/projects/asciiquarium/asciiquarium.tar.gz
    $ tar -zxvf asciiquarium.tar.gz
    $ cd asciiquarium_1.0/
    $ sudo cp asciiquarium /usr/local/bin
    $ sudo chmod 0755 /usr/local/bin/asciiquarium

### How do I view my ASCII Aquarium? ###

Simply type the following command:

    $ /usr/local/bin/asciiquarium

OR

    $ perl /usr/local/bin/asciiquarium

![Fig.01: ASCII Aquarium](http://s0.cyberciti.org/uploads/tips/2011/01/screenshot-ASCIIQuarium.png)

### Related media ###

注：youtube 视频
<iframe width="596" height="335" frameborder="0" allowfullscreen="" src="//www.youtube.com/embed/MzatWgu67ok"></iframe>

[Video 01: ASCIIQuarium - Sea Animation on Linux / Unix Desktop][1]

### Download: erminal ASCII Aquarium KDE and Mac OS X Version ###

[Download asciiquarium][2]. If you're running Mac OS X, try a packaged [version][3] that will run out of the box. For KDE users, try a [KDE Screensaver][4] based on the Asciiquarium.

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/tips/linux-unix-apple-osx-terminal-ascii-aquarium.html

作者：Vivek Gite
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:http://youtu.be/MzatWgu67ok
[2]:http://www.robobunny.com/projects/asciiquarium/html/
[3]:http://habilis.net/macasciiquarium/
[4]:http://kde-look.org/content/show.php?content=29207
