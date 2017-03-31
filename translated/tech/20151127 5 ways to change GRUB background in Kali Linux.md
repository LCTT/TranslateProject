在 Kali Linux 中更改 GRUB 背景的 5 种方式
============================================================

这是一个关于如何在 Kali Linux 中更改 GRUB 背景的简单指南（实际上它是 Kali Linux 的 
 GRUB 启动图像）。 Kali 开发团队在这方面做的不多，他们好像太忙了，所以在这篇文章中，我会对 GRUB 解释一二，但是不会冗长到我失去写作的激情。 那么我们开始吧……

[
 ![Change GRUB background in Kali Linux - blackMORE OPs -10](http://www.blackmoreops.com/wp-content/uploads/2015/11/Change-GRUB-background-in-Kali-Linux-blackMORE-OPs-10.jpg) 
][10]

### 查找 GRUB 设置

这通常是所有人首先会遇到的一个问题，在哪里设置？有很多方法来查找 GRUB 设置。每个人都可能有自己的方法，但我发现 `update-grub` 是最简单的。如果在 VMWare 或 VirtualBox 中执行 `update-grub`，你将看到如下所示的内容：

```
root@kali:~# update-grub
Generating grub configuration file ...
Found background image: /usr/share/images/desktop-base/desktop-grub.png
Found linux image: /boot/vmlinuz-4.0.0-kali1-amd64
Found initrd image: /boot/initrd.img-4.0.0-kali1-amd64
  No volume groups found
done
root@kali:~#
```

如果您是双系统，或者三系统，那么您将看到 GRUB 以及其他操作系统入口。然而，我们感兴趣的部分是背景图像，这是在我这里看到的（你会看到完全相同的内容）：

```
Found background image: /usr/share/images/desktop-base/desktop-grub.png
```

### GRUB 启动图像搜索顺序

在 grub-2.02 中，对基于 Debian 的系统来说，它将按照以下顺序搜索启动背景：

1.  `/etc/default/grub` 里的 `GRUB_BACKGROUND` 行 
2.  在 `/boot/grub/` 里找到的第一个图像（如果发现多张，将以字母顺序排序）
3.  在 `/usr/share/desktop-base/grub_background.sh` 中指定的
4.  在 `/etc/grub.d/05_debian_theme` 里 `WALLPAPER` 行列出的

现在将此信息留在这里，我们会尽快重新检查它。

### Kali Linux GRUB 启动图像

在我使用 Kali Linux 时（因为我喜欢用它做事），会发现 Kali 正在使用这里的背景图像：`/usr/share/images/desktop-base/desktop-grub.png`

为了确定，我们来检查一下这个 `.png` 文件的属性。

```
root@kali:~# 
root@kali:~# ls -l /usr/share/images/desktop-base/desktop-grub.png
lrwxrwxrwx 1 root root 30 Oct  8 00:31 /usr/share/images/desktop-base/desktop-grub.png -> /etc/alternatives/desktop-grub
root@kali:~#
```

[
 ![Change GRUB background in Kali Linux - blackMORE OPs -1](http://www.blackmoreops.com/wp-content/uploads/2015/11/Change-GRUB-background-in-Kali-Linux-blackMORE-OPs-1.jpg) 
][11]

什么？它只是 `/etc/alternatives/desktop-grub` 的一个符号链接？ 但是 `/etc/alternatives/desktop-grub` 不是图片文件。看来我也要检查一下它的属性。

```
root@kali:~# 
root@kali:~# ls -l /etc/alternatives/desktop-grub
lrwxrwxrwx 1 root root 44 Oct  8 00:27 /etc/alternatives/desktop-grub -> /usr/share/images/desktop-base/kali-grub.png
root@kali:~# 
```

[
 ![Change GRUB background in Kali Linux - blackMORE OPs -3](http://www.blackmoreops.com/wp-content/uploads/2015/11/Change-GRUB-background-in-Kali-Linux-blackMORE-OPs-3.jpg) 
][12]

好吧，真让人费解。 `/etc/alternatives/desktop-grub` 也是一个符号链接，它指向 `/usr/share/images/desktop-base/kali-grub.png`，来自最初同样的文件夹。呃！ 无语。 但是现在我们至少可以替换该文件并将其解决。

在替换之前，我们需要检查 `/usr/share/images/desktop-base/kali-grub.png` 的属性，以确保下载相同类型和大小的文件。

```
root@kali:~# 
root@kali:~# file /usr/share/images/desktop-base/kali-grub.png
/usr/share/images/desktop-base/kali-grub.png: PNG image data, 640 x 480, 8-bit/color RGB, non-interlaced
root@kali:~# 
```

可以确定这是一个 PNG 图像文件，像素尺寸为 640 x 480。

### GRUB 背景图像属性

可以使用 `PNG`, `JPG`/`JPEG` 以及 `TGA` 类型的图像文件作为 GRUB 2 的背景。必须符合以下规范：

*   `JPG`/`JPEG` 图像必须是 `8-bit` (256 色)
*   图像应该是非索引的，`RGB`

默认情况下，如果安装了 `desktop-base` 软件包，符合上述规范的图像将放在 `/usr/share/images/desktop-base/` 目录中。在谷歌上很容易找到类似的文件。我也找了一个。

```
root@kali:~# 
root@kali:~# file Downloads/wallpaper-1.png 
Downloads/wallpaper-1.png: PNG image data, 640 x 480, 8-bit/color RGB, non-interlaced
root@kali:~# 
```

[
 ![Change GRUB background in Kali Linux - blackMORE OPs -6](http://www.blackmoreops.com/wp-content/uploads/2015/11/Change-GRUB-background-in-Kali-Linux-blackMORE-OPs-6.jpg) 
][13]

### 方式 1：替换图像

现在我们只需简单的用新文件将 `/usr/share/images/desktop-base/kali-grub.png` 替换掉。值得注意这是最简单的方法，不需要修改 `grub-config` 文件。 如果你对 GRUB 很熟，建议你简单的修改 GRUB 的默认配置文件，然后执行 `update-grub`。

像往常一样，我会将原文件重命名为 `kali-grub.png.bkp` 进行备份。

```
root@kali:~# 
root@kali:~# mv /usr/share/images/desktop-base/kali-grub.png /usr/share/images/desktop-base/kali-grub.png.bkp
root@kali:~# 
```

[
 ![Change GRUB background in Kali Linux - blackMORE OPs -4](http://www.blackmoreops.com/wp-content/uploads/2015/11/Change-GRUB-background-in-Kali-Linux-blackMORE-OPs-4.jpg) 
][14]

现在我们将下载的文件重命名为 `kali-grub.png`。

```
root@kali:~# 
root@kali:~# cp Downloads/wallpaper-1.png /usr/share/images/desktop-base/kali-grub.png
root@kali:~# 
```

[
 ![Change GRUB background in Kali Linux - blackMORE OPs -5](http://www.blackmoreops.com/wp-content/uploads/2015/11/Change-GRUB-background-in-Kali-Linux-blackMORE-OPs-5.jpg) 
][15]

最后执行命令 `update-grub`：

```
root@kali:~# update-grub
Generating grub configuration file ...
Found background image: /usr/share/images/desktop-base/desktop-grub.png
Found linux image: /boot/vmlinuz-4.0.0-kali1-amd64
Found initrd image: /boot/initrd.img-4.0.0-kali1-amd64
  No volume groups found
done
root@kali:~#
```

[
 ![Change GRUB background in Kali Linux - blackMORE OPs -7](http://www.blackmoreops.com/wp-content/uploads/2015/11/Change-GRUB-background-in-Kali-Linux-blackMORE-OPs-7.jpg) 
][16]

下次重新启动你的 Kali Linux 时，你会看到 GRUB 背景变成了你自己的图像（GRUB 启动界面)。

下面是我现在正在使用的新 GRUB 启动背景。你呢？要不要试试这个办法？

[
 ![Change GRUB background in Kali Linux - blackMORE OPs -9](http://www.blackmoreops.com/wp-content/uploads/2015/11/Change-GRUB-background-in-Kali-Linux-blackMORE-OPs-9.jpg) 
][17]

这是最简单最安全的办法，最糟的情况也不过是在 GRUB 看到一个蓝色的背景，但你依然可以登录后修复它们。现在如果你有信心，让我们尝试一个改变 GRUB 设置的更好的方法（有点复杂）。后续步骤更加有趣，而且可以在任何使用 GRUB 引导的 Linux 上使用。

现在回忆一下 GRUB 在哪 4 个地方寻找启动背景图像？再看一遍：

1.  `/etc/default/grub` 里的 `GRUB_BACKGROUND` 行 
2.  在 `/boot/grub/` 里找到的第一个图像（如果发现多张，将以字母顺序排序）
3.  在 `/usr/share/desktop-base/grub_background.sh` 中指定的
4.  在 `/etc/grub.d/05_debian_theme` 里 WALLPAPER 行列出的

那么我们再在 Kali Linux 上（或任意使用 GRUB2 的 Linux系统）试一下新的选择。

### 方式 2：在 GRUB_BACKGROUND 中定义图像路径

所以你可以根据上述的查找优先级使用上述任一项，将 GRUB 背景图像改为自己的。以下是我自己系统上  `/etc/default/grub` 的内容。

```
root@kali:~# vi /etc/default/grub
```

按照 `GRUB_BACKGROUND="/root/World-Map.jpg"` 的格式添加一行，其中 World-Map.jpg 是你要作为 GRUB 背景的图像文件。

```
# If you change this file, run 'update-grub' afterwards to update
# /boot/grub/grub.cfg.
# For full documentation of the options in this file, see:
#   info -f grub -n 'Simple configuration'

GRUB_DEFAULT=0
GRUB_TIMEOUT=15
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT="quiet"
GRUB_CMDLINE_LINUX="initrd=/install/gtk/initrd.gz"
GRUB_BACKGROUND="/root/World-Map.jpg"
```

一旦使用上述方式完成更改，务必执行 `update-grub` 命令，如下所示。

```
root@kali:~# update-grub
Generating grub configuration file ...
Found background: /root/World-Map.jpg
Found background image: /root/World-Map.jpg
Found linux image: /boot/vmlinuz-4.0.0-kali1-amd64
Found initrd image: /boot/initrd.img-4.0.0-kali1-amd64
  No volume groups found
done
root@kali:~#
```

现在重启机器，你会在 GRUB 看到自定义的图像。

### 方式 3：把图像文件放到 /boot/grub/ 文件夹

如果没有在 `/etc/default/grub` 文件中指定 `GRUB_BACKGROUND` 项，理论上 GRUB 应当使用在 `/boot/grub/` 文件夹找到的第一个图像文件作为背景。如果 GRUB 在 `/boot/grub/` 找到多个图像文件，它会按字母排序并使用第一个图像文件。

### 方式 4：在 grub_background.sh 指定图像路径

如果没有在 `/etc/default/grub` 文件中指定 `GRUB_BACKGROUND` 项，而且 `/boot/grub/` 目录下没有图像文件，GRUB 将会开始在 `/usr/share/desktop-base/grub_background.sh` 文件中指定的图像路径中搜索。Kali Linux 是在这里指定的。每个 Linux 发行版都有自己的特色。

### 方式 5：在 /etc/grub.d/05\_debian\_theme 文件的 WALLPAPER 一行指定图像

这是 GRUB 搜寻背景图像的最后一个位置。如果在其他部分都没有找到，它将会在这里查找。

### 结论

这篇文章较长，但我想介绍一些基础但很重要的东西。如果你有仔细阅读，你会理解如何在 Kali Linux 上来回跟踪符号链接。当你需要在一些 Linux 系统上查找 GRUB 背景图像的位置时，你会感到得心应手。只要再多阅读一点来理解 GRUB 颜色的工作方式，你就是行家了。

--------------------------------------------------------------------------------

via: https://www.blackmoreops.com/2015/11/27/change-grub-background-in-kali-linux/

作者：[https://www.blackmoreops.com/][a]
译者：[fuowang](https://github.com/fuowang)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.blackmoreops.com/2015/11/27/change-grub-background-in-kali-linux/
[1]:http://www.facebook.com/sharer.php?u=https://www.blackmoreops.com/?p=5958
[2]:https://twitter.com/intent/tweet?text=5+ways+to+change+GRUB+background+in+Kali+Linux%20via%20%40blackmoreops&url=https://www.blackmoreops.com/?p=5958
[3]:https://plusone.google.com/_/+1/confirm?hl=en&url=https://www.blackmoreops.com/?p=5958&name=5+ways+to+change+GRUB+background+in+Kali+Linux
[4]:https://www.blackmoreops.com/how-to/
[5]:https://www.blackmoreops.com/kali-linux/
[6]:https://www.blackmoreops.com/kali-linux-2-x-sana/
[7]:https://www.blackmoreops.com/administration/
[8]:https://www.blackmoreops.com/usability/
[9]:https://www.blackmoreops.com/2015/11/27/change-grub-background-in-kali-linux/#comments
[10]:http://www.blackmoreops.com/wp-content/uploads/2015/11/Change-GRUB-background-in-Kali-Linux-blackMORE-OPs-10.jpg
[11]:http://www.blackmoreops.com/2015/11/27/change-grub-background-in-kali-linux/change-grub-background-in-kali-linux-blackmore-ops-1/
[12]:http://www.blackmoreops.com/2015/11/27/change-grub-background-in-kali-linux/change-grub-background-in-kali-linux-blackmore-ops-3/
[13]:http://www.blackmoreops.com/2015/11/27/change-grub-background-in-kali-linux/change-grub-background-in-kali-linux-blackmore-ops-6/
[14]:http://www.blackmoreops.com/2015/11/27/change-grub-background-in-kali-linux/change-grub-background-in-kali-linux-blackmore-ops-4/
[15]:http://www.blackmoreops.com/2015/11/27/change-grub-background-in-kali-linux/change-grub-background-in-kali-linux-blackmore-ops-5/
[16]:http://www.blackmoreops.com/2015/11/27/change-grub-background-in-kali-linux/change-grub-background-in-kali-linux-blackmore-ops-7/
[17]:http://www.blackmoreops.com/wp-content/uploads/2015/11/Change-GRUB-background-in-Kali-Linux-blackMORE-OPs-9.jpg
