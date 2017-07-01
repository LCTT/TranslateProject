如何用树莓派控制 GOIO 引脚并操作继电器
==========================================

> 学习如何用 PHP 和温度传感器实现树莓派控制 GPIO 并操作继电器

 ![How to control GPIO pins and operate relays with the Raspberry Pi](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/raspberry_pi_day_lead_0.jpeg?itok=lCxmviRD "How to control GPIO pins and operate relays with the Raspberry Pi") 

你是否曾经想知道怎样使用手机或者电脑在任何地方控制你的风扇和灯等一些家用电器？

我现在想控制我的圣诞彩灯，是使用手机呢，还是使用平板电脑呢，或者是使用笔记本电脑呢？都不是，而是仅仅使用一个树莓派。让我来告诉你如何使用 PHP 和温度传感器实现树莓派控制 GPIO 引脚并操作继电器。我使用 AJAX 把它们整合在了一起。

### 硬件要求：

* 树莓派
* 安装有 Raspbian 系统的 SD 卡（任何一张 SD 卡都可以，但是我更偏向使用大小为 32GB 等级为 class 10 的 SD 卡）
* 电源适配器
* 跳线（母对母跳线和公转母跳线）
* 继电器板（我使用一个用于 12V 继电器的继电器板）
* DS18B20 温度传感器
* 树莓派的 Wi-Fi 适配器
* 路由器（为了访问互联网，你需要有一个拥有端口转发的路由器）
* 10KΩ 的电阻

### 软件要求：

* 下载并安装 Raspbian 系统到你的 SD 卡
* 有效的互联网连接
* Apache web 服务器
* PHP
* WiringPi
* 基于 Mac 或者 Windows 的 SSH 客户端

### 一般的配置和设置

1、 插入 SD 卡到树莓派，然后使用以太网网线将它连接到路由器；

2、 连接 WiFi 适配器；

3、 使用 SSH 方式登录到树莓派，然后使用下面的命令编辑 `interfaces` 文件：

```
sudo nano /etc/network/interfaces
```

这个命令会用一个叫做 `nano`  的编辑器打开这个文件。它是一个非常简单又易于使用的文本编辑器。如果你不熟悉基 Linux 的操作系统，可以使用键盘上的方向键来操作。

用 `nano` 打开这个文件后，你会看到这样一个界面：

![File editor nano](https://opensource.com/sites/default/files/putty_0.png "File editor nano") 

4、要配置你的无线网络，按照下面所示修改这个文件：

```
iface lo inet loopback
iface eth0 inet dhcp
allow-hotplug wlan0
auto wlan0
iface wlan0 inet dhcp
   wpa-ssid "Your Network SSID"
   wpa-psk "Your Password"
```

5、 按 `CTRL+O` 保存，然后按 `CTRL+X` 退出编辑器。

到目前为止，一切都已经配置完成，接下来你需要做的就是使用命令重新加载网络：

```
sudo service networking reload
```

（警告：如果你是使用远程连接的方式连接的树莓派，连接将会中断。)

### 软件配置

#### 安装 Apache web 服务器

Apache 是一个受欢迎的服务器应用，你可以在树莓派安装这个程序让它提供网页服务。Apache 原本就可以通过 HTTP 方式提供 HTML 文件服务，添加其他模块后，Apache 还可以使用像 PHP 这样的脚本语言来提供动态网页的服务。

可以在命令行输入下面命令安装 Apache：

```
sudo apt-get install apache2 -y
```

安装完成后，可以在浏览器地址栏输入树莓派的 IP 地址来测试 web 服务器。如果你可以获得下面图片的内容，说明你已经成功地安装并设置好了你的服务器。

![Successful server setup](https://opensource.com/sites/default/files/itworks.png "Successful server setup") 

要改变这个默认的页面和添加你自己的 html 文件，进入 `var/www/html` 目录：

```
cd /var/www/html
```

添加一些文件来测试是否成功。

#### 安装 PHP

PHP 是一个预处理器，这意味着它是当服务器收到网页请求时才会运行的一段代码。它开始运行，处理网页上需要被显示的内容，然后把网页发送给浏览器。不像静态的 HTML，PHP 在不同的环境下可以显示不同的内容。其他的语言也可以做到这一点，但是由于 WordPress 是用 PHP 编写的，有些时候你需要使用它。PHP 是 web 上一种非常受欢迎的语言，像 Facebok 和 Wikipeadia 这样的大型项目都是用 PHP 编写的。

使用下面的命令安装 PHP 和 Apache 软件包：

```
sudo apt-get install php5 libapache2-mod-php5 -y
```

#### 测试 PHP

创建文件 `index.php`：

```
sudo nano index.php
```

在里面写入一些 PHP 内容：

```
<?php echo "hello world"; ?>
```

保存文件，接下来删除 `index.html`，因为它比 `index.php` 的优先级更高：

```
sudo rm index.html
```

刷新你的浏览器，你会看到 “hello world”。这并不是动态的，但是它仍然由 PHP 提供服务。如果你在上面看到提原始的 PHP 文件而不是“hello world”，重新加载和重启 Apahce（LCTT 译注，重启即可）：

```
sudo /etc/init.d/apache2 reload
sudo /etc/init.d/apache2 restart
```

#### 安装 WiringPi

为了可以对代码的更改进行跟踪，WiringPi 的维护采用 git。但假如你因为某些原因而没法使用  git，还有一种可以替代的方案。（通常你的防火墙会把你隔离开来，所以请先检查一下你的防火墙的设置情况！）

如果你还没有安装 git，那么在 Debian 及其衍生版本中（比如 Raspbian），你可以这样安装它：

```
sudo apt-get install git-core
```

若是你遇到了一些错误，请确保你的树莓派是最新版本的 Raspbian 系统：

```
sudo apt-get update sudo apt-get upgrade
```

使用 git 获取最 WiringPi：

```
sudo git clone git://git.drogon.net/wiringPi
```

如果你之前已经使用过 clone 操作，那么可以使用下面命令：

```
cd wiringPi && git pull origin
```

这个命令会将会获取更新的版本，你然后可以重新运行下面的构建脚本。

有一个新的简化的脚本来构建和安装:

```
cd wiringPi && ./build
```

这个新的构建脚本将会为你完成编译和安装 WiringPi。它曾一度需要使用 `sudo` 命令，所以在运行这它之前你可能需要检查一下这个脚本。

#### 测试 WiringPi

运行 `gpio` 命令来检查安装成功与否:

```
gpio -v gpio readall
```

这将给你一些信心，软件运行良好。

#### 连接 DS18B20 传感器到树莓派

* 传感器上的黑线用于 GND。
* 红线用于 VCC。
* 黄线是 GPIO 线。

![GPIO image](https://opensource.com/sites/default/files/gpio_0.png "GPIO image") 

连线：

 * VCC 连接 3V 的 1 号引脚。
 * GPIO 线连接 7 号引脚（GPIO4）。
 * 地线连接 GND 的 9 号引脚。
 
#### 软件配置

为了用 PHP 使用 DS18B20 温度传感器模块，你需要执行下面的命令来激活用于树莓派上 GPIO 引脚和 DS18B20 的内核模块：

```
sudo modprobe w1-gpio
sudo modprobe w1-therm
```

你不想每次 Raspberry 重启后都手动执行上述命令，所以你想每次开机能自动启动这些模块。可以在文件 `/etc/modules` 中添加下面的命令行来做到：

```
sudo nano /etc/modules/
```

添加下面的命令行到它里面:

```
w1-gpio
w1-therm
```

为了测试，输入:

```
cd /sys/bus/w1/devices/
```

现在输入 `ls`。

你会看到你的设备信息。在设备驱动程序中，你的 DS18B20 传感器应该作为一串字母和数字被列出。在本例中，设备被记录为 `28-000005e2fdc3`。然后你需要使用 `cd` 命令来访问传感器，用你自己的序列号替代我的： `cd 28-000005e2fdc3`。

DS18B20 会周期性的将数据写入文件 `w1_slave`，所以你只需要使用命令 `cat`来读出数据： `cat w1_slave`。

这会生成下面的两行文本，输出中 `t=` 表示摄氏单位的温度。在前两位数后面加上一个小数点(例如，我收到的温度读数是 30.125 摄氏度)。

### 连接继电器

1、 取两根跳线，把其中一根连接到树莓派上的 GPIO24（18 号引脚），另一根连接 GND 引脚。你可以参考下面这张图。

2、 现在将跳线的另一端连接到继电器板。GND 连接到继电器上的 GND，GPIO 输出线连接到继电器的通道引脚号，这取决于你正使用的继电器型号。记住，将树莓派上的 GND 与继电器上的 GND 连接连接起来，树莓派上的 GPIO 输出连接继电器上的输入引脚。

![Headers](https://opensource.com/sites/default/files/headers.png "Headers") 

注意！将继电器连接树莓派的时候小心一些，因为它可能会导致电流回流，这会造成短路。

3、 现在将电源连接继电器，可以使用 12V 的电源适配器，也可以将 VCC 引脚连接到什么破上的 3.3V 或 5.5V 引脚。

### 使用 PHP 控制继电器

让我们先写一个借助于 WiringPi 软件用来控制 Paspberry Pi 上 GPIO 引脚的 PHP 脚本。

1、在 Apache 服务器的网站根目录下创建一个文件，使用下面命令切换到该目录：

```
cd /var/www/html
```

2、 新建一个叫 `Home` 的文件夹：

```
sudo mkdir Home
```

3、 新建一个叫 `on.php`的脚本

```
sudo nano on.php
```

4、 在脚本中加入下面的代码：

```
<?php

        system("gpio-g mode 24 out");
        system("gpio-g write 24 1");

?>
```

5、 使用 `CTRL+O` 保存文件，`CTRL+X` 退出。

上面的代码中，你在第一行使用命令将 24 号 GPIO引脚设置为 output 模式：

```
system("gpio-g mode 24 out") ;
```

在第二行，你使用 `1` 将 24 号引脚 GPIO 打开，在二进制中"1"表示打开，"0"表示关闭。

6、 为了关闭继电器，可以创建另外一个 `off.php` 文件，并用 `0` 替换 `1`。

```
<?php

        system(" gpio-g mode 24 out ");
        system(" gpio-g write 24 1 ");

?>
```

7、 如果你已经将继电器连接了树莓派，可以在浏览器中输入你的树莓派的 IP 地址，并在后面加上目录名和文件名来进行访问：

```
http://{IPADDRESS}/home/on.php 
```

这将会打开继电器。

8、 要关闭它，可以访问叫 `off.php` 的文件：

```
http://{IPADDRESS}/home/off.php
```

现在你需要能够在一个单独的页面来控制这两样事情，而不用单独的刷新或者访问这两个页面。你可以使用 AJAX 来完成。

9、 新建一个 HTML 文件，并在其中加入下面代码：

```
[html + php + ajax codeblock]

<html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script type="text/javascript">// <![CDATA[

$(document).ready(function() {

$('#on').click(function(){

var a= new XMLHttpRequest();

a.open("GET", "on.php"); a.onreadystatechange=function(){

if(a.readyState==4){ if(a.status ==200){

 } else alert ("http error"); } }

a.send();

});

});

$(document).ready(function()

{ $('#Off').click(function(){

var a= new XMLHttpRequest();

a.open("GET", "off.php");

a.onreadystatechange=function(){

if(a.readyState==4){

if(a.status ==200){

 } else alert ("http error"); } }

a.send();

});

});

</script>

<button id="on" type="button"``Switch Lights On </button>

<button id="off" type="button"``Switch Lights Off </button>
```

10、 保存文件，进入你的 web 浏览器目录，然后打开那个网页。你会看到两个按钮，它们可以打开和关闭灯泡。基于同样的想法，你还可以使用 bootstrap 和 CSS 来创建一个更加漂亮的 web 界面。

### 在这个网页上观察温度

1、 新建一个 `temperature.php` 的文件：

```
sudo nano temperature.php
```

2、 在文件中加入下面的代码，用你自己的设备 ID 替换 `10-000802292522`：

```
<?php
//File to read
$file = '/sys/devices/w1_bus_master1/10-000802292522/w1_slave';
//Read the file line by line
$lines = file($file);
//Get the temp from second line
$temp = explode('=', $lines[1]);
//Setup some nice formatting (i.e., 21,3)
$temp = number_format($temp[1] / 1000, 1, ',', '');
//And echo that temp
echo $temp . " °C";
?>
```

3、 打开你刚刚创建的 HTML 文件，并创建一个新的带有 `id` 为 “screen” 的 `<div>`标签

```
<div id="screen"></div>
```

4、 在这个标签后或者这个文档的尾部下面的代码：

```
<script>
$(document).ready(function(){
setInterval(function(){
$("#screen").load('temperature.php')
}, 1000);
});
</script>
```

其中，`#screen` 是标签 `<div>` 的 `id` ，你想在它里面显示温度。它会每隔 1000 毫秒加载一次 `temperature.php` 文件。

我使用了 bootstrap 框架来制作一个漂亮的面板来显示温度，你还可以加入多个图标和图形让网页更有吸引力。

这只是一个控制继电器板并显示温度的基础的系统，你可以通过创建基于定时和从恒温器读数等基于事件触发来进一步地对系统进行开发。

（ 题图：opensource.com）

--------------------------------------------------------------------------------


作者简介：

Abdul Hannan Mustajab: 我 17 岁，生活在印度。我正在追求科学，数学和计算机科学方面的教育。我在 spunkytechnology.com 上发表关于我的项目的博客。我一直在对使用不同的微控制器和电路板的基于物联网的 AI 进行研究。


via: https://opensource.com/article/17/3/operate-relays-control-gpio-pins-raspberry-pi

作者：[Abdul Hannan Mustajab][a]
译者：[zhousiyu325](https://github.com/zhousiyu325)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/mustajabhannan
[1]:http://www.php.net/system
[2]:http://www.php.net/system
[3]:http://www.php.net/system
[4]:http://www.php.net/system
[5]:http://www.php.net/system
[6]:http://www.php.net/file
[7]:http://www.php.net/explode
[8]:http://www.php.net/number_format
[9]:https://opensource.com/article/17/3/operate-relays-control-gpio-pins-raspberry-pi?rate=RX8QqLzmUb_wEeLw0Ee0UYdp1ehVokKZ-JbbJK_Cn5M
[10]:https://opensource.com/user/123336/feed
[11]:https://opensource.com/users/mustajabhannan


