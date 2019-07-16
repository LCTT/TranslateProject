如何更换 Ubuntu 系统的 GDM 登录界面背景
======

![](https://www.ostechnix.com/wp-content/uploads/2018/11/GDM-login-screen-3.png)

Ubuntu 18.04 LTS 桌面系统在登录、锁屏和解锁状态下，我们会看到一个纯紫色的背景。它是 GDM（<ruby>GNOME 显示管理器<rt>GNOME Display Manager</rt></ruby>）从 ubuntu 17.04 版本开始使用的默认背景。有一些人可能会不喜欢这个纯色的背景，想换一个酷一点、更吸睛的！如果是这样，你找对地方了。这篇短文将会告诉你如何更换 Ubuntu 18.04 LTS 的 GDM 登录界面的背景。

### 更换 Ubuntu 的登录界面背景

这是 Ubuntu 18.04 LTS 桌面系统默认的登录界面。

![](https://www.ostechnix.com/wp-content/uploads/2018/11/GDM-login-screen-1.png)

不管你喜欢与否，你总是会不经意在登录、解屏/锁屏的时面对它。别担心！你可以随便更换一个你喜欢的图片。

在 Ubuntu 上更换桌面壁纸和用户的资料图像不难。我们可以点击鼠标就搞定了。但更换解屏/锁屏的背景则需要修改文件 `ubuntu.css`，它位于 `/usr/share/gnome-shell/theme`。

修改这个文件之前，最好备份一下它。这样我们可以避免出现问题时可以恢复它。

```
$ sudo cp /usr/share/gnome-shell/theme/ubuntu.css /usr/share/gnome-shell/theme/ubuntu.css.bak
```

修改文件 `ubuntu.css`：

```
$ sudo nano /usr/share/gnome-shell/theme/ubuntu.css
```

在文件中找到关键字 `lockDialogGroup`，如下行：

```
#lockDialogGroup {
   background: #2c001e url(resource:///org/gnome/shell/theme/noise-texture.png);
   background-repeat: repeat; 
}
```

![](https://www.ostechnix.com/wp-content/uploads/2018/11/ubuntu_css.png)

可以看到，GDM 默认登录的背景图片是 `noise-texture.png`。

现在修改为你自己的图片路径。也可以选择 .jpg 或 .png 格式的文件，两种格式的图片文件都是支持的。修改完成后的文件内容如下：

```
#lockDialogGroup {
   background: #2c001e url(file:///home/sk/image.png);
   background-repeat: no-repeat; 
   background-size: cover;
   background-position: center;
}
```

请注意 `ubuntu.css` 文件里这个关键字的修改，我把修改点加粗了。

你可能注意到，我把原来的 `... url(resource:///org/gnome/shell/theme/noise-texture.png);` 修改为 `... url(file:///home/sk/image.png);`。也就是说，你可以把 `... url(resource ...` 修改为 `.. url(file ...`。

同时，你可以把参数 `background-repeat:` 的值 `repeat` 修改为 `no-repeat`，并增加另外两行。你可以直接复制上面几行的修改到你的 `ubuntu.css` 文件，对应的修改为你的图片路径。

修改完成后，保存和关闭此文件。然后系统重启生效。

下面是 GDM 登录界面的最新背景图片：

![](https://www.ostechnix.com/wp-content/uploads/2018/11/GDM-login-screen-2.png)

是不是很酷，你都看到了，更换 GDM 登录的默认背景很简单。你只需要修改 `ubuntu.css` 文件中图片的路径然后重启系统。是不是很简单也很有意思.

你可以修改 `/usr/share/gnome-shell/theme` 目录下的文件 `gdm3.css` ，具体修改内容和修改结果和上面一样。同时记得修改前备份要修改的文件。

就这些了。如果有好的东东再分享了，请大家关注！

后会有期。

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-change-gdm-login-screen-background-in-ubuntu/

作者：[SK][a]
选题：[lujun9972][b]
译者：[Guevaraya](https://github.com/guevaraya)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
