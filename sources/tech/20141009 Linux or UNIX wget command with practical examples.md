Translating by GOLinux ...
Linux/UNIX wget command with practical examples
================================================================================
wget is a Linux/UNIX command line **file downloader**.Wget is a free utility for non-interactive download of files from the Web. It supports **HTTP**, **HTTPS**, and **FTP** protocols, as well as retrieval through HTTP proxies.Wget is non-interactive, meaning that it can work in the background, while the user is not logged on.

In this post we will discuss different examples of wget command.

### Example:1 Download Single File ###

    # wget http://mirror.nbrc.ac.in/centos/7.0.1406/isos/x86_64/CentOS-7.0-1406-x86_64-DVD.iso

This command will download the CentOS 7 ISO file in the user’s current working directtory.

### Example:2 Resume Partial Downloaded File ###

There are some scenarios where we start downloading a large file but in the middle Internet got disconnected , so using the option ‘**-c**’ in wget command we can resume our download from where it got disconnected.

    # wget -c http://mirror.nbrc.ac.in/centos/7.0.1406/isos/x86_64/CentOS-7.0-1406-x86_64-DVD.iso

![](http://www.linuxtechi.com/wp-content/uploads/2014/09/wget-resume-download-1024x111-1.jpg)

### Example:3 Download Files in the background ###

We can download the file in the background using the option ‘-b’ in wget command.

    linuxtechi@localhost:~$ wget -b http://mirror.nbrc.ac.in/centos/7.0.1406/isos/x86_64/
    CentOS-7.0-1406-x86_64-DVD.iso
    Continuing in background, pid 4505.
    Output will be written to ‘wget-log’.

As we can see above that downloading progress is capture in ‘wget-log’ file in user’s current directory.

    linuxtechi@localhost:~$ tail -f wget-log
    2300K ………. ………. ………. ………. ………. 0% 48.1K 18h5m
    2350K ………. ………. ………. ………. ………. 0% 53.7K 18h9m
    2400K ………. ………. ………. ………. ………. 0% 52.1K 18h13m
    2450K ………. ………. ………. ………. ………. 0% 58.3K 18h14m
    2500K ………. ………. ………. ………. ………. 0% 63.6K 18h14m
    2550K ………. ………. ………. ………. ………. 0% 63.4K 18h13m
    2600K ………. ………. ………. ………. ………. 0% 72.8K 18h10m
    2650K ………. ………. ………. ………. ………. 0% 59.8K 18h11m
    2700K ………. ………. ………. ………. ………. 0% 52.8K 18h14m
    2750K ………. ………. ………. ………. ………. 0% 58.4K 18h15m
    2800K ………. ………. ………. ………. ………. 0% 58.2K 18h16m
    2850K ………. ………. ………. ………. ………. 0% 52.2K 18h20m

### Example:4 Limiting Download Speed . ###

By default wget command try to use full bandwidth , but there may be case that you are using shared internet , so if you try to download huge file using wget , this may slow down Internet of other users. This situation can be avoided if you limit the download speed using ‘–limit-rate‘ option.

    #wget --limit-rate=100k http://mirror.nbrc.ac.in/centos/7.0.1406/isos/x86_64/CentOS-7.0-1406-x86_64-DVD.iso

In the above example,the download speed is limited to 100k.

### Example:5 Download Multiple Files using ‘-i’ option ###

If you want to download multiple files using wget command , then first create a text file and add all URLs in the text file.

    # cat download-list.txt
    url1
    url2
    url3
    url4

Now issue issue below Command :

    # wget -i download-list.txt

### Example:6 Increase Retry Attempts. ###

We can increase the retry attempts using ‘–tries‘ option in wget. By default wget command retries 20 times to make the download successful.

This option becomes very useful when you have internet connection problem and you are downloading a large file , then there is a chance of failures in the download.

    # wget --tries=75 http://mirror.nbrc.ac.in/centos/7.0.1406/isos/x86_64/CentOS-7.0-1406-x86_64-DVD.iso

### Example:7 Redirect wget Logs to a log File using -o ###

We can redirect the wget command logs to a log file using ‘-o‘ option.

    #wget -o download.log http://mirror.nbrc.ac.in/centos/7.0.1406/isos/x86_64/CentOS-7.0-1406-x86_64-DVD.iso

Download.log file will be created in the user’s current directory.

### Example:8 Download Full website for local viewing. ###

    # wget --mirror -p --convert-links -P ./<Local-Folder> website-url

Whereas

- **–mirror** : turn on options suitable for mirroring.
- **-p** : download all files that are necessary to properly display a given HTML page.
- **–convert-links** : after the download, convert the links in document for local viewing.
- -**P ./Local-Folder** : save all the files and directories to the specified directory.

### Example:9 Reject file types while downloading. ###

When you are planning to download full website , then we can force wget command not to download images using ‘–reject’ option .

    # wget --reject=png Website-To-Be-Downloaded

### Example:10 Setting Download Quota using wget -Q ###

We can force wget command to quit downloading when download size exceeds certain size using ‘-Q’ option

    # wget -Q10m -i download-list.txt

Note that quota will never affect downloading a single file. So if you specify wget -Q10m ftp://wuarchive.wustl.edu/ls-lR.gz, all of the ls-lR.gz will be downloaded. The same goes even when several URLs are specified on the command-line. However, quota is respected when retrieving either recursively, or from an input file. Thus you may safely type ‘wget -Q10m -i download-list.txt’ download will be aborted when the quota is exceeded.

### Example:11 Downloading file from password protected site. ###

    # wget --ftp-user=<user-name> --ftp-password=<password> Download-URL

Another way to specify username and password is in the URL itself.

Either method reveals your password to anyone who bothers to run “ps”. To prevent the passwords from being seen, store them in .wgetrc or .netrc, and make sure to protect those files from other users with “chmod”. If the passwords are really important, do not leave them lying in those files either edit the files and delete them after Wget has started the download.

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/wget-command-practical-examples/

作者：[Pradeep Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/
