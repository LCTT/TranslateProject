10 条真心有趣的 Linux 命令
================================================================================

**在终端工作是一件很有趣的事情。今天，我们将会列举一些有趣得为你带来欢笑的Linux命令。**

### 1. rev ###

创建一个文件，在文件里面输入几个单词，rev命令会将你写的东西反转输出到控制台。

    # rev  <file name>

![Selection_002](http://www.unixmen.com/wp-content/uploads/2015/09/Selection_0021.png)

![Selection_001](http://www.unixmen.com/wp-content/uploads/2015/09/Selection_0011.png)

### 2. fortune ###

这个命令没有被默认安装，用apt-get命令安装它，fortune命令会随机显示一些句子

    crank@crank-System:~$ sudo apt-get install fortune

![Selection_003](http://www.unixmen.com/wp-content/uploads/2015/09/Selection_0031.png)

利用fortune命令的**_s** 选项，他会限制一个句子的输出长度。

    # fortune -s

![Selection_004](http://www.unixmen.com/wp-content/uploads/2015/09/Selection_0042.png)

### 3. yes ###

    # yes <string>

这个命令会不停打印字符串，直到用户把这进程给结束掉。

    # yes unixmen

![Selection_005](http://www.unixmen.com/wp-content/uploads/2015/09/Selection_0054.png)

### 4. figlet ###

这个命令可以用apt-get安装，安装之后，在**/usr/share/figlet**可以看到一些ascii字体文件。

    cd /usr/share/figlet

----------

    #figlet -f <font>  <string>
    #figlet -f big.flf unixmen

![Selection_006](http://www.unixmen.com/wp-content/uploads/2015/09/Selection_0062.png)

	#figlet -f block.flf  unixmen

![Selection_007](http://www.unixmen.com/wp-content/uploads/2015/09/Selection_0072.png)

当然，你也可以尝试使用其他的选项。

### 5. asciiquarium ###

这个命令会将你的终端变成一个海洋馆。

下载term animator：

    # wget http://search.cpan.org/CPAN/authors/id/K/KB/KBAUCOM/Term-Animation-2.4.tar.gz

安装并且配置这个包：

    # tar -zxvf Term-Animation-2.4.tar.gz
    # cd Term-Animation-2.4/
    # perl Makefile.PL && make && make test
    # sudo make install

接着安装下面这个包:

    # apt-get install libcurses-perl

下载并且安装asciiquarium：

    # wget http://www.robobunny.com/projects/asciiquarium/asciiquarium.tar.gz
    # tar -zxvf asciiquarium.tar.gz 
    # cd asciiquarium_1.0/
    # cp asciiquarium /usr/local/bin/

执行如下命令：

    # /usr/local/bin/asciiquarium

![asciiquarium_1.1 : perl_008](http://www.unixmen.com/wp-content/uploads/2015/09/asciiquarium_1.1-perl_008.png)

### 6. bb ###

    # apt-get install bb
    # bb

看看会输出什么？

![Selection_009](http://www.unixmen.com/wp-content/uploads/2015/09/Selection_0092.png)

### 7. sl ###

有的时候你可能把 **ls** 误打成了 **sl**，其实 **sl** 也是一个命令，如果你打 sl的话，你会看到一个移动的火车头

    # apt-get install sl

----------

    # sl

![Selection_012](http://www.unixmen.com/wp-content/uploads/2015/09/Selection_0122.png)

### 8. cowsay ###

一个很常见的命令，它会用ascii显示你想说的话。

    apt-get install cowsay

----------

    # cowsay <string>

![Selection_013](http://www.unixmen.com/wp-content/uploads/2015/09/Selection_0132.png)

或者，你可以用其他的角色来取代默认角色来说这句话，这些角色都存储在**/usr/share/cowsay/cows**目录下

    # cd /usr/share/cowsay/cows

----------

    cowsay -f ghostbusters.cow  unixmen

![Selection_014](http://www.unixmen.com/wp-content/uploads/2015/09/Selection_0141.png)

或者

    # cowsay -f bud-frogs.cow Rajneesh

![Selection_015](http://www.unixmen.com/wp-content/uploads/2015/09/Selection_0151.png)

### 9. toilet ###

你没看错，这是个命令来的，他会将字符串以彩色的ascii字符串形式输出到终端

    # apt-get install toilet

----------

    # toilet --gay unixmen

![Selection_016](http://www.unixmen.com/wp-content/uploads/2015/09/Selection_0161.png)

    toilet -F border -F gay unixmen

![Selection_020](http://www.unixmen.com/wp-content/uploads/2015/09/Selection_020.png)

    toilet  -f mono12 -F metal  unixmen

![Selection_018](http://www.unixmen.com/wp-content/uploads/2015/09/Selection_0181.png)

### 10. aafire ###

aafire能让你的终端燃起来。

    # apt-get install libaa-bin

----------

    # aafire

![Selection_019](http://www.unixmen.com/wp-content/uploads/2015/09/Selection_0191.png)

就这么多，祝你们在Linux终端玩得开心哈！！！

--------------------------------------------------------------------------------

via: http://www.unixmen.com/list-10-funny-linux-commands/

作者：[Rajneesh Upadhyay][a]
译者：[tnuoccalanosrep](https://github.com/tnuoccalanosrep)
校对：[wxy](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/rajneesh/
