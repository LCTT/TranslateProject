Perl 与动态网站的诞生
==================

> 在新闻组和邮件列表里、在计算机科学实验室里、在各大陆之间，流传着一个神秘的故事，那是关于 Perl 与动态网站之间的不得不说的往事。

![Perl and the birth of the dynamic web](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/osdc-lead-web-internet.png?itok=hq81pSDs "Perl and the birth of the dynamic web") 

>图片来源 : [Internet Archive Book Images][30], 由 Opensource.com 修改. [CC BY-SA 4.0][29].

早期互联网历史中，有一些脍炙人口的开创性事件：如 蒂姆·伯纳斯·李（Tim Berners-Lee）在邮件组上[宣布][28] WWW-project 的那天，该文档随同 [CERN][27] 发布的项目代码进入到了公共域，以及 1993 年 1 月的[第一版 NCSA Mosaic 浏览器][26]。虽然这些独立的事件是相当重要的，但是当时的技术的开发已经更为丰富，不再是由一组的孤立事件组成，而更像是一系列有内在联系的故事。

这其中的一个故事描述的是网站是如何变成_动态的_，通俗说来就是我们如何使服务器除了提供静态 HTML 文档之外做更多的事。这是个流传在[新闻组][25]和邮件列表间、计算机科学实验室里、各个大陆之间的故事，重点不是一个人，而是一种编程语言：Perl。

### CGI 脚本和信息软件

在上世纪 90 年代中后期，Perl 几乎和动态网站是同义词。Perl 是一种相对来说容易学习的解释型语言，并且有强大的文本处理特性，使得它能够很容易的编写脚本来把一个网站关联到数据库、处理由用户发送的表单数据，当然，还要创造那些上世纪 90 年代的网站的经典形象——计数器和留言簿。

类似的网站特性渐渐的变成了 CGI 脚本的形式，其全称为通用网关接口（Common Gateway Interface），[首个实现][24]由 Rob McCool 于 1993 年 11 月在 NCSA HTTPD 上完成。CGI 是目的是直面功能，并且在短短几年间，任何人都可以很容易的找到一些由 Perl 写的预制的脚本存档。有一个声名狼籍的案例就是 [Matt's Scripts Archive][23]，这是一种流行却包含各种安全缺陷的源代码库，它甚至使得 Perl 社区成员创建了一种被称为 [Not Matt‘s Scripts][22] 的更为专业的替换选择。

在当时，无论是业余爱好者，还是职业程序员都采用 Perl 来制作动态网站和应用，Tim O’Reilly [创造了词汇“信息软件（infoware）”][21] 来描述网站和 Perl 怎样成为变化中的计算机工业的一部分。考虑到 Yahoo！和 Amazon 带来的创新，O‘Reilly 写道：“传统软件在大量的软件中仅仅包含了少量的信息；而信息软件则在少量的软件中包含了大量的信息。” Perl 是一种像瑞士军刀一样的完美的小而强大的工具，它支撑了信息媒体从巨大的网站目录向早期的用户生成内容（UGC）平台的转变。

### 题外话

尽管使用 Perl 来制作 CGI 简直是上佳之选，但是编程语言和不断提升中的动态网站之间的关系变得更加的密切与深入。从[第一个网站][20]（在 1990 年的圣诞节前）出现到 1993 年 McCool 实现 CGI 的短暂时期内，Web 上的各种东西，比如表单、图片以及表格，就这么逐渐出现在上世纪 90 年代乃至后来。尽管伯纳斯·李也对这些早期的岁月产生了影响，但是不同的人看到的是 Web 不同的潜在作用，并将它推向各自不同的方向。一方面，这样的结果来自一些著名的辩论，例如 [HTML 应该和 SGML 保持多近的关系][19]、[是否应该实现一个图像标签][18]等等。在另一方面，在没有直接因素影响的情况下改变是极其缓慢的。后者已经很好的描述了动态网站是如何发展的。

从某种意义上说，第一个“网关”的诞生可以追溯到 1991 至 1992 年之间（LCTT 译注：此处所谓“网关”的意义请参照 CGI 的定义），当时伯纳斯·李和一些计算机科学家与超文本爱好者[编写服务程序][17]使得一些特定的资源能够连接到一起，例如 CERN 的内部应用程序、通用的应用程序如 Oracle 数据库、[广域信息查询系统（WAIS）][16] 等等。（WAIS 是 Web 的前身，上世纪 80 年代后期开发，其中，开发者之一 [Brewster Kahle][15]，是一个数字化图书管理员和 [Internet Archive][14] 的创始人。）可以这样理解，“网关”就是一个被设计用来连接其它 Web、数据库或者应用程序的定制的 Web 服务器。任何的动态功能就意味着在不同的端口上运行另外一个守护进程（参考阅读，例如伯纳斯·李对于在网站上[如何添加一个搜索功能][13] 的描述）。伯纳斯·李期望 Web 可以成为不同信息系统之间的通用接口，并且鼓励建立单一用途服务。他也提到 Perl 是一种强大的（甚至是不可思议）、可以将各种东西组合起来的语言。

然而，另一种对“网关”的理解指出它不一定是一个定制设备，可能只是一个脚本，一个并不需要额外服务器的低吞吐量的附加脚本。这种形式的首次出现是有争议性的 Jim Davis 的 [Gateway to the U Mich Geography server][11]，于 1992 年的 11 月发布在了 WWW-talk 邮件列表中。Davis 的脚本是使用 Perl 编写的，是一种 Web API 的原型，基于格式化的用户查询从另外的服务器拉取数据。我们来说明一下这两种对于网关的理解的不同之处，伯纳斯·李[回复了][10] Davis 的邮件，期望他和 Michigan 服务器的作者“能够达成某种共识”，“从网络的角度来看的话”仅使用一台服务器来提供这样的信息可能会更有意义。伯纳斯·李，可能是期待着 Web 的发明者可以提出一种有秩序的信息资源访问方式。这样从不同服务器上拉取数据的网关和脚本意味着一种潜在的 Web 的质的变化，虽然不断增多，但也可能有点偏离了伯纳斯·李的原始观点。

### 回到 Perl HTTPD

在 Davis 的地理服务器上的网关向标准化的、低吞吐量的、通过 CGI 方式实现的脚本化网关迈进的一步中，[Perl HTTPD][9] 的出现是很重要的事件，它是 1993 年初由印地安纳大学的研究生 Marc Van Heyningen 在布卢明顿（Bloomington）完全使用 Perl 语言实现的一个 Web 服务器程序。从 Van Heyningen 给出的[设计原则][8]来看，基于使用 Perl 就不需要任何的编译过程这样一种事实，使得它能够成为一种极易扩展的服务器程序，这个服务器包含了“一个向代码中增加新特性时只要简单的重启一下就可以，而不会有任何的宕机时间的特性”，使得这个服务器程序可以频繁的加入新功能。

Perl HTTPD 代表了那种服务器程序应该是单一、特定目的的观点。相应的，这种模式似乎暗示了在 Web 开发中像这样渐进式的、持续测试的软件产品可能会最终变成一种共识。Van Heyningen 在后来[提到过][7]他从头编写这样一个服务器程序的初衷是当时没有一种简便的方式使用 CERN 服务器程序来生成“虚拟文档”（例如，动态生成的页面），他打趣说使用 Perl 这样的“神之语言”来写可能是最简单的方式了。在他初期编写的众多脚本中有一个 Sun 操作系统的用户手册的 Web 界面，以及 [Finger 网关][6]（这是一种早期用来共享计算机系统信息或者是用户信息的协议）。

虽然 Van Heyningen 将印地安纳大学的服务器主要用来连接现存的信息资源，他和研究生们同时也看见了作为个人发布形式的潜在可能。其中一件广为人知事件是在 1993-1994 年之间围绕着一个著名的加拿大案件而[公布][5]的一系列的文件、照片和新闻故事，与此形成鲜明对比的是，所有的全国性媒体都保持了沉默。

Perl HTTPD 没有坚持到现在的需要。今天，Van Heyningen 回忆起这个程序的时候认为这个程序只是当时的一个原型产品。它的原始目的只是向那些已经选择了 Gopher 作为大学的网络界面的资深教员们展示了网络的另一种利用方式。Van Heyningen 以[一种基于 Web 的、可搜索的出版物索引][4]的方式，用代码回应了他的导师们的虚荣。就是说，在服务器程序技术方面关键创新是为了赢得争论的胜利而诞生的，在这个角度上来看代码做到了所有要求它所做的事。

不管该服务器程序的生命是否短暂，伴随者 Perl HTTPD 一起出现的理念已经传播到了各个角落。Van Heyningen 开始收到了获取该代码的请求，而后将它分享到了网上，并提示说，需要了解一些 Perl 就可以将它移植到其它操作系统（或者找到一个这样的人也行）。不久之后，居住在奥斯汀（Austin）的程序员 Tony Sanders 开发了一个被称为 [Plexus][3] 的轻便版本。Sander 的服务器程序是一款全功能的产品，并且同样包含了 Perl HTTPD 所建议的易扩展性，而且添加一些新的特性如图片解码等。Plexus [直接影响了][2] Rob McCool 给 NCSA HTTPD 服务器上的脚本开发的“htbin”，并且同样影响到了不久之后诞生的通用网关接口（CGI）。

在这些历史遗产之外，感谢妙不可言的 Internet Archive（互联网时光机）使得 Perl HTTPD 在今天依然保留在一种我们依然可以获取的形式，你可以从[这里下载 tarball][1]。

### 历史展望

对于技术世界的颠覆来说，技术的改变总是在一个相互对立的过程中。现有的技术是思考新技术的基础与起点。过时的编程形式启迪了今天人们做事的新方式。网络世界的创新可能看起来更像是对于旧技术的扩展，不仅仅是 Perl。

在萌芽事件的简单的时间轴之外，Web 历史学者也许可以从 Perl 获取更多的线索。其中一部份的挑战在于材料的获取。更多需要做的事情包括从可获取的大量杂乱的数据中梳理出它的结构，将分散在邮件列表、归档网站，书本和杂志中的信息内容组合在一起。还有一部分的挑战是需要认识到 Web 的历史不仅仅是新技术发布的日子，它同时包括了个人记忆、人类情感与社会进程等，并且这不仅仅是单一的历史线而是有许许多多条相似的历史线组合而成的。就如 Perl 的信条一样“殊途同归。（There's More Than One Way To Do It.）”

--------------------------------------------------------------------------------

via: https://opensource.com/life/16/11/perl-and-birth-dynamic-web

作者：[Michael Stevenson][a]
译者：[wcnnbdk1](https://github.com/wcnnbdk1)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/mstevenson
[1]:https://web.archive.org/web/20011126190051/http://www.cs.indiana.edu/perl-server/httpd.pl.tar.Z
[2]:http://1997.webhistory.org/www.lists/www-talk.1993q4/0516.html
[3]:https://web.archive.org/web/19990421192342/http://www.earth.com/server/doc/plexus.html
[4]:https://web.archive.org/web/19990428030253/http://www.cs.indiana.edu:800/cstr/search
[5]:https://web.archive.org/web/19970720205155/http://www.cs.indiana.edu/canada/karla.html
[6]:https://web.archive.org/web/19990429014629/http://www.cs.indiana.edu:800/finger/gateway
[7]:https://web.archive.org/web/19980122184328/http://www.cs.indiana.edu/perl-server/history.html
[8]:https://web.archive.org/web/19970720025822/http://www.cs.indiana.edu/perl-server/intro.html
[9]:https://web.archive.org/web/19970720025822/http://www.cs.indiana.edu/perl-server/code.html
[10]:https://lists.w3.org/Archives/Public/www-talk/1992NovDec/0069.html
[11]:https://lists.w3.org/Archives/Public/www-talk/1992NovDec/0060.html
[12]:http://info.cern.ch/hypertext/WWW/Provider/ShellScript.html
[13]:http://1997.webhistory.org/www.lists/www-talk.1993q1/0109.html
[14]:https://archive.org/index.php
[15]:http://brewster.kahle.org/about/
[16]:https://en.wikipedia.org/wiki/Wide_area_information_server
[17]:http://info.cern.ch/hypertext/WWW/Daemon/Overview.html
[18]:http://1997.webhistory.org/www.lists/www-talk.1993q1/0182.html
[19]:http://1997.webhistory.org/www.lists/www-talk.1993q1/0096.html
[20]:http://info.cern.ch/hypertext/WWW/TheProject.html
[21]:https://web.archive.org/web/20000815230603/http://www.edventure.com/release1/1198.html
[22]:http://nms-cgi.sourceforge.net/
[23]:https://web.archive.org/web/19980709151514/http://scriptarchive.com/
[24]:http://1997.webhistory.org/www.lists/www-talk.1993q4/0518.html
[25]:https://en.wikipedia.org/wiki/Usenet_newsgroup
[26]:http://1997.webhistory.org/www.lists/www-talk.1993q1/0099.html
[27]:https://tenyears-www.web.cern.ch/tenyears-www/
[28]:https://groups.google.com/forum/#!msg/alt.hypertext/eCTkkOoWTAY/bJGhZyooXzkJ
[29]:https://creativecommons.org/licenses/by-sa/4.0/
[30]:https://www.flickr.com/photos/internetarchivebookimages/14591826409/in/photolist-oeqVBX-xezHCD-otJDtG-whb6Qz-tohe9q-tCxH8y-xq4VfN-otJFfh-xEmn3b-tERUdv-oucUgd-wKDyLy-owgebW-xd6Wew-xGEvuT-toqHkP-oegBCj-xtDdzN-tF19ip-xGFbWP-xcQMJq-wxrrkN-tEYczi-tEYvCn-tohQuy-tEzFwN-xHikPT-oetG8V-toiGvh-wKEgAu-xut1qp-toh7PG-xezovR-oegRMa-wKN2eg-oegSRp-sJ29GF-oeqXLV-oeJTBY-ovLF3X-oeh2iJ-xcQBWs-oepQoy-ow4xoo-xknjyD-ovunVZ-togQaj-tEytff-xEkSLS-xtD8G1
