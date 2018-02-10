translating---geekpi

How to use lftp to accelerate ftp/https download speed on Linux/UNIX
======
lftp is a file transfer program. It allows sophisticated FTP, HTTP/HTTPS, and other connections. If the site URL is specified, then lftp will connect to that site otherwise a connection has to be established with the open command. It is an essential tool for all a Linux/Unix command line users. I have already written about [Linux ultra fast command line download accelerator][1] such as Axel and prozilla. lftp is another tool for the same job with more features. lftp can handle seven file access methods:

  1. ftp
  2. ftps
  3. http
  4. https
  5. hftp
  6. fish
  7. sftp
  8. file



### So what is unique about lftp?

  * Every operation in lftp is reliable, that is any not fatal error is ignored, and the operation is repeated. So if downloading breaks, it will be restarted from the point automatically. Even if FTP server does not support REST command, lftp will try to retrieve the file from the very beginning until the file is transferred completely.
  * lftp has shell-like command syntax allowing you to launch several commands in parallel in the background.
  * lftp has a builtin mirror which can download or update a whole directory tree. There is also a reverse mirror (mirror -R) which uploads or updates a directory tree on the server. The mirror can also synchronize directories between two remote servers, using FXP if available.



### How to use lftp as download accelerator

lftp has pget command. It allows you download files in parallel. The syntax is
`lftp -e 'pget -n NUM -c url; exit'`
For example, download <http://kernel.org/pub/linux/kernel/v2.6/linux-2.6.22.2.tar.bz2> file using pget in 5 parts:
```
$ cd /tmp 
$ lftp -e 'pget -n 5 -c http://kernel.org/pub/linux/kernel/v2.6/linux-2.6.22.2.tar.bz2'
```
Sample outputs:
```
45108964 bytes transferred in 57 seconds (775.3K/s)
lftp :~>quit

```

Where,

  1. pget – Download files in parallel
  2. -n 5 – Set maximum number of connections to 5
  3. -c – Continue broken transfer if lfile.lftp-pget-status exists in the current directory



### How to use lftp to accelerate ftp/https download on Linux/Unix

Another try with added exit command:
`$ lftp -e 'pget -n 10 -c https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.15.tar.xz; exit'`

[Linux-lftp-command-demo][https://www.cyberciti.biz/tips/wp-content/uploads/2007/08/Linux-lftp-command-demo.mp4]

### A note about parallel downloading

Please note that by using download accelerator you are going to put a load on remote host. Also note that lftp may not work with sites that do not support multi-source downloads or blocks such requests at firewall level.

NA command offers many other features. Refer to [lftp][2] man page for more information:
`man lftp`

### about the author

The author is the creator of nixCraft and a seasoned sysadmin and a trainer for the Linux operating system/Unix shell scripting. He has worked with global clients and in various industries, including IT, education, defense and space research, and the nonprofit sector. Follow him on [Twitter][3], [Facebook][4], [Google+][5]. Get the **latest tutorials on SysAdmin, Linux/Unix and open source topics via[my RSS/XML feed][6]**.

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/tips/linux-unix-download-accelerator.html

作者：[Vivek Gite][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/tips/download-accelerator-for-linux-command-line-tools.html
[2]:https://lftp.yar.ru/
[3]:https://twitter.com/nixcraft
[4]:https://facebook.com/nixcraft
[5]:https://plus.google.com/+CybercitiBiz
[6]:https://www.cyberciti.biz/atom/atom.xml
