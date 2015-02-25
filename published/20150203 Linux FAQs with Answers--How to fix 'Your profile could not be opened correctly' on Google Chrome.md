Linux有问必答——如何修复Google Chrome 的“Your profile could not be opened correctly”错误
================================================================================
> **提问**：当我在linux打开Google Chrome 浏览器时，我已经几次收到弹出窗口，提示我的档案文件没有被正确打开（Your profile could not be opened correctly.）。每次我打开Chrome都要弹出来，我应该如何修复这个问题？

当你在你的Chrome上看见"Your profile could not be opened correctly"错误信息时，从某种程度上讲，那是因为你的Chrome配置文件数据已经损坏。这个问题经常发生在手动升级Google Chrome的时候。

![](https://farm8.staticflickr.com/7428/16238502737_27bdda6685_o.png)

修复取决于到底哪个文件损坏，你可以试试下面的几个方法。

### 方法一 ###

关掉所有Chrome窗口和标签页。

进入~/.config/google-chrome/Default，移除或者重命名"Web Data"文件。

    $ cd ~/.config/google-chrome/Default
    $ rm "Web Data" 

再次开打Google Chrome浏览器。

### 方法二 ###

关掉所有Chrome窗口和标签页。

进入~/.config/google-chrome/"Profile 1"，并重命名"History"文件。

    $ cd ~/.config/google-chrome/"Profile 1"
    $ mv History History.bak 

再次开打Google Chrome浏览器。

### 方法三 ###

如果依然没有解决，你可以试试移除所有默认配置文件夹（~/.config/google-chrome/Default）。注意:如果这样做，你将会遗失所有之前打开的Google标签、导入的书签，浏览记录和登录数据等。

在移除之前，先关掉所有Chrome窗口和标签页

    $ rm -rf ~/.config/google-chrome/Default

之后重启Google Chrome，文件夹~/.config/google-chrome/Default会自动生成。

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/your-profile-could-not-be-opened-correctly-google-chrome.html

译者：[VicYu/Vic020](http://vicyu.net)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
