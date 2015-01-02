一大波有用的 bash 别名和函数
================================================================================

作为一个命令行探索者，你或许发现你自己一遍又一遍重复同样的命令。如果你总是用ssh进入到同一台电脑，如果你总是将一连串命令连接起来，如果你总是用同样的参数运行一个程序，你也许希望在这种不断的重复中为你的生命节约下几秒钟。

解决方案是使用一个别名（alias）。正如你可能知道的，别名用一种让你的shell记住一个特定的命令并且给它一个新的名字的方式。不管怎么样，别名有一些限制，它只是shell命令的快捷方式，不能传递或者控制其中的参数。所以作为补充，bash 也允许你创建你自己的函数，这可能更长一些和复杂一点，它允许任意数量的参数。

当然，当你有美食时，比如某种汤，你要分享它给大家。我这里有一个列表，列出了一些最有用bash别名和函数的。注意“最有用的”只是个说法，别名的是否有用要看你是否每天都需要在 shell 里面用它。

在你开始你的别名体验之旅前，这里有一个便于使用的小技巧：如果你的别名和原本的命令名字相同，你可以用如下技巧来访问原本的命令（LCTT 译注：你也可以直接原本命令的完整路径来访问它。）

    \command 

例如，如果有一个替换了ls命令的别名 ls。如果你想使用原本的ls命令而不是别名，通过调用它:

    \ls 
    
### 提升生产力 ###

这些别名真的很简单并且真的很短，但他们大多数是为了给你的生命节省几秒钟，最终也许为你这一辈子节省出来几年，也许呢。

    alias ls="ls --color=auto"

简单但非常重要。使ls命令带着彩色输出。

    alias ll="ls --color -al"

以彩色的列表方式列出目录里面的全部文件。

    alias grep='grep --color=auto'

类似，只是在grep里输出带上颜色。

    mcd() { mkdir -p "$1"; cd "$1";} 

我的最爱之一。创建一个目录并进入该目录里： mcd [目录名]。

    cls() { cd "$1"; ls;}

类似上一个函数，进入一个目录并列出它的的内容：cls[目录名]。

    backup() { cp "$1"{,.bak};}

简单的给文件创建一个备份: backup [文件] 将会在同一个目录下创建 [文件].bak。

    md5check() { md5sum "$1" | grep "$2";}

因为我讨厌通过手工比较文件的md5校验值，这个函数会计算它并进行比较：md5check[文件][校验值]。

![](https://farm6.staticflickr.com/5616/15412389280_8be57841ae_o.jpg)

    alias makescript="fc -rnl | head -1 >" 

很容易用你上一个运行的命令创建一个脚本：makescript [脚本名字.sh]

    alias genpasswd="strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo" 

只是瞬间产生一个强壮的密码。

![](https://farm4.staticflickr.com/3955/15574321206_dd365f0f0e.jpg)

    alias c="clear"

清除你终端屏幕不能更简单了吧？

    alias histg="history | grep"

快速搜索你的命令输入历史：histg [关键字]

    alias ..='cd ..'

回到上层目录还需要输入 cd 吗？

    alias ...='cd ../..'

自然，去到上两层目录。

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

很长，但是也是最有用的。解压任何的文档类型：extract: [压缩文件]

### 系统信息 ###

想尽快地知道关于你的系统一切信息？

    alias cmount="mount | column -t"

按列格式化输出mount信息。

![](https://farm6.staticflickr.com/5603/15598830622_587b77a363_z.jpg)

    alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'" 

以树形结构递归地显示目录结构。

    sbs() { du -b --max-depth 1 | sort -nr | perl -pe 's{([0-9]+)}{sprintf "%.1f%s", $1>=2**30? ($1/2**30, "G"): $1>=2**20? ($1/2**20, "M"): $1>=2**10? ($1/2**10, "K"): ($1, "")}e';} 

安装文件在磁盘存储的大小排序，显示当前目录的文件列表。

    alias intercept="sudo strace -ff -e trace=write -e write=1,2 -p" 

接管某个进程的标准输出和标准错误。注意你需要安装了 strace。

    alias meminfo='free -m -l -t'

查看你还有剩下多少内存。

![](https://farm4.staticflickr.com/3955/15411891448_0b9d6450bd_z.jpg)

    alias ps? = "ps aux | grep"

可以很容易地找到某个进程的PID：ps? [名字]。

    alias volume="amixer get Master | sed '1,4 d' | cut -d [ -f 2 | cut -d ] -f 1"

显示当前音量设置。

![](https://farm4.staticflickr.com/3939/15597995445_99ea7ffcd5_o.jpg)

### 网络 ###

对于所有用在互联网和本地网络的命令，也有一些神奇的别名给它们。

    alias websiteget="wget --random-wait -r -p -e robots=off -U mozilla"

下载整个网站：websiteget [URL]。

    alias listen="lsof -P -i -n" 

显示出哪个应用程序连接到网络。

![](https://farm4.staticflickr.com/3943/15598830552_c7e5eaaa0d_z.jpg)

    alias port='netstat -tulanp'

显示出活动的端口。

    gmail() { curl -u "$1" --silent "https://mail.google.com/mail/feed/atom" | sed -e 's/<\/fullcount.*/\n/' | sed -e 's/.*fullcount>//'}

大概的显示你的谷歌邮件里未读邮件的数量：gmail [用户名]

    alias ipinfo="curl ifconfig.me && curl ifconfig.me/host"

获得你的公网IP地址和主机名。

    getlocation() { lynx -dump http://www.ip-adress.com/ip_tracer/?QRY=$1|grep address|egrep 'city|state|country'|awk '{print $3,$4,$5,$6,$7,$8}'|sed 's\ip address flag \\'|sed 's\My\\';} 

返回你的当前IP地址的地理位置。

### 也许无用 ###

所以呢，如果一些别名并不是全都具有使用价值？它们可能仍然有趣。

    kernelgraph() { lsmod | perl -e 'print "digraph \"lsmod\" {";<>;while(<>){@_=split/\s+/; print "\"$_[0]\" -> \"$_\"\n" for split/,/,$_[3]}print "}"' | dot -Tpng | display -;}

绘制内核模块依赖曲线图。需要可以查看图片。

    alias busy="cat /dev/urandom | hexdump -C | grep 'ca fe'" 

在那些非技术人员的眼里你看起来是总是那么忙和神秘。

![](https://farm6.staticflickr.com/5599/15574321326_ab3fbc1ef9_z.jpg)

最后，这些别名和函数的很大一部分来自于我个人的.bashrc。而那些令人点赞的网站 [alias.sh][1]和[commandlinefu.com][2]我早已在我的帖子[best online tools for Linux][3] 里面介绍过。你可以去看看，如果你愿意，也可以分享下你的。也欢迎你在这里评论，分享一下你的智慧。

做为奖励，这里有我提到的全部别名和函数的纯文本版本，随时可以复制粘贴到你的.bashrc。（如果你已经一行一行的复制到这里了，哈哈，你发现你又浪费了生命的几秒钟~）

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
译者：[luoyutiantang](https://github.com/luoyutiantang)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/adrien
[1]:http://alias.sh/
[2]:http://www.commandlinefu.com/commands/browse
[3]:http://xmodulo.com/useful-online-tools-linux.html
