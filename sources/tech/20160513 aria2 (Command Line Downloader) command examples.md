yangmingming translating
# aria2 (Command Line Downloader) command examples

[aria2][4] is a Free, open source, lightweight multi-protocol & multi-source command-line download utility. It supports HTTP/HTTPS, FTP, SFTP, BitTorrent and Metalink. aria2 can be manipulated via built-in JSON-RPC and XML-RPC interfaces. aria2 automatically validates chunks of data while downloading a file. It can download a file from multiple sources/protocols and tries to utilize your maximum download bandwidth. By default all the Linux Distribution included aria2, so we can install easily from official repository. some of the GUI download manager using aria2 as a plugin to improve the download speed like [uget][3].

#### Aria2 Features

*   HTTP/HTTPS GET support
*   HTTP Proxy support
*   HTTP BASIC authentication support
*   HTTP Proxy authentication support
*   FTP support(active, passive mode)
*   FTP through HTTP proxy(GET command or tunneling)
*   Segmented download
*   Cookie support
*   It can run as a daemon process.
*   BitTorrent protocol support with fast extension.
*   Selective download in multi-file torrent
*   Metalink version 3.0 support(HTTP/FTP/BitTorrent).
*   Limiting download/upload speed

#### 1) Install aria2 on Linux

We can easily install aria2 command line downloader to all the Linux Distribution such as Debian, Ubuntu, Mint, RHEL, CentOS, Fedora, suse, openSUSE, Arch Linux, Manjaro, Mageia, etc.. Just fire the below command to install. For CentOS, RHEL systems we need to enable [uget][2] or [RPMForge][1] repository.

```
[For Debian, Ubuntu & Mint]
$ sudo apt-get install aria2

[For CentOS, RHEL, Fedora 21 and older Systems]
# yum install aria2

[Fedora 22 and later systems]
# dnf install aria2

[For suse & openSUSE]
# zypper install wget

[Mageia]
# urpmi aria2

[For Debian, Ubuntu & Mint]
$ sudo pacman -S aria2

```

#### 2) Download Single File

The below command will download the file from given URL and stores in current directory, while downloading the file we can see the (date, time, download speed & download progress) of file.

```
# aria2c https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2
[#986c80 19MiB/21MiB(90%) CN:1 DL:3.0MiB]
03/22 09:49:13 [NOTICE] Download complete: /opt/owncloud-9.0.0.tar.bz2

Download Results:
gid   |stat|avg speed  |path/URI
======+====+===========+=======================================================
986c80|OK  |   3.0MiB/s|/opt/owncloud-9.0.0.tar.bz2

Status Legend:
(OK):download completed.

```

#### 3) Save the file with different name

We can save the file with different name & format while initiate downloading, using -o (lowercase) option. Here we are going to save the filename with owncloud.zip.

```
# aria2c -o owncloud.zip https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2
[#d31304 16MiB/21MiB(74%) CN:1 DL:6.2MiB]
03/22 09:51:02 [NOTICE] Download complete: /opt/owncloud.zip

Download Results:
gid   |stat|avg speed  |path/URI
======+====+===========+=======================================================
d31304|OK  |   7.3MiB/s|/opt/owncloud.zip

Status Legend:
(OK):download completed.

```

#### 4) Limit download speed

By default aria2 utilize full bandwidth for downloading file and we can’t use anything on server before download completion (Which will affect other service accessing bandwidth). So better use –max-download-limit option to avoid further issue while downloading big size file.

```
# aria2c --max-download-limit=500k https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2
[#7f9fbf 21MiB/21MiB(99%) CN:1 DL:466KiB]
03/22 09:54:51 [NOTICE] Download complete: /opt/owncloud-9.0.0.tar.bz2

Download Results:
gid   |stat|avg speed  |path/URI
======+====+===========+=======================================================
7f9fbf|OK  |   462KiB/s|/opt/owncloud-9.0.0.tar.bz2

Status Legend:
(OK):download completed.

```

#### 5) Download Multiple Files

The below command will download more then on file from the location and stores in current directory, while downloading the file we can see the (date, time, download speed & download progress) of file.

```
# aria2c -Z https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2 ftp://ftp.gnu.org/gnu/wget/wget-1.17.tar.gz
[DL:1.7MiB][#53533c 272KiB/21MiB(1%)][#b52bb1 768KiB/3.6MiB(20%)]
03/22 10:25:54 [NOTICE] Download complete: /opt/wget-1.17.tar.gz
[#53533c 18MiB/21MiB(86%) CN:1 DL:3.2MiB]
03/22 10:25:59 [NOTICE] Download complete: /opt/owncloud-9.0.0.tar.bz2

Download Results:
gid   |stat|avg speed  |path/URI
======+====+===========+=======================================================
b52bb1|OK  |   2.8MiB/s|/opt/wget-1.17.tar.gz
53533c|OK  |   3.4MiB/s|/opt/owncloud-9.0.0.tar.bz2

Status Legend:
(OK):download completed.

```

#### 6) Resume Incomplete download

Make sure, whenever going to download big size of file (eg: ISO Images), i advise you to use -c option which will help us to resume the existing incomplete download from the state and complete as usual when we are facing any network connectivity issue or system problems. Otherwise when you are download again, it will initiate the fresh download and store to different file name (append .1 to the filename automatically). Note: If any interrupt happen, aria2 save file with .aria2 extension.

<iframe marginwidth="0" marginheight="0" scrolling="no" frameborder="0" height="90" width="728" id="_mN_gpt_827143833" style="border-width: 0px; border-style: initial; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;"></iframe>
```
# aria2c -c https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2
[#db0b08 8.2MiB/21MiB(38%) CN:1 DL:3.1MiB ETA:4s]^C
03/22 10:09:26 [NOTICE] Shutdown sequence commencing... Press Ctrl-C again for emergency shutdown.

03/22 10:09:26 [NOTICE] Download GID#db0b08bf55d5908d not complete: /opt/owncloud-9.0.0.tar.bz2

Download Results:
gid   |stat|avg speed  |path/URI
======+====+===========+=======================================================
db0b08|INPR|   3.3MiB/s|/opt/owncloud-9.0.0.tar.bz2

Status Legend:
(INPR):download in-progress.

aria2 will resume download if the transfer is restarted.

# aria2c -c https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2
[#873d08 21MiB/21MiB(98%) CN:1 DL:2.7MiB]
03/22 10:09:57 [NOTICE] Download complete: /opt/owncloud-9.0.0.tar.bz2

Download Results:
gid   |stat|avg speed  |path/URI
======+====+===========+=======================================================
873d08|OK  |   1.9MiB/s|/opt/owncloud-9.0.0.tar.bz2

Status Legend:
(OK):download completed.

```

#### 7) Get the input from file

Alternatively wget can get the list of input URL’s from file and start downloading. We need to create a file and store each URL in separate line. Add -i option with aria2 command to perform this action.

```
# aria2c -i test-aria2.txt
[DL:3.9MiB][#b97984 192KiB/21MiB(0%)][#673c8e 2.5MiB/3.6MiB(69%)]
03/22 10:14:22 [NOTICE] Download complete: /opt/wget-1.17.tar.gz
[#b97984 19MiB/21MiB(90%) CN:1 DL:2.5MiB]
03/22 10:14:30 [NOTICE] Download complete: /opt/owncloud-9.0.0.tar.bz2

Download Results:
gid   |stat|avg speed  |path/URI
======+====+===========+=======================================================
673c8e|OK  |   4.3MiB/s|/opt/wget-1.17.tar.gz
b97984|OK  |   2.5MiB/s|/opt/owncloud-9.0.0.tar.bz2

Status Legend:
(OK):download completed.

```

#### 8) Download using 2 connections per host

The maximum number of connections to one server for each download. By default this will establish one connection to each host. We can establish more then one connection to each host to speedup download by adding -x2 (2 means, two connection) option with aria2 command

```
# aria2c -x2 https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2
[#ddd4cd 18MiB/21MiB(83%) CN:1 DL:5.0MiB]
03/22 10:16:27 [NOTICE] Download complete: /opt/owncloud-9.0.0.tar.bz2

Download Results:
gid   |stat|avg speed  |path/URI
======+====+===========+=======================================================
ddd4cd|OK  |   5.5MiB/s|/opt/owncloud-9.0.0.tar.bz2

Status Legend:
(OK):download completed.

```

#### 9) Download Torrent Files

We can directly download a Torrent files using aria2 command.

```
# aria2c https://torcache.net/torrent/C86F4E743253E0EBF3090CCFFCC9B56FA38451A3.torrent?title=[kat.cr]irudhi.suttru.2015.official.teaser.full.hd.1080p.pathi.team.sr
[#388321 0B/0B CN:1 DL:0B]                                                                                                                    
03/22 20:06:14 [NOTICE] Download complete: /opt/[kat.cr]irudhi.suttru.2015.official.teaser.full.hd.1080p.pathi.team.sr.torrent

03/22 20:06:14 [ERROR] Exception caught
Exception: [BtPostDownloadHandler.cc:98] errorCode=25 Could not parse BitTorrent metainfo

Download Results:
gid   |stat|avg speed  |path/URI
======+====+===========+=======================================================
388321|OK  |    11MiB/s|/opt/[kat.cr]irudhi.suttru.2015.official.teaser.full.hd.1080p.pathi.team.sr.torrent

Status Legend:
(OK):download completed.

```

#### 10) Download BitTorrent Magnet URI

Also we can directly download a Torrent files through BitTorrent Magnet URI using aria2 command.

```
# aria2c 'magnet:?xt=urn:btih:248D0A1CD08284299DE78D5C1ED359BB46717D8C'

```

#### 11) Download BitTorrent Metalink

Also we can directly download a Metalink file using aria2 command.

```
# aria2c https://curl.haxx.se/metalink.cgi?curl=tar.bz2

```

#### 12) Download a file from password protected site

Alternatively we can download a file from password protected site. The below command will download the file from password protected site.

```
# aria2c --http-user=xxx --http-password=xxx https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2

# aria2c --ftp-user=xxx --ftp-password=xxx ftp://ftp.gnu.org/gnu/wget/wget-1.17.tar.gz

```

#### 13) Read more about aria2

If you want to know more option which is available for wget, you can grep the details on your terminal itself by firing below commands..

```
# man aria2c
or
# aria2c --help

```

Enjoy…)

--------------------------------------------------------------------------------

via: http://www.2daygeek.com/aria2-command-line-download-utility-tool/

作者：[MAGESH MARUTHAMUTHU][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.2daygeek.com/author/magesh/
[1]:http://www.2daygeek.com/aria2-command-line-download-utility-tool/
[2]:http://www.2daygeek.com/aria2-command-line-download-utility-tool/
[3]:http://www.2daygeek.com/install-uget-download-manager-on-ubuntu-centos-debian-fedora-mint-rhel-opensuse/
[4]:https://aria2.github.io/
