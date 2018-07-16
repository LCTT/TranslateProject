好消息！Weather App更新美化界面啦！
================================================================================
WeatherApp是一款[Ubuntu软件开发套件][1]应用程序，可以收集、管理并显示相关的天气信息，界面漂亮美观。

这款方便的天气小工具实现了多城市、单色图标、日期、滚轮切换、每小时更新天气等功能，另外还可以翻页显示额外的天气细节哟~

[WeatherApp][2] 现已更新，新发布的版本将原本的纯文本通知美化为漂亮的可视化界面啦~

如下图中显示，点击底部工具栏的`Refresh`按钮，界面上立即显示出一个漂亮的数据加载框，白色的底面结合旋转的小圈圈，旁边再配上 `Loading...`的字样，有没有觉得连等待都变得那么友好与美妙呢~

![](http://iloveubuntu.net/pictures_me/weather%20app%20new%20activity%20indicator%20sep22.png)

几周以前，WeatherApp开始支持故障通知，这就意味着，假如发生网络无法连接等异常状况，WeatherApp就能及时向亲爱的用户们告知啦~

本次更新，我们将上面提到的出错通知进行了调整，调整后的通知以同样的圆角白色风格配以灰体字提醒，`暂时无法加载天气信息，请稍后重试~`，这与之前整个窗口用浅黑色透明图层填充相比是不是清新了许多？

![](http://iloveubuntu.net/pictures_me/weather%20app%20internet%20notification.png)

那么，怎样**安装**WeatherApp 0.3版本呢？

很简单，在终端中依次输入以下命令就可以啦(Ubuntu 13.04，Ubuntu 13.10)：

    sudo add-apt-repository ppa:ubuntu-sdk-team/ppa && sudo add-apt-repository ppa:ubuntu-touch-coreapps-drivers/daily
    
    sudo apt-get update
    sudo apt-get install ubuntu-sdk ubuntu-weather-app

（译者注：安装使用愉快，天气变化，请注意及时增减衣物哦~）

via:http://iloveubuntu.net/weather-app-refines-its-visuals 

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[Mr小眼儿] 校对：[Caroline][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[Mr小眼儿]:http://linux.cn/space/14801
[Caroline]:http://linux.cn/space/14763

[1]:http://developer.ubuntu.com/get-started/ 
[2]:https://launchpad.net/ubuntu-weather-app
