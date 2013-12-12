Linux sheel 贴士和技巧
================================================================================
我日常使用Linux shell(Bash),但是我经常忘记一些有用的命令或者shell技巧。是的,我能记住一些命令但是我不能说只在特定的任务上使用一次。那么我就开始在我的Dropbox账号里用文本文件写下这些Linux shell的贴士,现在我决定共享它。这个表我以后还会更新。记住,这里的一些贴士需要在你的Linux发行版上安装额外的软件。

在bash中检查远程端口是否打开:

    echo >/dev/tcp/8.8.8.8/53 && echo "open"

终止进程:

    Ctrl + z 

将进程移到前台:

    fg

生成随机16进制数字,n是字符的数量:

    openssl rand -hex n

在当前shell中从一个文件中执行命令:

    source /home/user/file.name

提取前5个字符的字串:

    ${variable:0:5}

SSH调试模式:

    ssh -vvv user@ip_address

带pem key的SSH

    ssh user@ip_address -i key.pem

用wget获取完整目录列表到本地目录:

    wget -r --no-parent --reject "index.html*" http://hostname/ -P /home/user/dirs

创建多个目录:

    mkdir -p /home/user/{test,test1,test2}

列出带子进程的进程树:

    ps axwef

创建war文件:

    jar -cvf name.war file

测试磁盘写速度:

    dd if=/dev/zero of=/tmp/output.img bs=8k count=256k conv=fdatasync; rm -rf /tmp/output.img

测试磁盘读速度:

    hdparm -Tt /dev/sda

从文本中获取md5值:

    echo -n "text" | md5sum

检测xml语法:

    xmllint --noout file.xml

在新的目录中提取tar.gz文件:

    tar zxvf package.tar.gz -C new_dir

用curl获取HTTP头:

    curl -I http://www.example.com

修改一些文件或目录的时间戳 (YYMMDDhhmm):

    touch -t 0712250000 file

使用wget从ftp下载:

    wget -m ftp://username:password@hostname

生成随机密码 (本例中16位字符长):

    LANG=c < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-16};echo;

快速创建一个文件的备份:

    cp some_file_name{,.bkp}

访问Windows共享:

    smbclient -U "DOMAIN\user" //dc.domain.com/share/test/dir

在历史中运行命令 (这里在第100行):

    !100

unzip到目录中:

    unzip package_name.zip -d dir_name

多行文字 (按 CTRL + d 退出):

    cat > test.txt

创建空白的文件或者已存在的文件:

    > test.txt

从Ubuntu NTP服务器上更新日期:

    ntpdate ntp.ubuntu.com

netstat 显示所有tcp4监听的端口:

    netstat -lnt4 | awk '{print $4}' | cut -f2 -d: | grep -o '[0-9]*'

将qcow2图像转化成raw:

    qemu-img convert -f qcow2 -O raw precise-server-cloudimg-amd64-disk1.img \
                                     precise-server-cloudimg-amd64-disk1.raw

重复运行命令,显示它的输出 (默认2s刷新):

    watch ps -ef

显示所有用户:

    getent passwd

以读写模式挂载root:

    mount -o remount,rw /

挂在目录 (适合于符号链接不成功的情况下):

    mount --bind /source /destination

发送动态更新给DNS:

    nsupdate < <EOF
    update add $HOST 86400 A $IP
    send
    EOF

递归grep所有目录

    grep -r "some_text" /path/to/dir

列出10个最大的已打开的文件:

    lsof / | awk '{ if($7 > 1048576) print $7/1048576 "MB "$9 }' | sort -n -u | tail

以MB显示空余内存:

    free -m | grep cache | awk '/[0-9]/{ print $4" MB" }'

打开vim并跳转到文件最后:

    vim + some_file_name

git clone特定branch (master):

    git clone git@github.com:name/app.git -b master

git切换到另外一个branch (develop):

    git checkout develop

git删除一个branch(myfeature):

    git branch -d myfeature

Git删除一个远程branch:

    git push origin :branchName

Git push 新的branch到远程:

    git push -u origin mynewfeature

打印history中最后的cat命令

    !cat:p

运行history中的最后的cat命令:

    !cat

找出在/home/user中的所有空子目录:

    find /home/user -maxdepth 1 -type d -empty

得到test.txt中50到60行的文本:

    < test.txt sed -n '50,60p'

运行最后的命令 (如果是: mkdir /root/test, 下面会运行: sudo mkdir /root/test):

    sudo !!

创建临时RAM文件系统 - ramdisk (首先创建在 /tmpram 目录):

    mount -t tmpfs tmpfs /tmpram -o size=512m

Grep完整单词:

    grep -w "name" test.txt

需要特权模式在一个文件后追加文本:

    echo "some text" | sudo tee -a /path/file

列出所有的kill信号:

    kill -l

生成随机密码 (本例中16个字符长):

    openssl rand -base64 16

在bash历史中不记录最后的会话:

    kill -9 $$

扫描网络找出打开的端口:

    nmap -p 8081 172.20.0.0/16

设置git email:

    git config --global user.email "me@example.com"

如果你有未提交的commit,与master同步:

    git pull --rebase origin master

将文件中含有txt的所有文件移动到/home/user:

    find -iname "*txt*" -exec mv -v {} /home/user \;

一行行合并文件:

    paste test.txt test1.txt

shell中的进度条:

    pv data.log

用netcat发送数据给服务器:

    echo "hosts.sampleHost 10 `date +%s`" | nc 192.168.200.2 3000

转换tab到空格:

    expand test.txt > test1.txt

跳过bash历史:

    < <space>>cmd

回到先前的工作目录:

    cd -

切割大的tar.gz文件 (每个 100MB) 并还原:

    split –b 100m /path/to/large/archive /path/to/output/files
    cat files* > archive

用curl获取HTTP状态值:

    curl -sL -w "%{http_code}\\n" www.example.com -o /dev/null

当 Ctrl + c 没用时:

    Ctrl + \

获取文件所有者:

    stat -c %U file.txt

列出块设备:

    lsblk -f

找出末尾空格的文件:

    find . -type f -exec egrep -l " +$" "{}" \;

找出用tab缩进的文件:

    find . -type f -exec egrep -l $'\t' "{}" \;

用"="打印水平行

    printf '%100s\n' | tr ' ' =

**更新: 2013年11月25日**

--------------------------------------------------------------------------------

via: http://www.techbar.me/linux-shell-tips/

译者：[geekpi](https://github.com/geekpi) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出