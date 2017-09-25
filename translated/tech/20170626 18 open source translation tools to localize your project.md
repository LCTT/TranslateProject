Translating by TimeBear
18 个本地化您项目的开源翻译工具
============================================================

### 本地化在为世界各地的用户调整项目方面发挥着关键作用。


![18 个本地化您项目的开源翻译工具](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/people_remote_teams_world.png?itok=wI-GW8zX "18 open source translation tools to localize your project")
>Image by : opensource.com

本地化在定制开源项目以满足世界各地用户的需求方面发挥着核心作用。 除了编码之外，语言翻译也是世界各地人们贡献和参与开源项目的主要方式之一。

有专门针对语言服务行业特有的工具 (　听到这件事是不是很惊讶？　) 这使得一个平滑的本地化过程具有很高的质量。 本地化工具的类别包括:

*   计算机辅助翻译工具 (CAT)

*   机器翻译引擎 (MT)

*   翻译管理系统 (TMS)

*   术语管理工具

*   本地化自动化工具

这些工具的专有版本可能相当昂贵。一个 SDL Trados Studio ( 主要的CAT工具 ) 的许可证可以花费数千欧元，即使这样，它只对一个人有用，并且定制是有限的 ( 而且，它们的成本也很高 )。 开源项目希望本地化到多种语言，简化本地化过程，并看到开源工具来节省资金，而且通过定制获得所需的灵活性。 我已经对许多开源本地化工具项目进行了高级的调查，以帮助您决定使用什么。

### 计算机辅助翻译工具 (CAT)

### [omegat_cat.png][1]

![OmegaT CAT 工具](https://opensource.com/sites/default/files/u128651/omegat_cat.png "OmegaT CAT tool")

OmegaT CAT 工具。 在这里，您可以看到在工作中，翻译存储器(模糊匹配)和术语回顾(术语表)特性。 OmegaT 在 GNU 公共许可版本 3+ 中获得许可。

CAT 工具是语言服务行业的主要工具。 顾名思义，CAT 工具可以帮助翻译人员尽快完成翻译、双语评论和单语评论的任务，并通过重用翻译内容(也称为翻译存储器)，达到尽可能高的一致性。 翻译存储器和术语回忆是 CAT 工具的两个主要特征。 他们能够使译者在新项目中重用以前项目中翻译的内容。 这使得他们可以在较短的时间内翻译大量的单词，同时通过术语和风格一致性保持较高水平的质量。 这对于本地化特别方便，因为许多软件和 web UI 中的文本在平台和应用程序中通常是相同的。 尽管CAT工具是独立的软件，但需要翻译人员在本地工作并合并到中央存储库。

**查看工具:**

*   [OmegaT][7]

*   [OmegaT+][8]

*   [OpenTM2][9]

*   [Anaphraseus][10]

*   [ 字幕翻译器 ][11]

### 机器翻译引擎 (MT)

![apertium_screenshot.png](https://opensource.com/sites/default/files/images/life-uploads/apertium_screenshot.png)

机器翻译引擎自动将文本从一种语言翻译到另一种语言。 机器翻译引擎被分成三种主要的方法:基于规则的、统计的和神经的(这是新技术)。 最广泛的机器翻译引擎方法时统计数据 ( 简而言之 ) 过使用 [_n_ -gram 模型][29] 对带注释的双语语料库数据进行统计分析，得出关于两种语言之间的相互关联的结论。   当将新的源语言短语引入到引擎进行翻译时，它会在其分析的语料库数据中查找与目标语言产生统计相关的对等物。 机器翻译引擎可以作为对翻译人员的生产力辅助，改变他们的主要任务，从将源文本转换为目标文本再到编辑机器翻译引擎的目标语言输出。 我不建议在本地化中使用原始的机器翻译引擎输出，但是如果您的社区接受了后期编辑的培训，那么机器翻译引擎可以成为一个有用的工具，帮助他们做出大量的贡献。

**查看工具:**

*   [Apertium][12]

*   [Moses][13]

### 翻译管理系统 (TMS)

### [mozilla_pontoon.png][2]

![Mozilla 的 Pontoon 翻译管理系统用户界面](https://opensource.com/sites/default/files/u128651/mozilla_pontoon.png "Mozilla's Pontoon translation management system user interface")

Mozilla的Pontoon翻译管理系统用户界面。 使用 WYSIWYG 编辑，您可以在上下文根据语境翻译内容，在翻译的同时保证质量。 Pontoon 根据 BSD 3 条款新的或修订的许可证获得许可的。

翻译管理系统工具是基于web的平台，允许您管理本地化项目，并使翻译人员和审稿人能够做他们最擅长的事情。 大多数翻译管理系统工具旨在通过包括版本控制系统 (VCS) 集成、云服务集成、项目报告以及标准的翻译存储器和术语回忆功能，实现本地化过程中的许多手工部分的自动化。 这些工具最适合于社区本地化或翻译项目，因为它们允许大量的翻译人员和审阅人员为一个项目做出贡献。 一些人还使用 WYSIWYG 编辑器为他们的翻译者提供翻译语境。 这种增加的语境可以提高翻译的准确性，减少译者在翻译和审查用户界面之间的翻译过程中需要等待的时间。

**查看工具**

*   [Pontoon][14]

*   [Pootle][15]

*   [Weblate][16]

*   [Translate5][17]

*   [GlobalSight][18]

*   [Zanata][19]

*   [Jabylon][20]

### 术语管理工具

### [baseterm_term_entry_example.png][3]

![杨百翰大学的 BaseTerm 工具](https://opensource.com/sites/default/files/u128651/baseterm_term_entry_example.png "Brigham Young University's BaseTerm tool")

杨百翰大学 (Brigham Young University) 的 BaseTerm 工具显示了新的入门对话窗口。 BaseTerm 根据 Eclipse 公共许可证进行许可。

术语管理工具为您提供 GUI 来创建术语资源（称为术语库）以添加语境并确保翻译的一致性。 这些资源在帮助翻译人员的翻译过程中被 CAT 工具和翻译管理系统消耗了。 对于一个术语可以是基于语境名词或动词的语言，术语管理工具允许您添加标记其词性，单语定义以及上下文线索的术语的元数据。 术语管理通常是本地化过程中服务性不周，但也是同样重要的部分。 在开源和专有的生态系统中，只有少量的可用选项。

**查看工具**

*   [BaseTerm][21]

*   [Terminator][22]

### 自动本地化工具

### [okapi_framework.jpg][4]

![Okapi 框架的 Ratel 和 Rainbow 组件](https://opensource.com/sites/default/files/u128651/okapi_framework.jpg "Ratel and Rainbow components of the Okapi Framework")

Okapi 框架的 Ratel 和 Rainbow 组件 图片由 Okapi 框架提供。Okapi 框架在 Apache License 2.0 版本下获得许可。

自动本地化工具便于您处理数据本地化。 这可以包括文本提取、文件格式转换、标记化、VCS同步、术语提取、预翻译和对通用本地化标准文件格式的各种质量检查。 在一些工具套件中，如Okapi框架，您可以创建用于执行各种本地化任务的自动化管道。 这对于各种情况都非常有用，但是它们的主要功能是通过自动化许多任务来节省时间。 它们还可以让你更接近一个更连续的本地化过程。

**查看工具**

*   [Okapi Framework][23]

*   [Mojito][24]

### 为什么开源是关键

本地化在开放时是最强大和有效的。 这些工具应该让您和您的社区能够将您的项目本地化为尽可能多的语言。

想了解更多吗? 看看这些额外的资源：

*   [自由/开源的机器翻译软件][25] 列表

*   _[打开翻译工具][5]_  电子书

 _Jeff Beatty 将在 7 月 12 日至 15 日在盐湖城举行的 [OpenWest][27] 上谈论 [开源本土化工具][26]。_

--------------------------------------------------------------------------------

作者简介：

Jeff Beatty - Jeff Beatty 是 Mozilla 公司本地化的负责人, Mozilla 是流行的开源 web 浏览器 Firefox 的制造商。 他拥有利默里克大学 (University of Limerick) 多语言计算和本地化专业硕士学位。 Jeff 还在全球知名刊物中担任本地化专家，如《经济学人》 (The Economist)、《世界报》 (El Universal)、多语种杂志等。 Jeff 旨在展示 Mozilla 的本地化程序，创建破坏性的开源翻译技术，并充当中介。

-----------

via: https://opensource.com/article/17/6/open-source-localization-tools

作者：[Jeff Beatty][a]
译者：[TimeBear](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/guerojeff
[1]:https://opensource.com/file/357341
[2]:https://opensource.com/file/357331
[3]:https://opensource.com/file/357326
[4]:https://opensource.com/file/357336
[5]:https://booki.flossmanuals.net/open-translation-tools/index
[6]:https://opensource.com/article/17/6/open-source-localization-tools?rate=QVxhNMYU2Rzrul0hmvzCTqOUinduQ8Au5L8sT8bVbFk
[7]:http://www.omegat.org/
[8]:http://omegatplus.sourceforge.net/
[9]:http://opentm2.org/
[10]:http://anaphraseus.sourceforge.net/
[11]:http://www.mironto.sk/
[12]:http://www.apertium.org/
[13]:http://www.statmt.org/moses/
[14]:http://pontoon.mozilla.org/
[15]:http://pootle.translatehouse.org/
[16]:https://weblate.org/
[17]:http://translate5.net/
[18]:http://www.globalsight.com/
[19]:http://zanata.org/
[20]:http://jabylon.org/
[21]:http://certsoftadmin.byu.edu/baseterm/termbase/search_all
[22]:https://github.com/translate/terminator
[23]:http://okapiframework.org/
[24]:http://www.mojito.global/
[25]:http://fosmt.org/
[26]:https://www.openwest.org/custom/description.php?id=156
[27]:https://www.openwest.org/
[28]:https://opensource.com/user/143806/feed
[29]:https://en.wikipedia.org/wiki/N-gram#n-gram_models
[30]:https://opensource.com/users/guerojeff
