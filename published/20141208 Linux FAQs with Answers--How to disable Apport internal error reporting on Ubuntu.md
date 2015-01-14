Linux有问必答：如何禁止Ubuntu的Apport内部错误报告程序
================================================================================
> **问题**：在桌面版Ubuntu中，我经常遇到一些弹窗窗口，警告我Ubuntu发生了内部错误，问我要不要发送错误报告。每次软件崩溃都要烦扰我，我如何才能关掉这个错误报告功能呢？

Ubuntu桌面版预装了Apport，它是一个错误收集系统，会收集软件崩溃、未处理异常和其他，包括程序bug，并为调试目的生成崩溃报告。当一个应用程序崩溃或者出现Bug时候，Apport就会通过弹窗警告用户并且询问用户是否提交崩溃报告。你也许也看到过下面的消息。

- "Sorry, the application XXXX has closed unexpectedly."
- "对不起，应用程序XXXX意外关闭了。"
- "Sorry, Ubuntu XX.XX has experienced an internal error."
- "对不起，Ubuntu XX.XX 发生了一个内部错误。"
- "System program problem detected." 
- "检测到系统程序问题。"

![](https://farm9.staticflickr.com/8635/15688551119_708b23b12a_z.jpg)

也许因为应用一直崩溃，频繁的错误报告会使人心烦。也许你担心Apport会收集和上传你的Ubuntu系统的敏感信息。无论什么原因，你想关掉Apport的错误报告功能。

### 临时关闭Apport错误报告 ###

如果你想要临时关闭Apport，使用下列命令

    $ sudo service apport stop 

注意重启Ubuntu系统Apport会继续开启

### 永久关闭Apport错误报告 ###

为了永久关闭Apport，编辑/etc/default/apport，修改下列参数

    enabled=0

重启你的Ubuntu系统，Apport将会自动关闭

如果你再也不会用Apport，有一种简单的方法完全移除它

    $ sudo apt-get purge apport 

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/disable-apport-internal-error-reporting-ubuntu.html

译者：[VicYu/Vic020](http://www.vicyu.net/)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
