5 Linux Command Line Based Tools for Downloading Files and Browsing Websites
================================================================================
Linux command-line, the most adventurous and fascinating part of GNU/Linux is very cool and powerful tool. Command line itself is very productive and the availability of various inbuilt and third party command line application makes Linux robust and powerful. The Linux Shell supports a variety of web application of various kind be it torrent downloader, dedicated downloader or Internet Surfing.

![Command Line Internet Tools](http://www.tecmint.com/wp-content/uploads/2014/02/Command-Line-Internet-Tools.jpg)
5 Command Line Internet Tools

Here we are presenting 5 great command line Internet tools, which are very useful and proves to be very handy.

### 1. rTorrent ###

rTorrent is a text­-based Torrent Client which is written in C++ aimed at high performance. It is available for most of the standard Linux Distributions including FreeBSD and Mac OS X.

#### Installation of rTorrent ####

    # apt­-get install rtorrent    (on APT based System)

----------

    # yum install rtorrent        (on YUM based System)

Check if rtorrent is installed correctly by running the following command in the terminal.

    # rtorrent

![Command line torrent download](http://www.tecmint.com/wp-content/uploads/2014/02/rTorrent.jpeg)
rTorrent Command Line Tool

#### Functioning of rTorrent ####

Some of the useful Key-bindings and their use.

- CTRL+ q – Quit rTorrent Application
- CTRL+ s – Start Download
- CTRL+ d – Stop an active Download or Remove an already stopped Download.
- CTRL+ k – Stop and Close an active Download.
- CTRL+ r – Hash Check a torrent before Upload/Download Begins.
- CTRL+ q – When this key combination is executed twice, rTorrent shutdown without sending a stop Signal.
- Left Arrow Key – Redirect to Previous screen.
- Right Arrow Key – Redirect to Next Screen

### 2. Wget ###

Wget, is a part of GNU Project, the name is derived from World Wide Web (WWW). Wget is a brilliant tool which is useful for recursive download, offline viewing of HTML from local Server and is available for most of the platforms be it Windows, Mac, Linux. Wget makes it possible to download files over HTTP, HTTPS and FTP. Moreover it can be useful in mirroring the whole website as well as support for proxy browsing, pausing/resuming Downloads.

#### Installation of Wget ####

Wget being a GNU project comes bundled with Most of the Standard Linux Distributions and there is no need to download and install it separately. If in-case, it’s not installed by default, you can still install it using apt or yum.

    # apt­-get install wget        (on APT based System)

----------

    # yum install wget        (on YUM based System)

#### Some Basic Usage of Wget ####

Download a single file using wget.

    # wget http://www.website-name.com/file

Download a whole website, recursively.

    # wget -r http://www.website-name.com

Download specific type of file (say pdf and png) from a website.

    # wget -r -A png,pdf http://www.website-name.com

Wget is a wonderful tool which enables custom and filtered download even on limited resource Machine. A screen shot of wget download, where we are mirroring a website (Yahoo.com).

![Wget Download Files](http://www.tecmint.com/wp-content/uploads/2014/02/Wget.jpeg)
Wget Command Line File Download

For more such wget download examples, read our article that shows [10 Wget Download Command Examples][1].

### 3. cURL ###

cURL is a command line tool for transferring data over a number of protocols. cURL is a client side application which support protocols like FTP, HTTP, FTPS, TFTP, TELNET, IMAP, POP3, etc. cURL is a simple downloader which is different from wget in supporting LDAP, POP3 as compared to others. Moreover Proxy Downloading, pausing download, resuming download are well supported in cURL.

#### Installation of cURL ####

By default cURL is available in most of the distribution either in repository or installed. if it’s not installed, just do a apt or yum to get a required package from the repository.

    # apt­-get install curl        (on APT based System)

----------

    # yum install curl        (on YUM based System)

Basic Usage of cURL

    # curl www.tecmint.com

![Curl Download](http://www.tecmint.com/wp-content/uploads/2014/02/Curl.jpeg)
Curl Data Download

![Curl Data Download](http://www.tecmint.com/wp-content/uploads/2014/02/Curl-2.jpeg)
Curl Download

### 4. w3m ###

The w3m is a text based web browser released under GPL. W3m support tables, frames, color, SSL connection and inline images. W3m is known for fast browsing.

#### Installation of w3m ####

Again w3m is available by default in most of the Linux Distribution. If incase, it is not available you can always apt or yum the required package.

    # apt­-get install w3m        (on APT based System)

----------

    # yum install w3m        (on YUM based System)

#### Basic Usage of w3m ####

    # w3m www.tecmint.com

![Command Line Browser](http://www.tecmint.com/wp-content/uploads/2014/02/w3m.jpeg)
w3m Text Based Web Browser

### 5. Elinks ###

Elinks is a free text-based web browser for Unix and Unix based System. Elinks support HTTP, HTTP Cookies and also support browsing script in Perl and Ruby. Tab based browsing is well supported. The best thing is that it supports Mouse, Display Colours and support a number of Protocols like HTTP, FTP, SMB, Ipv4 and Ipv6.

#### Installation of Elinks ####

By default elinks also available in most of the Linux distributions. If not, install it via apt or yum.

    # apt­-get install elinks    (on APT based System)

----------

    # yum install elinks        (on YUM based System)

Basic Usage of Elinks

    # elinks www.tecmint.com

![Command Line Internet Browsing](http://www.tecmint.com/wp-content/uploads/2014/02/Elinks.jpeg)
Elinks Command Line Web Browsing

That’s all for now. I’ll be here again with an interesting article which you people will love to read. Till then stay tuned and connected to Tecmint and don’t forget to give your valuable feedback in comment section.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-command-line-tools-for-downloading-files/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/10-wget-command-examples-in-linux/