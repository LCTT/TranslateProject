在Linux中模拟击键和鼠标移动
================================================================================
<pre><code>
你是否曾经拥有一个梦
    ——你的计算机`
         可以自动为你干活？
或许，并非因为
    你刚看了终结者。
然而，除此之外
    脚本和任务自动化
        是每个高级用户追寻的梦
如果今天
    有许多的解决方案
        可以满足这个目标
那么
    有时候
       就难以从那众多之中采撷那
       简洁、聪明而又高效的一个
我
    不能假装
       是我自己发现了它
而与此同时
    却偏爱着那个
       整洁的软体——xdotool
其方法是如此直观
    正如它作为X11自动化工具的表露
转换思想
    xdotool可以通过读取文本文件
       模拟击键的旋律
           以及鼠标的曼舞
</code></pre>
            
### 让Xdotool在Linux定居 ###

对于Ubuntu，Debian或者Linux Mint，你能够只做：

    $ sudo apt-get install xdotool 

对于Fedora，请使用yum命令：

    $ sudo yum install xdotool 

对于CentOS用户，可以在[EPEL repo][1]中找到该包。在启用EPEL仓库后，只要使用上面的yum命令就可以达成你的愿望。

对于Arch用户，可在Community仓库中找到该包：

    $ sudo pacman -S xdotool 

如果你还是找不到你的发行版的对应xdotool，你可以从它的[官方站点][2]下载。

### Xdotool基本功 ###

虽然xdotool是那样的直观，但它仍然是个脚本程序。因此，为了要正确地使用它，你还是得了解它的语法。不过敬请放心，相对于程序的功能而言，语法还是比较简单易学的。

首先，模拟击键是很容易的。你可以从终端敲入下面的命令：

    $ xdotool key [name of the key] 

如果你想要连接两个键，可以在它们之间使用“+”操作符。它看起来像这样：

    $ xdotool key alt+Tab 

这两个组合键可以为你切换窗口。

要想让xdotool帮你输入，可以使用以下命令：

    $ xdotool type '' 

这些对于基本的击键而言已经足够了。但是，xdotool的众多长处之一，就是它可以获取特定窗口的焦点。它可以获取右边的窗口，然后在里面输入，所有你记录下的按键都不会人间蒸发，而是老老实实的如你所愿的出现在那里。要获得该功能，一个简单的命令可以搞定：

    $ xdotool search --name [name of the window] key [keys to press]

该命令将在打开的窗口中搜索对应名称的窗口，并聚焦于该窗口，然后模拟击键。

来点更高级的，但很有用哦，xdotool可以模拟鼠标移动和点击，看这命令：

    $ xdotool mousemove x y 

你可以将光标定位到屏幕坐标（x，y）（像素）。你也可以使用“click”参数来组合：

    $ xdotool mousemove x y click 1 

这会让鼠标移动到（x，y），然后点击鼠标左键。“1”代表鼠标左键，“2”则是滚轮，“3”则是右键。

最后，一旦你这些命令根植于你脑海，你也许想要实际转储于文件来编辑并试着玩玩。鉴于此，就会有超过一个语句以上的内容了。你需要的就是写一个bash脚本了：

    #!/bin/bash
    
    xdotool [command 1]
    xdotool [command 2]
    etc

或者你可以使用：

    $ xdotool [filename] 

这里你将命令写入到一个独立的文件中，然后通过将文件名作为xdotool命令的参数。

### 意外收获 ###

作为本文的一个意外收获，这里是xdotool的一个具体实例。你可能听说过，也可能没听说过Bing —— 微软的搜索引擎。在后面的实例中，你会看到你可能从没听过Bing奖励：一个程序，可以让你用Bing积分兑取亚马逊的礼物卡和其它的一些礼物卡。要赚取这些积分，你可以每天在Bing上搜索累计达30次，每次搜索你都会获得0.5个积分。换句话说，你必须把Bing设为默认搜索引擎，并每天使用它。

或者，你可以使用xdotool脚本，在这个脚本中，会自动聚焦到Firefox（你可以用你喜欢的浏览器来取代它），并使用fortune命令生成一些随机单词来实施搜索。大约30秒之内，你的日常搜索任务就完成了。

    #!/bin/bash
     
    for i in {1..30}
    do
      WID=`xdotool search --title "Mozilla Firefox" | head -1`
      xdotool windowfocus $WID
      xdotool key ctrl+l
      xdotool key Tab
      SENTENCE="$(fortune | cut -d' ' -f1-3 | head -1)"
      xdotool type $SENTENCE
      xdotool key "Return"
      sleep 4
    done


下面来个小结吧：我真的很喜欢xdotool，即便它的完整功能超越了本文涵盖的范围。这对于脚本和任务自动化而言，确实是种平易的方式。负面的问题是，它可能不是最有效率的一个。但我要再说一遍，它忠于职守了，而且学习起来也不是那么麻烦。

你对xdotool怎么看呢？你是否更喜欢另外一个自动化工具，而不是它呢？为什么呢？请在评论中告诉我们吧。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/07/simulate-key-press-mouse-movement-linux.html

译者：[GOLinux](https://github.com/GOLinux) 校对：[ wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/2013/03/how-to-set-up-epel-repository-on-centos.html
[2]:http://www.semicomplete.com/projects/xdotool/
