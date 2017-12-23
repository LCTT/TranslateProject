Linux 长期支持版关于未来的声明    
===============================       

> Linux  4.4 长期支持版（LTS）将得到 6年的使用期，但是这并不意味着其它长期支持版的使用期将持续这么久。    

[视频](http://android-streaming.techrepublic.com/media/2014/10/17/343832643820/1242911146001_1697467424001_zdnet-linux-linus-2point7_1189834_740.mp4)

_视频: Torvalds 对内核版本 2.6 的弹性感到惊讶_ 
   
在 2017 年 10 月，[Linux 内核小组同意将 Linux 长期支持版（LTS）的下一个版本的生命期从两年延长至六年][5]，而 LTS 的下一个版本正是 [Linux 4.14][6]。这对于 [Android][7]，嵌入式 Linux 和 Linux 物联网（IoT）的开发者们是一个利好。但是这个变动并不意味着将来所有的 Linux LTS 版本将有 6 年的使用期。 

正如 [Linux 基金会][8]的 IT 技术设施安全主管 Konstantin Ryabitsev 在 Google+ 上发文解释说，“尽管外面的各种各样的新闻网站可能已经告知你们，但是[内核版本 4.14 的 LTS 并不计划支持 6 年][9]。只是因为 Greg Kroah-Hartman 正在为 LTS 4.4 版本做这项工作并不表示从现在开始所有的 LTS 内核会维持那么久。” 
   
所以，简而言之，Linux 4.14 将支持到 2020 年 1月份，而 2016 年 1 月 20 号问世的 Linux 4.4 内核将支持到 2022 年。因此，如果你正在编写一个打算能够长期运行的 Linux 发行版，那你需要基于 [Linux 4.4 版本][10]。     

[Linux LTS 版本][11]包含对旧内核树的后向移植漏洞的修复。不是所有漏洞的修复都被导入进来，只有重要漏洞的修复才用于这些内核中。它们不会非常频繁的发布，特别是对那些旧版本的内核树来说。 
   
Linux 其它的版本有<ruby>尝鲜版<rt>Prepatch</rt></ruby>或发布候选版（RC）、<ruby>主线版<rt>Mainline</rt></ruby>，<ruby>稳定版<rt>Stable</rt></ruby>和 LTS 版。    

RC 版必须从源代码编译并且通常包含漏洞的修复和新特性。这些都是由 Linux Torvalds 维护和发布的。他也维护主线版本树（这是所有新特性被引入的地方）。新的主线内核每几个月发布一次。当主线版本树发布以便通用时，它被称为“稳定版”。稳定版的内核漏洞修复是从主线版本树后向移植的，并且这些修复是由一个指定的稳定版内核维护者来申请。在下一个主线内核变得可用之前，通常也有一些修复漏洞的内核发布。
  
对于最新的 LTS 版本，Linux 4.14，Ryabitsev 说，“Greg 已经担负起了 4.14 版本的维护者责任（过去发生过多次），其他人想成为该版本的维护者也是有可能的，但是你最后不要指望。"  

Kroah-Hartman 对 Ryabitsev 的帖子回复道：“[他说神马。][12]”
  
-------------------
via: http://www.zdnet.com/article/long-term-linux-support-future-clarified/

作者：[Steven J. Vaughan-Nichols][a]
译者：[liuxinyu123](https://github.com/liuxinyu123)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出   

[a]:http://www.zdnet.com/meet-the-team/us/steven-j-vaughan-nichols/
[1]:http://www.zdnet.com/article/long-term-linux-support-future-clarified/#comments-eb4f0633-955f-4fec-9e56-734c34ee2bf2
[2]:http://www.zdnet.com/article/the-tension-between-iot-and-erp/
[3]:http://www.zdnet.com/article/the-tension-between-iot-and-erp/
[4]:http://www.zdnet.com/article/the-tension-between-iot-and-erp/
[5]:http://www.zdnet.com/article/long-term-support-linux-gets-a-longer-lease-on-life/
[6]:http://www.zdnet.com/article/the-new-long-term-linux-kernel-linux-4-14-has-arrived/
[7]:https://www.android.com/
[8]:https://www.linuxfoundation.org/
[9]:https://plus.google.com/u/0/+KonstantinRyabitsev/posts/Lq97ZtL8Xw9
[10]:http://www.zdnet.com/article/whats-new-and-nifty-in-linux-4-4/
[11]:https://www.kernel.org/releases.html
[12]:https://plus.google.com/u/0/+gregkroahhartman/posts/ZUcSz3Sn1Hc
[13]:http://www.zdnet.com/meet-the-team/us/steven-j-vaughan-nichols/
[14]:http://www.zdnet.com/meet-the-team/us/steven-j-vaughan-nichols/
[15]:http://www.zdnet.com/blog/open-source/
[16]:http://www.zdnet.com/topic/enterprise-software/




