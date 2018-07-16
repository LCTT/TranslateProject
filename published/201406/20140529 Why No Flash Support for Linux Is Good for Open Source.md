为什么Flash不支持Linux对开源比较好
================================================================================
> Linux中开源软件Chromium浏览器对Adobe Flash的支持即将结束，这实际上对Linux世界是件好事。

![](http://thevarguy.com/site-files/thevarguy.com/files/imagecache/medium_img/uploads/2014/05/noflash.png)

Flash，这个无处不在的网络媒体框架，很快将不能在linux的[Chromium][1]浏览器中使用了。Chromium是开源版的[Google Chrome][2]浏览器。现在我们要为Linux世界恐慌了吗？答案是根本不用。

事情是这样的：Chromium对Flash支持的传统方法是通过使用最初设计用于Netscape浏览器的一个插件实现的，不过很快这个方法将[不能使用了][3]。取而代之的是，Flash支持将通过新的叫做Pepper的API而实现，这是Google为Chrome而制作的。

对于Linux用户，问题是Pepper只能用于Chrome，而不能用于其表兄弟Chromium。虽然在技术上可以使Pepper在Chromium上使用，但需要你比一般Linux用户拥有更多的知识才能搞定。

这对Linux世界来说是个坏消息，根据[一个统计数据][4]称，有近一半的Linux用户在使用Chromium。在Linux上的其他浏览器，对Flash的支持将在Flash 11.2版本结束，现在它仍然能够良好工作，但是将来可能就不能使用了。这就是说，不久，不论Chromium还是Firefox或者他们的分支或其他的开源软件，将不能可靠地显示基于Flash的内容。

但到目前为止，很少有人对此事感到恐慌，事实上他们确实不应该恐慌。从很多方面来说，Flash对Linux不再支持实际上是件好事，因为这将有助于加速Flash的完全消失。毕竟，就如Jim Lynch在IT World上[写的][5]，苹果iOS从没有过Flash支持，但这并没有阻碍iPads或iPhones变得的极为流行。尤其是一些技术如HTML5使得在提供网络内容时不必使用Flash。

这件事情里，拒绝支持一个特定的软件包，从长远来看对于Linux社区和更大范畴的IT世界更有好处。这种情况很少见，但当发生在Flash上时，Linux不支持的确是件好事。

--------------------------------------------------------------------------------

via: http://thevarguy.com/open-source-application-software-companies/052814/why-no-flash-support-linux-good-open-source

译者：[linuhap](https://github.com/linuhap) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.chromium.org/
[2]:https://www.google.com/intl/en-US/chrome/browser/
[3]:http://www.techrepublic.com/article/browsers-will-flash-linux-into-the-future-or-drag-it-into-the-past/#.
[4]:http://www.techrepublic.com/article/browsers-will-flash-linux-into-the-future-or-drag-it-into-the-past/#.
[5]:http://www.itworld.com/open-source/420319/adobe-flash-critical-future-linux