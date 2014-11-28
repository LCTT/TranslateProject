 什么是有用的bash别名和函数
================================================================================
作为一个命令行探索者,你或许发现你自己一遍又一遍. 如果你总是用ssh进入到同一台电脑, 同时你总是管道关联相同的命令，或者如果你时常用一些参数运行一个程序,你应该想要拯救你人生中的这个珍贵的助手。你一遍又一遍花费着重复相同的动作.
解决方案是使用一个别名.正如你可能知道的,别名用一种方式告诉你的shell记住详细的命令并且给它一个新的名字：别名,的方式。不管怎么样，别名是即时有效的，同样地它只是shell命令的快捷方式,没有能力传递或者控制参数.所以补充时,bash也允许你创建你自己的函数,那样可能更漫长和复杂,并且也允许任意数量的参数.
当然，当你有一个好的食谱-像汤，你要分享它.因此这里有一个列表，用一些最有用bash别名和函数的.注意"最有用的"是随意的定义,当然别名的有益依赖在于你每天shell的使用性
在你用别名开始试验之前, 这里有一个便于使用的小技巧:如果你给予别名相同的名字作为常规命令,你可以选择开始原始的命令并且用技巧忽略别名
    \command 
例如,第一个别名在下面替换ls命令。如果你想使用常规的ls命令而不是别名，通过调用它:
    \ls 
    
### Productivity ###

这些别名真的很简单并且真的很短,但他们大多数主要是以主题为依据，那样无论何时倘若你第二次保存一小部分,它允许在多年以后再结束.也许不会. 

    alias ls="ls --color=auto"

简单但非常重要.使ls命令带着彩色输出

    alias ll = "ls --color -al"

从一个目录采用列表格式快速显示全部文件.

    alias grep='grep --color=auto'

相同地，把一些颜色在grep里输出

    mcd() { mkdir -p "$1"; cd "$1";} 

我的最爱之一. 制造一个目录采用一个命令mcd[名字]和cd命令进入到目录里面

    cls() { cd "$1"; ls;}

类似于前面的功能,cd命令进入一个目录别且列出它的的内容：cls[名字]

    backup() { cp "$1"{,.bak};}

简单的方法，使文件有一个备份: backup [文件]将会在相同的目录创建[文件].bak.

    md5check() { md5sum "$1" | grep "$2";}

因为我讨厌通过手工比较文件的md5算法,这个函数计算它并且计算它使用grep：md5check[文件][钥匙]

![](https://farm6.staticflickr.com/5616/15412389280_8be57841ae_o.jpg)

    alias makescript="fc -rnl | head -1 >" 

很容易地制造上个命令的脚本输出，你运行makescript[脚本名字.sh]

    alias genpasswd="strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo" 

只是瞬间产生一个强壮的密码

![](https://farm4.staticflickr.com/3955/15574321206_dd365f0f0e.jpg)

    alias c="clear"

不能较为简单的清除你终端的屏幕

    alias histg="history | grep"

通过你的命令历史：histg[关键字]快速地搜索

    alias ..='cd ..'

不需要写cd命令到上层目录

    alias ...='cd ../..'

类似地，去到上两个目录

    extract() { 
        if [ -f $1 ] ; then 
          case $1 in 
            *.tar.bz2)   tar xjf $1     ;; 
            *.tar.gz)    tar xzf $1     ;; 
            *.bz2)       bunzip2 $1     ;; 
            *.rar)       unrar e $1     ;; 
            *.gz)        gunzip $1      ;; 
            *.tar)       tar xf $1      ;; 
            *.tbz2)      tar xjf $1     ;; 
            *.tgz)       tar xzf $1     ;; 
            *.zip)       unzip $1       ;; 
            *.Z)         uncompress $1  ;; 
            *.7z)        7z x $1        ;; 
            *)     echo "'$1' cannot be extracted via extract()" ;; 
             esac 
         else 
             echo "'$1' is not a valid file" 
         fi 
    }

很长，但是也是最有用的。解压任何的文档类型：extract:[文档文件]


### 系统信息 ###

想尽快地知道一切关于你的系统？

    alias cmount="mount | column -t"

mount到列队中的格式输出

![](https://farm6.staticflickr.com/5603/15598830622_587b77a363_z.jpg)

    alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'" 

递归树格式显示目录结构.

    sbs() { du -b --max-depth 1 | sort -nr | perl -pe 's{([0-9]+)}{sprintf "%.1f%s", $1>=2**30? ($1/2**30, "G"): $1>=2**20? ($1/2**20, "M"): $1>=2**10? ($1/2**10, "K"): ($1, "")}e';} 

在当前目录里“按大小排序”显示列表的文件，排序按它们在磁盘上的大小

    alias intercept="sudo strace -ff -e trace=write -e write=1,2 -p" 

intercept[一些PID]阻止进程的标准输入输出文件和标准错误文件。注意你需要看着安装完成

    alias meminfo='free -m -l -t'

查看你还有剩下多少内存

![](https://farm4.staticflickr.com/3955/15411891448_0b9d6450bd_z.jpg)

    alias ps? = "ps aux | grep"

ps？[名字]很容易地发现，这个任何进程的

    alias volume="amixer get Master | sed '1,4 d' | cut -d [ -f 2 | cut -d ] -f 1"

显示现在声音的音量.

![](https://farm4.staticflickr.com/3939/15597995445_99ea7ffcd5_o.jpg)

### 网络 ###

对于所有涉及互联网和你本地网络的命令，也有奇特的别名给它们


    alias websiteget="wget --random-wait -r -p -e robots=off -U mozilla"

websiteget[指定的位置]下载完整的网站地址

    alias listen="lsof -P -i -n" 

显示出哪个应用程序连接到网络

![](https://farm4.staticflickr.com/3943/15598830552_c7e5eaaa0d_z.jpg)

    alias port='netstat -tulanp'

显示出活动的端口

    gmail() { curl -u "$1" --silent "https://mail.google.com/mail/feed/atom" | sed -e 's/<\/fullcount.*/\n/' | sed -e 's/.*fullcount>//'}

gmail：[用户名]大概的显示你的谷歌邮件里未读邮件的数量


    alias ipinfo="curl ifconfig.me && curl ifconfig.me/host"

获得你的公共IP地址和主机

    getlocation() { lynx -dump http://www.ip-adress.com/ip_tracer/?QRY=$1|grep address|egrep 'city|state|country'|awk '{print $3,$4,$5,$6,$7,$8}'|sed 's\ip address flag \\'|sed 's\My\\';} 

以你的IP地址为基础返回你现在的位置

### 没用的 ###

所以呢，如果一些别名是不是全部具有使用价值？它们可能仍然有趣


    kernelgraph() { lsmod | perl -e 'print "digraph \"lsmod\" {";<>;while(<>){@_=split/\s+/; print "\"$_[0]\" -> \"$_\"\n" for split/,/,$_[3]}print "}"' | dot -Tpng | display -;}

要绘制内核模块依赖曲线图。需要镜像阅读器

    alias busy="cat /dev/urandom | hexdump -C | grep "ca fe"" 

在非技术人员的眼里你看起来都在忙和构思

![](https://farm6.staticflickr.com/5599/15574321326_ab3fbc1ef9_z.jpg)

最后，这些别名和函数的很大一部分来自于我个人的.bashrc.这些令人敬畏的网站 [alias.sh][1]和[commandlinefu.com][2]我早已经展示在我的[best online tools for Linux][3].当然去检测它们的输出，让你拥有特有的秘诀。如果你真的同意，在注释里分享你的智慧，


做为奖励，这里有我提到的全部别名和函数的纯文本版本，随时可以复制粘贴到你的.bashrc.

    #Productivity
    alias ls="ls --color=auto"
    alias ll="ls --color -al"
    alias grep='grep --color=auto'
    mcd() { mkdir -p "$1"; cd "$1";}
    cls() { cd "$1"; ls;}
    backup() { cp "$1"{,.bak};}
    md5check() { md5sum "$1" | grep "$2";}
    alias makescript="fc -rnl | head -1 >"
    alias genpasswd="strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo"
    alias c="clear"
    alias histg="history | grep"
    alias ..='cd ..'
    alias ...='cd ../..'
    extract() {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }
      
    #System info
    alias cmount="mount | column -t"
    alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
    sbs(){ du -b --max-depth 1 | sort -nr | perl -pe 's{([0-9]+)}{sprintf "%.1f%s", $1>=2**30? ($1/2**30, "G"): $1>=2**20? ($1/2**20, "M"): $1>=2**10? ($1/2**10, "K"): ($1, "")}e';}
    alias intercept="sudo strace -ff -e trace=write -e write=1,2 -p"
    alias meminfo='free -m -l -t'
    alias ps?="ps aux | grep"
    alias volume="amixer get Master | sed '1,4 d' | cut -d [ -f 2 | cut -d ] -f 1"
      
    #Network
    alias websiteget="wget --random-wait -r -p -e robots=off -U mozilla"
    alias listen="lsof -P -i -n"
    alias port='netstat -tulanp'
    gmail() { curl -u "$1" --silent "https://mail.google.com/mail/feed/atom" | sed -e 's/<\/fullcount.*/\n/' | sed -e 's/.*fullcount>//'}
    alias ipinfo="curl ifconfig.me && curl ifconfig.me/host"
    getlocation() { lynx -dump http://www.ip-adress.com/ip_tracer/?QRY=$1|grep address|egrep 'city|state|country'|awk '{print $3,$4,$5,$6,$7,$8}'|sed 's\ip address flag \\'|sed 's\My\\';}
      
    #Funny
    kernelgraph() { lsmod | perl -e 'print "digraph \"lsmod\" {";<>;while(<>){@_=split/\s+/; print "\"$_[0]\" -> \"$_\"\n" for split/,/,$_[3]}print "}"' | dot -Tpng | display -;}
    alias busy="cat /dev/urandom | hexdump -C | grep \"ca fe\""

--------------------------------------------------------------------------------

via: http://xmodulo.com/useful-bash-aliases-functions.html

作者：[Adrien Brochard][a]
译者：[译者luoyutiantang](https://github.com/译者luoyutiantang)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/adrien
[1]:http://alias.sh/
[2]:http://www.commandlinefu.com/commands/browse
[3]:http://xmodulo.com/useful-online-tools-linux.html
