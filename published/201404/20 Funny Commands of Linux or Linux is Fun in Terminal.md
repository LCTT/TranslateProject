Linux命令及Linux终端的20个趣事
================================================================================
玩**Linux**其乐无穷！**哈哈**。不相信。记住我的话，在文章结尾时你就会相信**Linux**确实好玩了。

![20 Linux Funny Commands](http://www.tecmint.com/wp-content/uploads/2013/05/Linux-Funny-Commands.png)

### 1. 命令：sl （蒸汽机车） ###

你可能了解 ‘ls’ 命令，并经常使用它来查看文件夹的内容。但是，有些时候你可能会拼写成 ‘sl’ ,这时我们应该如何获得一些乐趣而不是看见“command not found”呢？

#### 安装 sl ####

    root@tecmint:~# apt-get install sl 		(In Debian like OS)
    root@tecmint:~# yum -y install sl 		(In Red Hat like OS)

#### 输出 ####

    root@tecmint:~# sl

![sl command](http://www.tecmint.com/wp-content/uploads/2013/05/sl.png)

当你敲入的是‘**LS**‘而不是’**ls**‘时，这个命令也会运行。

### 2. 命令：telnet ###

**非也！非也！！**这可不像它平常那样复杂。你可能很熟悉**telnet**。Telnet 是一个文本化的双向网络协议。这里不需要安装什么东西。你需要的就是一个Linux系统和一个连通的网络。

    root@tecmint:~# telnet towel.blinkenlights.nl

![telnet command](http://www.tecmint.com/wp-content/uploads/2013/05/telnet.png)

### 3. 命令：fortune ###

试试你未知的运气，终端里有时也有好玩的。

#### 安装 fortune ####

    root@tecmint:~# apt-get install fortune 	(for aptitude based system)
    root@tecmint:~# yum install fortune 		(for yum based system)

    root@tecmint:~# fortune
    
    You're not my type.  For that matter, you're not even my species!!!
    Future looks spotty.  You will spill soup in late evening.
    You worry too much about your job.  Stop it.  You are not paid enough to worry.
    Your love life will be... interesting.

### 4. 命令：rev（翻转）###

它会把传递给它的的每个字符串都反过来，是不是很好玩。

    root@tecmint:~# rev
    
    123abc 
    cba321 
    
    xuniL eb ot nrob
    born to be Linux

### 5. 命令：factor ###

该谈点儿关于**Mathematics**的了，这个命令输出给定数字的所有因子。

    root@tecmint:~# factor
    
    5 
    5: 5 
    
    12 
    12: 2 2 3 
    
    1001 
    1001: 7 11 13 
    
    5442134 
    5442134: 2 2721067

### 6.命令：script ###

好的，这不是什么命令，而是一个脚本，一个很有趣的脚本。

    root@tecmint:~# for i in {1..12}; do for j in $(seq 1 $i); do echo -ne $i x $j=$((i*j))\\t;done; echo;done 

    1 x 1=1	
    2 x 1=2	2 x 2=4	
    3 x 1=3	3 x 2=6	3 x 3=9	
    4 x 1=4	4 x 2=8	4 x 3=12	4 x 4=16	
    5 x 1=5	5 x 2=10	5 x 3=15	5 x 4=20	5 x 5=25	
    6 x 1=6	6 x 2=12	6 x 3=18	6 x 4=24	6 x 5=30	6 x 6=36	
    7 x 1=7	7 x 2=14	7 x 3=21	7 x 4=28	7 x 5=35	7 x 6=42	7 x 7=49	
    8 x 1=8	8 x 2=16	8 x 3=24	8 x 4=32	8 x 5=40	8 x 6=48	8 x 7=56	8 x 8=64	
    9 x 1=9	9 x 2=18	9 x 3=27	9 x 4=36	9 x 5=45	9 x 6=54	9 x 7=63	9 x 8=72	9 x 9=81	
    10 x 1=10	10 x 2=20	10 x 3=30	10 x 4=40	10 x 5=50	10 x 6=60	10 x 7=70	10 x 8=80	10 x 9=90	10 x 10=100	
    11 x 1=11	11 x 2=22	11 x 3=33	11 x 4=44	11 x 5=55	11 x 6=66	11 x 7=77	11 x 8=88	11 x 9=99	11 x 10=110	11 x 11=121	
    12 x 1=12	12 x 2=24	12 x 3=36	12 x 4=48	12 x 5=60	12 x 6=72	12 x 7=84	12 x 8=96	12 x 9=108	12 x 10=120	12 x 11=132	12 x 12=144

### 7.命令：Cowsay ###

一个在终端用**ASCII**码组成的小牛，这个小牛会说出你想要它说的话。

#### 安装Cowsay ####

    root@tecmint:~# apt-get install cowsay 		(for Debian based OS)
    root@tecmint:~# yum install cowsay		(for Red Hat based OS)

#### 输出 ####

    root@tecmint:~# cowsay I Love nix 

     ____________
    < I Love nix >
     ------------
            \   ^__^
             \  (oo)\_______
                (__)\       )\/\
                    ||----w |
                    ||     ||


如果用管道将‘**fortune command**’命令重定向到cowsay会怎样呢？

root@tecmint:~# fortune | cowsay 

     _________________________________________
     / Q: How many Oregonians does it take to  \
     | screw in a light bulb? A: Three. One to |
     | screw in the light bulb and two to fend |
     | off all those                           |
     |                                         |
     | Californians trying to share the        |
     \ experience.                             /
      -----------------------------------------
             \   ^__^
              \  (oo)\_______
                 (__)\       )\/\
                     ||----w |
                     ||     ||


**提示：‘|’**是管道命令符。通常它是将一个命令的输出作为下一个命令的输入。在上面的例子中‘**fortune**’的输出作为‘**cowsay**’命令的输出。管道命令会经常用在脚本和程序编写中。

**xcowsay**是一个图形界面程序。它与**cowsay**类似只是以一种图形的方式来表达，可以说是**X**版本的cowsay。

    apt-get insatll xcowsay
    yum install xcowsay

#### 输出 ####
    root@tecmint:~# xcowsay I Love nix

![xcowsay command](http://www.tecmint.com/wp-content/uploads/2013/05/xcowsay.png)

**cowthink**是另一个命令。运行“cowthink Linux is sooo funny ”看看它与cowsay的不同吧。

    apt-get insatll cowthink
    yum install cowthink

#### 输出 ####

    root@tecmint:~# cowthink ....Linux is sooo funny
     _________________________
    ( ....Linux is sooo funny )
     -------------------------
            o   ^__^
             o  (oo)\_______
                (__)\       )\/\
                    ||----w |
                    ||     ||

### 8. 命令：yes ###

yes 是一个非常有趣又有用的命令，尤其对于脚本编写和系统管理员来说，它可以自动地生成预先定义的响应或者将其传到终端。

    root@tecmint:~# yes I Love Linux

    I Love Linux
    I Love Linux
    I Love Linux
    I Love Linux
    I Love Linux
    I Love Linux
    I Love Linux
    I Love Linux
    I Love Linux
    I Love Linux
    I Love Linux
    I Love Linux

**提示**: (直到你按下**ctrl+c**才停止)

### 9. 命令: toilet ###


什么？你在开玩笑吗! 当然没有，但肯定的是这个命令的名字太搞了，我也不知道这个命令的名字从何而来。

#### 安装toilet ####

    root@tecmint:~# apt-get install toilet 
    root@tecmint:~# yum install toilet

#### 输出 ####

    root@tecmint:~# toilet tecmint 

    mmmmmmm                        "             m                               
       #     mmm    mmm   mmmmm  mmm    m mm   mm#mm          mmm    mmm   mmmmm 
       #    #"  #  #"  "  # # #    #    #"  #    #           #"  "  #" "#  # # # 
       #    #""""  #      # # #    #    #   #    #           #      #   #  # # # 
       #    "#mm"  "#mm"  # # #  mm#mm  #   #    "mm    #    "#mm"  "#m#"  # # #


这个命令甚至提供了一些颜色和字体格式。

    root@tecmint:~# toilet -f mono12 -F metal Tecmint.com

![toilet command](http://www.tecmint.com/wp-content/uploads/2013/05/toilet.png)

**提示：Figlet** 是另外一个与toilet产生的效果类似的命令。


### 10. 命令：cmatrix ###

你可能看多好莱坞的电影‘**黑客帝国**’并陶醉于被赋予**Neo**的能看到在矩阵中任何事物的能力，或者你会想到一幅类似于‘**Hacker**’的桌面的生动画面。


#### 安装 cmatrix ####

    root@tecmint:~# apt-get install cmatrix
    root@tecmint:~# yum install cmatrix

#### 输出 ####

    root@tecmint:~# cmatrix

![cmatrix command](http://www.tecmint.com/wp-content/uploads/2013/05/cmatrix.png)

### 11. 命令: oneko ###


可能你坚信Linux的鼠标指针永远是同样的黑色或白色一点儿也不生动，那你就错了。“**oneko**”是一个会让一个“**Jerry**”你的鼠标指针附着到你鼠标上的一个软件包。

#### 安装 oneko ####

    root@tecmint:~# apt-get install oneko
    root@tecmint:~# yum install oneko

#### 输出 ####

    root@tecmint:~# oneko

![oneko command](http://www.tecmint.com/wp-content/uploads/2013/05/oneko.png)


**提示**：关闭运行着**oneko**的终端时，**Jerry**也会随之消失，重新启动终端时也不会再出项。你可以将这个程序添加到启动选项中然后继续使用它。

### 12. Fork炸弹  ###

这是一段非常欠抽的代码。运行这个命令的后果自己负责。这个命令其实是一个fork炸弹，它会以指数级的自乘，直到所有的系统资源都被利用了或者系统挂起（想要见识这个命令的威力你可以试一次这个命令，但是后果自负，记得在运行它之前关掉并保存其它所有程序和文件）。

    root@tecmint:~# :(){ :|:& }:

### 13. 命令：while  ###


下面的”while“命令是一个脚本，这个脚本可以为你提供彩色的日期和文件直到你按下中断键（ctrl+c）。复制粘贴这个命令到你的终端。

    root@tecmint:~# while true; do echo "$(date '+%D %T' | toilet -f term -F border --gay)"; sleep 1; done

![Linux while command](http://www.tecmint.com/wp-content/uploads/2013/05/while.png)


**提示**：以上脚本通过下面的修改也会产生类似的输出但是还是有点不同的，在你的终端试试吧。

    root@tecmint:~# while true; do clear; echo "$(date '+%D %T' | toilet -f term -F border --gay)"; sleep 1; done

### 14. 命令: espeak ###

将你的多媒体音箱的音量调到最大，然后在将这个命令复制到你的终端，来看看你听到上帝的声音时的反应吧。

#### 安装 espeak ####

    root@tecmint:~# apt-get install espeak
    root@tecmint:~# yum install espeak

#### 输出 ####

    root@tecmint:~# espeak "Tecmint is a very good website dedicated to Foss Community"

### 15. 命令: aafire ###

在你的终端放一把火如何。把这个“**aafire**”敲到你的终端，不需要什么引号看看这神奇的一幕吧。按下任意键中指该程序。


#### 安装 aafire ####

    root@tecmint:~# apt-get install libaa-bin

#### 输出 ####

    root@tecmint:~# aafire

![](http://www.tecmint.com/wp-content/uploads/2013/05/aafire.png)

### 16. 命令: bb ###

首先安装“**apt-get install bb**”,然后敲入“**bb**”看看会发生什么吧。

    root@tecmint:~# bb

![bb command](http://www.tecmint.com/wp-content/uploads/2013/05/bb.png)

### 17. 命令: url ###


如果在你的朋友面前用命令行来改变你的 **twitter status** 会不会很酷呢。用你的**用户名密码**和**你想要的状态**分别替换**username, password** 和“**your status message**“就可以了。

	root@tecmint:~# url -u YourUsername:YourPassword -d status="Your status message" http://twitter.com/statuses/update.xml
	
### 18. ASCIIquarium ###

想要在终端弄一个水族馆该，怎么办？

    root@tecmint:~# apt-get install libcurses-perl
    root@tecmint:~# cd /tmp 
    root@tecmint:~# wget http://search.cpan.org/CPAN/authors/id/K/KB/KBAUCOM/Term-Animation-2.4.tar.gz
    root@tecmint:~# tar -zxvf Term-Animation-2.4.tar.gz
    root@tecmint:~# cd Term-Animation-2.4/
    root@tecmint:~# perl Makefile.PL &&  make &&   make test
    root@tecmint:~# make install

#### 安装 ASCIIquarium ####

下载并安装**ASCIIquarium**。

    root@tecmint:~# cd /tmp
    root@tecmint:~# wget http://www.robobunny.com/projects/asciiquarium/asciiquarium.tar.gz
    root@tecmint:~# tar -zxvf asciiquarium.tar.gz
    root@tecmint:~# cd asciiquarium_1.1/
    root@tecmint:~# cp asciiquarium /usr/local/bin
    root@tecmint:~# chmod 0755 /usr/local/bin/asciiquarium


最后在终端运行“**asciiquarium**”或者“**/usr/local/bin/asciiquarium**”，记得不要加引号，神奇的一幕将在你眼前展现。

    root@tecmint:~# asciiquarium

![aquarium command](http://www.tecmint.com/wp-content/uploads/2013/05/ascliquarium.png)

### 19. 命令: funny manpages ###


首先安装“**apt-get install funny－manpages**”然后运行下面命令的man手册。其中一些



    baby
    celibacy
    condom
    date
    echo
    flame
    flog
    gong
    grope, egrope, fgrope 
    party 
    rescrog 
    rm
    rtfm
    tm
    uubp
    woman (undocumented)
    xkill 
    xlart 
    sex 
    strfry

    root@tecmint:~# man baby

### 20. Linux Tweaks ###

该到了做一些优化的时候了

    root@tecmint:~# world
    
    bash: world: not found
    
    root@tecmint:~# touch girls\ boo** 
    
    touch: cannot touch `girls boo**`: Permission denied
    
    root@tecmint:~# nice man woman
    
    No manual entry for woman
    
    root@tecmint:~# ^How did the sex change operation go?^ 
    
    bash: :s^How did the sex change operation go?^ : substitution failed
    
    root@tecmint:~# %blow 
    
    bash: fg: %blow: no such job
    
    root@tecmint:~# make love 
    
    make: *** No rule to make target `love`.  Stop.
    
    $ [ whereis my brain?
    sh: 2: [: missing ]
    
    % man: why did you get a divorce? 
    man:: Too many arguments.
    
    % !:say, what is saccharine? 
    Bad substitute.
    
    server@localhost:/srv$ \(- 
    bash: (-: command not found


Linux总是sexy：**who | grep -i blonde | date; cd ~; unzip; touch; strip; finger; mount; gasp; yes; uptime; umount; sleep**（如果你知道我的意思，汗！）


还有一些其它的命令，只是这些命令并不能在所有的系统上运行，所以本文没有涉及到。比如说**dog , filter, banner**

使用愉快，你可以稍后再对我说谢谢：）您的评价是我们前进的不竭动力。告诉我们你最喜欢的命令。继续关注，不久我会有另一篇值得阅读的文章。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/20-funny-commands-of-linux-or-linux-is-fun-in-terminal/

译者：[Linchenguang](https://github.com/Linchenguang) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
