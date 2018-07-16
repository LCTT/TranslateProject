Ubuntu天气预报软件细微的改进了颜色表现力
=================================

正如最近几个月所见，Ubuntu Converged已经有了大量的软件，这些软件涵盖了底层的系统服务，新的Unity 8界面程序和Ubuntu开发人员专用的应用程序，另外还有一些正由能力较强的第三方开发者、Ubuntu开发者和Ubuntu设计者通力合作来联合生产的[核心的应用][1]程序。

最近几周，[天气预报软件][2]已经有了很多的优化和改进，这些使该软件日趋完美的努力是为了在不久的将来提供一个稳定版本的天气预报应用。

天气预报应用程序自身支持多城市和丰富的天气数据，这些天气数据(比如说摄氏度)的表达和预先的颜色设定有关；比如，20摄氏度就用桔红色表示，而比较低的温度则用灰绿色表示。

现在，天气预报应用已经更新到了一个小而有趣的版本，该版本不仅修复了一些bug，同时也为在视觉上生动地渲染色调方面带来了更多的暗颜色。

也就是说，较高的温度（比如20摄氏度）仍然是与以前一样的桔红色，但是其色彩活力降低了亮度，同时也添加了细微但明显的暗色调。

以更多冷色调为特点的天气颜色比以前更加赏心悦目了。

![](http://iloveubuntu.net/pictures_me/ols%20vs%20new%20weather%20app.png)

![](http://iloveubuntu.net/pictures_me/old%20vs%20new%202%20weather%20beijing.png)

那么我们如何安装天气预报软件3.0呢？

添加下面的官方PPA（Ubuntu 13.04，Ubuntu 13.10）就可以了。

    sudo add-apt-repository ppa:ubuntu-sdk-team/ppa && sudo add-apt-repository ppa:ubuntu-touch-coreapps-drivers/daily

    sudo apt-get update
    sudo apt-get install ubuntu-sdk ubuntu-weather-app


---

via: http://iloveubuntu.net/weather-app-updated-subtle-color-refinements

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[Linchenguang](https://github.com/Linchenguang) 校对：[wxy](https://github.com/wxy)



[1]:https://launchpad.net/ubuntu-phone-coreapps
[2]:https://launchpad.net/ubuntu-weather-app
