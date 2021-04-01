[#]: collector: (lujun9972)
[#]: translator: (stevenzdg988)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13206-1.html)
[#]: subject: (9 favorite open source tools for Node.js developers)
[#]: via: (https://opensource.com/article/20/1/open-source-tools-nodejs)
[#]: author: (Hiren Dhadhuk https://opensource.com/users/hirendhadhuk)

9 个 Node.js 开发人员最喜欢的开源工具
======

> 在众多可用于简化 Node.js 开发的工具中，以下 9 种是最佳选择。

![](https://img.linux.net.cn/data/attachment/album/202103/15/233658i99wxvzin13o5319.png)

我最近在 [StackOverflow][2] 上读到了一项调查，该调查称超过 49％ 的开发人员在其项目中使用了 Node.js。这结果对我来说并不意外。

作为一个狂热的技术使用者，我可以肯定地说 Node.js 的引入引领了软件开发的新时代。现在，它是软件开发最受欢迎的技术之一，仅次于JavaScript。

### Node.js 是什么，为什么如此受欢迎？

Node.js 是一个跨平台的开源运行环境，用于在浏览器之外执行 JavaScript 代码。它也是建立在 Chrome 的 JavaScript 运行时之上的首选运行时环境，主要用于构建快速、可扩展和高效的网络应用程序。

我记得当时我们要花费几个小时来协调前端和后端开发人员，他们分别编写不同脚本。当 Node.js 出现后，所有这些都改变了。我相信，促使开发人员采用这项技术是因为它的双向效率。

使用 Node.js，你可以让你的代码同时运行在客户端和服务器端，从而加快了整个开发过程。Node.js 弥合了前端和后端开发之间的差距，并使开发过程更加高效。

### Node.js 工具浪潮

对于 49％ 的开发人员（包括我）来说，Node.js 处于在前端和后端开发的金字塔顶端。有大量的 [Node.js 用例][3] 帮助我和我的团队在截止日期之内交付复杂的项目。幸运的是，Node.js 的日益普及也产生了一系列开源项目和工具，以帮助开发人员使用该环境。

近来，对使用 Node.js 构建的项目的需求突然增加。有时，我发现管理这些项目，并同时保持交付高质量项目的步伐非常具有挑战性。因此，我决定使用为 Node.js 开发人员提供的许多开源工具中一些最高效的，使某些方面的开发自动化。

根据我在 Node.js 方面的丰富经验，我使用了许多的工具，这些工具对整个开发过程都非常有帮助：从简化编码过程，到监测再到内容管理。

为了帮助我的 Node.js 开发同道，我整理了这个列表，其中包括我最喜欢的 9 个简化 Node.js 开发的开源工具。

### Webpack

[Webpack][4] 是一个容易使用的 JavaScript <ruby>模块捆绑程序<rt>module bundler</rt></ruby>，用于简化前端开发。它会检测具有依赖的模块，并将其转换为描述模块的静态<ruby>素材<rt>asset</rt></ruby>。

可以通过软件包管理器 npm 或 Yarn 安装该工具。

利用 npm 命令安装如下：

```
npm install --save-dev webpack
```

利用 Yarn 命令安装如下：

```
yarn add webpack --dev
```

Webpack 可以创建在运行时异步加载的单个捆绑包或多个素材链。不必单独加载。使用 Webpack 工具可以快速高效地打包这些素材并提供服务，从而改善用户整体体验，并减少开发人员在管理加载时间方面的困难。

### Strapi

[Strapi][5] 是一个开源的<ruby>无界面<rt>headless</rt></ruby>内容管理系统（CMS）。无界面 CMS 是一种基础软件，可以管理内容而无需预先构建好的前端。它是一个使用 RESTful API 函数的只有后端的系统。

可以通过软件包管理器 Yarn 或 npx 安装 Strapi。

利用 Yarn 命令安装如下：

```
yarn create strapi-app my-project --quickstart
```

利用 npx 命令安装如下：

```
npx create-strapi-app my-project --quickstart
```

Strapi 的目标是在任何设备上以结构化的方式获取和交付内容。CMS 可以使你轻松管理应用程序的内容，并确保它们是动态的，可以在任何设备上访问。

它提供了许多功能，包括文件上传、内置的电子邮件系统、JSON Web Token（JWT）验证和自动生成文档。我发现它非常方便，因为它简化了整个 CMS，并为我提供了编辑、创建或删除所有类型内容的完全自主权。

另外，通过 Strapi 构建的内容结构非常灵活，因为你可以创建和重用内容组和可定制的 API。

### Broccoli

[Broccoli][6] 是一个功能强大的构建工具，运行在 [ES6][7] 模块上。构建工具是一种软件，可让你将应用程序或网站中的所有各种素材（例如图像、CSS、JavaScript 等）组合成一种可分发的格式。Broccoli 将自己称为 “雄心勃勃的应用程序的素材管道”。

使用 Broccoli 你需要一个项目目录。有了项目目录后，可以使用以下命令通过 npm 安装 Broccoli：

```
npm install --save-dev broccoli
npm install --global broccoli-cli
```

你也可以使用 Yarn 进行安装。

当前版本的 Node.js 就是使用该工具的最佳版本，因为它提供了长期支持。它可以帮助你避免进行更新和重新安装过程中的麻烦。安装过程完成后，可以在 `Brocfile.js` 文件中包含构建规范。

在 Broccoli 中，抽象单位是“树”，该树将文件和子目录存储在特定子目录中。因此，在构建之前，你必须有一个具体的想法，你希望你的构建是什么样子的。

最好的是，Broccoli 带有用于开发的内置服务器，可让你将素材托管在本地 HTTP 服务器上。Broccoli 非常适合流线型重建，因为其简洁的架构和灵活的生态系统可提高重建和编译速度。Broccoli 可让你井井有条，以节省时间并在开发过程中最大限度地提高生产力。

### Danger

[Danger][8] 是一个非常方便的开源工具，用于简化你的<ruby>拉取请求<rt>pull request</rt></ruby>（PR）检查。正如 Danger 库描述所说，该工具可通过管理 PR 检查来帮助 “正规化” 你的代码审查系统。Danger 可以与你的 CI 集成在一起，帮助你加快审核过程。

将 Danger 与你的项目集成是一个简单的逐步过程：你只需要包括 Danger 模块，并为每个项目创建一个 Danger 文件。然而，创建一个 Danger 帐户（通过 GitHub 或 Bitbucket 很容易做到），并且为开源软件项目设置访问令牌更加方便。

可以通过 NPM 或 Yarn 安装 Danger。要使用 Yarn，请添加 `danger -D` 到 `package.JSON` 中。

将 Danger 添加到 CI 后，你可以：

  * 高亮显示重要的创建工件
  * 通过强制链接到 Trello 和 Jira 之类的工具来管理 sprint
  * 强制生成更新日志
  * 使用描述性标签
  * 以及更多

例如，你可以设计一个定义团队文化并为代码审查和 PR 检查设定特定规则的系统。根据 Danger 提供的元数据及其广泛的插件生态系统，可以解决常见的<ruby>议题<rt>issue</rt></ruby>。

### Snyk

网络安全是开发人员的主要关注点。[Snyk][9] 是修复开源组件中漏洞的最著名工具之一。它最初是一个用于修复 Node.js 项目漏洞的项目，并且已经演变为可以检测并修复 Ruby、Java、Python 和 Scala 应用程序中的漏洞。Snyk 主要分四个阶段运行：

  * 查找漏洞依赖性
  * 修复特定漏洞
  * 通过 PR 检查预防安全风险
  * 持续监控应用程序

Snyk 可以集成在项目的任何阶段，包括编码、CI/CD 和报告。我发现这对于测试 Node.js 项目非常有帮助，可以测试或构建 npm 软件包时检查是否存在安全风险。你还可以在 GitHub 中为你的应用程序运行 PR 检查，以使你的项目更安全。Synx 还提供了一系列集成，可用于监控依赖关系并解决特定问题。

要在本地计算机上运行 Snyk，可以通过 NPM 安装它：

```
npm install -g snyk
```

### Migrat

[Migrat][10] 是一款使用纯文本的数据迁移工具，非常易于使用。 它可在各种软件堆栈和进程中工作，从而使其更加实用。你可以使用简单的代码行安装 Migrat：

```
$ npm install -g migrat
```

Migrat 并不需要特别的数据库引擎。它支持多节点环境，因为迁移可以在一个全局节点上运行，也可以在每个服务器上运行一次。Migrat 之所以方便，是因为它便于向每个迁移传递上下文。

你可以定义每个迁移的用途（例如，数据库集、连接、日志接口等）。此外，为了避免随意迁移，即多个服务器在全局范围内进行迁移，Migrat 可以在进程运行时进行全局锁定，从而使其只能在全局范围内运行一次。它还附带了一系列用于 SQL 数据库、Slack、HipChat 和 Datadog 仪表盘的插件。你可以将实时迁移状况发送到这些平台中的任何一个。

### Clinic.js

[Clinic.js][11] 是一个用于 Node.js 项目的开源监视工具。它结合了三种不同的工具 Doctor、Bubbleprof 和 Flame，帮助你监控、检测和解决 Node.js 的性能问题。

你可以通过运行以下命令从 npm 安装 Clinic.js：

```
$ npm install clinic
```

你可以根据要监视项目的某个方面以及要生成的报告，选择要使用的 Clinic.js 包含的三个工具中的一个：

  * Doctor 通过注入探针来提供详细的指标，并就项目的总体运行状况提供建议。
  * Bubbleprof 非常适合分析，并使用 `async_hooks` 生成指标。
  * Flame 非常适合发现代码中的热路径和瓶颈。

### PM2

监视是后端开发过程中最重要的方面之一。[PM2][12] 是一款 Node.js 的进程管理工具，可帮助开发人员监视项目的多个方面，例如日志、延迟和速度。该工具与 Linux、MacOS 和 Windows 兼容，并支持从 Node.js 8.X 开始的所有 Node.js 版本。

你可以使用以下命令通过 npm 安装 PM2：

```
$ npm install pm2 --g
```

如果尚未安装 Node.js，则可以使用以下命令安装：

```
wget -qO- https://getpm2.com/install.sh | bash
```

安装完成后，使用以下命令启动应用程序：

```
$ pm2 start app.js
```

关于 PM2 最好的地方是可以在集群模式下运行应用程序。可以同时为多个 CPU 内核生成一个进程。这样可以轻松增强应用程序性能并最大程度地提高可靠性。PM2 也非常适合更新工作，因为你可以使用 “热重载” 选项更新应用程序并以零停机时间重新加载应用程序。总体而言，它是为 Node.js 应用程序简化进程管理的好工具。

### Electrode

[Electrode][13] 是 Walmart Labs 的一个开源应用程序平台。该平台可帮助你以结构化方式构建大规模通用的 React/Node.js 应用程序。

Electrode 应用程序生成器使你可以构建专注于代码的灵活内核，提供一些出色的模块以向应用程序添加复杂功能，并附带了广泛的工具来优化应用程序的 Node.js 包。

可以使用 npm 安装 Electrode。安装完成后，你可以使用 Ignite 启动应用程序，并深入研究 Electrode 应用程序生成器。

你可以使用 NPM 安装 Electrode：

```
npm install -g electrode-ignite xclap-cli
```

### 你最喜欢哪一个？

这些只是不断增长的开源工具列表中的一小部分，在使用 Node.js 时，这些工具可以在不同阶段派上用场。你最喜欢使用哪些开源 Node.js 工具？请在评论中分享你的建议。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/open-source-tools-nodejs

作者：[Hiren Dhadhuk][a]
选题：[lujun9972][b]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hirendhadhuk
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tools_hardware_purple.png?itok=3NdVoYhl (Tools illustration)
[2]: https://insights.stackoverflow.com/survey/2019#technology-_-other-frameworks-libraries-and-tools
[3]: https://www.simform.com/nodejs-use-case/
[4]: https://webpack.js.org/
[5]: https://strapi.io/
[6]: https://broccoli.build/
[7]: https://en.wikipedia.org/wiki/ECMAScript#6th_Edition_-_ECMAScript_2015
[8]: https://danger.systems/
[9]: https://snyk.io/
[10]: https://github.com/naturalatlas/migrat
[11]: https://clinicjs.org/
[12]: https://pm2.keymetrics.io/
[13]: https://www.electrode.io/
