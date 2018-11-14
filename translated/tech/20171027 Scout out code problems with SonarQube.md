使用 SonarQube 追踪代码问题
======
> 通过不断分析代码以了解潜在的质量问题，开源的 SonarQube 项目支持了 DevOps 的“尽早发布和经常发布” 的思维模式。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/open%20source_collaboration_0.png?itok=YEl_GXbv)

越来越多的组织正在实施 [DevOps][1] 以便在通过中间开发和测试环境以后更快更好的将新代码引入到生产环境。虽然版本控制、持续集成和部署以及自动化测试都属于 DevOps 的范畴，但仍然存在一个关键问题：组织如何量化代码质量，而不仅仅是部署的速度？

[SonarQube][2] 是用来填补这个空隙的一种选择。它是一个开源平台，通过代码的自动化静态分析不断的检查代码质量。 SonarQube 支持 20 多种语言的分析，并在各种类型的项目中输出和存储问题。

SonarQube 同时也提供了一个可同时维护和管理不同项目、不同代码的集中的环境。可以为每个项目定制规则。持续的检查和分析代码的健康轨迹。

SonarQube 还可以集成到可持续集成和开发（CI/CD）流程中，协助和自动确定代码是否为生产环境做好了准备的过程。

### 它可以衡量什么

开箱即用，SonarQube 可以测量的关键指标，包括代码错误、<ruby>代码异味<rt>code smells</rt></ruby>、安全漏洞和重复的代码。

* **代码错误** 是代码中的一部分不正确或无法正常运行、可能会导致错误的结果，是指那些在代码发布到生产环境之前应该被修复的明显的错误。  
* [代码异味][3] 不同于代码错误，被检测到的代码是可能能正确执行并符合预期。然而，它不容易被修复，也不能被单元测试覆盖，却可能会导致一些未知的错误，或是一些其它的问题。从长期的可维护性来讲，立即修复代码异味是明智之举。通常在编写代码的时候，代码异味并不容易被发现，而 SonarQube 的静态分析是一种发现它们的很好的方式。
* **安全漏洞** 正如听起来的一样：指的是现在的代码中可能存在的安全问题的缺陷。这些缺陷应该立即修复来防止黑客利用它们。
* **重复的代码** 也和听起来的一样：指的是源代码中重复的部分。代码重复在软件设计中是一种很不好的做法。总的来说，如果对一部分代码进行更改而另一部分没有，则会导致一些维护性的问题。例如，识别重复的代码可以很容易的将重复的代码打包成一个库来重复的使用。

### 可自定义的选项

因为它是开源的，所以 SonarQube 鼓励用户开发和提供可定制的选项。目前有超过 60 个[插件][4] 可用于增强 SonarQube 开箱即用的分析功能。

大多数的插件是为了增加 SonarQube 可以分析的编程语言的数量。另一些插件可以分析一些额外的指标甚至包括一些显示的仪表盘视图。实际上，如果组织需要检查一些自定义指标，或是想要在自己的仪表盘和以特定的方式查看分析数据，或使用 SonarQube 不支持的编程语言，则可能存在一些自定义的选项可以使用。如果你想要的功能并不支持，SonarQube 源码的开放也为你自己开发新的功能提供了可能性。

用户还可以定制适用于每种特定编程语言分析器的规则。通过 SonarQube 用户界面，可以按语言和按项目选择和取消规则。这些为特定的项目指定的规则，可以很好的在一个集中的位置维护所有的数据和配置。

### 为什么它那么重要

SonarQube 为组织提供了一个集中的位置来管理和跟踪多个项目代码中的问题。它还可以把持续的检查与质量门限相结合。一旦项目分析过一次以后，更进一步的分析会参考软件最新的修改来更新原始的统计信息，以反映最新的变化。这些跟踪可以让用户看到问题解决的程度和速度。这与 “尽早发布并经常发布”不谋而合。

另外，SonarQube 可使用 [可持续集成流程][5]，比如像 [Hudson][6] 和 [Jenkins][7] 这样的工具。这个质量门限可以很好的反映代码的整体运行状况，并且通过 Jenkins 等集成工具，在发布代码到生产环境时担任一个重要的角色。

本着 DevOps 的精神， SonarQube 可以量化代码质量，来达到组织内部的要求。为了加快代码生产和发布的周期，组织必须意识到它们自己的技术债务和软件问题。通过发现这些信息， SonarQube 可以帮助组织更快的生成高质量的软件。

### 想要了解更多吗？

SonarQube 基于 GUN 通用公共许可证发布，它的源码可以在 [GitHub][8] 上查看。越来越多的用户对 SonarQube 的特性和功能感兴趣。 [Twitter][9] 和 [Google][10] 上有活跃的社区。这些社区以及 [SonarQube 博客][11] 对任何有兴趣开始和使用 SonarQube 的人有很有帮助。

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/10/sonarqube

作者：[Sophie Polson][a]
译者：[Jamkr](https://github.com/Jamkr)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/sophiepolson
[1]:https://en.wikipedia.org/wiki/DevOps
[2]:https://www.sonarqube.org/
[3]:https://en.wikipedia.org/wiki/Code_smell
[4]:https://docs.sonarqube.org/display/PLUG/Plugin+Library
[5]:https://jenkins.io/blog/2017/04/18/continuousdelivery-devops-sonarqube/
[6]:https://en.wikipedia.org/wiki/Hudson_(software)
[7]:https://en.wikipedia.org/wiki/Jenkins_(software)
[8]:https://github.com/SonarSource/sonarqube
[9]:https://twitter.com/SonarQube
[10]:https://groups.google.com/forum/#!forum/sonarqube
[11]:https://blog.sonarsource.com/
