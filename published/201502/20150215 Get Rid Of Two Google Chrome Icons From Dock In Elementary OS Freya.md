如何避免在ELemetary OS Freya中出现两个Google Chrome 图标
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/Two_Google_Chrome_ElementaryOS_Freya.jpeg)

这篇文章会教你**如何避免在ELemetary OS Freya中出现两个Google Chrome 图标**。

Chrome才是我在所有系统中使用的主浏览器。[Modori][2] 是默认放在dock中的浏览器，所以你每次使用Chrome时都需要在Slingshot中搜索Google Chrome，而为了节省时间，我通常会将它“保持在dock”中。

这里的问题是当你点击dock中的Chrome图标时，它会创建另外一个Google Chrome的实例。这就在dock中留下两个Chrome图标，这或许你可以不在意，但是很显然处女座不能忍！如果你有相同的感受，让我们看下如何移除这第二个Google Chrome图标。

### 在Elementary OS Freya的dock中删除第二个Google Chrome 图标 ###

#### 第一步: ####

从dock中删除Google Chrome。

#### 第二步: ####

打开终端并使用下面的命令：

    cp /usr/share/applications/google-chrome.desktop ~/.local/share/applications

#### 第三步: ####

接下来我们要编辑google-chrome.destop文件。使用下面的命令：

    scratch-text-editor ~/.local/share/applications/google-chrome.desktop

这会用Scratch打开google-chrome.destop文件。在[Desktop Entry]段落下，加入下面的行：


    StartupWMClass=Google-chrome-stable

看上去像这样：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/two_Google_Chrome_Elementary_Freya.png)

#### 第四步: ####

进入Slingshot并且再次打开Google Chrome。再次选择“keep in dock”。关闭并重新打开它来验证它是否在dock中打开了另外一个新的Chrome图标。这里不需要重启系统。

我希望这篇提示能够帮助你删除Elementary OS Freya中多出的Chrome图标。有任何问题或建议让我在评论区中知道。

--------------------------------------------------------------------------------

via: http://itsfoss.com/rid-google-chrome-icons-dock-elementary-os-freya/

作者：[Abhishek][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://elementary.io/
[2]:http://midori-browser.org/
