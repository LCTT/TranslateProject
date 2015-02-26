wget 命令实例
================================================================================
wget是Linux/Unix命令行**文件下载器**，它是下载网站上文件的免费的非交互下载工具，它支持**HTTP**、**HTTPS**和**FTP**协议，也支持通过HTTP代理检索。Wget是非交互的，这就是说它可以在用户没有登录到系统时在后台工作。

在本帖中，我们将讨论wget命令的一些不同使用实例。

### 实例1 ：下载单个文件 ###

    # wget http://mirror.nbrc.ac.in/centos/7.0.1406/isos/x86_64/CentOS-7.0-1406-x86_64-DVD.iso

该命令会下载CentOS 7 ISO文件到用户当前工作目录中。

### 实例2：续传分段下载文件 ###

总有那么一些场景，当我们开始下载一个大文件时，中途互联网却断开了。那样的话，我们可以使用wget命令的‘**-c**’选项，让下载从断点续传。

    # wget -c http://mirror.nbrc.ac.in/centos/7.0.1406/isos/x86_64/CentOS-7.0-1406-x86_64-DVD.iso

![](http://www.linuxtechi.com/wp-content/uploads/2014/09/wget-resume-download-1024x111-1.jpg)

### 实例3：后台下载文件 ###

我们可以通过在wget命令中使用‘-b’选项来让它在后台下载文件。

    linuxtechi@localhost:~$ wget -b http://mirror.nbrc.ac.in/centos/7.0.1406/isos/x86_64/
    CentOS-7.0-1406-x86_64-DVD.iso
    Continuing in background, pid 4505.
    Output will be written to ‘wget-log’.

正如我们上面所见，下载进程被捕获到用户当前目录中的‘wget-log’文件中。

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

### 实例4：限制下载速率 ###

默认情况下，wget命令尝试以全速下载，但是有时候你可能使用的是共享互联网，那么如果你尝试使用wget来下载庞大的文件时，就会把其它用户的网络拖慢。这时，你如果使用‘-limit-rate’选项来限制下载速率，就可以避免这种情况的发生。

    #wget --limit-rate=100k http://mirror.nbrc.ac.in/centos/7.0.1406/isos/x86_64/CentOS-7.0-1406-x86_64-DVD.iso

在上例中，下载速率被限制到了100k。

### 实例5：使用‘-i’选项来下载多个文件 ###

如果你想要使用wget命令来下载多个文件，那么首先要创建一个文本文件，并将所有的URL添加到该文件中。

    # cat download-list.txt
    url1
    url2
    url3
    url4

现在，发出以下命令吧：

    # wget -i download-list.txt

### 实例6：增加重试次数 ###

我们可以使用‘-tries’选项来增加重试次数。默认情况下，wget命令会重试20次，直到下载成功。

该选项在你下载一个大文件的过程中互联网连接发生问题时十分有用，因为在那种情况下，会增加下载失败的几率。

    # wget --tries=75 http://mirror.nbrc.ac.in/centos/7.0.1406/isos/x86_64/CentOS-7.0-1406-x86_64-DVD.iso

### 实例7：使用-o选项来重定向wget日志到文件 ###

我们可以使用‘-o’选项来重定向wget命令的日志到一个日志文件。

    #wget -o download.log http://mirror.nbrc.ac.in/centos/7.0.1406/isos/x86_64/CentOS-7.0-1406-x86_64-DVD.iso

上面的命令会在用户当前目录下创建download.log文件。

### 实例8：下载整个网站用于本地查看 ###

    # wget --mirror -p --convert-links -P ./<Local-Folder> website-url

鉴于

- **–mirror** : 开启适用于镜像的选项。
- **-p** : 下载所有能正确显示指定HTML网页的全部必要文件。
- **–convert-links** : 下载完成后，转换文档中的链接以用于本地查看。
- -**P ./Local-Folder** : 保存所有文件和目录到指定的目录。

### 实例9：下载过程中拒绝文件类型 ###

当你正打算下载整个网站时，我们可以使用‘-reject’选项来强制wget不下载图片。

    # wget --reject=png Website-To-Be-Downloaded

### 实例10：使用wget -Q设置下载配额 ###

我们可以使用‘-Q’选项强制wget命令在下载大小超过特定大小时退出下载。

    # wget -Q10m -i download-list.txt

注意，配额不会对单个文件的下载产生影响。所以，如果你指定wget -Q10m ftp://wuarchive.wustl.edu/ls-lR.gz，ls-lR.gz的全部内容都会被下载。这在下载命令行指定的多个URL时也一样。然而，在递归或从一个输入文件检索时，还是值得一用。因此，你可以安全地输入‘wget -Q10m -i download-list.txt’，在超过配额时，下载会退出。

### 实例11：从密码保护的网站下载文件 ###

    # wget --ftp-user=<user-name> --ftp-password=<password> Download-URL

另外一种指定用户名和密码的方式是在URL中。

任一方法都将你的密码揭露给了那些运行“ps”命令的人。要防止密码被查看到，将它们存储到.wgetrc或.netrc中，并使用“chmod”设置合适的权限来保护这些文件不让其他用户查看到。如果密码真的很重要，不要在它们还在文件里躺着的时候走开，在Wget开始下载后，编辑该文件，或者删除它们。

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/wget-command-practical-examples/

作者：[Pradeep Kumar][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/
