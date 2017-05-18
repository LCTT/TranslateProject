该死，原生移动应用的开发成本太高了！
============================================================

> 一个有价值的命题

我们遇到了一个临界点。除去少数几个特别的的用例之外，使用原生框架和原生应用开发团队构建、维护移动应用再也没有意义了。

 ![](https://cdn-images-1.medium.com/max/1000/1*4nyeufIIgw9B7nMSr5Sybg.jpeg) 

*在美国，雇佣 [iOS，Android][1]，[JavaScript][2] 开发人员的平均花费*

在过去的几年，原生移动应用开发的费用螺旋式上升，无法控制。对没有大量资金的新创业者来说，创建原生应用、MVP 设计架构和原型的难度大大增加。现有的公司需要抓住人才，以便在现有应用上进行迭代开发或者构建一个新的应用。要尽一切努力才能留住最好的人才，与 [世界各地的公司][9] 拼尽全力[争个][6][高][7][下][8]。

 ![](https://cdn-images-1.medium.com/max/800/1*imThyh2e45RW1np0xXIE4Q.png) 

*2015 年初，原生方式和混合方式开发 MVP 设计架构的费用[对比][3]*

### 这一切对于我们意味着什么？

如果你的公司很大或者有足够多的现金，旧思维是只要你在原生应用开发方面投入足够多的资金，就高枕无忧。但事实不再如此。

Facebook 是你最不会想到的在人才战中失败的公司（因为他们没有失败），它也遇到了原生应用方面金钱无法解决的问题。他们的移动应用庞大而又复杂，[他们发现编译它竟然需要 15 分钟][10]。这意味着哪怕是极小的用户界面改动，比如移动几个点，测试起来都要花费几个小时（甚至几天）。

除了冗长的编译时间，应用的每一个小改动在测试时都需要在两个完全不同的环境（IOS 和 Android）实施，开发团队需要使用两种语言和框架工作，这趟水更浑了。

Facebook 对这个问题的解决方案是 [React Native][11]。

### 能不能抛弃移动应用，仅面向 Web 呢？

[一些人认为移动应用的末日已到][12]。尽管我很欣赏、尊重 [Eric Elliott][13] 和他的工作，但我们还是通过考察一些近期的数据，进而讨论一下某些相反的观点：

![](https://cdn-images-1.medium.com/max/800/1*s0O7X2PgIqP5_zselxQdqQ.png) 

*人们在移动应用上花费的[时间][4]（2016年4月）*

> 人们使用 APP 的时间占使用手机总时长的 90%

目前世界上有 25 亿人在使用移动手机。[这个数字增长到 50 亿的速度会比我们想象的还要快。][14] 在正常情况下，丢掉 45 亿人的生意，或者抛弃有 45 亿人使用的应用程序是绝对荒唐且行不通的。

老问题是原生移动应用的开发成本对大多数公司来说太高了。然而，面向 web 的开发成本也在增加。[在美国，JavaScript 开发者的平均工资已达到 $97,000.00][15]。

伴随着复杂性的增加以及对高质量 web 开发的需求暴涨，雇佣一个 JavaScript 开发者的平均价格直逼原生应用开发者。论证 web 开发更便宜已经没用了。

### 那混合开发呢？

混合应用是将 HTML5 应用内嵌在原生应用的容器里，并且提供实现原生平台特性所需的权限。Cordova 和 PhoneGap 就是典型的例子。

如果你想构建一个 MVP 设计架构、一个产品原型，或者不担心对原生应用的模仿的用户体验，那么混合应用会很适合你。但谨记如果你最后想把它转为原生应用，整个项目都得重写。

此领域有很多创新的东西，我最喜欢的当属 [Ionic Framework][16]。混合开发正变得越来越好，但还不如原生开发那么流畅自然。

有很多公司，包括最严峻的初创公司，也包括大中规模的公司，混合应用在质量上的表现似乎没有满足客户的要求，给人的感觉是活糙、不够专业。

[听说应用商店里的前 100 名都不是混合应用][17]，我没有证据支持这一观点。如果说有百分之零到百分之五是混合应用，我就不怀疑了。

> [我们最大的错误是在 HTML5 身上下了太多的赌注][18] — 马克·扎克伯格 

### 解决方案

如果你紧跟移动开发动向，那么你绝对听说过像 [NativeScript][19] 和 [React Native][20] 这样的项目。

通过这些项目，使用由 JavaScript 写成的基本 UI 组成块，像常规 iOS 和 Android 应用那样，就可以构建出高质量的原生移动应用。

你可以仅用一位工程师，也可以用一个专业的工程师团队，通过 React Native 使用 [现有代码库][22] 或者 [底层技术][23] 进行跨平台移动应用开发、[原生桌面开发][21]，甚至还有 web 开发。把你的应用发布到 APP Store 上、 Play Store 上，还有 Web 上。如此可以在保证不丧失原生应用性能和质量的同时，使成本仅占传统开发的一小部分。

通过 React Native 进行跨平台开发时重复使用其中 90% 的代码也不是没有的事，这个范围通常是 80% 到 90%。

如果你的团队使用 React Native, 既可以消除团队之间的分歧，也可以让 UI 和 API 的设计更一致，还可以加快开发速度。

在编译时不需要使用 React Native，在保存时应用可以实时更新，也加快了开发速度。

React Native 还可以使用 [Code Push][24] 和 [AppHub][25] 这样的工具来远程更新你的 JavaScript 代码。这意味着你可以向用户实时推送更新、新特性，快速修复 bug，绕过打包、发布这些工作，绕过 App Store、Google Play Store 的审核，省去了耗时 2 到 7 天的过程（App Store 一直是整个过程的痛点）。混合应用的这些优势原生应用不可能比得上。

如果这个领域的创新力能像刚发行时那样保持，将来你甚至可以为 [Apple Watch][26]、[Apple TV][27]，和 [Tizen][28] 这样的平台开发应用。

> NativeScript 依然是个相当年轻的框架驱动，Angular 版本 2，[上个月刚刚发布测试版][29]。但只要它保持良好的市场份额，未来就很有前途。

你可能还不知道世界上一些最能创新、最大的科技公司在这类技术上下了很大的赌注，特别是 [React Native][30]。

我供职过的多家企业以及世界 500 强公司目前都在转移至 React Native。

### 在产品中特别注意使用 React Native

看下面的例子，[这是一个使用 React Native 技术的著名应用列表][31]。

#### Facebook

 ![](https://cdn-images-1.medium.com/max/800/1*36atCP-kVNoYrit2RMR-8g.jpeg) 

*Facebook 公司的 React Native 应用*

Facebook 的两款应用 [Ads Manager][32] 和 [Facebook Groups][33] 都在使用 React Native 技术，并且[将会应用到实现动态消息的框架上][34]。

Facebook 也会投入大量的资金创立和维护像 React Native 这样的开源项目，而且开源项目的开发者最近已经创建很多了不起的项目，这是很了不起的工作，像我以及全世界的业务每天都从中享受诸多好处。

#### Instagram

 ![](https://cdn-images-1.medium.com/max/800/1*MQ0ezjRsUW3A5I0ahryHPg.jpeg) 

*Instagram*

Instagram 应用的一部分已经使用了 React Native 技术。

#### Airbnb

 ![](https://cdn-images-1.medium.com/max/800/1*JS3R_cfLsDFCmAZJmtVEvg.jpeg) 

*Airbnb*

Airbnb 的很多东西正用 React Native 重写。（来自 [Leland Richardson][36]）

超过 90% 的 Airbnb 旅行平台都是用 React Native 写的。（来自 [spikebrehm][37]）

#### Vogue

 ![](https://cdn-images-1.medium.com/max/800/1*V9JMA2L3lXcO1nczCN3gcA.jpeg) 

*Vogue 是 2016 年度十佳应用之一*

Vogue 这么突出不仅仅因为它也用 React Native 写成，而是[因为它被苹果公司评为年度十佳应用之一][38]。

 ![](https://cdn-images-1.medium.com/max/800/1*vPDVV-vwvjfL3MsHpOO8rQ.jpeg) 

#### 沃尔玛

![](https://cdn-images-1.medium.com/max/800/1*ZlUk9AGwfOAPKdEBpa8avg.jpeg)

*Walmart Labs*

查看这篇 [Keerti](https://medium.com/@Keerti) 的[文章](https://medium.com/walmartlabs/react-native-at-walmartlabs-cdd140589560#.azpn97g8t)来了解沃尔玛是怎样看待  React Native 的优势的。

#### 微软

微软在 React Native 身上下的赌注很大。

它早已发布多个开源工具，包括 [Code Push][39]、[React Native VS Code][40]，以及 [React Native Windows][41]，旨在帮助开发者向 React Native 领域转移。

微软考虑的是那些已经使用 React Native 为 iOS 和 Android 开发应用的开发者，他们可以重用高达 90% 的代码，不用花费太多额外的时间和成本就可将应用发布到 Windows 上。

微软对 React Native 生态的贡献十分广泛，过去几年在开源界的表现很抢眼。

### 结论

移动应用界面设计和移动应用开发要进行范式转变，下一步就是 React Native 以及与其相似的技术。

#### 公司

如果你的公司正想着削减成本、加快开发速度，而又不想在应用质量和性能上妥协，这是最适合使用 React Native 的时候，它能提高你的净利润。

#### 开发者

如果你是一个开发者，想进入一个将来会快速发展的领域，我强烈推荐你把 React Native 列入你的学习清单。

如果了解 JavaScript，你会入门很快，工具我首推 [Exponent][5]，其他的就看你怎么想了。使用 Exponent 开发者可以轻松的编译、测试和发布跨 Windows 和 MacOS 两个平台的 React Native 应用。

如果已经是一位原生应用开发者，你更会受益匪浅。因为在需要时你能够胜任深入研究原生应用边缘的工作。虽然不会经常用到，但在团队需要时这可是十分宝贵的能力。

我花了很多时间来学习、指导别人 React Native。因为它让我十分激动，而且使用这个框架创作应用也是我一个平淡的小乐趣。

感谢阅读。

--------------------------------------------------------------------------------

作者简介：

![](https://cdn-images-1.medium.com/fit/c/60/60/1*uindYEb0zBpZTRV4suSkfg.jpeg)

教授和构建 React Native 应用的软件开发专家

--------------------------------------------------------------------------------

via: https://hackernoon.com/the-cost-of-native-mobile-app-development-is-too-damn-high-4d258025033a

作者：[Nader Dabit][a]
译者：[fuowang](https://github.com/fuowang)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://hackernoon.com/@dabit3
[1]:http://www.indeed.com/salary
[2]:http://www.payscale.com/research/US/Skill=JavaScript/Salary
[3]:http://www.comentum.com/mobile-app-development-cost.html
[4]:http://www.smartinsights.com/mobile-marketing/mobile-marketing-analytics/mobile-marketing-statistics/attachment/percent-time-spent-on-mobile-apps-2016/
[5]:https://medium.com/u/df61a4267d7a
[6]:http://www.bizjournals.com/charlotte/how-to/human-resources/2016/12/employers-offer-premium-wages-skilled-workers.html
[7]:https://www.cnet.com/news/silicon-valley-talent-wars-engineers-come-get-your-250k-salary/
[8]:http://www.nytimes.com/2015/08/19/technology/unicorns-hunt-for-talent-among-silicon-valleys-giants.html
[9]:http://blogs.wsj.com/cio/2016/09/30/tech-talent-war-moves-to-africa/
[10]:https://devchat.tv/react-native-radio/08-bridging-react-native-components-with-tadeu-zagallo
[11]:https://facebook.github.io/react-native/
[12]:https://medium.com/javascript-scene/native-apps-are-doomed-ac397148a2c0#.w06yd23ej
[13]:https://medium.com/u/c359511de780
[14]:http://ben-evans.com/benedictevans/2016/12/8/mobile-is-eating-the-world
[15]:http://www.indeed.com/salary?q1=javascript+developer&l1=united+states&tm=1
[16]:https://ionicframework.com/
[17]:https://medium.com/lunabee-studio/why-hybrid-apps-are-crap-6f827a42f549#.lakqptjw6
[18]:https://techcrunch.com/2012/09/11/mark-zuckerberg-our-biggest-mistake-with-mobile-was-betting-too-much-on-html5/
[19]:https://www.nativescript.org/
[20]:https://facebook.github.io/react-native/
[21]:https://github.com/ptmt/react-native-macos
[22]:https://github.com/necolas/react-native-web
[23]:https://facebook.github.io/react/
[24]:http://microsoft.github.io/code-push/
[25]:https://apphub.io/
[26]:https://github.com/elliottsj/apple-watch-uikit
[27]:https://github.com/douglowder/react-native-appletv
[28]:https://www.tizen.org/blogs/srsaul/2016/samsung-committed-bringing-react-native-tizen
[29]:http://angularjs.blogspot.com/2016/09/angular2-final.html
[30]:https://facebook.github.io/react-native/
[31]:https://facebook.github.io/react-native/showcase.html
[32]:https://play.google.com/store/apps/details?id=com.facebook.adsmanager
[33]:https://itunes.apple.com/us/app/facebook-groups/id931735837?mt=8
[34]:https://devchat.tv/react-native-radio/40-navigation-in-react-native-with-eric-vicenti
[35]:https://code.facebook.com/projects/
[36]:https://medium.com/u/41a8b1601c59
[37]:https://medium.com/u/71a78c1b069b
[38]:http://www.highsnobiety.com/2016/12/08/iphone-apps-best-of-the-year-2016/
[39]:http://microsoft.github.io/code-push/
[40]:https://github.com/Microsoft/vscode-react-native
[41]:https://github.com/ReactWindows/react-native-windows
[42]:https://twitter.com/dabit3
[43]:http://reactnative.training/
