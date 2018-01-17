如何在终端输入密码时显示星号
======

![](https://www.ostechnix.com/wp-content/uploads/2018/01/Display-Asterisks-When-You-Type-Password-In-terminal-1-720x340.png)

当你在 Web 浏览器或任何 GUI 登录中输入密码时，密码会被标记成星号 ******** 或圆形符号 ••••••••••••• 。这是内置的安全机制，以防止你附近的用户看到你的密码。但是当你在终端输入密码来执行任何 **sudo** 或 **su** 的管理任务时，你不会在输入密码的时候看见星号或者圆形符号。它不会有任何输入密码的视觉指示，也不会有任何光标移动，什么也没有。你不知道你是否输入了所有的字符。你只会看到一个空白的屏幕！

看看下面的截图。

![][2]

正如你在上面的图片中看到的，我已经输入了密码，但没有任何指示（星号或圆形符号）。现在，我不确定我是否输入了所有密码。这个安全机制也可以防止你附近的人猜测密码长度。当然，这种行为可以改变。这是本指南要说的。这并不困难。请继续阅读。

#### 当你在终端输入密码时显示星号

要在终端输入密码时显示星号，我们需要在 **“/etc/sudoers”** 中做一些小修改。在做任何更改之前，最好备份这个文件。为此，只需运行：
```
sudo cp /etc/sudoers{,.bak}
```

上述命令将 /etc/sudoers 备份成名为 /etc/sudoers.bak。你可以恢复它，以防万一在编辑文件后出错。

接下来，使用下面的命令编辑 **“/etc/sudoers”**：
```
sudo visudo
```

找到下面这行：
```
Defaults env_reset
```

![][3]

在该行的末尾添加一个额外的单词 **“,pwfeedback”**，如下所示。
```
Defaults env_reset,pwfeedback
```

![][4]

然后，按下 **“CTRL + x”** 和 **“y”** 保存并关闭文件。重新启动终端以使更改生效。

现在，当你在终端输入密码时，你会看到星号。

![][5]

如果你对在终端输入密码时看不到密码感到不舒服，那么这个小技巧会有帮助。请注意，当你输入输入密码时其他用户就可以预测你的密码长度。如果你不介意，请按照上述方法进行更改，以使你的密码可见（当然，标记为星号！）。

现在就是这样了。还有更好的东西。敬请关注！

干杯!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/display-asterisks-type-password-terminal/

作者：[SK][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[2]:http://www.ostechnix.com/wp-content/uploads/2018/01/password-1.png ()
[3]:http://www.ostechnix.com/wp-content/uploads/2018/01/visudo-1.png ()
[4]:http://www.ostechnix.com/wp-content/uploads/2018/01/visudo-1-1.png ()
[5]:http://www.ostechnix.com/wp-content/uploads/2018/01/visudo-2.png ()
