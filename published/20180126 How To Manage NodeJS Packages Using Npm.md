如何使用 npm 管理 NodeJS 包
=====

![](https://www.ostechnix.com/wp-content/uploads/2018/01/npm-720x340.png)

前一段时间，我们发布了一个[使用 pip 管理  Python 包][3]的指南。今天，我们将讨论如何使用 npm 管理 NodeJS 包。npm 是最大的软件注册中心，包含 600,000 多个包。每天，世界各地的开发人员通过 npm 共享和下载软件包。在本指南中，我将解释使用 npm 基础知识，例如安装包（本地和全局）、安装特定版本的包、更新、删除和管理 NodeJS 包等等。

### 安装 npm

用于 npm 是用 NodeJS 编写的，我们需要安装 NodeJS 才能使用 npm。要在不同的 Linux 发行版上安装 NodeJS，请参考下面的链接。

- [在 Linux 上安装 NodeJS](https://www.ostechnix.com/install-node-js-linux/)

检查 node 安装的位置：

```
$ which node
/home/sk/.nvm/versions/node/v9.4.0/bin/node
```

检查它的版本：

```
$ node -v
v9.4.0
```

进入 Node 交互式解释器：

```
$ node
> .help
.break Sometimes you get stuck, this gets you out
.clear Alias for .break
.editor Enter editor mode
.exit Exit the repl
.help Print this help message
.load Load JS from a file into the REPL session
.save Save all evaluated commands in this REPL session to a file
> .exit
```

检查 npm 安装的位置：

```
$ which npm
/home/sk/.nvm/versions/node/v9.4.0/bin/npm
```

还有版本：

```
$ npm -v
5.6.0
```

棒极了！Node 和 npm 已安装好！正如你可能已经注意到，我已经在我的 `$HOME` 目录中安装了 NodeJS 和 NPM，这样是为了避免在全局模块时出现权限问题。这是 NodeJS 团队推荐的方法。

那么，让我们继续看看如何使用 npm 管理 NodeJS 模块（或包）。

### 安装 NodeJS 模块

NodeJS 模块可以安装在本地或全局（系统范围）。现在我将演示如何在本地安装包（LCTT 译注：即将包安装到一个 NodeJS 项目当中，所以下面会先创建一个空项目做演示）。

#### 在本地安装包

为了在本地管理包，我们通常使用 `package.json` 文件来管理。

首先，让我们创建我们的项目目录。

```
$ mkdir demo
$ cd demo
```

在项目目录中创建一个 `package.json` 文件。为此，运行：

```
$ npm init
```

输入你的包的详细信息，例如名称、版本、作者、GitHub 页面等等，或者按下回车键接受默认值并键入 `yes` 确认。

```
This utility will walk you through creating a package.json file.
It only covers the most common items, and tries to guess sensible defaults.

See `npm help json` for definitive documentation on these fields
and exactly what they do.

Use `npm install <pkg>` afterwards to install a package and
save it as a dependency in the package.json file.

Press ^C at any time to quit.
package name: (demo)
version: (1.0.0)
description: demo nodejs app
entry point: (index.js)
test command:
git repository:
keywords:
author:
license: (ISC)
About to write to /home/sk/demo/package.json:

{
 "name": "demo",
 "version": "1.0.0",
 "description": "demo nodejs app",
 "main": "index.js",
 "scripts": {
 "test": "echo \"Error: no test specified\" && exit 1"
 },
 "author": "",
 "license": "ISC"
}

Is this ok? (yes) yes
```

上面的命令初始化你的项目并创建了 `package.json` 文件。

你也可以使用命令以非交互式方式执行此操作：

```
npm init --y
```

现在让我们安装名为 [commander][2] 的包。

```
$ npm install commander
```

示例输出：

```
npm notice created a lockfile as package-lock.json. You should commit this file.
npm WARN demo@1.0.0 No repository field.

+ commander@2.13.0
added 1 package in 2.519s
```

这将在项目的根目录中创建一个名为 `node_modules` 的目录（如果它不存在的话），并在其中下载包。

让我们检查 `pachage.json` 文件。

```
$ cat package.json 
{
 "name": "demo",
 "version": "1.0.0",
 "description": "demo nodejs app",
 "main": "index.js",
 "scripts": {
 "test": "echo \"Error: no test specified\" && exit 1"
 },
 "author": "",
 "license": "ISC",
 "dependencies": {
 "commander": "^2.13.0"
 }
}
```

你会看到添加了依赖文件，版本号前面的插入符号 ( `^` ) 表示在安装时，npm 将取出它可以找到的最高版本的包。

```
$ ls node_modules/
commander
```

`package.json` 文件的优点是，如果你的项目目录中有 `package.json` 文件，只需键入 `npm install`，那么 `npm` 将查看文件中列出的依赖关系并下载它们。你甚至可以与其他开发人员共享它或将其推送到你的 GitHub  仓库。因此，当他们键入 `npm install` 时，他们将获得你拥有的所有相同的包。

你也可能会注意到另一个名为 `package-lock.json` 的文件，该文件确保在项目安装的所有系统上都保持相同的依赖关系。

要在你的程序中使用已安装的包，使用实际代码在项目目录中创建一个 `index.js`（或者其他任何名称）文件，然后使用以下命令运行它：

```
$ node index.js
```

#### 在全局安装包

如果你想使用一个包作为命令行工具，那么最好在全局安装它。这样，无论你的当前目录是哪个目录，它都能正常工作。

```
$ npm install async -g
+ async@2.6.0
added 2 packages in 4.695s
```

或者

```
$ npm install async --global
```

要安装特定版本的包，我们可以：

```
$ npm install async@2.6.0 --global
```

### 更新 NodeJS 模块

要更新本地包，转到 `package.json` 所在的项目目录并运行：

```
$ npm update
```

然后，运行以下命令确保所有包都更新了。

```
$ npm outdated
```

如果没有需要更新的，那么它返回空。

要找出哪一个全局包需要更新，运行：

```
$ npm outdated -g --depth=0
```

如果没有输出，意味着所有包都已更新。

更新单个全局包，运行：

```
$ npm update -g <package-name>
```

更新所有的全局包，运行：

```
$ npm update -g
```

### 列出 NodeJS 模块

列出本地包，转到项目目录并运行：

```
$ npm list
demo@1.0.0 /home/sk/demo
└── commander@2.13.0
```

如你所见，我在本地安装了 `commander` 这个包。

要列出全局包，从任何位置都可以运行以下命令：

```
$ npm list -g
```

示例输出：

```
/home/sk/.nvm/versions/node/v9.4.0/lib
├─┬ async@2.6.0
│ └── lodash@4.17.4
└─┬ npm@5.6.0
 ├── abbrev@1.1.1
 ├── ansi-regex@3.0.0
 ├── ansicolors@0.3.2
 ├── ansistyles@0.1.3
 ├── aproba@1.2.0
 ├── archy@1.0.0
[...]
```

该命令将列出所有模块及其依赖关系。

要仅仅列出顶级模块，使用 `-depth=0` 选项：

```
$ npm list -g --depth=0
/home/sk/.nvm/versions/node/v9.4.0/lib
├── async@2.6.0
└── npm@5.6.0
```

#### 寻找 NodeJS 模块

要搜索一个模块，使用 `npm search`  命令：

```
npm search <search-string>
```

例如：

```
$ npm search request
```

该命令将显示包含搜索字符串 `request` 的所有模块。

##### 移除 NodeJS 模块

要删除本地包，转到项目目录并运行以下命令，这会从 `node_modules` 目录中删除包：

```
$ npm uninstall <package-name>
```

要从 `package.json` 文件中的依赖关系中删除它，使用如下所示的 `save` 选项：

```
$ npm uninstall --save <package-name>
```

要删除已安装的全局包，运行：

```
$ npm uninstall -g <package>
```

### 清除 npm 缓存

默认情况下，npm 在安装包时，会将其副本保存在 `$HOME` 目录中名为 `.npm` 的缓存文件夹中。所以，你可以在下次安装时不必再次下载。

查看缓存模块：

```
$ ls ~/.npm
```

随着时间的推移，缓存文件夹会充斥着大量旧的包。所以不时清理缓存会好一些。

从 npm@5 开始，npm 缓存可以从 corruption 问题中自行修复，并且保证从缓存中提取的数据有效。如果你想确保一切都一致，运行：

```
$ npm cache verify
```

清除整个缓存，运行：

```
$ npm cache clean --force
```

### 查看 npm 配置

要查看 npm 配置，键入：

```
$ npm config list
```

或者：

```
$ npm config ls
```

示例输出：

```
; cli configs
metrics-registry = "https://registry.npmjs.org/"
scope = ""
user-agent = "npm/5.6.0 node/v9.4.0 linux x64"

; node bin location = /home/sk/.nvm/versions/node/v9.4.0/bin/node
; cwd = /home/sk
; HOME = /home/sk
; "npm config ls -l" to show all defaults.
```

要显示当前的全局位置：

```
$ npm config get prefix
/home/sk/.nvm/versions/node/v9.4.0
```

好吧，这就是全部了。我们刚才介绍的只是基础知识，npm 是一个广泛话题。有关更多详细信息，参阅 [**NPM Getting Started**][3] 指南。

希望这对你有帮助。更多好东西即将来临，敬请关注！

干杯！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/manage-nodejs-packages-using-npm/

作者：[SK][a]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/manage-python-packages-using-pip/
[2]:https://www.npmjs.com/package/commander
[3]:https://docs.npmjs.com/getting-started/
