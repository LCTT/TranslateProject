[谁是 Python 的目标受众？][40]
============================================================

Python 是为谁设计的？

*   [Python 使用情况的参考][8]

*   [CPython 主要服务于哪些受众？][9]

*   [这些相关问题的原因是什么?][10]

*   [适合进入 PyPI 规划的方面有哪些？][11]

*   [当增加它到标准库中时，为什么一些 APIs 会被改变？][12]

*   [为什么一些 API 是以临时（provisional）的形式被增加的？][13]

*   [为什么只有一些标准库 APIs 被升级？][14]

*   [标准库任何部分都有独立的版本吗？][15]

*   [这些注意事项为什么很重要？][16]

几年前， 我在 python-dev 邮件列表中、活跃的 CPython 核心开发人员、以及决定参与该过程的人员中[强调][38]说，“CPython 的动作太快了也太慢了”，作为这种冲突的一个主要原因是，它们不能有效地使用他们的个人时间和精力。

我一直在考虑这种情况，在参与的这几年，我也花费了一些时间去思考这一点，在我写那篇文章的时候，我还在波音防务澳大利亚公司（Boeing Defence Australia）工作。下个月，我将离开波音进入红帽亚太（Red Hat Asia-Pacific），并且开始在大企业的[开源供应链管理][39]上获得重分发者（redistributor）级别的观点。

### [Python 使用情况的参考][17]

我将分解 CPython 的使用情况如下，它虽然有些过于简化（注意，这些分类并不是很清晰，他们仅关注影响新软件特性和版本的部署不同因素）：

*   教育类：教育工作者的主要兴趣在于建模方法的教学和计算操作方面，_不_ 写或维护软件产品。例如：
    *   澳大利亚的 [数字课程][1]

    *   Lorena A. Barba 的 [AeroPython][2]

*   个人的自动化爱好者的项目：主要的是软件，经常是只有软件，而且用户通常是写它的人。例如：
    *   my Digital Blasphemy [image download notebook][3]

    *   Paul Fenwick's (Inter)National [Rick Astley Hotline][4]

*   组织（organisational）过程的自动化：主要是软件，经常是只有软件，用户是为了利益而编写它的组织。例如：
    *   CPython 的 [核发工作流工具][5]

    *   Linux 发行版的开发、构建&发行工具

*   “一劳永逸（Set-and-forget）” 的基础设施中：这里是软件，（这种说法有时候有些争议），在生命周期中软件几乎不会升级，但是，在底层平台可能会升级。例如：
    *   大多数的自我管理的企业或机构的基础设施（在那些资金充足的可持续工程计划中，这是让人非常不安的)

    *   拨款资助的软件（当最初的拨款耗尽时，维护通常会终止）

    *   有严格认证要求的软件（如果没有绝对必要的话，从经济性考虑，重新认证比常规更新来说要昂贵很多）

    *   没有自动升级功能的嵌入式软件系统

*   持续升级的基础设施：具有健壮的持续工程化模型的软件，对于依赖和平台升级被认为是例行的，而不去关心其它的代码改变。例如：
    *   Facebook 的 Python 服务基础设施

    *   滚动发布的 Linux 分发版

    *   大多数的公共 PaaS 无服务器环境（Heroku、OpenShift、AWS Lambda、Google Cloud Functions、Azure Cloud Functions等等）

*   间歇性升级的标准的操作环境：对其核心组件进行常规升级，但这些升级以年为单位进行，而不是周或月。例如：
    *   [VFX 平台][6]

    *   长周期支持的 Linux 分发版

    *   CPython 和 Python 标准库

    *   基础设施管理 & 业务流程工具（比如 OpenStack、 Ansible）

    *   硬件控制系统

*   短生命周期的软件：软件仅被使用一次，然后就丢弃或忽略，而不是随后接着升级。例如：
    *   临时（Ad hoc）自动脚本

    *   被确定为 “终止” 的单用户游戏（你玩它们一次后，甚至都忘了去卸载它，或许在一个新的设备上都不打算再去安装它）

    *   短暂的或非持久状态的单用户游戏（如果你卸载并重安装它们，你的游戏体验也不会有什么大的变化）

    *   特定事件的应用程序（这些应用程序与特定的物理事件捆绑，一旦事件结束，这些应用程序就不再有用了）

*   定期使用的应用程序：部署后定期升级的软件。例如：
    *   业务管理软件

    *   个人 & 专业的生产力应用程序（比如，Blender）

    *   开发工具 & 服务（比如，Mercurial、 Buildbot、 Roundup）

    *   多用户游戏，和其它明显的处于持续状态的还没有被定义为 “终止” 的游戏

    *   有自动升级功能的嵌入式软件系统

*   共享的抽象层：软件组件的设计使它能够在特定的问题域有效地工作，即使你没有亲自掌握该领域的所有错综复杂的东西。例如：
    *   大多数的运行时库和归入这一类的框架（比如，Django、Flask、Pyramid、SQL Alchemy、NumPy、SciPy、requests)

    *   也适合归入这里的许多测试和类型引用工具（比如，pytest、Hypothesis、vcrpy、behave、mypy）

    *   其它应用程序的插件（比如，Blender plugins、OpenStack hardware adapters）

    *   本身就代表了 “Python 世界” 的基准的标准库（那是一个 [难以置信的复杂][7] 的世界观）

### [CPython 主要服务于哪些受众？][18]

最终，CPython 和标准库的主要受众是哪些，不论什么原因，一个更多的有限的标准库和从 PyPI 安装的显式声明的第三方库的组合，提供的服务是不够的。

为了更一步简化上面回顾的不同用法和部署模式，为了尽可能的总结，将最大的 Python 用户群体分开来看，一种是，在一些环境中将 Python 作为一种_脚本语言_使用的，另外一种是将它用作一个_应用程序开发语言_，最终发布的是一种产品而不是他们的脚本。

当把 Python 作为一种脚本语言来使用时，它们典型的开发者特性包括：

*   主要的处理单元是由一个 Python 文件组成的（或 Jupyter notebook !)，而不是一个 Python 目录和元数据文件

*   没有任何形式的单独的构建步骤 - 是_作为_一个脚本分发的，类似于分发一个单独的 shell 脚本的方法。

*   没有单独的安装步骤（除了下载这个文件到一个合适的位置），除了在目标系统上要求预配置运行时环境

*   没有显式的规定依赖关系，除了最低的 Python 版本，或一个预期的运行环境声明。如果需要一个标准库以外的依赖项，他们会通过一个环境脚本去提供（无论是操作系统、数据分析平台、还是嵌入 Python 运行时的应用程序）

*   没有单独的测试套件，使用 "通过你给定的输入，这个脚本是否给出了你期望的结果?" 这种方式来进行测试

*   如果在执行前需要测试，它将以 “dry run” 和 “预览” 模式来向用户展示软件_将_怎样运行

*   如果可以完全使用静态代码分析工具，它是通过集成进用户的软件开发环境的，而不是为个别的脚本单独设置的。

相比之下，使用 Python 作为一个应用程序开发语言的开发者特征包括：

*   主要的工作单元是由 Python 的目录和元数据文件组成的，而不是单个 Python 文件

*   在发布之前有一个单独的构建步骤去预处理应用程序，即使是把它的这些文件一起打包进一个 Python sdist、wheel 或 zipapp 文档

*   是否有独立的安装步骤去预处理将要使用的应用程序，取决于应用程序是如何打包的，和支持的目标环境

*   外部的依赖直接在项目目录中的一个元数据文件中表示（比如，`pyproject.toml`、`requirements.txt`、`Pipfile`），或作为生成的发行包的一部分（比如，`setup.py`、`flit.ini`）

*   存在一个独立的测试套件，或者作为一个 Python API 的一个测试单元、功能接口的集成测试、或者是两者的一个结合

*   静态分析工具的使用是在项目级配置的，作为测试管理的一部分，而不是依赖

作为以上分类的一个结果，CPython 和标准库最终提供的主要用途是，在合适的 CPython 特性发布后3 - 5年，为教育和临时（ad hoc）的 Python 脚本环境的呈现的功能，定义重新分发的独立基准。

对于临时（ad hoc）脚本使用的情况，这个 3-5 年的延迟是由于新版本重分发给用户的延迟组成的，以及那些重分发版的用户花在修改他们的标准操作环境上的时间。

在教育环境中的情况，教育工作者需要一些时间去评估新特性，和决定是否将它们包含进提供给他们的学生的课程中。

### [这些相关问题的原因是什么?][19]

这篇文章很大程序上是受 Twitter 上 [我的评论][20] 的讨论鼓舞的，定义在 [PEP 411][21] 中引用临时（Provisional）的 API 的情形，作为一个开源项目发行的例子，一个真实的被邀请用户，作为共同开发者去积极参与设计和开发过程，而不是仅被动使用已准备好的最终设计。

这些回复包括一些在更高级别的库中支持的临时（Provisional） API 的一些相关的沮丧的表述，这些库没有临时（Provisional）状态的传递，以及因此而被限制为只有最新版本的临时（Provisional） API 支持这些相关特性，而不是任何的早期迭代版本。

我的 [主要反应][22] 是去建议，开源提供者应该努力加强他们需要的有限支持，以加强他们的维护工作的可持续性。这意味着，如果支持老版本的临时（Provisional） API 是非常痛苦的，然后，只有项目开发人员自己需要时，或者，有人为此支付费用时，他们才会去提供支持。这类似于我的观点，志愿者提供的项目是否应该免费支持老的商业的长周期支持的 Python 发行版，这对他们来说是非常麻烦的事，我[不认他们应该去做][23]，正如我所期望的那样，大多数这样的需求都来自于管理差劲的习以为常的惯性，而不是真正的需求（真正的需求，它应该去支付费用来解决问题）

然而，我的[第二个反应][24]是，去认识到这一点，尽管多年来一直在讨论这个问题（比如，在上面链接中 2011 的一篇年的文章中，以及在 Python 3 问答的回答中 [在这里][25]、[这里][26]、和[这里][27]，和在去年的 [Python 包生态系统][28]上的一篇文章中的一小部分)，我从来没有真实尝试直接去解释过它对标准库设计过程中的影响。

如果没有这些背景，设计过程中的一些方面，如临时（Provisional） API 的介绍，或者是受到不同的启发（inspired-by-not-the-same-as）的介绍，看起来似乎是很荒谬的，因为它们似乎是在试图标准化 API，而实际上并没有对 API 进行标准化。

### [适合进入 PyPI 规划的方面有哪些？][29]

提交给 python-ideas 或 python-dev 的_任何_建议的第一个门槛就是，清楚地回答这个问题，“为什么 PyPI 上的一个模块不够好？”。绝大多数的建议都在这一步失败了，但通过他们得到了几个共同的主题：

*   大多数新手可能经常是从互联网上去 “复制粘贴” 错误的建议，而不是去下载一个合适的第三方库。（比如，这就是为什么存在 `secrets` 库的原因：使得很少的人去使用 `random` 模块，因为安全敏感的原因，这是用于游戏和统计模拟的）

*   这个模块是用于提供一个实现的参考，并去允许与其它的相互竞争的实现之间提供互操作性，而不是对所有人的所有事物都是必要的。（比如，`asyncio`、`wsgiref`、`unittest`、和 `logging` 全部都是这种情况）

*   这个模块是用于标准库的其它部分（比如，`enum` 就是这种情况，像`unittest`一样）

*   这个模块是被设计去支持语言之外的一些语法（比如，`contextlib`、`asyncio` 和 `typing` 模块，就是这种情况）

*   这个模块只是普通的临时（ad hoc）脚本用途（比如，`pathlib` 和 `ipaddress` 就是这种情况）

*   这个模块被用于一个教育环境（比如，`statistics` 模块允许进行交互式地探索统计的概念，尽管你不会用它来做全部的统计分析）

通过前面的 “PyPI 是不是明显不够好” 的检查，一个模块还不足以确保被接收到标准库中，但它已经足够转变问题为 “在接下来的几年中，你所推荐的要包含的库能否对一般的 Python 开发人员的经验有所改提升？”

标准库中的 `ensurepip` 和 `venv` 模块的介绍也明确地告诉分发者，我们期望的 Python 级别的打包和安装工具在任何平台的特定分发机制中都予以支持。

### [当增加它到标准库中时，为什么一些 APIs 会被改变？][30]

现在已经存在的第三方模块有时候会被批量地采用到标准库中，在其它情况下，实际上增加进行的是重新设计和重新实现的 API，只是它参照了现有 API 的用户体验，但是，根据另外的设计参考，删除或修改了一些细节，和附属于语言参考实现部分的权限。

例如，不像广受欢迎的第三方库的前身 `path.py`，`pathlib` 并_不_规定字符串子类，而是独立的类型。作为解决文件互操作性问题的结果，是定义了文件系统路径协议，它允许与文件系统路径一起使用的接口，去使用更大范围的对象。

为 `ipaddress` 模块设计的 API 是为教学 IP 地址概念，从定义的地址和网络中，为显式的单独主机接口调整的（IP 地址关联到特定的 IP 网络)，为了提供一个最佳的教学工具，而最原始的 “ipaddr” 模块中，使用网络术语的方式不那么严谨。

在其它情况下，标准库被构建为多种现有方法的一个综合，而且，还有可能依赖于定义现有库的 API 时不存在的特性。应用于 `asyncio` 和 `typing` 模块的所有的这些考虑，虽然后来考虑适用于 `dataclasses` 的 API 被认为是 PEP 557 （它可以被总结为 “像属性一样，但是使用变量注释作为字段声明”）。

这类改变的工作原理是，这类库不会消失，而且，它们的维护者经常并不关心与标准库相关的限制（特别是，相对缓慢的发行节奏）。在这种情况下，对于标准库版本的文档来说，使用 “See Also” 链接指向原始模块是很常见的，特别是，如果第三方版本提供了标准库模块中忽略的其他特性和灵活性时。

### [为什么一些 API 是以临时（provisional）的形式被增加的？][31]

虽然 CPython 确实设置了 API 的弃用策略，但我们通常不希望在没有令人信服的理由的情况下去使用它（在其他项目试图与 Python 2.7 保持兼容性时，尤其如此）。

然而，当增加一个受已有的第三方启发去设计的而不是去拷贝的新的 API 时，在设计实践中，有些设计实践可能会出现问题，这比平常的风险要高。

当我们考虑这种改变的风险比平常要高，我们将相关的 API 标记为临时（provisional），表示保守的终端用户可以希望避免完全依赖他们，并且，共享抽象层的开发者可能希望考虑，对他们准备支持的临时（provisional） API 的版本实施比平时更严格的限制。

### [为什么只有一些标准库 APIs 被升级？][32]

这里简短的回答升级的主要 APIs 有哪些？：

*   不适合外部因素驱动的补充更新

*   无论是临时（ad hoc）脚本使用情况，还是为促进将来的多个第三方解决方案之间的互操作性，都有明显好外的

*   对这方面感兴趣的人提交了一个可接受的建议

如果一个用于应用程序开发的模块存在一个非常明显的限制（limitations），比如，`datetime`，如果重分发版通过替代一个现成的第三方模块有所改善，比如，`requests`，或者，如果标准库的发布节奏与需要的有问题的包之间有真正的冲突，比如，`certifi`，那么，计划对标准库版本进行改变的因素将显著减少。

从本质上说，这和关于 PyPI 上面的问题是相反的：因为，PyPI 分发机制对增强应用程序开发人员经验来说，通常_是_足够好的，这样的改进是有意义的，允许重分发者和平台提供者自行决定将哪些内容作为缺省提供的一部分。

当改变后的能力（capabilities）假设在 3-5 年内缺省出现时被认为是有价值的，才会将这些改变进入到 CPython 和标准库中。

### [标准库任何部分都有独立的版本吗？][33]

是的，它就像是 `ensurepip` 使用的捆绑模式( CPython 发行了一个 `pip` 的最新捆绑版本，而并没有把它放进标准库中），将来可能被应用到其它模块中。

最有可能的第一个候选者是 `distutils` 构建系统，因为切换到这种模式将允许构建系统在多个发行版本之间保持一致。

这种处理方式的其它可能的候选对象是 Tcl/Tk graphics 捆绑和 IDLE 编辑器，它们已经被拆分，并且通过一些重分发程序转换成安装可选项。

### [这些注意事项为什么很重要？][34]

从本质上说，那些积极参与开源开发的人就是那些致力于开源应用程序和共享抽象层的人。

写一些临时（ad hoc）脚本和为学生设计一些教学习题的人，通常不会认为他们是软件开发人员 —— 他们是教师、系统管理员、数据分析人员、金融工程师、流行病学家、物理学家、生物学家、商业分析师、动画师、架构设计师、等等。

当所有我们的担心是，语言是开发人员的经验时，那么，我们可以简单假设人们知道一些什么，他们使用的工具，所遵循的开发流程，以及构建和部署他们软件的方法。

当一个应用程序运行时（runtime），_也_作为一个脚本引擎广为流行时，事情将变的更加复杂。在一个项目中去平衡两种需求，就会导致双方的不理解和怀疑，做任何一件事都将变得很困难。

这篇文章不是为了说，我们在开发 CPython 过程中从来没有做出过不正确的决定 —— 它只是指出添加到 Python 标准库中的看上去很荒谬的特性的最合理的反应（reaction），它将是 “我不是那个特性的预期目标受众的一部分”，而不是 “我对它没有兴趣，因此，它对所有人都是毫无用处和没有价值的，添加它纯属骚扰我”。

--------------------------------------------------------------------------------

via: http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html

作者：[Nick Coghlan ][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.curiousefficiency.org/pages/about.html
[1]:https://aca.edu.au/#home-unpack
[2]:https://github.com/barbagroup/AeroPython
[3]:https://nbviewer.jupyter.org/urls/bitbucket.org/ncoghlan/misc/raw/default/notebooks/Digital%20Blasphemy.ipynb
[4]:https://github.com/pjf/rickastley
[5]:https://github.com/python/core-workflow
[6]:http://www.vfxplatform.com/
[7]:http://www.curiousefficiency.org/posts/2015/10/languages-to-improve-your-python.html#broadening-our-horizons
[8]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#use-cases-for-python-s-reference-interpreter
[9]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#which-audience-does-cpython-primarily-serve
[10]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#why-is-this-relevant-to-anything
[11]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#where-does-pypi-fit-into-the-picture
[12]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#why-are-some-apis-changed-when-adding-them-to-the-standard-library
[13]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#why-are-some-apis-added-in-provisional-form
[14]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#why-are-only-some-standard-library-apis-upgraded
[15]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#will-any-parts-of-the-standard-library-ever-be-independently-versioned
[16]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#why-do-these-considerations-matter
[17]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#id1
[18]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#id2
[19]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#id3
[20]:https://twitter.com/ncoghlan_dev/status/916994106819088384
[21]:https://www.python.org/dev/peps/pep-0411/
[22]:https://twitter.com/ncoghlan_dev/status/917092464355241984
[23]:http://www.curiousefficiency.org/posts/2015/04/stop-supporting-python26.html
[24]:https://twitter.com/ncoghlan_dev/status/917088410162012160
[25]:http://python-notes.curiousefficiency.org/en/latest/python3/questions_and_answers.html#wouldn-t-a-python-2-8-release-help-ease-the-transition
[26]:http://python-notes.curiousefficiency.org/en/latest/python3/questions_and_answers.html#doesn-t-this-make-python-look-like-an-immature-and-unstable-platform
[27]:http://python-notes.curiousefficiency.org/en/latest/python3/questions_and_answers.html#what-about-insert-other-shiny-new-feature-here
[28]:http://www.curiousefficiency.org/posts/2016/09/python-packaging-ecosystem.html
[29]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#id4
[30]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#id5
[31]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#id6
[32]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#id7
[33]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#id8
[34]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#id9
[35]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#
[36]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#disqus_thread
[37]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.rst
[38]:http://www.curiousefficiency.org/posts/2011/04/musings-on-culture-of-python-dev.html
[39]:http://community.redhat.com/blog/2015/02/the-quid-pro-quo-of-open-infrastructure/
[40]:http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html#
