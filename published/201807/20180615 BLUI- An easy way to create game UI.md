BLUI：创建游戏 UI 的简单方法
======

> 开源游戏开发插件运行虚幻引擎的用户使用基于 Web 的编程方式创建独特的用户界面元素。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/gaming_plugin_blui_screenshot.jpg?itok=91nnYCt_)

游戏开发引擎在过去几年中变得越来越易于​​使用。像 Unity 这样一直免费使用的引擎，以及最近从基于订阅的服务切换到免费服务的<ruby>虚幻引擎<rt>Unreal Engine</rt></ruby>，允许独立开发者使用 AAA 发行商相同达到行业标准的工具。虽然这些引擎都不是开源的，但每个引擎都能够促进其周围的开源生态系统的发展。

这些引擎中可以包含插件以允许开发人员通过添加特定程序来增强引擎的基本功能。这些程序的范围可以从简单的资源包到更复杂的事物，如人工智能 （AI） 集成。这些插件来自不同的创作者。有些是由引擎开发工作室和有些是个人提供的。后者中的很多是开源插件。

### 什么是 BLUI？

作为独立游戏开发工作室的一员，我体验到了在专有游戏引擎上使用开源插件的好处。Aaron Shea 开发的一个开源插件 [BLUI][1] 对我们团队的开发过程起到了重要作用。它允许我们使用基于 Web 的编程（如 HTML/CSS 和 JavaScript）创建用户界面 （UI） 组件。尽管<ruby>虚幻引擎<rt>Unreal Engine</rt></ruby>（我们选择的引擎）有一个实现了类似目的的内置 UI 编辑器，我们也选择使用这个开源插件。我们选择使用开源替代品有三个主要原因：它们的可访问性、易于实现以及伴随的开源程序活跃的、支持性好的在线社区。

在虚幻引擎的最早版本中，我们在游戏中创建 UI 的唯一方法是通过引擎的原生 UI 集成，使用 Autodesk 的 Scaleform 程序，或通过在虚幻社区中传播的一些选定的基于订阅的虚幻引擎集成。在这些情况下，这些解决方案要么不能为独立开发者提供有竞争力的 UI 解决方案，对于小型团队来说太昂贵，要么只能为大型团队和 AAA 开发者提供。

在商业产品和虚幻引擎的原生整合失败后，我们向独立社区寻求解决方案。我们在那里发现了 BLUI。它不仅与虚幻引擎无缝集成，而且还保持了一个强大且活跃的社区，经常推出更新并确保独立开发人员可以轻松访问文档。BLUI 使开发人员能够将 HTML 文件导入虚幻引擎，并在程序内部对其进行编程。这使得通过 web 语言创建的 UI 能够集成到游戏的代码、资源和其他元素中，并拥有所有 HTML、CSS、Javascript 和其他网络语言的能力。它还为开源 [Chromium Embedded Framework][2] 提供全面支持。

### 安装和使用 BLUI

使用 BLUI 的基本过程包括首先通过 HTML 创建 UI。开发人员可以使用任何工具来实现此目的，包括<ruby>自举<rt>bootstrapped</rt> JavaScript 代码、外部 API 或任何数据库代码。一旦这个 HTML 页面完成，你可以像安装任何虚幻引擎插件那样安装它，并加载或创建一个项目。项目加载后，你可以将 BLUI 函数放在虚幻引擎 UI 图纸中的任何位置，或者通过 C++ 进行硬编码。开发人员可以通过其 HTML 页面调用函数，或使用 BLUI 的内部函数轻松更改变量。

![Integrating BLUI into Unreal Engine 4 blueprints][4]

*将 BLUI 集成到虚幻 4 图纸中。*

在我们当前的项目中，我们使用 BLUI 将 UI 元素与游戏中的音轨同步，为游戏机制的节奏方面提供视觉反馈。将定制引擎编程与 BLUI 插件集成很容易。

![Using BLUI to sync UI elements with the soundtrack.][6]

*使用 BLUI 将 UI 元素与音轨同步。*

通过 BLUI GitHub 页面上的[文档][7]，将 BLUI 集成到虚幻 4 中是一个轻松的过程。还有一个由支持虚幻引擎开发人员组成的[论坛][8]，他们乐于询问和回答关于插件以及实现该工具时出现的任何问题。

### 开源优势

开源插件可以在专有游戏引擎的范围内扩展创意。他们继续降低进入游戏开发的障碍，并且可以产生前所未有的游戏内的机制和资源。随着对专有游戏开发引擎的访问持续增长，开源插件社区将变得更加重要。不断增长的创造力必将超过专有软件，开源代码将会填补这些空白，并促进开发真正独特的游戏。而这种新颖性正是让独立游戏如此美好的原因！

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/blui-game-development-plugin

作者：[Uwana lkaiddi][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/uwikaiddi
[1]:https://github.com/AaronShea/BLUI
[2]:https://bitbucket.org/chromiumembedded/cef
[3]:/file/400616
[4]:https://opensource.com/sites/default/files/uploads/blui_gaming_plugin-integratingblui.png (Integrating BLUI into Unreal Engine 4 blueprints)
[5]:/file/400621
[6]:https://opensource.com/sites/default/files/uploads/blui_gaming_plugin-syncui.png (Using BLUI to sync UI elements with the soundtrack.)
[7]:https://github.com/AaronShea/BLUI/wiki
[8]:https://forums.unrealengine.com/community/released-projects/29036-blui-open-source-html5-js-css-hud-ui
