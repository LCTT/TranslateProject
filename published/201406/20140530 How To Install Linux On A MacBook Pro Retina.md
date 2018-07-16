如何在MacBook Pro Retina上安装Linux
================================================================================
![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2014/05/linux-macbook-pro-retina-840x420.jpg?ec7b17)

MacBook Pros拥有非常强大的配置，但是有些人想强上加强，他们想用Linux系统。

不管您是想要更开放和个性化的操作系统又或者是您只想要使用某些在Linux特有的软件，您都会想要在您的MacBook上安装Linux。 可惜的是MacBook Pro们可是一块块密不透风砖头，让您想装其他系统又无从下手。尤其是Linux，比在MacBook上装Windows还难。 Boot Camp对于Linux来说也没有什么用处。 虽然如此，但并不代表您完全不能做到，装机走起！

### 为什么要在MacBook Pro Retina上装Linux？ ###

买MacBook不就是为了OS X吗？为何要装Linux？ 其实买MacBook的原因不仅仅只是因为它的操作系统， 其极致的硬件性能，超长的电池寿命，以及抗操抗造都是购买它的原因。 这些这么好的硬件再加上一块能让您体验到HiDPI的清晰度Retina显示屏，其不皆是买入的理由乎？

但是如果您对OS X无爱，又或者您真心想要使用Linux，为何不将这自由、开源、小巧、个性化的Linux塞进您的高大上的硬件呢？苹果可能有话要说了，可谁在乎呢~

注：在本期教程我们将会使用[最流行的Linux发行版][1] - Ubuntu来作为我们这次安装的选择。您也可以用自己想用的的Linux发行版，但相关的步骤会和本教程略有出入。 如果您把自己的系统玩坏了，我们将不承担任何责任。 本教程将教您如何 Linux 和 OS X 双系统启动，另外只有在OS X才能升级固件，所以我们建议您不要将OS X 删除。

但在我们开始之前，请您用您喜欢的方法（比如Time Machine 或 CrashPlan）将您的电脑彻底备份，以防万一。

### 下载 Ubuntu ###

首先您需要下载一份[Ubuntu桌面版安装镜像][2] 。 务必选择64位的桌面版，虽然该镜像并不是为Mac提供的。该镜像在BIOS和EFI模式下都能启动，而Mac的镜像却只能在BIOS启动。Mac是专门设计成这样的，但是我们要使之以EFI模式下启动。

### 写到U盘（USB） ###

其次， 找个2GB以上的USB， 我们将会用该USB作为Ubuntu的安装启动盘。 你可以按照 [Ubuntu官方指导的步骤][3] 或者 [使用专用的图形化工具][4] 来准备安装盘.

### 调整分区大小 ###

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2014/05/mac_linux_disk_utility.jpg?ec7b17)

当你完成上一步后，你的Mac Book Pro就做好安装的准备了。 打开Disk Utility（磁盘工具）， 点击左边选择你的硬盘， 选择Partitions（分区）标签页。 把Mac分区缩小到你喜欢的大小 - 我们将会用新创建的可用空间来安装Ubuntu。

### 启动Ubuntu镜像 ###

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2014/05/mac_linux_boot.jpg?ec7b17)

上述步骤完成后，将U盘插入并重启Mac Book Pro。当关机之后屏幕一黑时，请按住Option键（alt）直到你看到不同的启动选项。选择EFI选项（如果有两个的话选择左边的哪一个）来从USB启动Ubuntu.

当你看到“Try Ubuntu" 和 "Install Ubuntu" 两个选项的时候， 选择 "Try Ubuntu" 因为我们需要在安装完成之后重启之前弄一些其他的东西。

### 安装器 ###

当Ubuntu的桌面加载好之后，一路向下走直到你看到分区的这一步。 如果你连接不上WiFi的话就代表你的Ubuntu还暂时不知道如何跟你这位高大上Mac做朋友， 不过不用担心， 我们暂时还不需要网络， 在你迟些重启的时候会自动识别你的驱动。

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2014/05/mac_linux_installer_partitions.jpg?ec7b17)

到分区这个步骤之后， 选择 "Do Something else" 这个选项。 然后请确保那块大约128MB左右的分区已经被识别为EFI启动分区（你可以点击它然后选择Option来确定一下； 另外，那个分区应该是 /dev/sda1）。下一步， 你要在新建的空间里创建一个 ext4分区，在其上挂载“/”路径。 如果你知道你自己在干嘛的话也可以创建几个不同的分区（切记这不是Windows啊孩纸）。

在你开始下一步之前，请确保你的安装引导程序（boot loader）是选择了 /dev/sda1，GRUB也是装到该分区的。 然后按照平常一样该咋装咋装。

### 修改 EFI 引导 ###

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2014/05/mac_linux_efibootmgr.jpg?ec7b17)

当你的安装器装完Ubuntu之后，不要按重启！！！ 我们还需要弄这么点东西才能使用GRUB。 请运行下列的指令:

    sudo apt-get install efibootmgr

这个将会暂时地安装一个EFI boot的配置工具，然后 运行：

    sudo efibootmgr

这个将会显示出当前的启动设置， 你应该看到的是 "ubuntu" 和 "Boot0000*"，当前的EFI设置是把系统指向 Boot0080*，这样的话就会跳过GRUB然后直接跳入OS X，所以我们要用以下指令来修复它：

    sudo efibootmgr -o 0,80

现在就可以重启了！

恭喜你啦~你的Ubuntu现在应该就可以用了哦！不过下列的一些调整会让性能提升哦！

### 坑爹地调整设置 ###

首先你需要改一下GRUB的设置，这样你的SSD盘才不会偶尔死机， 在Terminal输入：

    sudo nano /etc/default/grub

找到 **GRUB\_CMDLINE\_LINUX**那一行 ， 把它改成 **GRUB\_CMDLINE\_LINUX="libata.force=noncq"** 。 按下CTRL + X保存，然后按Y来确定保存。 接下来你要在Terminal输入：

    sudo nano /etc/grub.d/40_custom

打开一个新的文件，请使用真丶精准手指准确地一字一字输入：

    menuentry "Mac OS X" {
    exit
    }

这将会让你boot到你安装好的Mac OS X（GRUB的32-bit和64-bit项不能用）。然后CTRL+X 和 Y 保存退出，然后输入：

    sudo update-grub

最后必须要重启才能生效。

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2014/05/mac_linux_small_retina.jpg?ec7b17)

在极其高清的Retina显示屏上神马都这么小，坑爹啊啊？ 去Setting -> Display 里把 Scaling Factor弄大一点吧，不然妈妈又要担心你的近视眼了。

你也可能觉得在边边上改变窗口大小是一件极其困难的事情，坑爹啊啊？ 去Terminal输入：

    sudo nano /usr/share/themes/Ambiance/metacity-1/metacity-theme-1.xml

然后在里面修改成下面的参数：

    <distance name="left_width" value="4"/>
    <distance name="right_width" value="4"/>
    <distance name="bottom_height" value="4"/>

如果还是太小，把上面的东西改成6吧！

最后，如果你觉得你的Linux把你那Retina鲜艳的颜色洗掉了，请到你的OS X盘，找到以下的文件：

    /Library/ColorSync/Profiles/Displays/Color LCD-xxxxxx.icc

xxxxxx只是一串随机的字符，不过这路径应该只有一个文件。把他搬到你Ubuntu的Home folder， 然后到 System Settings –> Color 选择 Add New Profile 并选择你那刚弄过来的icc文件。

### 总结 ###

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2014/05/mac_linux_final.jpg?ec7b17)

恭喜你啦， 现在终于有一台属于你的Linux MacBook Pro Retina啦！如果你想把你的Ubuntu弄得更手熟，请按 [让你的Ubuntu 像家一样舒服][5] 尽情地修改配置吧！ 该教程也可用于其他的Mac系统，当然每种Mac都有不同的好处和坏处。 如果你用的是其他的Mac，请翻一翻[这篇为Ubuntu写的文档][6]

另外，你还可以看一下其他可以在Mac安装的[Linux 发行包][7]哦！

Image Credits: [K?rlis Dambr?ns][8] Via Flickr

--------------------------------------------------------------------------------

via: http://www.makeuseof.com/tag/install-linux-macbook-pro/

译者：[213edu](https://github.com/213edu) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.makeuseof.com/tag/windows-xp-users-switch-ubuntu-14-04-lts-trusty-tahr/
[2]:http://www.ubuntu.com/download/desktop/
[3]:http://www.ubuntu.com/download/desktop/create-a-usb-stick-on-mac-osx
[4]:http://www.makeuseof.com/tag/how-to-boot-a-linux-live-usb-stick-on-your-mac/
[5]:http://www.makeuseof.com/tag/11-tweaks-perform-ubuntu-installation/
[6]:https://help.ubuntu.com/community/MacBookPro
[7]:http://www.makeuseof.com/pages/best-linux-distributions
[8]:https://www.flickr.com/photos/janitors/10037346335
