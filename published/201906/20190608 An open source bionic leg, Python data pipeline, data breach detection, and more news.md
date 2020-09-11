[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10965-1.html)
[#]: subject: (An open source bionic leg, Python data pipeline, data breach detection, and more news)
[#]: via: (https://opensource.com/article/19/6/news-june-8)
[#]: author: (Scott Nesbitt https://opensource.com/users/scottnesbitt)

开源新闻：开源仿生腿、Python 数据管道、数据泄露检测
======

> 了解过去两周来最大的开源头条新闻。

![][1]

在本期开源新闻综述中，我们将介绍一个开源仿生腿、一个新的开源医学影像组织，麦肯锡发布的首个开源软件，以及更多！

### 使用开源推进仿生学

我们这一代人从电视剧《六百万美元人》和《仿生女人》中学到了仿生学一词。让科幻小说（尽管基于事实）正在成为现实的，要归功于[由密歇根大学和 Shirley Ryan AbilityLab 设计][2]的假肢。

该腿采用简单、低成本的模块化设计，“旨在通过为仿生学领域的零碎研究工作提供统一的平台，提高患者的生活质量并加速科学进步”。根据首席设计师 Elliot Rouse 的说法，它将“使研究人员能够有效地解决与一系列的实验室和社区活动中控制仿生腿相关的挑战。”

你可以从[开源腿][3]网站了解有该腿的更多信息并下载该设计。

### 麦肯锡发布了一个用于构建产品级数据管道的 Python 库

咨询巨头麦肯锡公司最近发布了其[第一个开源工具][4]，名为 Kedro，它是一个用于创建机器学习和数据管道的 Python 库。

Kedro 使得“管理大型工作流程更加容易，并确保整个项目的代码质量始终如一”，产品经理 Yetunde Dada 说。虽然它最初是作为一种专有的工具，但麦肯锡开源了 Kedro，因此“客户可以在我们离开项目后使用它 —— 这是我们回馈的方式，”工程师 Nikolaos Tsaousis 说。

如果你有兴趣了解一下，可以从 GitHub 上获取 [Kedro 的源代码][5]。

### 新联盟推进开源医学成像

一组专家和患者倡导者聚集在一起组成了[开源成像联盟][6]。该联盟旨在“通过数字成像和机器学习帮助推进特发性肺纤维化和其他间质性肺病的诊断。”

根据联盟执行董事 Elizabeth Estes 的说法，该项目旨在“协作加速诊断，帮助预后处置，最终让医生更有效地治疗患者”。为此，他们正在组织和分享“来自患者的 15,000 个匿名图像扫描和临床数据，这将作为机器学习程序的输入数据来开发算法。”

### Mozilla 发布了一种简单易用的方法，以确定你是否遭受过数据泄露

向不那么精通软件的人解释安全性始终是一项挑战，无论你的技能水平如何，都很难监控你的风险。Mozilla  发布了 [Firefox Monitor][7]，其数据由 [Have I Been Pwned][8] 提供，它是一种查看你的任何电子邮件是否出现在重大数据泄露事件中的简单方式。你可以输入电子邮件逐个搜索，或注册他们的服务以便将来通知你。

该网站还提供了大量有用的教程，用于了解黑客如何做的，数据泄露后如何处理以及如何创建强密码。请务必将网站加入书签，以防家人要求你在假日期间提供建议。

### 其它新闻

* [想要一款去谷歌化的 Android？把你的手机发送给这个人][9]
* [CockroachDB 发行版使用了非 OSI 批准的许可证，但仍然保持开源][10]
* [基础设施自动化公司 Chef 承诺开源][11]
* [俄罗斯的 Windows 替代品将获得安全升级][12]
* [使用此代码在几分钟内从 Medium 切换到你自己的博客][13]
* [开源推进联盟宣布与台湾自由软件协会建立新合作伙伴关系][14]

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/news-june-8

作者：[Scott Nesbitt][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/weekly_news_roundup_tv.png?itok=B6PM4S1i
[2]: https://news.umich.edu/open-source-bionic-leg-first-of-its-kind-platform-aims-to-rapidly-advance-prosthetics/
[3]: https://opensourceleg.com/
[4]: https://www.information-age.com/kedro-mckinseys-open-source-software-tool-123482991/
[5]: https://github.com/quantumblacklabs/kedro
[6]: https://pulmonaryfibrosisnews.com/2019/05/31/international-open-source-imaging-consortium-osic-launched-to-advance-ipf-diagnosis/
[7]: https://monitor.firefox.com/
[8]: https://haveibeenpwned.com/
[9]: https://fossbytes.com/want-a-google-free-android-send-your-phone-to-this-guy/
[10]: https://www.cockroachlabs.com/blog/oss-relicensing-cockroachdb/
[11]: https://www.infoq.com/news/2019/05/chef-open-source/
[12]: https://www.nextgov.com/cybersecurity/2019/05/russias-would-be-windows-replacement-gets-security-upgrade/157330/
[13]: https://github.com/mathieudutour/medium-to-own-blog
[14]: https://opensource.org/node/994
