8个有趣的Linux提示与技巧！
================================================================================

我们时不时给你带来关于Linux的提示与技巧。和这个系列保持一致，这里有8个我们从读者收到最有趣的提示和技巧。我们希望你喜欢它。请继续读下去。。。

![](http://www.efytimes.com/admin/useradmin/photo/j4lm23703PM1182014.jpg)

### 以它们的大小列出文件 ###

如果你想要一个基于它们大小排序的文件列表，你可以使用下面的命令。

它会以递减顺序排列文件。

    # ls -l | grep ^- | sort -nr -k 5 | more

如果你想要递归地做相同的事，你可以使用下面的第二个命令。

    # ls -lR | grep ^- | sort -nr -k 5 | more

*—Sumedh Gajbhiye,
sumedh.gajbhiye1985@gmail.com*

### 重置奇怪的终端 ###

如果感觉你的bash终端错误地显示垃圾的提示字符信息，并无论你输入任何命令都显示非ASCII字符-下面的命令可以让事情回到正轨。

在终端盲打输入（译注：因为你其实看不到你输入的这些字符的正确显示，不过尽管输入好了！）下面的命令并按回车：

    # reset

如果那个不能修复这个问题，试一下下面的:

    # stty sane

*—Sudheer Divakaran,
cdsudheer@gmail.com*

### 记录并回放终端会话 ###

下面是一个简单的贴士来记录并回放终端回放。它通过使用命令script和scriptreplay。

这在使用终端制作教程时非常方便。

要开始记录你的终端会话，使用下面的命令：

    $ script -t 2> timing.log -a output.session

接着输入:

    $ ls
    $touch test
    .....

    $ exit

这里，script命令取两个文件作为参数timing.log(它记录了每个命令执行的时间信息)和output.session(存储了命令的输出)。

现在，要回访记录的会话，使用下面所示的scriptplay。

    $ scriptreplay timing.log output.session

注：timing.log和output.session可以被任何想要在自己的终端上重放会话的人使用。

*—Abhishek Singh,
abhishekkumarsingh.cse@gmail.com*

### 使用shell脚本生成随机数 ###

有时当你想要用shell脚本编程时，可能需要生成一个随机数来用于脚本。

这里是获得一个3位随机数的代码。

    var=$(dd if=/dev/urandom count=1 2> /dev/null | cksum | cut -f1 -d” “ | cut -c 3-5);

这回存储随机生成的数字在名为var的变量中。

*—Arpan Chavda,
09bce006@nirmauni.ac.in*

### 以root用户运行Linux上的软件 ###

作为一名root用户，为了让某些不能在root身份运行的软件运行（译注：典型的是google chrome），你需要在软件的二进制文件中改变geteuid调用为getppid。

这个技术在操作系统中非常有用，比如backtrack，这里的大多数安装工作都以root用户完成。

比如:为了以root用户运行Google Chrome，使用下面的命令:

    # hexedit /opt/google/chome/chrome

接着按下Ctrl+S并在16进制转储文件中搜寻geteuid字符串。用字符串getppid代替。按下Ctrl+X来保存并退出编辑器。

现在浏览器就可以以root用户运行了。

    # google-chrome

*—Mayank Bhanderi,
mbhanderi24@gmail.com*

### 用gzip压缩优化你的站点 ###

压缩是一种简单、有效的方法来节约带宽和加速你的站点。在压缩的帮助下，多数站点的主页面会从100KB变成10KB。

为了在Apache Web服务器中启用这个特性，你需要在httpd.conf中包含deflate_module，并且在Apache配置文件中加入下面的行 (/etc/httpd/conf/httpd.conf)来压缩text、html、 javascript、 css 和 xml 文件:

    AddOutputFilterByType DEFLATE text/plain
    AddOutputFilterByType DEFLATE text/html
    AddOutputFilterByType DEFLATE text/xml
    AddOutputFilterByType DEFLATE text/css
    AddOutputFilterByType DEFLATE application/xml
    AddOutputFilterByType DEFLATE application/xhtml+xml
    AddOutputFilterByType DEFLATE application/rss+xml
    AddOutputFilterByType DEFLATE application/javascript
    AddOutputFilterByType DEFLATE application/x-javascript

*—Munish Kumar,
munishtotech@gmail.com*

### 在登陆时检查服务器负载信息 ###

这里有一个贴士来在你登陆服务器的时候检查服务器平均负载。创建一个sload.sh的文本文件，内容如下:

    #!/bin/bash
    gh=$(uptime | awk -F, ‘{print $3}’)
    echo -e “Server$gh\n”

现在，为了在登陆时检查服务器负载，通过/root/.bashrc调用sload.sh脚本。

记住如下设置脚本权限：

    # chmod 755 /root/sload.sh

要调用sload.sh脚本，如下在/root/.bashrc后追加

    /root/sload.sh

或者你还可以这样追加sload.sh的内容到.bashrc中。

    $echo “/root/sload.sh” >> /root/.bashrc

当你完成上面的步骤后，你可以登出并再次登陆来查看服务器负载。

*—Ranjith Kumar T,
ranjith.stc@gmail.com*

### 在特定时间开始你的任务 ###

你可以使用下面的命令来在特定时间调度你的作业：

    # at 2015

    > >vlc /music/rockstar.mp3

这个命令会在2015小时后使用vlc播放器播放rockstar.mp3。你可以在at命令后跟上-l选项来检查挂起的作业：

    # at -l

更多at命令的信息可以在man页找到。

*—Manas Pradhan,
acmeofmanas@gmail.com*

--------------------------------------------------------------------------------

via: http://www.efytimes.com/e1/fullnews.asp?edid=127250

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出