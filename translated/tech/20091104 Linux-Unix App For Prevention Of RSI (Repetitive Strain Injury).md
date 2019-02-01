Linux 下如何避免重复性压迫损伤（RSI） 
======

![workrave-image][1]

<ruby>[重复性压迫损伤][2]<rt>Repetitive Strain Injury</rt></ruby>（RSI）是职业性损伤综合症，非特异性手臂疼痛或工作引起的上肢障碍。RSI 是由于过度使用双手从事重复性任务导致的，如打字、书写和使用鼠标. 不幸的是，大部分人不了解什么是 RSI 以及它的危害有多大。你可以使用名叫 Workrave 的开源软件轻松的预防 RSI。

### RSI 有哪些症状？

我从这个[页面][3]引用过来的，看看哪些你被说中了：

  1. 疲惫缺乏忍耐力？
  2. 手掌及上肢乏力
  3. 疼痛麻木甚至失去知觉？
  4. 沉重：你有没有感觉手很沉？
  5. 笨拙: 你有没有感觉抓不紧东西？
  6. 你有没有感觉手上无力？很难打开罐子或切菜无力？
  7. 缺乏协调和控制？
  8. 手总是冰凉的？
  9. 健康意识有待提高？稍不注意身体就发现有毛病了。
  10. 是否过敏？
  11. 频繁的自我按摩（潜意识的）？
  12. 共鸣的疼痛？当别人在谈论手痛的时候，你是否也感觉到了手疼？

### 如何减少发展为 RSI 的风险

  * 使用计算机的时候每隔 30 分钟间隔休息一下。借助软件如 workrave 预防 RSI。
  * 有规律的锻炼可以预防各种损伤，包括 RSI。
  * 使用合理的姿势。调整你的电脑桌和椅子使身体保持一个肌肉放松状态。

### Workrave

Workrave 是一款预防计算机用户发展为 RSI 或近视的自由开源软件。软件会定期锁屏为一个动画： “Workrave 小姐”，引导用户做各种伸展运动并敦促其休息一下。这个软件经常提醒你暂停休息一下，并限制你每天的限度。程序可以运行在 MS-Window、Linux 以及类 UNIX 操作系统下。

#### 安装 workrave

在 Debian/Ubuntu Linux 系统运行以下 [apt 命令][4]/[apt-get 命令][5]：

```
$ sudo apt-get install workrave
```

Fedora Linux 发行版用户运行以下 dnf 命令：

```
$ sudo dnf install workrave
```

RHEL/CentOS Linux 用户可以启动 EPEL 仓库并用 [yum 命令][6]安装：

```
### [ **在CentOS/RHEL 7.x 及衍生版本上测试** ] ###
$ sudo yum install epel-release
$ sudo yum install https://rpms.remirepo.net/enterprise/remi-release-7.rpm
$ sudo yum install workrave
```

Arch Linux 用户运行以下 pacman 命令来安装：

```
$ sudo pacman -S workrave
```

FreeBSD 用户可用以下 pkg 命令安装：

```
# pkg install workrave
```

OpenBSD 用户可用以下 pkg_add 命令安装：

```
$ doas pkg_add workrave
```

#### 如何配置 workrave

Workrave 以一个小程序运行，它的用户界面位于面板中。你可以为 workrave 增加一个面板来控制软件的动作和外观。

增加一个新 workrave 对象到面板：

  * 在面板空白区域右键，打开面板弹出菜单
  * 选择新增到面板
  * 新增面板对话框打开，在加载器顶部，可以看到可用的面板对象按照字母排列。选中 workrave 程序并单击新增。

![图 01：新增 workrave 对象到面板][7]

*图 01：新增 workrave 对象到面板*

如果修改 workrave 对象的属性，执行以下步骤：

  * 右键 workrave 对象打开面板对象弹出
  * 选中偏好。使用属性对话框修改对应属性

![图 02：修改 Workrave 对象属性](https://www.cyberciti.biz/media/new/tips/2009/11/linux-gnome-workwave-preferences-.png)

*图 02：修改 Workrave 对象属性*

#### Workrave 运行展示

主窗口显示下一次提醒休息的剩余时间，这个窗口可以关闭，时间提示窗口会显示在面板上。

![图 03：时间计数器][8]

*图 03：时间计数器*

![图 04：Workrave 小姐 - 引导你做伸展运动的动画][9]

*图 04：Workrave 小姐 - 引导你做伸展运动的动画*

休息提示窗口，请求你暂停一下工作：

![图 05：休息提示倒计时][10]

*图 05：休息提示倒计时*

![图 06：你可以跳过休息][11]

*图 06：你可以跳过休息*

#### 参考链接:

  1. [Workrave 项目][12] 主页
  2. [pokoy][13] 防止 RSI 和其他计算机压力的轻量级守护进程
  3. GNOME3 下的 [Pomodoro][14] 计数器
  4. [RSI][2] 的维基百科

### 关于作者

作者是 nixCraft 创始人，经验丰富的系统管理员，同时也是一个 Linux/Unix 系统下的 shell 脚本培训师。他曾服务于全球客户，并与多个行业合作包括 IT、教育、国防和航天研究，以及非盈利机构。可以在 [Twitter][15]、[Facebook][16]、[Google+][17] 上关注他。

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/tips/repetitive-strain-injury-prevention-software.html

作者：[Vivek Gite][a]
译者：[guevaraya](https://github.com/guevaraya)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz/
[1]:https://www.cyberciti.biz/media/new/tips/2009/11/workrave-image.jpg 
[2]:https://en.wikipedia.org/wiki/Repetitive_strain_injury
[3]:https://web.eecs.umich.edu/~cscott/rsi.html##symptoms
[4]:https://www.cyberciti.biz/faq/ubuntu-lts-debian-linux-apt-command-examples/  
[5]:https://www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html 
[6]:https://www.cyberciti.biz/faq/rhel-centos-fedora-linux-yum-command-howto/ 
[7]:https://www.cyberciti.biz/media/new/tips/2009/11/add-workwave-to-panel.png
[8]:https://www.cyberciti.biz/media/new/tips/2009/11/screenshot-workrave.png 
[9]:https://www.cyberciti.biz/media/new/tips/2009/11/miss-workrave.png 
[10]:https://www.cyberciti.biz/media/new/tips/2009/11/time-for-micro-pause.gif 
[11]:https://www.cyberciti.biz/media/new/tips/2009/11/Micro-break.png 
[12]:http://www.workrave.org/
[13]:https://github.com/ttygde/pokoy
[14]:http://gnomepomodoro.org
[15]:https://twitter.com/nixcraft
[16]:https://facebook.com/nixcraft
[17]:https://plus.google.com/+CybercitiBiz
