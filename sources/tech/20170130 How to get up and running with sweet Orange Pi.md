
beyondworld 翻译中

如何获取并运行Orange Pi
===========================

How to get up and running with sweet Orange Pi
============================================================

 ![如何获取并运行Orange Pi](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/the_orange_pi_zero.jpg?itok=00T8KODN "How to get up and running with sweet Orange Pi") 

 ![How to get up and running with sweet Orange Pi](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/the_orange_pi_zero.jpg?itok=00T8KODN "How to get up and running with sweet Orange Pi") 
Image credits : 
索引：

Dave Egts, CC BY-SA 4.0

通过开源驱动的硬件比如[Arduino][2]和[Raspberry Pi][3]变得更加主流了，这些开源硬件的成本持续下降，给那些全新的且具有创新性[IoT][4]的[STEM][5](译者注：STEM代表科学Science，技术Technology，工程Engineering，数学Mathematics。STEM教育就是科学，技术，工程，数学的教育)类软件降低了使用门槛。由于我对这些比较感兴趣，总是持续关注以便能找到一些可以应用到教育产业的创新点，比如课堂教育和我女儿的机器人小组[6]。当听说Orange Pi比Raspberry Pi更优秀[7]时，我开始关注Orange Pi。

As open source-powered hardware like [Arduino][2] and [Raspberry Pi][3] becomes more and more mainstream, its cost keeps dropping, which opens the door to new and innovative [IoT][4] and [STEM][5] applications. As someone who's passionate about both, I'm always on the lookout for new innovations that can be applied in industry, the classroom, and [my daughter's robotics team][6]. When I heard about the Orange Pi as being a "[Raspberry Pi killer][7]," I paused to take notice.

尽管是这个略带酸味儿的名字，但是我仍然被Orange Pi Zero迷住了。我最近刚上手了一个Orange Pi Zero并且在本文中分享我的第一体验。真情提示：我真着迷了。

Despite the sour sounding name, the Orange Pi Zero intrigued me. I recently got my hands on one and in this article share my first impressions. Spoiler alert: I was very impressed.

### 为什么是Orange Pi?

### Why Orange Pi?

Orange Pi 是由Linux驱动的单板计算机家族一员，由深圳迅龙软件有限公司研发[8]并在[AliExpress][9]上售卖。在AliExpress上买东西需要有耐心，提前计划并预留2到4周的运输时间，因为这些产品都是从中国大陆直接发往全世界其它地方的。

Orange Pi is a family of Linux-powered, single board computers manufactured by [Shenzhen Xunlong Software Co., Limited][8], and [sold on AliExpress][9]. As with anything sold on AliExpress, be patient and plan ahead for shipping times of two to four or more weeks, because the products are shipped directly from mainland China to locations around the world.

与Raspberry Pi不同，Raspberry Pi有一个小却不断增加不同价位的单板计算机家族，这些型号有不同尺寸和特色但是Orange Pi的数量更多。还有个好消息就是你可以在巨大的软件库中选择你需要的东西，但是坏消息就是你的选择数量太大了。在我看来，可以使用[Orange Pi Zero][10]的512MB版本，因为该版本平衡了适合高校学术环境的特性和价格因数。

Unlike the Raspberry Pi, which has had a small but growing family of single board computers for different price points, form factors, and features, the number of Orange Pi boards is much larger. The good news is that you have a tremendous amount of choice in the application you want, but the bad news is that amount of choice could be overwhelming. In my case, I went with the [Orange Pi Zero][10] 512MB version, because it has the right balance of features and is priced for use in high school, academic environments.

To see a high-resolution image with all the specs, go to the [Orange Pi Zero website][11].

Specifically, I needed the device to be as inexpensive as possible, but still useful out of the box, with Internet connectivity for SSH and IoT applications. The Orange Pi Zero meets these requirements by having onboard 10/100M Ethernet and 802.11 b/g/n Wi-Fi for Internet connectivity. It also has 26 Raspberry Pi-compatible [GPIO ports][12] for connecting sensors for IoT applications. I went with the 512MB version of the Orange Pi Zero over the 256MB version because more memory is typically better and it was only $2 more. Out the door, the unit was US $12.30 shipped, which makes it cost effective for classroom environments where experimentation and creating [magic smoke][13] is encouraged.

Compared to a $5 [Raspberry Pi Zero][14], the Orange Pi Zero is only a few dollars more expensive, but it is much more useful out of the box because it has onboard Internet connectivity and four CPU cores instead of one. This onboard networking capability also makes the Orange Pi Zero a better gift than a Raspberry Pi Zero because the Raspberry Pi Zero needs Micro-USB-to-USB adapters and a Wi-Fi USB adapter to connect to the Internet. When giving IoT devices as gifts, you want the recipient to enjoy the product as quickly and easily as possible, instead of giving something incomplete that will just end up on a shelf.

### Out of the box experience

One of my initial concerns about the Orange Pi is that the vendor and community support wouldn't be as strong as the Raspberry Pi Foundation's and its community's support, leaving the end user all alone putting in extra effort to get the device going. If that's the case, I'd be reluctant to recommend the Orange Pi for classroom use or as a gift. The good news is that the Orange Pi Zero worked well right away and was actually easier to get going than a Raspberry Pi.

The Orange Pi arrived in my mailbox two weeks after ordering. I unpacked it and got it up and running in a matter of minutes. Most of my time was spent downloading the operating system. The Orange Pi can run a variety of operating systems, ranging from Android to Debian variants. I went with [Armbian][15] as it appeared to be the most popular choice for Orange Pi enthusiasts. Since Armbian supports many ARM-based single-board computers, you need to select [the right Armbian build for the Orange Pi Zero][16]. By following the [Getting Started section][17] of the Armbian User Guide, I was easily able to image a microSD card, insert the microSD card and Ethernet cable, power the unit with an existing 3A Micro-USB power adapter I use with my Raspberry Pis, and SSH into it.

 ![Orange Pi interface](https://opensource.com/sites/default/files/orange_pi_screen_shot.png "Orange Pi interface") 

<sup style="box-sizing: border-box; font-size: 13.5px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em;">SSHing into the Orange Pi Zero.</sup>

Once SSHed in via Ethernet, I was able to connect to my wireless access point easily using [nmtui-connect][18]. Then I performed an **apt-get update && apt-get upgrade** and noticed that the update ran much faster than a Raspberry Pi Zero and closer to the performance of a [Raspberry Pi 3][19]. Others have [observed similar results][20], too. It may not be as fast as a Raspberry Pi 3, but I wasn't planning to sequence genomes or mine Bitcoin with it. I also noticed that Armbian automatically resizes the root partition to fill the entire microSD card, which is an explicit, manual, and sometimes forgotten step when using Raspbian. Finally, for the US $12 price, three times as many students can learn on their own Orange Pi Zero as compared to a $35 Raspberry Pi 3, and you can give an Orange Pi Zero to three times as many friends.

 ![Orange Pi Form Factor](https://opensource.com/sites/default/files/the_orange_pi_zero_form_factor.jpg "Orange Pi Form Factor") 

<sup style="box-sizing: border-box; font-size: 13.5px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em;">The Orange Pi Zero form factor compared with the Raspberry Pi 3.</sup>

### Closing thoughts

The Orange Pi is definitely a solution looking for problems. Given its low cost, ability to get up and running quickly, relatively quick performance, and GPIO-pin compatibility with Raspberry Pi, the Orange Pi, and Orange Pi Zero in particular, should definitely be on your short list for experimentation in your workshop, classroom, or robot.

Have you tried the Orange Pi? I'd love to hear about your experiences in the comments below.

--------------------------------------------------------------------------------

作者简介：

David Egts - David Egts | Chief Technologist, North America Public Sector, Red Hat. Drum playing, motorcycle riding, computer geek, husband, dad, and catechist. Follow me on Twitter at @davidegts and check out the podcast I co-host!

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/how-to-orange-pi

作者：[David Egts][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/daveegts
[1]:https://opensource.com/article/17/1/how-to-orange-pi?rate=ZJsifrA90bn7TAU6NWgsxdYtRQjRhq5n7NiPZD8876M
[2]:https://en.wikipedia.org/wiki/Arduino
[3]:https://en.wikipedia.org/wiki/Raspberry_Pi
[4]:https://en.wikipedia.org/wiki/Internet_of_things
[5]:https://en.wikipedia.org/wiki/Science,_technology,_engineering,_and_mathematics
[6]:https://opensource.com/education/14/3/fighting-unicorns-robotics-team
[7]:http://sprtechuk.blogspot.com/2015/09/15-computer-orange-pi-pc-is-powerful.html
[8]:http://www.xunlong.tv/
[9]:https://www.aliexpress.com/store/1553371
[10]:http://www.orangepi.org/orangepizero/
[11]:http://www.orangepi.org/orangepizero/
[12]:http://linux-sunxi.org/Xunlong_Orange_Pi_Zero#Expansion_Port
[13]:https://en.wikipedia.org/wiki/Magic_smoke
[14]:https://www.raspberrypi.org/products/pi-zero/
[15]:https://www.armbian.com/
[16]:https://www.armbian.com/orange-pi-zero/
[17]:https://docs.armbian.com/User-Guide_Getting-Started/
[18]:https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Networking_Guide/sec-Networking_Config_Using_nmtui.html
[19]:https://www.raspberrypi.org/products/raspberry-pi-3-model-b/
[20]:https://openbenchmarking.org/result/1612154-TA-1603058GA04,1612151-MICK-MICKMAK70,1612095-TA-1603058GA97,1612095-TA-1603058GA50
[21]:https://opensource.com/user/24799/feed
[22]:https://opensource.com/article/17/1/how-to-orange-pi#comments
[23]:https://opensource.com/users/daveegts
