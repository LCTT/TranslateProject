在Linux桌面上创建视频DVD
================================================================================
> **问题**：我想要从MP4电影文件创建一张视频DVD，在Linux桌面环境中有没有我可以用来创建视频DVD的DVD创作工具？

[DeVeDe][1]是一个开源（GPLv3）DVD创作软件，它允许你从任何数量的视频文件创建视频DVD、VCD、SVCD或者DivX。DeVeDe依赖于其它如Mplayer、FFMpeg、MEncoder、DVDAuthor、VCDImager以及MKisofs之类的软件来进行格式转换。就这点而论，它支持各种各样的主流输入视频/音频格式（如.mp4，.avi，.mpg，.mkv）。你可以在PAL和NTSC视频格式之间选择，也可以田间菜单或字幕。

如果你想要保留或者分发你的假期、家庭或者娱乐影音副本，DeVeDe可以派上用场。

### 安装Devede ###

#### Debian，Ubuntu及其衍生版： ####

    # aptitude install devede

#### RHEL或者CentOS： ####

启用[EPEL][2]和[Nux Dextop][3]仓库，然后运行：

    # yum install devede 

#### Fedora： ####

启用[RPM Fusion][4]仓库，然后运行：

    # yum install devede 

### 使用DeVeDe创建视频DVD ###

启动DeVeDe并从菜单选择视频DVD。

![](https://farm4.staticflickr.com/3930/15366785019_b5fe164573_z.jpg)

在下一屏中，DeVeDe会自动添加一个标题到收藏。你可以编辑说明文字（1），添加一个文件（2），然后添加另一个标题。根据需要，可重复该操作过程。

![](https://farm4.staticflickr.com/3955/15550730461_e9d830ac64_z.jpg)

在当前标题结束后，“标题属性”对话框允许你在6个要实施的行为之间选择。完成后，点击确定：

![](https://farm4.staticflickr.com/3928/15554250892_061ef87db3_o.png)

“文件属性”对话框用于添加文件到当前标题。点击文件夹图标（右上角），然后浏览你的计算机以选择想要的文件。你也可以通过点击副标题对话框右边的添加按钮添加一个副标题文件。选择好视频文件（又或者是副标题文件）后，点击右下角的确定。

![](https://farm6.staticflickr.com/5608/15367271798_800a7ff9e9_z.jpg)

你可以添加你所需的足够多的文件（只受DVD容量的限制）。

![](https://farm4.staticflickr.com/3949/15550730511_7c3ca04026_z.jpg)

接下来，编辑菜单选项。你可以选择一个背景图片和声音文件，在主菜单显示时播放（在DVD插入播放器时就会出现）。

![](https://farm6.staticflickr.com/5614/15367271808_a4d3ba5639_z.jpg)

最后，点击菜单选项对话框内的确定回到主光盘结构，在那里你需要点击下一步来开始以视频DVD结构创建一个.iso映像。

![](https://farm4.staticflickr.com/3951/15550730531_c51e64feb9_o.png)

![](https://farm6.staticflickr.com/5602/15366785109_c9663eb0d5_o.png)

在DeVeDe创建完视频DVD后，下面这个对话框将呈现在我们眼前：

![](https://farm4.staticflickr.com/3936/15550730551_0c140ea276_o.png)

现在，我们可以刻录.iso文件（该文件包含有视频DVD）到光盘了，你可以使用[growisofs][5]或其它DVD刻录工具。

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/create-video-dvd-linux-desktop.html

译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.rastersoft.com/programas/devede.html
[2]:http://xmodulo.com/how-to-set-up-epel-repository-on-centos.html
[3]:http://ask.xmodulo.com/enable-nux-dextop-repository-centos-rhel.html
[4]:http://xmodulo.com/how-to-install-rpm-fusion-on-fedora.html
[5]:http://ask.xmodulo.com/burn-iso-nrg-image-dvd-command-line.html
