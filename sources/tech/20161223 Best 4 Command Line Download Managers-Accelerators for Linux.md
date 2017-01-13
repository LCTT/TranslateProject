translating---geekpi

Best 4 Command Line Download Managers/Accelerators for Linux
============================================================

We all very often uses download manager to download files from internet for different requirements, it’s one of the major contributor for me as well as others too. We all want a super fast download manager to complete the download as much possible, so that we can save our time and move forward for further work. There are a lot of download managers and accelerators available (GUI & CLI) which speeds up your download.

All the download utility doing the same task but they way of handling & feature is differ like, Single threaded and multi-threaded, interactive and non-interactive. Here, we are going to list best four command line download accelerators which we uses regularly for day to day work.

#### #1 Aria2

[Aria2][1] is a lightweight multi-protocol & multi-source command-line download manager/utility for Linux, Windows & Mac OSX. It supports HTTP/HTTPS, FTP, SFTP, BitTorrent and Metalink. aria2 can be manipulated via built-in JSON-RPC and XML-RPC interfaces.

It supports multi-threading and uses multiple sources/protocols to download files which really speeds up your download and complete the download as much as possible.

It’s very lightweight and doesn’t require much memory and CPU. We can use as a BitTorrent Client because it has all the features you want in BitTorrent client.

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

Refer the following article for further usage of Aria2.

[How to Install & use Aria2 in Linux][2]

#### #2 Axel

[Axel][3] is a lightweight download utility, it does the same thing how other accelerator does. It opens multiple connections for one file and each connections download separate file fragment to complete the download more quickly.

Axel supports HTTP, HTTPS, FTP and FTPS protocols. It can also use multiple mirrors for single file download. So, Axel can speed up a download up to 40% (approximately, i personally realized). It’s very lightweight because no dependencies and uses very less CPU & RAM.

Axel downloads all the data directly to the destination file, using one single thread.

Note : There is no option to download the two file in single command

Refer the following article for further usage of Axel.

[How to Install & use Axel in Linux][4]

#### #3 Wget

[Wget][5] (formerly known as Geturl) is a Free, open source, command line downloader which is retrieving files using HTTP, HTTPS and FTP, the most widely-used Internet protocols. It is a non-interactive command line tool and Its name is derived from World Wide Web and get.

Wget handle download pretty much good compared with other tools, even it doesn’t support multi-threading and futures included working in background, recursive download, multiple file downloads, resume downloads, non-interactive downloads & large file downloads.

By default all the Linux Distribution included wget, so we can install easily from official repository, also we can install to windows and Mac OS too.

Wget has been designed for robustness over slow or unstable network connections, if a download fails due to a network problem, it will keep retrying until the whole file has been retrieved. If the server supports regetting, it will instruct the server to continue the download from where it left off.

#### Wget Features

*   Can resume aborted downloads, using REST and RANGE
*   Can use filename wild cards and recursively mirror directories
*   NLS-based message files for many different languages
*   Optionally converts absolute links in downloaded documents to relative, so that downloaded documents may link to each other locally
*   Runs on most UNIX-like operating systems as well as Microsoft Windows
*   Supports HTTP proxies
*   Supports HTTP cookies
*   Supports persistent HTTP connections
*   Unattended / background operation
*   Uses local file timestamps to determine whether documents need to be re-downloaded when mirroring

Refer the following article for further usage of Wget.

[How to Install & use Wget in Linux][6]

#### #4 Curl

[Curl][7] is similar to wget and doesn’t support multi-threading but surprisingly make the download much faster compare with wget.

curl is a tool to transfer data from a server or to server, using one of the supported protocols (DICT, FILE, FTP, FTPS, GOPHER, HTTP, HTTPS, IMAP, IMAPS, LDAP, LDAPS, POP3, POP3S, RTMP, RTSP, SCP, SFTP, SMTP, SMTPS, TELNET and TFTP).

The command is designed to work without user interaction. Also curl support proxy support, user authentication, FTP upload, HTTP post, SSL connections, cookies, file transfer resume, Metalink, and more. curl is powered by libcurl for all transfer-related features.

If you specify URL without `protocol://` prefix, curl will attempt to guess what protocol you might want. For example, host names starting with “ftp.”curl will assume you want to speak FTP. If it’s not find specific protocol, then do default to HTTP.

Refer the following article for further usage of Curl.

[How to Install & use Curl in Linux][8]

--------------------------------------------------------------------------------

via: http://www.2daygeek.com/best-4-command-line-download-managers-accelerators-for-linux/

作者：[Magesh Maruthamuthu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.2daygeek.com/author/magesh/
[1]:https://aria2.github.io/
[2]:http://www.2daygeek.com/aria2-command-line-download-utility-tool/
[3]:https://axel.alioth.debian.org/
[4]:http://www.2daygeek.com/axel-command-line-downloader-accelerator-for-linux/
[5]:https://www.gnu.org/software/wget/
[6]:http://www.2daygeek.com/wget-command-line-download-utility-tool/
[7]:https://curl.haxx.se/
[8]:http://www.2daygeek.com/curl-command-line-download-manager/
