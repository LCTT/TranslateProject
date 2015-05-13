Translating by GOLinux!
Linux FAQs with Answers--How to view torrent file content on Linux
================================================================================
> **Question**: I have a torrent file downloaded from the web. Is there a tool that allows me to view the content of a torrent on Linux? For example, I want to know what files are included inside a torrent. 

A torrent file (i.e., a file with **.torrent** extension) is a BitTorrent metadata file which stores information (e.g., tracker URLs, file list, sizes, checksums, creation date) needed by a BitTorrent client to download files shared on BitTorrent peer-to-peer networks. Inside a single torrent file, one or more files can be listed for sharing.

The content of a torrent file is encoded with BEncode, the BitTorrent's data serialization format. Thus to view the content of a torrent file, you need a corresponding decoder.

In fact, any GUI-based BitTorrent client (e.g., Transmission or uTorrent) is equipped with BEncode decoder, so can show to you the content of a torrent file by opening it. However, if you don't want to use any sort of BitTorrent client to check up on a torrent file, you can try a command-line torrent viewer called [dumptorrent][2].

The **dumptorrent** command prints the detailed content of a torrent file (e.g., file names, sizes, tracker URLs, creation date, info hash, etc.) by using a built-in BEncode decoder.

### Install DumpTorrent on Linux ###

To install dumptorrent on Linux, you can build it from the source.

On Debian, Ubuntu or Linux Mint:

    $ sudo apt-get install gcc make
    $ wget http://downloads.sourceforge.net/project/dumptorrent/dumptorrent/1.2/dumptorrent-1.2.tar.gz
    $ tar -xvf dumptorrent-1.2.tar.gz
    $ cd dumptorrent-1.2
    $ make
    $ sudo cp dumptorrent /usr/local/bin 

On CentOS, Fedora or RHEL:

    $ sudo yum install gcc make
    $ wget http://downloads.sourceforge.net/project/dumptorrent/dumptorrent/1.2/dumptorrent-1.2.tar.gz
    $ tar -xvf dumptorrent-1.2.tar.gz
    $ cd dumptorrent-1.2
    $ make
    $ sudo cp dumptorrent /usr/local/bin 

Make sure that /usr/local/bin is [included][2] in your PATH.

### View the Content of a Torrent ###

To check the content of a torrent, simply run dumptorrent with a torrent file as an argument. This will print a summary of a torrent, including file names, sizes and tracker URL.

    $ dumptorrent <torrent-file> 

![](https://farm8.staticflickr.com/7729/16816455904_b051e29972_b.jpg)

To view the full content of a torrent, add "-v" option. This will print more detailed information of a torrent, including info-hash, piece length, creation date, creator, and full announce list.

    $ dumptorrent -v <torrent-file> 

![](https://farm6.staticflickr.com/5331/17438628461_1f6675bd77_b.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/view-torrent-file-content-linux.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:http://dumptorrent.sourceforge.net/
[2]:http://ask.xmodulo.com/change-path-environment-variable-linux.html
