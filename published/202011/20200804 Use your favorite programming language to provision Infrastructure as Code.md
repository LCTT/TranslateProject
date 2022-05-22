[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12862-1.html)
[#]: subject: (Use your favorite programming language to provision Infrastructure as Code)
[#]: via: (https://opensource.com/article/20/8/infrastructure-as-code-pulumi)
[#]: author: (Lee Briggs https://opensource.com/users/lbriggs)

使用你喜欢的编程语言，将基础设施作为代码进行配置
======

> 用 Node.js 或其他编程语言为你提供启动基础设施所需的一切服务。

![](https://img.linux.net.cn/data/attachment/album/202011/27/151108bnnggmxegfzwog46.jpg)

当你在 IT 和技术的世界里遨游时，你会反复遇到一些术语。其中有些术语很难量化，随着时间的推移，可能会有不同的含义。[“DevOps”][2] 就是一个例子，这个词似乎（在我看来）会根据使用它的人而改变；最初的 DevOps 先驱者可能甚至不认识我们今天所说的 DevOps。

如果你是一个软件开发者，“<ruby>基础架构即代码<rt>Infrastructure as Code</rt></ruby>”（IaC）可能是其中一个术语。IaC 是使用与你编写面向用户的功能相同的软件开发实践来声明应用程序运行的基础设施。这通常意味着使用 [Git][3] 或 [Mercurial][4] 等工具进行版本控制，使用 Puppet、Chef 或 Ansible 进行[配置管理][5]。在基础设施供应层，最常见的技术是 CloudFormation（专用于 AWS），或开源替代品 [Terraform][6]，用来创建供你的应用程序运行的混合云资源。

在配置管理领域有很好产品可供选择，可以将 IaC 写成配置文件或首选的编程语言，但这种选择在基础设施供应领域并不常见。

[Pulumi][7] 提供了一个使用标准编程语言来定义基础设施的方式。它支持一系列语言，包括 [JavaScript][8]、[TypeScript][9]、[Go][10]、[Python][11] 和 [C#][12]。就像 Terraform 一样，Pulumi 对许多熟悉的云提供商有一流的支持，比如 [AWS][13]、[Azure][14]、[Google Cloud][15] 和[其他提供商][16]。

在本文中，我将向你展示如何使用 Pulumi 以 Node.js 编写基础设施。

### 先决条件

首先，确保你已经做好了使用 Pulumi 的准备。Pulumi 支持所有主流的操作系统，所以你安装其先决条件的方法取决于你使用的操作系统。

首先，安装你喜欢的编程语言的解释器。我将使用 TypeScript，所以我需要安装 `node` 二进制。请查阅 Node 的[安装说明][17]，了解你的操作系统的信息。你可以在 [Mac][19] 或 [Linux][20] 上使用 [Homebrew][18] 来安装：

```
brew install node
```

在 Linux 上，你可以使用你常用的软件包管理器，如 `apt` 或 `dnf`。

```
$ sudo dnf install nodejs
```

无论哪种情况，结果都应该是 `node` 二进制文件在你的 `$PATH` 中可用。要确认它是可访问的，运行：

```
node --version
```

接下来，安装 Pulumi 命令行界面（CLI）。你可以在 Pulumi 的文档中找到针对不同操作系统的[安装说明][21]。在 Mac 或 Linux 上使用 `brew`：

```
brew install pulumi
```

另外，你也可以使用安装脚本。首先下载并审查它，然后执行它：

```
$ curl -fsSL --output pulumi_installer.sh https://get.pulumi.com/
$ more  pulumi_installer.sh
$ sh ./pulumi_installer.sh
```

同样，我们所希望的结果是在你的路径上有 `pulumi` 二进制。检查版本以确保你已经准备好了：

```
pulumi version
v2.5.0
```

### 配置 Pulumi

在你开始配置任何基础设施之前，给 Pulumi 一个存储其[状态][22]的地方。

Pulumi 将其状态存储在后端。默认的后端是 Pulumi 的软件即服务（它有一个针对个人用户的免费计划），但在这个例子中，我使用替代的文件后端。文件后端将在你的本地文件系统上创建一个文件来存储状态：

```
pulumi login --local
```

如果你打算和别人分享这个项目，文件后台可能不是一个好的起点。Pulumi 还可以将其状态存储在 AWS S3 等云对象存储中。要使用它，请创建一个 S3 bucket 并登录：

```
pulumi login --cloud-url s3://my-pulumi-state-bucket
```

现在你已经登录到了状态后端，你可以创建一个项目和一个堆栈了！

在你开始创建 Pulumi 项目之前，请先了解以下 Pulumi 术语，你将在本教程中看到这些术语。

#### 项目

<ruby>[项目][23]<rt>project</rt></ruby>是一个包含 `Pulumi.yaml` 文件的目录。这个文件包含了 Pulumi 需要知道的元数据，以便进行它的工作。在 `Pulumi.yaml` 文件中可以找到的示例字段有：

  * 运行时（例如，Python、Node、Go、.Net）
  * 项目说明（如“我的第一个 Pulumi 项目”）
  * 项目名称

项目是一个松散的概念，可以满足你的需求。一般来说，一个项目包含了一系列的*资源*，这些资源是你想要提供和控制的东西。你可以选择拥有资源很少的小型 Pulumi 项目，也可以选择包含所有你需要的资源的大型项目。随着你对 Pulumi 越来越熟悉，你想如何布局你的项目会变得更加清晰。

#### 堆栈

Pulumi <ruby>[堆栈][24]<rt>stack</rt></ruby>允许你根据可配置的值来区分你的 Pulumi 项目。一个常见的用途是将一个项目部署到不同的环境，如开发或生产环境，或不同的地区，如欧洲、中东和非洲以及美国。

在入门时，你不大需要一个复杂的堆栈设置，所以本演练使用默认的堆栈名称 `dev`。

### 在 IaC 中使用 TypeScript

你可以使用方便的 `pulumi new` 命令来<ruby>初建<rt>bootstrap</rt></ruby>一个 Pulumi 项目。`new` 命令有一大堆标志和选项，可以帮助你入门 Pulumi，所以请继续创建你的第一个项目：

```
$ pulumi new typescript
This command will walk you through creating a new Pulumi project.

Enter a value or leave blank to accept the (default), and press <ENTER>.
Press ^C at any time to quit.

project name: (pulumi) my-first-project
project description: (A minimal TypeScript Pulumi program) My very first Pulumi program
Created project 'my-first-project'

Please enter your desired stack name.
To create a stack in an organization, use the format <org-name>/<stack-name> (e.g. `acmecorp/dev`).
stack name: (dev) dev
Created stack 'dev'

Installing dependencies...


> node scripts/postinstall

added 82 packages from 126 contributors and audited 82 packages in 2.84s

13 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities

Finished installing dependencies

Your new project is ready to go! ✨

To perform an initial deployment, run 'pulumi up'
```

这里发生了很多事情，我将其展开来说：

第一部分是为你的 Pulumi 项目确定一个模板。我选择了通用的 `typescript` 选项，但是有[很多选项可供选择][25]。

这个 `new` 命令从你的模板库中抓取模板，并将这个文件复制到本地，包括运行时的依赖关系（在本例中是 `package.json`）。

`new` 命令通过在这个目录下运行 `npm install` 来安装这些依赖关系。然后 `npm install` 下载并安装运行 Pulumi 程序所需的一切，在这种情况下就是：`@pulumi/pulumi` NPM 包。

你已经准备好创建你的第一个资源了!

### 创建你的第一个云资源

资源是一个由你的基础设施供应软件生命周期进行管理的东西。资源一般是一个<ruby>云提供商对象<rt>cloud provider object</rt></ruby>，比如 S3 桶。Pulumi 的提供商处理 Pulumi 资源，提供商是具体的云提供商。Pulumi 有大约 [40 个提供商][26]可供你使用，但对于你的第一个资源，使用一个最简单的：<ruby>[随机提供商][27]<rt>random provider</rt></ruby>。

随机提供者顾名思义：它幂等地创建一个随机资源（例如，可以是一个字符串），并将其存储在 Pulumi 状态中。

使用 `npm` 将其添加到你的 Pulumi 项目中作为依赖关系：

```
npm install @pulumi/random
```

npm 包管理器下载并安装随机提供者包，并为你安装。现在你已经准备好编写你的 Pulumi 程序了。

当你之前生成你的项目时，Pulumi 的初建过程创建了一个 `index.ts` TypeScript 文件。在你喜欢的集成开发环境（IDE）中打开它，并添加你的第一个资源：

```
import * as pulumi from "@pulumi/pulumi";
import * as random from "@pulumi/random";

const password = new random.RandomString(`password`, {
    length: 10
})
```

如果你对 TypeScript 或 JavaScript 非常熟悉，这看起来会非常熟悉，因为它是用你熟悉的编程语言编写的。如果你使用的是 Pulumi 支持的其他语言之一，也是一样的。这里是之前的那个随机资源，但这次是用 Python 写的：

```
import pulumi_random as random

password = random.RandomString("password", length=10)
```

一个 Pulumi 项目目前只支持单一一种语言，但每个项目都可以引用其他语言编写的项目，这对于多语言团队的成员来说是一个很有用的技巧。

你已经编写了第一个 Pulumi 资源。现在你需要部署它。

离开编辑器，回到命令行。在你的项目目录下，运行 `pulumi up`，然后看着神奇的事情发生：

```
pulumi up

Previewing update (dev):
     Type                          Name                  Plan
 +   pulumi:pulumi:Stack           my-first-project-dev  create
 +   └─ random:index:RandomString  password              create

Resources:
    + 2 to create

Do you want to perform this update? yes
Updating (dev):
     Type                          Name                  Status
 +   pulumi:pulumi:Stack           my-first-project-dev  created
 +   └─ random:index:RandomString  password              created

Resources:
    + 2 created

Duration: 2s

Permalink: file:///Users/lbriggs/.pulumi/stacks/dev.json
```

太好了，你有了第一个 Pulumi 资源! 虽然你可能很享受这种成就感，但不幸的是，这个随机资源并没有那么有用：它只是一个随机的字符串，你甚至看不到它是什么。先解决这部分问题。修改你之前的程序，在你创建的常量中加入 `export`：

```
import * as pulumi from "@pulumi/pulumi";
import * as random from "@pulumi/random";

export const password = new random.RandomString(`password`, {
    length: 10
})
```

重新运行 `pulumi up`，看看输出：

```
pulumi up
Previewing update (dev):
     Type                 Name                  Plan
     pulumi:pulumi:Stack  my-first-project-dev

Outputs:
  + password: {
      + id             : "&+r?{}J$J7"
      + keepers        : output<string>
      + length         : 10
      + lower          : true
      + minLower       : 0
      + minNumeric     : 0
      + minSpecial     : 0
      + minUpper       : 0
      + number         : true
      + overrideSpecial: output<string>
      + result         : "&+r?{}J$J7"
      + special        : true
      + upper          : true
      + urn            : "urn:pulumi:dev::my-first-project::random:index/randomString:RandomString::password"
    }

Resources:
    2 unchanged

Do you want to perform this update? yes
Updating (dev):
     Type                 Name                  Status
     pulumi:pulumi:Stack  my-first-project-dev

Outputs:
  + password: {
      + id        : "&+r?{}J$J7"
      + length    : 10
      + lower     : true
      + minLower  : 0
      + minNumeric: 0
      + minSpecial: 0
      + minUpper  : 0
      + number    : true
      + result    : "&+r?{}J$J7"
      + special   : true
      + upper     : true
      + urn       : "urn:pulumi:dev::my-first-project::random:index/randomString:RandomString::password"
    }

Resources:
    2 unchanged

Duration: 1s
Permalink: file:///Users/lbriggs/.pulumi/stacks/dev.json
```

现在你可以在 `Outputs` 的 `result` 部分下看到一个随机生成的字符串。你现在可以看到你创建的资源有很多属性。

这一切都很好，但如果你想享受 IaC，你得提供一些随机字符串以外的东西。试试吧。

### 部署一个容器

到目前为止，你已经通过安装依赖关系和注册一个简单的随机资源来 体验了初建你的 Pulumi。现在部署一些实际的基础设施，尽管是在你的本地机器上。

首先，将 `@pulumi/docker` 提供者添加到你的堆栈中。使用你选择的包管理器将其添加到项目中：

```
npm install @pulumi/docker
```

你已经从 `npm` 下拉了 Pulumi Docker 提供商包，这意味着你现在可以在你的项目中创建 Docker 镜像。

如果你的机器上还没有安装 Docker，现在是一个极好的时机去安装它。说明将取决于你的操作系统，所以看看 [Docker 的安装页面][28]了解信息。

再次打开你喜欢的 IDE，运行一个 Docker 容器。修改你之前的 `index.ts` 文件，让它看起来像这样：

```
import * as pulumi from "@pulumi/pulumi";
import * as random from "@pulumi/random";
import * as docker from "@pulumi/docker";

const password = new random.RandomString(`password`, {
    length: 10
})

const container = new docker.Container(`my-password`, {
    image: 'hashicorp/http-echo',
    command: [ pulumi.interpolate`-text=Your super secret password is: ${password.result}` ],
    ports: [{
        internal: 5678,
        external: 5678,
    }]
})

export const id = container.id
```

这将创建一个容器，创建一个 Web 服务器。Web 服务器的输出是你随机生成的字符串，在本例中是一个密码。运行这个，看看会发生什么：

```
pulumi up

Previewing update (dev):
     Type                       Name                  Plan
     pulumi:pulumi:Stack        my-first-project-dev
 +   └─ docker:index:Container  my-password           create

Outputs:
  + id      : output<string>
  ~ password: {
        id        : "&+r?{}J$J7"
        length    : 10
        lower     : true
        minLower  : 0
        minNumeric: 0
        minSpecial: 0
        minUpper  : 0
        number    : true
        result    : "&+r?{}J$J7"
        special   : true
        upper     : true
        urn       : "urn:pulumi:dev::my-first-project::random:index/randomString:RandomString::password"
    }

Resources:
    + 1 to create
    2 unchanged

Do you want to perform this update? yes
Updating (dev):
     Type                       Name                  Status
     pulumi:pulumi:Stack        my-first-project-dev
 +   └─ docker:index:Container  my-password           created

Outputs:
  + id      : "e73b34aeca34a64b72b61b0b9b8438637ce28853937bc359a1528ca99f49ddda"
    password: {
        id        : "&+r?{}J$J7"
        length    : 10
        lower     : true
        minLower  : 0
        minNumeric: 0
        minSpecial: 0
        minUpper  : 0
        number    : true
        result    : "&+r?{}J$J7"
        special   : true
        upper     : true
        urn       : "urn:pulumi:dev::my-first-project::random:index/randomString:RandomString::password"
    }

Resources:
    + 1 created
    2 unchanged

Duration: 2s
Permalink: file:///Users/lbriggs/.pulumi/stacks/dev.json
```

你会注意到在 `Outputs` 部分，你输出的值已经改变了，它只是一个 Docker 容器 ID。检查你的非常简单的密码生成器是否工作：

```
curl http://localhost:5678
Your super secret password is: &+r?{}J$J7
```

就是这样! 你刚刚用 TypeScript 配置了你的第一个基础架构。

#### 关于 Pulumi 输出的快速说明

你会注意到在创建 Docker 容器的代码中，它使用了一个特殊的 `pulumi.interpolate` 调用。如果你熟悉 TypeScript，你可能会好奇为什么需要这样做（因为它是 Pulumi 特有的）。这有一个有趣的原因。

当 Pulumi 创建一个资源时，直到程序执行时有一些值是 Pulumi 不知道的。在 Pulumi 中，这些值被称为 `Outputs`。这些 `Outputs` 可以在上面的代码中看到，例如，在你的第一个随机资源中，你使用 `export` 关键字来输出随机资源的属性，你还输出了你创建的容器的容器 ID。

因为 Pulumi 直到执行时才知道这些 `Outputs` 的值，所以在操作字符串时，它需要特殊的助手来使用它们。如果你想了解更多关于这个特殊的编程模型，请观看[这个短视频][29]。

### 总结

随着混合云基础架构中出现的复杂性，IaC 在很多方面都有了发展。在基础设施供应领域，Pulumi 是一个很好的选择，它可以使用你最喜欢的编程语言来供应你所需要的一切基础设施，然后你可以在你最喜欢的配置管理工具中进行标记，以采取下一步措施。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/infrastructure-as-code-pulumi

作者：[Lee Briggs][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/lbriggs
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/puzzle_computer_solve_fix_tool.png?itok=U0pH1uwj (Puzzle pieces coming together to form a computer screen)
[2]: https://opensource.com/resources/devops
[3]: https://git-scm.com/
[4]: https://www.mercurial-scm.org/
[5]: https://opensource.com/article/18/12/configuration-management-tools
[6]: https://opensource.com/article/20/7/terraform-kubernetes
[7]: https://www.pulumi.com/
[8]: https://developer.mozilla.org/en-US/docs/Web/JavaScript
[9]: https://www.typescriptlang.org/
[10]: https://golang.org/
[11]: https://www.python.org/
[12]: https://en.wikipedia.org/wiki/C_Sharp_(programming_language)
[13]: https://www.pulumi.com/docs/intro/cloud-providers/aws/
[14]: https://www.pulumi.com/docs/intro/cloud-providers/azure/
[15]: https://www.pulumi.com/docs/intro/cloud-providers/gcp/
[16]: https://www.pulumi.com/docs/reference/pkg/
[17]: https://nodejs.org/en/download/
[18]: https://brew.sh/
[19]: https://opensource.com/article/20/6/homebrew-mac
[20]: https://opensource.com/article/20/6/homebrew-linux
[21]: https://www.pulumi.com/docs/get-started/install/
[22]: https://www.pulumi.com/docs/intro/concepts/state/
[23]: https://www.pulumi.com/docs/intro/concepts/project/
[24]: https://www.pulumi.com/docs/intro/concepts/stack/
[25]: https://github.com/pulumi/templates
[26]: https://www.pulumi.com/docs/intro/cloud-providers/
[27]: https://www.pulumi.com/docs/intro/cloud-providers/random/
[28]: https://docs.docker.com/get-docker/
[29]: https://www.youtube.com/watch?v=lybOxul2otM
