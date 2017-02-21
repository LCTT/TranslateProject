使用开源工具探索气候数据的奥秘
============================================================[up][1]
 ![Explore climate data with open source tools](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/bus-cloud.png?itok=bdROR1aE "Explore climate data with open source tools") 
图片源自： 

[Flickr user: theaucitron][2] (CC BY-SA 2.0)

如果这些天地球天气变化的不明显，你几乎无法察觉其中变化的格局。每个月，事实和数据都在向我们诠释一点——全球变暖。

气候学家如是告诫我们——如今的不作为，对于我们的将来可能是致命的。五角大楼高层[最近警告][3]当选总统的川普。申明如果不对气候变化有所动作，可能会造成威胁国家安全的灾难。愈趋减少的的水供应和微薄的降雨量会导致作物歉收，这将迫使大量的移民逃往世界各地，到那些可以维持他们生计的地方去。

遍览 NASA，美国国防部，以及其他机构针对气候的研究成果，我的心中有个疑惑。那就是是否有开源的工具，使对此感兴趣的人们能够自行去探索气候数据的奥秘，并总结出我们自己的结论。我在网上快速的检索了一下，然后找到了[Open Climate Workbench （开源气候工作台）][4]，[Apache 软件基金会][5]旗下的一个工程。

Open Climate Workbench （缩写 OCW） 开发用于对来自[Earth System Grid Federation （地球系统网格联盟，缩写 ESGF）][6]，[Coordinated Regional Climate Downscaling Experiment （协调区域气候降尺度实验，缩写 CORDEX）][7]，美国全球变化研究计划的 [National Climate Assessment （国家气候研究）][8]，[North American Regional Climate Assessment Program （北美区域气候评估计划）][9]，和 NASA，NOAA，以及其他组织或机构的数据进行气候模型评价。

你可下载 OCW 的 [tar ball （压缩包）][10] 并将它安装到满足以下[条件][11]的 Linux 电脑上。也可以将它安装到 Vagrant 或者 VirtualBox 虚拟机中，详见 OCW 的[虚拟机指南][12]。  

个人觉得想要了解 OCW 是如何工作的，最便捷的方式就是到 Regional Climate Model Evaluation System （区域气候模式评价系统，缩写 RCMES）下载一个[虚拟机镜像][13]。

从 RCMES 的网站上看，他们旨在通过为一系列广泛而全面的观测（例如，卫星观测，重新分析，现场观测）和建模资源（例如，[ESGF][16] 上的 [CMIP][14] 和 [CORDEX][15]）提供标准化的访问，以及常规分析和可视化任务的工具（例如，OCW），来促进气候和地球系统模型的区域规模评估。

你需要在宿主机上安装 VirtualBox 和 Vagrant。通过它们，你就能看到一个超赞的 OCW 作业示例。RCMES 为下载，导入，运行虚拟机提供了[详细的说明][17]。当你的虚拟机开始工作时，你可以用以下身份登陆。

** 用户名：vagrant，密码：vagrant。 **

 ![Regional Climate Model Evaluation System Data Plot](https://opensource.com/sites/default/files/rcmes_data_plot.png "Regional Climate Model Evaluation System Data Plot") 

RCMES 数据样图

RCMES 网页上的[教程][18]能帮助你迅速上手该软件。他们的[社区][19]十分活跃，而且看上去需要更多的[开发者][20]。 你也可以订阅他们[邮件列表][21]。

工程的[源代码][22]部署在 GitHub 上，遵寻 Apache License, Version 2.0。

--------------------------------------------------------------------------------

![](https://opensource.com/sites/default/files/styles/profile_pictures/public/donw2-crop.jpg?itok=OqOYd3A8)

Don Watkins（唐 沃特金斯） - 教育家，教育技术专家，企业家，开源支持者。心理学硕士，教育学硕士，Linux 系统管理员，CCNA，通过使用 Virtual Box 和 VMware 完成虚拟化。twitter 关注 @Don_Watkins。

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/apache-open-climate-workbench

作者：[Don Watkins][a]
译者：[martin2011qi](https://github.com/martin2011qi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/don-watkins
[1]:https://opensource.com/article/17/1/apache-open-climate-workbench?rate=Hv4_T-1gbcRNsiP9jnevzP1OTNKHIyQLXwqdjnBy2Bs
[2]:https://www.flickr.com/photos/theaucitron/5810163712/in/photolist-5p9nh3-6EkSKG-6EgGEF-9hYBcr-abCSpq-9zbjDz-4PVqwm-9RqBfq-abA2T4-4nXfwv-9RQkdN-dmjSdA-84o2ER-abA2Wp-ehyhPC-7oFYrc-4nvqBz-csMQXb-nRegFf-ntS23C-nXRyaB-6Xw3Mq-cRMaCq-b6wkkP-7u8sVQ-yqcg-6fTmk7-bzm3vU-6Xw3vL-6EkzCQ-d3W8PG-5MoveP-oMWsyY-jtMME6-XEMwS-2SeRXT-d2hjzJ-p2ZZVZ-7oFYoX-84r6Mo-cCizvm-gnnsg5-77YfPx-iDjqK-8gszbW-6MUZEZ-dhtwtk-gmpTob-6TBJ8p-mWQaAC/
[3]:https://www.scientificamerican.com/article/military-leaders-urge-trump-to-see-climate-as-a-security-threat/
[4]:https://climate.apache.org/
[5]:https://www.apache.org/
[6]:http://esgf.llnl.gov/
[7]:http://www.cordex.org/
[8]:http://nca2014.globalchange.gov/
[9]:http://www.narccap.ucar.edu/
[10]:http://climate.apache.org/downloads.html
[11]:http://climate.apache.org/downloads.html#prerequsites
[12]:https://cwiki.apache.org/confluence/display/CLIMATE/OCW+VM+-+A+Self+Contained+OCW+Environment
[13]:https://rcmes.jpl.nasa.gov/RCMES_Turtorial_data/RCMES_June09-2016.ova
[14]:http://cmip-pcmdi.llnl.gov/
[15]:http://www.cordex.org/
[16]:http://esgf.org/
[17]:https://rcmes.jpl.nasa.gov/content/running-rcmes-virtual-machine
[18]:https://rcmes.jpl.nasa.gov/content/tutorials-overview
[19]:http://climate.apache.org/community/get-involved.html
[20]:https://cwiki.apache.org/confluence/display/CLIMATE/Developer+Getting+Started+Guide
[21]:http://climate.apache.org/community/mailing-lists.html
[22]:https://github.com/apache/climate
