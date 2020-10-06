[#]: collector: "lujun9972"
[#]: translator: "lxbwolf"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "
[#]: subject: "Automate testing for website errors with this Python tool"
[#]: via: "https://opensource.com/article/20/7/seodeploy"
[#]: author: "JR Oakes https://opensource.com/users/jroakes"

使用这个 Python 工具对网站错误进行自动化测试
======
SEODeploy 可以帮助我们在网站部署之前识别出 SEO 问题。
![Computer screen with files or windows open][1]

作为一个有技术的搜索引擎优化开发者，我经常被请来协助做网站迁移、新网站启动、分析实现和一些其他影响网站线上可视性和控制风险的测量方法的工作。很多公司从用户通过搜索引擎查到他们的产品和服务这个途径每月都能获得大量的收入。虽然搜索引擎已经能妥善地处理没有被很好地格式化的代码，但是在开发过程中影响搜索引擎索引和用户展示页的问题还是会发生。

我曾经也尝试通过评审各阶段会破坏SEO（<ruby>搜索引擎优化<rt>search engine optimization</rt></ruby>）的问题来手动降低这种风险。我的团队最终查到的结果，决定该项目是否可以上线。但这个过程通常很低效，只能依靠有限的几个页面，且人工极易出错。

长期以来，这个行业一直在寻找可用且值得信赖的方式，在开发者和搜索引擎优化者可以指定必须测试的内容的前提下进行自动化测试。这是非常重要的，因为这些组在开发过程中优先级通常会发生冲突，搜索引擎优化者提交修改的同时，开发者也需要进行回归测试和控制预期之外的情况。

### 常见的破坏 SEO 的问题

我见过的很多网站有成千上万的页面，甚至上百万。实在令人费解，为什么一个开发过程中的改动能影响这么多页面。在 SEO 的世界中， Google 或其他搜索引擎展示你的页面时，一个非常微小和看起来无关紧要的修改也可能导致全网站范围的变化。在部署到生产环境之前，必须要处理这类错误。

下面是我去年见过的几个例子。

#### 偶发的 noindex

我们用的一个专用的第三方 SEO 监控工具，[ContentKing][2]，在部署到生产环境之后马上发现了这个问题。这个错误很隐蔽，因为在 HTML 中是不可见的，确切地说，它隐藏在服务器响应头里，但它能很快导致搜索不可见。


```
HTTP/1.1 200 OK
Date: Tue May 25 2010 21:12:42 GMT
[...]
X-Robots-Tag: noindex
[...]
```

#### canonical 小写

上线时错误地把整个网站的 [canonical 标签元素][3]全改成小写了。这个改动影响了接近 30000 个 URL。在修改之前，所有的 URL 大小写都正常（例如，`URL-Path`）。这之所以是个问题是因为 canonical 标签元素是用来给 Google 提示一个网页真实的 canonical URL 版本的。这个改动导致很多 URL 被从 Google 的索引中移除并用小写（`/url-path`）重新建立索引。影响范围是流量损失了 10% 到 15%，也污染了未来几个星期的网页监控数据。

#### origin 的退化

一个有复杂、React 的奇特实现的网站有个神奇的问题，`origin.domain.com` URL 退化为显示原始的内容交付网络服务器。它会间歇性地显示原始的主机而不是网站元数据中的边缘主机（如 canonical 标签元素、URL 和 Open Graph 标签）。这个问题在原始的 HTML 和渲染后的 HTML 中都存在。这个问题影响搜索的可见度和在社交媒体上分享的质量。

###  SEODeploy 介绍

SEO 通常使用差异测试工具来检测渲染后和原始的 HTML 的差异。差异测试是很理想的，因为它避免了肉眼测试的不确定性。你希望检查 Google 对你的页面的渲染过程的不同，而不是检查用户对你页面的渲染。你希望查看下原始的 HTML 是什么样的，而不是渲染后的 HTML，因为 Google 的渲染过程是有独立的两个阶段的。

这导致我和我的同事创造了 [SEODeploy][4] 这个“在部署流水线中用于自动化 SEO 测试的 Python 库。”我们的使命是：

> 开发一个工具，让开发者能通过修改 URL 路径在生产环境和分阶段的主机上进行差异测试，尤其是对 SEO 相关数据的非预期的退化的测试。

SEODeploy 的机制很简单：提供一个每行内容都是 URL 路径的文本文件，SEODeploy 对那些路径跑一系列的模块，对比生产环境和保存的 URL，把检测到的所有的错误和改动信息报告出来。

![SEODeploy overview][5]

(SEODeploy, [CC BY-SA 4.0][6])

这个工具及其模块可以用一个 YAML 文件来配置，在可预期的范围内可以自定义。

![SEODeploy output][7]

(SEODeploy, [CC BY-SA 4.0][6])

最初的发布版本包含下面的的核心功能和概念：

  1. **开源**：我们坚信分享代码可以被大家评论、改进、扩展、分享和复用。
  2. **模块化**：Web 开发中有很多边界条件。SEODeploy 工具在概念上很简单，因此模块化用来控制复杂性。我们提供了两个建好的模块和一个实例模块来简述基本结构。
  3. **URL 抽样：**由于它不是对所有 URL 都是可行和有效的，因此我们引入了一种随机抽取 XML 网站地图 URL 或被 ContentKing 监控的 URL 作为样本的方法。
  4. **灵活的差异检测**：Web 数据是凌乱的。无论被检测的数据是什么类型（如 延伸文件系统、数组或列表、JSON 对象或字典、整数、浮点数等等），差异检测功能都会尝试将这些数据转换为差异信息。
  5. **自动化**: 你可以在命令行来调用抽样和运行方法，将 SEODeploy 融合到已有的流水线也很简单。



### 模块

虽然核心功能很简单，但在设计上，SEODeploy 的强大功能和复杂度体现在模块上。模块用来处理获取、清理和组织暂存区和生产服务器上的数据来作对比时难度更大的任务。

#### Headless 模块

[Headless 模块][8] 是为那些从库里获取数据时不想为第三方服务付费的开发者准备的。它可以在任意版本的 Chrome 上运行，会从每组用来比较的 URL 中提取渲染的数据。

headless 模块会提取下面的核心数据用来比较：

  1. SEO 内容，如 标题、头、标签等等。
  2. Performance data from the Chrome Timings and Chrome DevTools Protocol (CDP) Performance APIs从Chrome 读写周期和 CDP（<ruby>Chrome 开发工具协议<rt>Chrome DevTools Protocol</rt></ruby>）性能 API 中提取性能数据
  3. 经过计算的性能监控，包括 CLS，一项由 Google 最近发布的很受欢迎的 [Web 核心数据][9]
  4. 从 CDP 覆盖率 API 获取的 CSS 和 JavaScript 的覆盖率数据



这个模块引入了处理暂存区、网络速度预设（为了让对比更规范化）等功能，也引入了一个处理在暂存的对比数据中替换临时主机的方法。开发者也能很容易地扩展这个模块，来获取他们想对任意网页进行对比的数据。

#### 其他模块

我们为开发者创建了一个[示例模块][10]，开发者可以参照它来使用框架创建一个自定义的提取模块。这个示例模块也是与 ContentKing 结合的。ContentKing 模块需要订阅 ContentKing，Headless 可以在所有能运行 Chrome 的机器上运行。

### 需要解决的问题

我们有扩展和强化工具库的[计划][11]，但是我们看到了开发者们对于能满足和不能满足他们需求的[反馈][12]。我们正在解决的问题和条目有：

  1. 对于某些对比元素（尤其是 schema），动态时间戳产生假阳性。
  2. 把测试数据保存到数据库，以便查看部署历史以及与上次暂存的推送进行差异测试。
  3. 借助渲染相关的云基础设施强化提取的精度和速度。
  4. 把测试覆盖率从现在的 46% 提高到 99% 以上。
  5. 目前，我们依赖 [Poetry][13] 进行部署管理，但我们希望发布一个 PyPl 库，这样就可以用 `pip install` 轻松安装。
  6. 我们还在关注更多使用时的问题和相关数据。



### 开始使用

这个项目在 [GitHub][4] 上，我们对大部分功能都提供了 [文档][14]。

我们希望你能克隆 SEODeploy 并为其贡献代码。我们的目标是通过这个由技术精湛的搜索引擎优化开发者开发的、经过开发者和工程师们认证的工具来为开源作贡献。我们都见过验证复杂的暂存问题需要多长时间，也都见过大量 URL 的微小改动能有什么样的商业影响。我们认为这个库可以节省时间、为开发团队降低部署过程中的风险。

If you have questions, issues, or want to contribute, please see the project's [About page][15].如果你有问题或者想提交代码，请查看项目的[关于][15]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/seodeploy

作者：[JR Oakes][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jroakes
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_screen_windows_files.png?itok=kLTeQUbY "Computer screen with files or windows open"
[2]: https://www.contentkingapp.com/
[3]: https://en.wikipedia.org/wiki/Canonical_link_element
[4]: https://github.com/locomotive-agency/SEODeploy
[5]: https://opensource.com/sites/default/files/uploads/seodeploy.png "SEODeploy overview"
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://opensource.com/sites/default/files/uploads/seodeploy_output.png "SEODeploy output"
[8]: https://locomotive-agency.github.io/SEODeploy/modules/headless/
[9]: https://web.dev/vitals/
[10]: https://locomotive-agency.github.io/SEODeploy/modules/creating/
[11]: https://locomotive-agency.github.io/SEODeploy/todo/
[12]: https://locomotive-agency.github.io/SEODeploy/about/#contact
[13]: https://python-poetry.org/
[14]: https://locomotive-agency.github.io/SEODeploy/
[15]: https://locomotive-agency.github.io/SEODeploy/about/
