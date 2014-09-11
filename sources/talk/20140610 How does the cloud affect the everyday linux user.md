barney-ro translating 

“云”是怎么影响每一位linux用户的？
================================================================================
### “云”简介 ###

不论是报纸、在线资讯、播客、科技博客、科技门户网站，甚至是电台和电视。“云计算”都是人们津津乐道永恒不变的主题。

然而，因为“云计算”包含了太多的东西，现在并没有一个明确的定义，所以你认为怎样“云计算”应该是什么呢？

> **云计算** 过去常常被当做是网络计算的一个模型，网络计算就是把用户程序或者是应用运行在一个联网的服务器或是一个服务器集群，而不是像个人电脑、平板以及智能手机这一类运算设备。比如像传统的客户机-服务器模型 (client-server) 和老一代的大型机，[1]用户通过连接服务器来执行一项任务。这和“云计算”是不同的，“云计算”是利用虚拟化的技术，把运算进程运行在一个或多个服务器上。利用虚拟技术，越来越多的物理化的服务器被配置和划分成多个独立的“虚拟”服务器，每个服务独立运行，对于用户来说，就像是运行在一个独立的物理服务器上一样。虚拟服务器本质上还是从他们的物理服务器中分离出来的，由于这种灵活的配置方式，使得人们可以按照意愿移动服务器和按比例分配资源而不影响最终的用户体验。计算机资源已成“颗粒”，给用户和管理人员提供方便，包括提供按需自助服务，支持更广泛的跨平台之间的访问，资源共享，快速重新部署，可被监控与量测服务。[2]

以上引用摘自维基百科。

在过去，我们要么用哑终端连接大型电脑主机，要么用桌面电脑连接运行在内部服务器上的应用，这种轮询的连接方式还依然存在于网上。

现在，所有桌面、应用和服务器的管理都已经本地化，都需要来自该公司的技术支持。

然而这只对软件公司等少数的公司有利，却对其他的一些商业公司不利，比如说银行、保险公司和石油公司。信息技术公司没有银行的职能，就好像是做餐饮的钻不出地下的石油一样。

大公司早已把很多服务外包给专业的公司。例如，餐饮公司为他们的员工提供食堂，和我们所熟知的离岸呼叫中心处理银行业务的客户电话。

IT 行业的很多服务也逐渐转向外包，许多的技术支持和开发的业务都被打包给中国、印度、马来西亚和东欧。

云计算与传统的典型模型有很大不同的一方面在于虚拟化，这种虚拟化的技术把服务运行于虚拟服务器上，服务器可以被放置在同一个地方或者是相隔千山万水，但是，这并不重要，你也不用担心，因为那不是你该担心的事情。

> In common usage the term “the cloud” has become a shorthand way to refer to cloud computing infrastructure.[4] The term came from the cloud symbol that network engineers used on network diagrams to represent the unknown (to them) segments of a network.[5] Marketers have further popularized the phrase “in the cloud” to refer to software, platforms and infrastructure that are sold “as a service”, i.e. remotely through the Internet.
> 通常，“云计算”已经成为云计算基础设施的简称。[4]这个术语来源于早年一些网络工程师用云状的符号表示那些对他们来说未知的网络片段。[5]营销者普及了这个云的概念，指的是软件、平台和一些可以买卖的基础设施。比如，远程登录互联网。

This article is therefore all about the cloud and what it means for the everyday linux user and what it can do for you and what, if any, pitfalls are there.
因此，这篇文章讲了和云相关的所有，对于linux的用户来说，这意味着你想做什么和它能为自己做些什么，如果可能，资源就在就是现成的。
From an end user and home user point of view, cloud computing has basically come to mean any service that is hosted online.
从一个终端用户和家庭使用者的角度来看，云计算就是提供在线服务。
So here goes, which cloud services are useful for an everyday linux user?
所以，让我们来说一下云能给linux用户提供哪些有用的服务？
### Email ###
### 电子邮件 ###
I would be very surprised if you are reading this and you don’t have an email account.
当你读到这里的时候，如果你还没有一个电子邮箱，我只能说你OUT了。
PC Advisor magazine analysed the top 6 emails services back in March, 2014 consisting of Outlook, GMail, Yahoo, iCloud, AOL and GMX.
据PC杂志顾问分析，截至2014三月份，电子邮箱的用户最多的分别是Outlook、GMail、Yahoo、icloud、AOL和GMX。
### Office Suites ###
### 办公套件 ###
As well as an email client one of the most commonly used tools required by everyone is an office suite.
和电子邮件客户端一样，对于每个人来说，最常用的一个工具之一就是办公套件。
In the past people would toddle off down to PC World, buy a computer and come home with a great big machine and half a dozen CDs containing 5 programs you definitely won’t use and Microsoft Works which was a cheap and virtually useless cut down version of Microsoft Office.
从人们蹒跚学步到现在的个人电脑，以前，买一个电脑会带回一个超大型的机器和半打子刻有几个没用的程序的CD，微软工作软件（Microsoft Works）是一个廉价，而且无用到几乎要砍掉的微软office版本。
Now you don’t even need an office suite on your computer even though there are some great free choices out there including LibreOffice and Kingsoft.
而现在，你甚至不需要在电脑上安装任何的办公套件，即便是有LibreOffice和Kingsoft这样好的软件供选择。
The obvious choices are of course Google Docs and Office 365. Does Office 365 work for Linux? Well this article from PC Pro in 2012 seems to suggest that it does.
最好的选择当然是Google Docs和Office 365。对于Office 365能否很好的运行于Linux平台，这篇来自2012专业电脑的文章似乎说明了这个问题。
![](http://www.linuxnews.pro/wp-content/uploads/2014/06/office365_1.png)

I don’t believe everything I read though so I signed up to Office 365 to see what would happen.
有人说我不相信我刚刚读到的，所以，我登录了Office365，像看看到底是怎样。
Signing up was free for a month and I was presented with a list of online applications that I could use which included Word, Excel and Outlook.
登录得到了一个月的试用期，并且给我赠送了包括Word、Excel、和Outlook等一些在线应用。
![](http://www.linuxnews.pro/wp-content/uploads/2014/06/office365_2.png)

All looked to be going well. I started Microsoft Word, chose a template to use and then of course it didn’t work at all.
一切看起来挺好，我打开了Microsoft Word,选择了一个模板来使用，当然并没有打开成功。
Office 365 isn’t yet supported on Linux and to be honest you don’t need it. Move on.
Office 365 并不支持linux设备，况且，说实话，你也不需要。so，咱们继续。
![](http://www.linuxnews.pro/wp-content/uploads/2014/06/office365_3.png)

Google Docs works and for home use it is perfect. There are hundreds of templates for the word processing and presentation tools and the spreadsheet application does most things although it doesn’t really replace Excel because you haven’t got hundreds of wannabe developers creating naff macros and VBA scripts everywhere.
Google Docs对于一般的办公支持非常完美，他们能完成很多的事情，并且有很多的模板针对文字处理，演示工具，电子表格等。即使他代替不了Excel，因为他并没有成百上千的开发人员为其创建宏和编写VBA脚本。
![](http://www.linuxnews.pro/wp-content/uploads/2014/06/zoho_1.png)

Another alternative to Office 365 is Zoho.
另一个可供选择的office条件是Zoho。
Similar to Google Docs, Zoho includes a word processor, spreadsheet tool, presentation tool and mail.
和Google Docs一样，Zoho也包含有文字处理工具，演示程序，电子表格程序和电子邮件。
There are finance and CRM tools as well.
此外，还有很多金融和客户管理系统。
![](http://www.linuxnews.pro/wp-content/uploads/2014/06/zoho_2.png)

The interface for the tools is actually very nice and clean.
这个工具的界面看起来真的很简洁，很棒。
Services such as Google Docs and Zoho also give you the power of collaboration.
像Google Docs和Zoho这些在线服务给予了人们相互协作的便利。
Documents can be shared and worked on by different people in different locations.
很多文档被不同的人分享，然后在不同的地方被不同的人修改完善。
This site provides a good list of alternative choices to Google Docs and Zoho.
这个网站提供了一些很好的选择来代替Google Docs和Zoho。
### Online File Storage ###
### 在线文件存储 ###
Another good service provided by Google Docs and Zoho is the ability to store the documents and files you create online.
Google Docs和Zoho给我们提供了其他一些很好的服务，比如说，你们可以线上存储很多文档和创建很多文件。
There are other services however such as Dropbox that are used to exclusively store your documents in the cloud.
也有一些其他的服务,比如说Dropbox,仅仅只提供在云存储服务。
The benefit of storing files with services like Dropbox is that if your house is burgled or catches fire then you have an offshore backup that remains intact. You can also access your files anywhere.
像Dropbox这样的云存储的好处是如果你的东西被偷了或者是房子着火了，而这时，你仍然有一份离岸备份时安好无缺的。你仍然可以在任何地方获取你的文件。
Dropbox is free for up to 2 gigabytes of use. If you have a lot more data, and most of us do nowadays, then there is a $ 9.99 monthly plan that is available allowing for 100 gigabytes. There is also a business version available from $ 15 a month.
Dropbox对于前2G的容量是免费的，如果你还有更多的东西要存储，每天还有更多的事情要做，每个月9.9美刀，你就能拥有100G的存储空间，另外，也提供商务版本，每个月15美刀。
There are of course alternatives to Dropbox and this site provides a list of the best online backup solutions.
当然，我们也有Dropbox的替代解决方案，这个网站也提供了最好的一些在线备份的方案。
### Photos ###
### 相片 ###
Since the introduction of digital cameras and more recently smart phones, more and more of us have memory cards full of photos.
自从引入了数码照相机和现在的很多智能手机，越来越多的人们利用存储卡来保存照片。
I bet that at some point or other that you have lost photos because your phone died and the photos were on the phone and not the memory card or you lost your phone losing pictures of your child’s sports day or another important occasion.
我相信肯定有人因为电话坏了而丢失照片，因为他的照片是存储在电话上的，而不是其他的存储设备，甚至，有些因为丢失了电话而丢失了他们孩子的运动会照片或者是其他一些具有纪念意义的照片资料。
Losing a phone is never a good thing. If you are clever you will have set up some sort of security because most people have their phones synchronised with their email accounts, Facebook, Twitter and even online banking.
丢失电话肯定不是什么好事情，如果你放机灵一点，相对可能要安全一点，因为很多人的电话和email，facebook，Twitter的账户是同步的，甚至在线存储也是。
All it takes to fix a lost phone is to change the passwords to all of the above accounts but lost photos are just not possible to recover and are a little bit more upsetting when lost.
当丢失手机时，我们只能做的是更改以上那些账户的密码，可是丢失的照片却是再也找不回来了，这让人有一点点伤心。
One solution of course is to backup to your computer. This is of course a good first step but occasionally laptops break as well and you are back to square one.
备份资料到电脑当然是一种很好的解决方法，不过要是你的笔记本哪天不小心坏了，你也只能从头再来。
Online photo storage sites are great resources because not only do they keep your photos safe you can also share them with whoever you choose to, eliminating the need to get 5 copies of the same photo developed to send to mum, nan, sister, aunty and mother-in-law.
在线照片存储的网站是一个很好的资源，因为他们不止要保证你的照片的安全，你也可以把照片分享给你选择的人。解决了那些把同样的照片做无数次的拷贝分别发给妈妈，奶奶，妹妹，阿姨和岳母的麻烦。
The solution I like to use is Google’s Picasa but many of you will have heard of services like Flickr as well.
我常用用的一个软件是谷歌的Picasa相册工具，但是大家也可能听说过像Flickr这样的网络相册。
Lifehacker has a list of the five best photo sharing services.
Lifehacker给出了最好的5个相册分享工具。
Remember though that just because they are called photo sharing services doesn’t mean you have to share them. You can keep them just to yourself.
请记住，虽然他们被称作是相册分享工具，但是并没有对顶说你一定要分享，你也可以自己保留他们。
### Music ###
### 音乐 ###
The first record that I was ever given was a 12 inch vinyl version of “Kings of the wild frontier” by “Adam and the Ants” back in the early 1980s.
我得到的第一个唱片是20世纪80年代初“Adam and the Ants”的"Kings of the wild frontier"的一个12英寸的碟子。
As the 1980s progressed the long play records were replaced by cassettes and just as I had accumulated a decent number of cassettes the compact disc became the thing to have.
从20世纪80年代到现在唱片逐渐被磁带所取代，就好像是我积累了很多的磁带以后，磁带却被光盘所取代。
Hundreds of compact discs later and MP3 file sharing became the norm and it even became the legal way of doing things.
后来，成百上千的激光唱片和MP3越来越普遍，甚至成为了一种潮流。
Nothing sits still with technology and the future is now with audio streaming services such as Spotify.
始终跟科技同步的就是现在的音频流媒体，比如像Spotify。
Spotify is free to use but is supported with the inclusion of adverts. In this regard it is like having your own personal radio station where you choose the playlist. Of course you can pay a monthly fee and have the adverts removed altogether.
Spotify是一个免费的软件，但是里面包含广告，就这一点而言，它就像是一个你可以定制的私人电台，当然你也可以叫月费来去除广告。
There are dozens of similar services including Grooveshark and last.fm.
Grooveshark和last.fm有很多相似的服务。
Techradar has a list of 7 alternatives to Spotify.
Techradar给出了7种Spotify的替代方案。
### Film ###
### 电影 ###
The first film I ever watched in the Cinema was Dumbo. The first video I ever watched was “Krull” which contained a young Dulph Lundgren. The format of the video was on Beta Max. (My next door neighbour had one).
我最早在电影院看的电影是Dumbo。我最早看的录像是“Krull”，
My dad came home one day with a video recorder from Radio Rentals and my sister and I used to take it in turns to pick a video to hire from the video store. I remember my first choice being “The Black Hole”.

As with music time moves on. Just as you get large units full of movies, some genius comes along and develops DVDs and then they come out with Bluerays.

Now of course video streaming is the order of the day especially if you have a decent enough internet connection.

The most commonly known services are Netflix and Lovefilm.

This website has a list of good alternatives to Netflix. Not all of these services (including Netflix) work seamlessly on Linux.

### Gaming ###

Music, films and now gaming have moved to the online arena.

Gaming is of course more difficult. Music is relatively low cost in terms of bandwidth and although films require a little more, the stream just needs to remain steady to get a clear picture.

Games need to run at a consistently high frame rate to be playable and unless you have a decent connection it probably isn’t even worth trying.

Current services offering a cloud gaming service include OnLive and StreamMyGame.

This site contains a list of 6 online gaming services to rival OnLive.

### Pitfalls ###

Cloud computing isn’t free from issues.

There is the obvious problem of hacking. If someone gets access to your online banking or your email then you have a real problem.

What about online file storage? There is currently the high profile case of Megaupload.com.

Megaupload.com was essentially a file storage site for storing large files. The problem is that a lot of people used the service to share copyright material and the US authorities came down like a ton of bricks and the service was shut down.

Now a lot of people losing files would perhaps be expecting the inevitable but what about people who genuinely did nothing wrong. Their data has been lost. The US authorities refusing to give it back.

Finally there is the subject of service maintenance. If your email went down for a day could you cope? What about 3 days? What about a month? You are at the mercy of the service provider.

A lot has been made about large companies losing data and there has also been a lot of noise regarding heartbleed which is a vulnerability found in SSL left unpatched for years.

If you have services hosted for you online then you are relying on technical support staff to do their job properly and if they don’t you could be at the mercy of hackers, hardware failures and poor backup and recovery maintenance.

### Summary ###

Cloud computing has really become the buzz term for any online service. Your web browser is a client connecting to a server or clusters of servers hosted anywhere in the world. The point is that you don’t care. You don’t need to know.

Generally speaking I have barely touched the surface. We all use the cloud everyday and most of us don’t even think about it.

How does the cloud affect the everyday linux user? It turns out quite a bit.

Is the cloud a good or bad thing? Neither. Each service has to be judged on it’s own merits.

The term “The Cloud” is just something marketing people and the technical press get excited about. Anyone remember when they kept using the term “Web 2.0″?

Thankyou for reading.

--------------------------------------------------------------------------------

via: http://www.linuxnews.pro/how-does-the-cloud-affect-the-everyday-linux-user/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出