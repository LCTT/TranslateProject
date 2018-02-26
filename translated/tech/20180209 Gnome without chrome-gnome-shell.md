没有 chrome-gnome-shell 的 Gnome
======

新的笔记本有触摸屏，它可以折叠成平板电脑，我听说 gnome-shell 将是桌面环境的一个很好的选择，我设法调整它足以按照现有的习惯重用。

然而，我有一个很大的问题，它怎么会鼓励人们从互联网上下载随机扩展，并将它们作为整个桌面环境的一部分运行。 一个更大的问题是，[gnome-core][1] 对 [chrome-gnome-shell] [2] 有强制依赖，插件不用 root 用户编辑 `/etc` 下的文件则无法禁用，这会给网站暴露我的桌面环境。

访问[这个网站][3]，它会知道你已经安装了哪些扩展，并且能够安装更多。我不信任它，我不需要那样，我不想那样。我为此感到震惊。

[我想出了一个临时解决方法][4]。

人们会在 firefox 中如何做呢？

### 描述

chrome-gnome-shell 是 gnome-core 的一个强制依赖项，它安装了一个可能不需要的浏览器插件，并强制它使用系统范围的 chrome 策略。

我认为使用 chrome-gnome-shell 会不必要地增加系统的攻击面，我作为主要用户，它会获取下载和执行随机未经审查代码的可疑特权。

这个包满足了 chrome-gnome-shell 的依赖，但不会安装任何东西。

请注意，在安装此包之后，如果先前安装了 chrome-gnome-shell，则需要清除 chrome-gnome-shell，以使其在 /etc/chromium 中删除 chromium 策略文件

### 说明
```
apt install equivs
equivs-build contain-gnome-shell
sudo dpkg -i contain-gnome-shell_1.0_all.deb
sudo dpkg --purge chrome-gnome-shell

```


--------------------------------------------------------------------------------

via: http://www.enricozini.org/blog/2018/debian/gnome-without-chrome-gnome-shell/

作者：[Enrico Zini][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.enricozini.org/
[1]:https://packages.debian.org/gnome-core
[2]:https://packages.debian.org/chrome-gnome-shell
[3]:https://extensions.gnome.org/
[4]:https://salsa.debian.org/enrico/contain-gnome-shell
