如何在命令行中使用 ftp 命令上传和下载文件
================================================================================
本文中，介绍在 Linux shell 中如何使用 ftp 命令。包括如何连接 FTP 服务器，上传或下载文件以及创建文件夹。尽管现在有许多不错的 FTP 桌面应用，但是在服务器、SSH、远程会话中命令行 ftp 命令还是有很多应用的。比如。需要服务器从 ftp 仓库拉取备份。

### 步骤 1: 建立 FTP 连接 ###

想要连接 FTP 服务器，在命令上中先输入`ftp`然后空格跟上 FTP 服务器的域名 'domain.com' 或者 IP 地址

#### 例如: ####

    ftp domain.com
    
    ftp 192.168.0.1
    
    ftp user@ftpdomain.com

**注意: 本例中使用匿名服务器。**

替换下面例子中 IP 或域名为你的服务器地址。

![FTP 登录](https://www.howtoforge.com/images/how-to-use-ftp-in-the-linux-shell/big/ftpanonymous.png)

### 步骤 2: 使用用户名密码登录 ###

绝大多数的 FTP 服务器是使用密码保护的，因此这些 FTP 服务器会询问'**username**'和'**password**'.

如果你连接到被称作匿名 FTP 服务器（LCTT 译注：即，并不需要你有真实的用户信息即可使用的 FTP 服务器称之为匿名 FTP 服务器），可以尝试`anonymous`作为用户名以及使用空密码：

    Name: anonymous
    
    Password:

之后，终端会返回如下的信息：

    230 Login successful.
    Remote system type is UNIX.
    Using binary mode to transfer files.
    ftp>

登录成功。

![FTP 登录成功](https://www.howtoforge.com/images/how-to-use-ftp-in-the-linux-shell/big/login.png)

### 步骤 3: 目录操作 ###

FTP 命令可以列出、移动和创建文件夹，如同我们在本地使用我们的电脑一样。`ls`可以打印目录列表，`cd`可以改变目录，`mkdir`可以创建文件夹。

#### 使用安全设置列出目录 ####

    ftp> ls

服务器将返回：

    200 PORT command successful. Consider using PASV.
    150 Here comes the directory listing.
    directory list
    ....
    ....
    226 Directory send OK.

![打印目录](https://www.howtoforge.com/images/how-to-use-ftp-in-the-linux-shell/big/listing.png)

#### 改变目录: ####

改变目录可以输入：

    ftp> cd directory

服务器将会返回：

    250 Directory succesfully changed.

![FTP中改变目录](https://www.howtoforge.com/images/how-to-use-ftp-in-the-linux-shell/big/directory.png)

### 步骤 4: 使用 FTP 下载文件 ###

在下载一个文件之前，我们首先需要使用`lcd`命令设定本地接受目录位置。

    lcd /home/user/yourdirectoryname

如果你不指定下载目录，文件将会下载到你登录 FTP 时候的工作目录。

现在，我们可以使用命令 get 来下载文件，比如：

    get file

文件会保存在使用lcd命令设置的目录位置。

服务器返回消息：

    local: file remote: file
    200 PORT command successful. Consider using PASV.
    150 Opening BINARY mode data connection for file (xxx bytes).
    226 File send OK.
    XXX bytes received in x.xx secs (x.xxx MB/s).

![使用FTP下载文件](https://www.howtoforge.com/images/how-to-use-ftp-in-the-linux-shell/big/gettingfile.png)

下载多个文件可以使用通配符及 `mget` 命令。例如，下面这个例子我打算下载所有以 .xls 结尾的文件。

    mget *.xls

### 步骤 5: 使用 FTP 上传文件 ###

完成 FTP 连接后，FTP 同样可以上传文件

使用 `put`命令上传文件：

    put file

当文件不再当前本地目录下的时候，可以使用绝对路径：

    put /path/file

同样，可以上传多个文件：

    mput *.xls

### 步骤 6: 关闭 FTP 连接 ###

完成FTP工作后，为了安全起见需要关闭连接。有三个命令可以关闭连接：

    bye
    
    exit
    
    quit

任意一个命令可以断开FTP服务器连接并返回：

    221 Goodbye

![](https://www.howtoforge.com/images/how-to-use-ftp-in-the-linux-shell/big/goodbye.png)

需要更多帮助，在使用 ftp 命令连接到服务器后，可以使用`help`获得更多帮助。

![](https://www.howtoforge.com/images/how-to-use-ftp-in-the-linux-shell/big/helpwindow.png)

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-use-ftp-on-the-linux-shell/

译者：[VicYu](http://vicyu.net)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出
