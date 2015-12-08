如何在命令行中使用ftp命令上传和下载文件
================================================================================
本文中，介绍在Linux shell中如何使用ftp命令。包括如何连接FTP服务器，上传或下载文件以及创建文件夹。尽管现在有许多不错的FTP桌面应用，但是在服务器、ssh、远程回话中命令行ftp命令还是有很多应用的。比如。需要服务器从ftp仓库拉取备份。

### 步骤 1: 建立FTP连接 ###


想要连接FTP服务器，在命令上中先输入'**ftp**'然后空格跟上FTP服务器的域名'domain.com'或者IP地址

#### 例如: ####

    ftp domain.com
    
    ftp 192.168.0.1
    
    ftp user@ftpdomain.com

**注意: 本次例子使用匿名服务器.**

替换下面例子中IP或域名为你的服务器地址。

![FTP登录](https://www.howtoforge.com/images/how-to-use-ftp-in-the-linux-shell/big/ftpanonymous.png)

### 步骤 2: 使用用户名密码登录 ###

绝大多数的FTP服务器是使用密码保护的，因此这些FTP服务器会询问'**用户名**'和'**密码**'.

如果你连接到被动匿名FTP服务器，可以尝试"anonymous"作为用户名以及空密码：

    Name: anonymous
    
    Password:

之后，终端会返回如下的信息：

    230 Login successful.
    Remote system type is UNIX.
    Using binary mode to transfer files.
    ftp>

登录成功。

![FTP登录成功](https://www.howtoforge.com/images/how-to-use-ftp-in-the-linux-shell/big/login.png)

### 步骤 3: 目录操作 ###

FTP命令可以列出、移动和创建文件夹，如同我们在本地使用我们的电脑一样。ls可以打印目录列表，cd可以改变目录，mkdir可以创建文件夹。

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

### 步骤 4: 使用FTP下载文件 ###

在下载一个文件之前，我们首先需要使用lcd命令设定本地接受目录位置。

    lcd /home/user/yourdirectoryname

如果你不指定下载目录，文件将会下载到你登录FTP时候的工作目录。

现在，我们可以使用命令get来下载文件，比如：

    get file

文件会保存在使用lcd命令设置的目录位置。

服务器返回消息：

    local: file remote: file
    200 PORT command successful. Consider using PASV.
    150 Opening BINARY mode data connection for file (xxx bytes).
    226 File send OK.
    XXX bytes received in x.xx secs (x.xxx MB/s).

![使用FTP下载文件](https://www.howtoforge.com/images/how-to-use-ftp-in-the-linux-shell/big/gettingfile.png)

下载多个文件可以使用通配符。例如，下面这个例子我打算下载所有以.xls结尾的文件。

    mget *.xls

### 步骤 5: 使用FTP上传文件 ###

完成FTP连接后，FTP同样可以上传文件

使用put命令上传文件：

    put file

当文件不再当前本地目录下的时候，可以使用绝对路径：

    put /path/file

同样，可以上传多个文件：

    mput *.xls

### 步骤 6: 关闭FTP连接 ###

完成FTP工作后，为了安全起见需要关闭连接。有三个命令可以关闭连接：

    bye
    
    exit
    
    quit

任意一个命令可以断开FTP服务器连接并返回：

    221 Goodbye

![](https://www.howtoforge.com/images/how-to-use-ftp-in-the-linux-shell/big/goodbye.png)

需要更多帮助，在使用ftp命令连接到服务器后，可以使用“help”获得更多帮助。

![](https://www.howtoforge.com/images/how-to-use-ftp-in-the-linux-shell/big/helpwindow.png)

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-use-ftp-on-the-linux-shell/

译者：[VicYu](http://vicyu.net)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出
