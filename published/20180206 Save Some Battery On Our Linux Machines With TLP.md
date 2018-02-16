TLP 帮助我们的 Linux 机器节能省电
======

![](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/save-some-battery-on-our-linux-machines-with-tlp_orig.jpg)

我发现 Linux 下电池的寿命普遍要比 Windows 下要短。尽管如此，这可是 Linux，我们总会有有办法的。

现在来讲一下这个名叫 TLP 的小工具，它能帮你的设备省点电。

**TLP - Linux 高级电源管理** 是一个小巧的命令行工具，它通过对 Linux 系统执行一些调整来真正帮助延长电池的寿命。

```
sudo apt install tlp
```

[![install tlp in linux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/install-tlp-in-linux.jpeg?1517926012)][2] 

对于其他的发行版，你可以阅读其[官方网站][3]上的指南。

安装完成之后，你只有在第一次的时候需要运行下面命令来启动 tlp。TLP 会在下次启动系统时自动运行。

[![start tlp on linux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/start-tlp-on-linux.jpeg?1517926209)][4] 

​现在 TLP 已经被启动起来了，而且已经设置好了节省电池所需要的默认配置。我们可以查看该配置文件。文件路径为 `/etc/default/tlp`。我们需要编辑该文件来修改各项配置。

配置文件中有很多选项，要启用某个选项的话之胥敖删除行首的 `#` 就行了。每个选项能够赋予什么值都有说明。下面是你可能会用到的选项：

*   自动休眠 USB 设备
*   设定启动时启用/禁用无线设备
*   降低硬盘转速
*   关闭无线设备
*   设置 CPU 以性能优先还是节能优先

### 结论

​TLP 是一个超棒的工具，可以延长 Linux 系统的电池使用寿命。我个人的经验是使用 TLP 能延长至少 30-40% 的电池使用寿命。

--------------------------------------------------------------------------------

via: http://www.linuxandubuntu.com/home/save-some-battery-on-our-linux-machines-with-tlp

作者：[LinuxAndUbuntu][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxandubuntu.com
[1]:http://www.linuxandubuntu.com/home/category/linux
[2]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/install-tlp-in-linux.jpeg
[3]:http://linrunner.de/en/tlp/docs/tlp-linux-advanced-power-management.html
[4]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/start-tlp-on-linux.jpeg
