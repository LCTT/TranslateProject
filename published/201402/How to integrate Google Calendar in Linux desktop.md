如何在Linux桌面墙纸上显示Google Calendar
================================================================================

Google Calendar 是时下最流行的网页应用程序之一。用户可以通过网络接口或者本地的应用程序跨设备访问或同步 Google Calendar。在 Linux 上，有很多方法可以本地访问 Google Calendar，比如用电子邮件客户端插件（如 Evolution 或 Thunderbird ）或者用日历应用程序（如 Sunbird 或 Rainklendar）。这些方法通常都需要安装不必要的大型软件，这些软件你很可能根本不需要。

如果你只是想在本地的 Linux 上翻翻 Google Calendar 或者用它设置提醒，那么你可以考虑使用[Google Calendar 命令行接口（或者 gcalcli）][1]，这是一种更轻型化的方法。对于 Linux 桌面操作系统用户来说，好处不止这些，如果将 gcalcli 与[Conky][2]搭配使用你就可以把 Google Calendar 透明地融入桌面主题。

在这个教程中，我会展示**如何利用 gcalcli 和 Conky 将 Google Calendar 融入 Linux 桌面**

### 在 Linux 安装 gcalcli ###

在安装 gcalcli 之前，要确保你正在用的是 Python 2 而不是 Python 3 ，因为 Python 3 与 gcalcli 不兼容。

如果是在 Debian、Ubuntu 或 Linux Mint 上可以用下面的命令安装 gcalcli 

    $ sudo apt-get install git python-pip python-gdata python-dateutil python-gflags python-vobject python-parsedatetime
    $ sudo pip install google-api-python-client
    $ sudo pip install apiclient urllib3
    $ git clone https://github.com/insanum/gcalcli.git
    $ cd gcalcli
    $ sudo python setup.py install 

**温馨提醒**：Ubuntu 或 Linux Mint 的软件库中虽然有 gcalcli，但是这些版本并不包含其最新的特性和针对 bug 的修复。所以这里推荐按以上所述的方法由源文件构建 gcalcli。

对于Fedora 、CentOS 或 RHEL，可按如下方法安装。

    $ sudo yum install git python-pip python-gdata python-dateutil python-gflags python-vobject
    $ sudo pip install google-api-python-client
    $ sudo pip install apiclient urllib3
    $ git clone https://github.com/insanum/gcalcli.git
    $ cd gcalcli
    $ sudo python setup.py install 

### gcalcli 的 Google 认证 ####

为了能让 gcalcli 访问 Google Calendar ，你需要用你的 Google 帐号通过 OAuth2 认证，以使 gcalcli 获得许可来访问你的 Google Calendar。

第一次运行 gcalcli 的时候，OAuth2 认证会自动进行初始化。因此运行下面的命令开始

    $ gcalcli agenda 

该命令会输出如下的一个 URL 。 

[![](http://farm4.staticflickr.com/3791/11216331146_d2c5f95963_z.jpg)][3]

同时这个命令也会弹出一个指向该 URL 的浏览器窗口。如果因为一些原因，你的浏览器没有反应，你可以手动复制粘贴这个 URL 到你的浏览器中。 

如果你还没有登录你的 Google 帐号，你得先登录。然后你会看到下面要求你许可 gcalcli 管理 Google Calendar 的信息。点击“Accept”即可。

[![](http://farm4.staticflickr.com/3810/11216308465_1008fc1bb3_z.jpg)][4]

### 支持 Google Calendar API ###

认证后，下一步就是支持 Google Calendar 的 API 访问。gcalcli 通过 Google Calendar API 访问Google Calendar 。但是，如果要使用 Google API 就必须明确设置你的 Google 帐号支持 Google API。

首先到：[https://cloud.google.com/console][5]。点击项目列表下的“API Project ”

转到“APIs & auth ”下面的“APIs”你会看见一个 Google APIs 列表。点击“Calendar API”的开关按钮使其能支持 API。

现在转到“APIs & auth”下的“Registered apps”那里，去注册 gcalcli app。点击最顶端的“Registered app”按钮。

[![](http://farm8.staticflickr.com/7293/11216363656_c203b6dfa2_z.jpg)][6]

填写 app 的名字（如，“My Gcalcli”），然后选择“ Native ”作为平台。点击“Registered”按钮。

这一步会生成并显示 OAuth 用户的 ID 和密码。另外关于上面提示的“You have not set up your product name（您没有设置您的产品名称）”，你可以忽略掉。

[![](http://farm3.staticflickr.com/2890/11216593546_312a564f1f_z.jpg)][7]

OAuth的认证结果将会保存在 ～/.gcalcli_oauth 文本文件中。

### 用 gcalcli 在命令行中访问 Google Calendar ###

你现在马上就可以用 gcalcli 访问Google Calendar 了。 

在你的家目录创建一个如下的 gcalcli 配置文件。将你先前获得的 OAuth 用户 ID 和 密码按下面格式输入进去。

    $ vi ~/.gcalclirc 

> --client_id='XXXXXXXXXX.apps.googleusercontent.com'
> --client_secret='YYYYYYYYYYYYYYYY'

到了这一步，你应该可以在命令行运行 gcalcli 了。

试试下面的命令，这两个命令会分别打印出一个你的 Google Calendar 的列表和今后 5 天的日程安排。

    $ gcalcli list
    $ gcalcli agenda 

[![](http://farm4.staticflickr.com/3780/11216465043_c8f6d8967d_z.jpg)][8]

### 将 gcalcli 与 Conky 结合 ###

最后一步就是将 gcalcli 的输出导入你的桌面主题中。为了做到这一点，你需要 Conky 这个非常强大的工具，它可以把许多信息直接显示在你的桌面主题中。

首先在你的 Linux 系统上 [安装 Conky][9]。 

然后，在你的家目录下的某个地方( 例如 ～/bin )创建如下的脚本程序。

    $ vi ~/bin/gcal.sh 

	#!/bin/sh

 	gcalcli --conky calw 2 |
      sed -e 's/^[(0\x71^[(B/?/g' \
          -e 's/^[(0\x78^[(B/?/g' \
          -e 's/^[(0\x6A^[(B/?/g' \
          -e 's/^[(0\x6B^[(B/?/g' \
          -e 's/^[(0\x6C^[(B/?/g' \
          -e 's/^[(0\x6D^[(B/?/g' \
          -e 's/^[(0\x6E^[(B/?/g' \
          -e 's/^[(0\x74^[(B/?/g' \
          -e 's/^[(0\x75^[(B/?/g' \
          -e 's/^[(0\x76^[(B/?/g' \
          -e 's/^[(0\x77^[(B/?/g'

    $ chmod +x ~/bin/gcal.sh 


**重要提醒**：上面脚本中的 ‘^[’ 必须是**真正的 ESCAPE 键**( 也就是说在 vi 中按 Ctrl-V 然后按 Esc )。


这个脚本程序将 VT100 转义序列转成Unicode组件图字符。这是[必须的一步][10]，因为 Conky 不支持 gcalcli 使用的 ANSI 字符画。

最后，在你的家目录中创建下面的 Conky 配置文件。

    $ vi ~/.conkyrc 

    alignment top_right
    maximum_width 630
    minimum_size 330 10
    gap_x 25
    gap_y 50
  
    own_window yes
    own_window_type conky
    own_window_hints undecorated,below,sticky,skip_taskbar,skip_pager
    own_window_transparent yes
    own_window_argb_visual yes
    own_window_argb_value 0
 
    update_interval 300
    background no
  
    border_width 1
    default_color cornflowerblue
    default_outline_color white
    default_shade_color white
    double_buffer no
    draw_borders no
    draw_graph_borders no
    draw_outline no
    draw_shades no
    max_port_monitor_connections 64
    max_specials 512
    max_user_text 16384
    text_buffer_size 8096
    no_buffers yes
    out_to_console no
    uppercase no
    use_xft yes
    xftfont Bitstream Vera Sans Mono:size=10
  
    TEXT
    *** Google Calendar Agenda ***
    ${execpi 300 gcalcli --conky agenda}
    ${execpi 300 ~/bin/gcal.sh}

这个 Conky 配置文件会直接在你的桌面主题上显示你的 Google Calendar 的一个日程表和一个两个星期的时间表。

现在，你可以运行下面的命令激活 Conky。

    $ conky 

你应该可以在 Linux 桌面的右边看到 Google Calendar。 

[![](http://farm8.staticflickr.com/7390/11216377436_72d00cec49_z.jpg)][11]

确认 Google Calendar 可以正常运行后，你可以将 Conky 设为在每次登录时自动启动。

### 设置 Google Calendar 提醒 ###

gcalcli 也可以为 Google Calendar 中即将到来的事件发送一个提醒。它使用 notify-send 命令。对于 Google Calendar 提醒，你可以像下面一样设置一个工作进程。

    $ crontab -l 

> */10 * * * * /usr/local/bin/gcalcli remind

--------------------------------------------------------------------------------

via: http://xmodulo.com/2013/12/integrate-google-calendar-linux-desktop.html

译者：[Linchenguang](https://github.com/Linchenguang) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://github.com/insanum/gcalcli
[2]:http://conky.sourceforge.net/
[3]:http://www.flickr.com/photos/xmodulo/11216331146/
[4]:http://www.flickr.com/photos/xmodulo/11216308465/
[5]:https://cloud.google.com/console
[6]:http://www.flickr.com/photos/xmodulo/11216363656/
[7]:http://www.flickr.com/photos/xmodulo/11216593546/
[8]:http://www.flickr.com/photos/xmodulo/11216465043/
[9]:http://xmodulo.com/2013/12/install-configure-conky-linux.html
[10]:https://github.com/insanum/gcalcli/issues/97
[11]:http://www.flickr.com/photos/xmodulo/11216377436/
