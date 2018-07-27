盘点 Python 的目标受众
============================================================

Python 是为谁设计的？

*   [Python 的参考解析器使用情况][8]
*   [CPython 主要服务于哪些受众？][9]
*   [这些相关问题的原因是什么?][10]
*   [适合进入 PyPI 规划的方面有哪些？][11]
*   [当添加它们到标准库中时，为什么一些 API 会被改变？][12]
*   [为什么一些 API 是以<ruby>临时<rt>provisional</rt></ruby>的形式被添加的？][13]
*   [为什么只有一些标准库 API 被升级？][14]
*   [标准库任何部分都有独立的版本吗？][15]
*   [这些注意事项为什么很重要？][16]

几年前，我在 python-dev 邮件列表中，以及在活跃的 CPython 核心开发人员和认为参与这一过程不是有效利用他们个人时间和精力的人中[强调][38]说，“CPython 的发展太快了也太慢了”是很多冲突的原因之一。

我一直认为事实确实如此，但这也是一个要点，在这几年中我也花费了一些时间去反思它。在我写那篇文章的时候，我还在<ruby>波音防务澳大利亚公司<rt>Boeing Defence Australia</rt></ruby>工作。下个月，我将离开波音进入<ruby>红帽亚太<rt>Red Hat Asia-Pacific</rt></ruby>，并且开始在大企业的[开源供应链管理][39]上获得<ruby>再分发者<rt>redistributor</rt></ruby>层面的视角。

### Python 的参考解析器使用情况

我尝试将 CPython 的使用情况分解如下，它虽然有些过于简化（注意，这些分类的界线并不是很清晰，他们仅关注于思考新软件特性和版本发布后不同因素的影响）：

*   教育类：教育工作者的主要兴趣在于建模方法的教学和计算操作方面，_不会去_ 写或维护生产级别的软件。例如：
    *   澳大利亚的 [数字课程][1]
    *   Lorena A. Barba 的 [AeroPython][2]
*   个人级的自动化和爱好者的项目：主要的是软件，而且经常是只有软件，用户通常是写它的人。例如：
    *   my Digital Blasphemy [图片下载器][3]
    *   Paul Fenwick 的 (Inter)National [Rick Astley Hotline][4]
*   <ruby>组织<rt>organisational</rt></ruby>过程自动化：主要是软件，而且经常是只有软件，用户是为了利益而编写它的组织。例如：
    *   CPython 的 [核心工作流工具][5]
    *   Linux 发行版的开发、构建 & 发行管理工具
*   “<ruby>一劳永逸<rt>Set-and-forget</rt></ruby>” 的基础设施中：这里是软件，（这种说法有时候有些争议），在生命周期中该软件几乎不会升级，但是，在底层平台可能会升级。例如：
    *   大多数的自我管理的企业或机构的基础设施（在那些资金充足的可持续工程计划中，这种情况是让人非常不安的）
    *   拨款资助的软件（当最初的拨款耗尽时，维护通常会终止）
    *   有严格认证要求的软件（如果没有绝对必要的话，从经济性考虑，重新认证比常规更新来说要昂贵很多）
    *   没有自动升级功能的嵌入式软件系统
*   持续升级的基础设施：具有健壮支撑的工程学模型的软件，对于依赖和平台升级通常是例行的，而不去关心其它的代码改变。例如：
    *   Facebook 的 Python 服务基础设施
    *   滚动发布的 Linux 分发版
    *   大多数的公共 PaaS 无服务器环境（Heroku、OpenShift、AWS Lambda、Google Cloud Functions、Azure Cloud Functions等等）
*   间隔性升级的标准的操作环境：对其核心组件进行常规升级，但这些升级以年为单位进行，而不是周或月。例如：
    *   [VFX 平台][6]
    *   长周期支持的 Linux 分发版
    *   CPython 和 Python 标准库
    *   基础设施管理 & 编排工具（比如 OpenStack、 Ansible）
    *   硬件控制系统
*   短生命周期的软件：软件仅被使用一次，然后就丢弃或忽略，而不是随后接着升级。例如：
    *   <ruby>临时<rt>Ad hoc</rt></ruby>自动脚本
    *   被确定为 “终止” 的单用户游戏（你玩它们一次后，甚至都忘了去卸载它，或许在一个新的设备上都不打算再去安装它）
    *   短暂的或非持久状态的单用户游戏（如果你卸载并重安装它们，你的游戏体验也不会有什么大的变化）
    *   特定事件的应用程序（这些应用程序与特定的物理事件捆绑，一旦事件结束，这些应用程序就不再有用了）
*   频繁使用的应用程序：部署后定期升级的软件。例如：
    *   业务管理软件
    *   个人 & 专业的生产力应用程序（比如，Blender）
    *   开发工具 & 服务（比如，Mercurial、 Buildbot、 Roundup）
    *   多用户游戏，和其它明显的处于持续状态的还没有被定义为 “终止” 的游戏
    *   有自动升级功能的嵌入式软件系统
*   共享的抽象层：在一个特定的问题领域中，设计用于让工作更高效的软件组件。即便是你没有亲自掌握该领域的所有错综复杂的东西。例如：
    *   大多数的运行时库和归入这一类的框架（比如，Django、Flask、Pyramid、SQL Alchemy、NumPy、SciPy、requests)
    *   适合归入这一类的许多测试和类型推断工具（比如，pytest、Hypothesis、vcrpy、behave、mypy）
    *   其它应用程序的插件（比如，Blender plugins、OpenStack hardware adapters）
    *   本身就代表了 “Python 世界” 基准的标准库（那是一个 [难以置信的复杂][7] 的世界观）

### CPython 主要服务于哪些受众？

从根本上说，CPython 和标准库的主要受众是哪些呢，是那些不管出于什么原因，将有限的标准库和从 PyPI 显式声明安装的第三方库组合起来所提供的服务，还不能够满足需求的那些人。

为了更进一步简化上面回顾的不同用法和部署模型，尽可能的总结，将最大的 Python 用户群体分开来看，一种是，在一些感兴趣的环境中将 Python 作为一种_脚本语言_使用的那些人；另外一种是将它用作一个_应用程序开发语言_的那些人，他们最终发布的是一种产品而不是他们的脚本。

把 Python 作为一种脚本语言来使用的开发者的典型特性包括：

*   主要的工作单元是由一个 Python 文件组成的（或 Jupyter notebook !)，而不是一个 Python 和元数据文件的目录
*   没有任何形式的单独的构建步骤 —— 是_作为_一个脚本分发的，类似于分发一个独立的 shell 脚本的方式
*   没有单独的安装步骤（除了下载这个文件到一个合适的位置），除了在目标系统上要求预配置运行时环境外
*   没有显式的规定依赖关系，除了最低的 Python 版本，或一个预期的运行环境声明。如果需要一个标准库以外的依赖项，他们会通过一个环境脚本去提供（无论是操作系统、数据分析平台、还是嵌入 Python 运行时的应用程序）
*   没有单独的测试套件，使用“通过你给定的输入，这个脚本是否给出了你期望的结果?” 这种方式来进行测试
*   如果在执行前需要测试，它将以 “试运行” 和 “预览” 模式来向用户展示软件_将_怎样运行
*   如果可以完全使用静态代码分析工具，它是通过集成进用户的软件开发环境的，而不是为个别的脚本单独设置的。

相比之下，使用 Python 作为一个应用程序开发语言的开发者特征包括：

*   主要的工作单元是由 Python 和元数据文件组成的目录，而不是单个 Python 文件
*   在发布之前有一个单独的构建步骤去预处理应用程序，哪怕是把它的这些文件一起打包进一个 Python sdist、wheel 或 zipapp 文档中
*   是否有独立的安装步骤去预处理将要使用的应用程序，取决于应用程序是如何打包的，和支持的目标环境
*   外部的依赖明确表示为项目目录中的一个元数据文件中，要么是直接在项目的目录中（比如，`pyproject.toml`、`requirements.txt`、`Pipfile`），要么是作为生成的发行包的一部分（比如，`setup.py`、`flit.ini`）
*   存在一个独立的测试套件，或者作为一个 Python API 的一个单元测试，或者作为功能接口的集成测试，或者是两者的一个结合
*   静态分析工具的使用是在项目级配置的，并作为测试管理的一部分，而不是取决于环境

作为以上分类的一个结果，CPython 和标准库的主要用途是，在相应的 CPython 特性发布后，为教育和<ruby>临时<rt>ad hoc</rt></ruby>的 Python 脚本环境，最终提供的是定义重分发者假定功能的独立基准 3- 5 年。

对于<ruby>临时<rt>ad hoc</rt></ruby>脚本使用的情况，这个 3 - 5 年的延迟是由于重分发者给用户制作新版本的延迟造成的，以及那些重分发版本的用户们花在修改他们的标准操作环境上的时间。

在教育环境中的情况是，教育工作者需要一些时间去评估新特性，和决定是否将它们包含进提供给他们的学生的课程中。

### 这些相关问题的原因是什么？

这篇文章很大程度上是受 Twitter 上对 [我的这个评论][20] 的讨论鼓舞的，它援引了定义在 [PEP 411][21] 中<ruby>临时<rt>Provisional</rt></ruby> API 的情形，作为一个开源项目的例子，对用户发出事实上的邀请，请其作为共同开发者去积极参与设计和开发过程，而不是仅被动使用已准备好的最终设计。

这些回复包括一些在更高级别的库中支持临时 API 的困难程度的一些沮丧性表述、没有这些库做临时状态的传递、以及因此而被限制为只有临时 API 的最新版本才支持这些相关特性，而不是任何早期版本的迭代。

我的 [主要回应][22] 是，建议开源提供者应该强制实施有限支持，通过这种强制的有限支持可以让个人的维护努力变得可持续。这意味着，如果对临时 API 的老版本提供迭代支持是非常痛苦的，到那时，只有在项目开发人员自己需要、或有人为此支付费用时，他们才会去提供支持。这与我的这个观点是类似的，那就是，志愿者提供的项目是否应该免费支持老的、商业性质的、长周期的 Python 版本，这对他们来说是非常麻烦的事，我[不认为他们应该去做][23]，正如我所期望的那样，大多数这样的需求都来自于管理差劲的、习以为常的惯性，而不是真正的需求（真正的需求，应该去支付费用来解决问题）。

而我的[第二个回应][24]是去实现这一点，尽管多年来一直在讨论这个问题（比如，在上面链接中最早在 2011 年的一篇的文章中，以及在 Python 3 问答的回复中的 [这里][25]、[这里][26]、和[这里][27]，以及去年的这篇文章 [Python 包生态系统][28] 中也提到了一些)，但我从来没有真实地尝试直接去解释它在标准库设计过程中的影响。

如果没有这些背景，设计过程中的一部分，比如临时 API 的引入，或者是<ruby>受启发而不同于它<rt>inspired-by-not-the-same-as</rt></ruby>的引入，看起来似乎是完全没有意义的，因为他们看起来似乎是在尝试对 API 进行标准化，而实际上并没有。

### 适合进入 PyPI 规划的方面有哪些？

提交给 python-ideas 或 python-dev 的_任何_建议所面临的第一个门槛就是清楚地回答这个问题：“为什么 PyPI 上的一个模块不够好？”。绝大多数的建议都在这一步失败了，为了通过这一步，这里有几个常见的话题：

*   与其去下载一个合适的第三方库，新手一般可能更倾向于从互联网上 “复制粘贴” 错误的指导。（比如，这就是为什么存在 `secrets` 库的原因：它使得人们很少去使用 `random` 模块，由于安全敏感的原因，它预期用于游戏和统计模拟的）
*   这个模块是打算去提供一个实现的参考，并允许与其它的相互竞争的实现之间提供互操作性，而不是对所有人的所有事物都是必要的。（比如，`asyncio`、`wsgiref`、`unittest`、和 `logging` 全部都是这种情况）
*   这个模块是预期用于标准库的其它部分（比如，`enum` 就是这种情况，像`unittest`一样）
*   这个模块是被设计去支持语言之外的一些语法（比如，`contextlib`、`asyncio` 和 `typing` 模块，就是这种情况）
*   这个模块只是普通的临时的脚本用途（比如，`pathlib` 和 `ipaddress` 就是这种情况）
*   这个模块被用于一个教育环境（比如，`statistics` 模块允许进行交互式地探索统计的概念，尽管你可能根本就不会用它来做全部的统计分析）

通过前面的 “PyPI 是不是明显不够好” 的检查，一个模块还不足以确保被接收到标准库中，但它已经足以转变问题为 “在接下来的几年中，你所推荐的要包含的库能否对一般的入门级 Python 开发人员的经验有所提升？”

标准库中的 `ensurepip` 和 `venv` 模块的引入也明确地告诉再分发者，我们期望的 Python 级别的打包和安装工具在任何平台的特定分发机制中都予以支持。

### 当添加它们到标准库中时，为什么一些 API 会被改变？

现在已经存在的第三方模块有时候会被批量地采用到标准库中，在其它情况下，实际上添加的是吸收了用户对现有 API 体验之后，进行重新设计和重新实现的 API，但是，会根据另外的设计考虑和已经成为其中一部分的语言实现参考来进行一些删除或细节修改。

例如，不像广受欢迎的第三方库的前身 `path.py`，`pathlib` 并_没有_定义字符串子类，而是以独立的类型替代。作为解决文件互操作性问题的结果，定义了文件系统路径协议，它允许使用文件系统路径的接口去使用更多的对象。

为了在“IP 地址” 这个概念的教学上提供一个更好的工具，为 `ipaddress` 模块设计的 API，将地址和网络的定义调整为显式的、独立定义的主机接口（IP 地址被关联到特定的 IP 网络)，而最原始的 `ipaddr` 模块中，在网络术语的使用方式上不那么严格。

另外的情况是，标准库将综合多种现有的方法的来构建，以及为早已存在的库定义 API 时，还有可能依靠不存在的语法特性。比如，`asyncio` 和 `typing` 模块就全部考虑了这些因素，虽然在 PEP 557 中正在考虑将后者所考虑的因素应用到 `dataclasses` API 上。（它可以被总结为 “像属性一样，但是使用可变注释作为字段声明”）。

这类改变的原理是，这类库不会消失，并且它们的维护者对标准库维护相关的那些限制通常并不感兴趣（特别是，相对缓慢的发行节奏）。在这种情况下，在标准库文档的更新版本中，很常见的做法是使用 “See Also” 链接指向原始模块，尤其是在第三方版本提供了额外的特性以及标准库模块中忽略的那些特性时。

### 为什么一些 API 是以临时的形式被添加的？

虽然 CPython 维护了 API 的弃用策略，但在没有正当理由的情况下，我们通常不会去使用该策略（在其他项目试图与 Python 2.7 保持兼容性时，尤其如此）。

然而在实践中，当添加这种受已有的第三方启发而不是直接精确拷贝第三方设计的新 API 时，所承担的风险要高于一些正常设计决定可能出现问题的风险。

当我们考虑这种改变的风险比平常要高，我们将相关的 API 标记为临时，表示保守的终端用户要避免完全依赖它们，而共享抽象层的开发者可能希望，对他们准备去支持的那个临时 API 的版本，考虑实施比平时更严格的限制。

### 为什么只有一些标准库 API 被升级？

这里简短的回答得到升级的主要 API 有哪些？：

*   不太可能有大量的外部因素干扰的附加更新
*   无论是对临时脚本使用案例还是对促进将来多个第三方解决方案之间的互操作性，都有明显好处的
*   对这方面感兴趣的人提交了一个可接受的建议

如果一个用于应用程序开发的模块存在一个非常明显的限制，比如，`datetime`，如果重分发者通过可供替代的第三方选择很容易地实现了改善，比如，`requests`，或者，如果标准库的发布节奏与所需要的包之间真的存在冲突，比如，`certifi`，那么，建议对标准库版本进行改变的因素将显著减少。

从本质上说，这和上面的关于 PyPI 问题正好相反：因为，从应用程序开发人员体验改善的角度来说，PyPI 分发机制通常_是_足够好的，这种分发方式的改进是有意义的，允许重分发者和平台提供者自行决定将哪些内容作为他们缺省提供的一部分。

假设在 3-5 年时间内，缺省出现了被认为是改变带来的可感知的价值时，才会将这些改变纳入到 CPython 和标准库中。

### 标准库任何部分都有独立的版本吗？

是的，它就像是 `ensurepip` 使用的捆绑模式（CPython 发行了一个 `pip` 的最新捆绑版本，而并没有把它放进标准库中），将来可能被应用到其它模块中。

最有可能的第一个候选者是 `distutils` 构建系统，因为切换到这种模式将允许构建系统在多个发行版本之间保持一致。

这种处理方式的其它的可能候选者是 Tcl/Tk 图形捆绑和 IDLE 编辑器，它们已经被拆分，并且通过一些重分发程序转换成可选安装项。

### 这些注意事项为什么很重要？

从本质上说，那些积极参与开源开发的人就是那些致力于开源应用程序和共享抽象层的人。

那些写一些临时脚本或为学生设计一些教学习题的人，通常不认为他们是软件开发人员 —— 他们是教师、系统管理员、数据分析人员、金融工程师、流行病学家、物理学家、生物学家、商业分析师、动画师、架构设计师等等。

对于一种语言，当我们全部的担心都是开发人员的经验时，那么我们就可以根据人们所知道的内容、他们使用的工具种类、他们所遵循的开发流程种类、构建和部署他们软件的方法等假定，来做大量的简化。

当一个应用程序运行时（runtime），_也_作为一个脚本引擎广为流行时，事情将变的更加复杂。在同一个项目中去平衡两种受众的需求，将就会导致双方的不理解和怀疑，做任何一件事都将变得很困难。

这篇文章不是为了说，我们在开发 CPython 过程中从来没有做出过不正确的决定 —— 它只是去合理地回应那些对添加到 Python 标准库中的看上去很荒谬的特性的质疑，它将是 “我不是那个特性的预期目标受众的一部分”，而不是 “我对它没有兴趣，因此它对所有人都是毫无用处和没有价值的，添加它纯属骚扰我”。

--------------------------------------------------------------------------------

via: http://www.curiousefficiency.org/posts/2017/10/considering-pythons-target-audience.html

作者：[Nick Coghlan][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

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
