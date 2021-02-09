[#]: collector: (lujun9972)
[#]: translator: (gxlct008)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12737-1.html)
[#]: subject: (Using Yarn on Ubuntu and Other Linux Distributions)
[#]: via: (https://itsfoss.com/install-yarn-ubuntu)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

在 Ubuntu 和其他 Linux 发行版上使用 Yarn
======

> 本速成教程向你展示了在 Ubuntu 和 Debian Linux 上安装 Yarn 包管理器的官方方法。你还将学习到一些基本的 Yarn 命令以及彻底删除 Yarn 的步骤。

[Yarn][1] 是 Facebook 开发的开源 JavaScript 包管理器。它是流行的 npm 包管理器的一个替代品，或者应该说是改进。 [Facebook 开发团队][2] 创建 Yarn 是为了克服 [npm][3] 的缺点。 Facebook 声称 Yarn 比 npm 更快、更可靠、更安全。

与 npm 一样，Yarn 为你提供一种自动安装、更新、配置和删除从全局注册库中检索到的程序包的方法。

Yarn 的优点是它更快，因为它可以缓存已下载的每个包，所以无需再次下载。它还将操作并行化，以最大化资源利用率。在执行每个已安装的包代码之前，Yarn 还使用 [校验和来验证完整性][4]。 Yarn 还保证可以在一个系统上运行的安装，在任何其他系统上都会以完全相同地方式工作。

如果你正 [在 Ubuntu 上使用 node.js][5]，那么你的系统上可能已经安装了 npm。在这种情况下，你可以使用 npm 通过以下方式全局安装 Yarn：

```
sudo npm install yarn -g
```

不过，我推荐使用官方方式在 Ubuntu/Debian 上安装 Yarn。

### 在 Ubuntu 和 Debian 上安装 Yarn [官方方式]

![Yarn JS][6]

这里提到的说明应该适用于所有版本的 Ubuntu，例如 Ubuntu 18.04、16.04 等。同样的一组说明也适用于 Debian 和其他基于 Debian 的发行版。

由于本教程使用 `curl` 来添加 Yarn 项目的 GPG 密钥，所以最好验证一下你是否已经安装了 `curl`。

```
sudo apt install curl
```

如果 `curl` 尚未安装，则上面的命令将安装它。既然有了 `curl`，你就可以使用它以如下方式添加 Yarn 项目的 GPG 密钥：

```
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
```

在此之后，将存储库添加到源列表中，以便将来可以轻松地升级 Yarn 包，并进行其余系统更新：

```
sudo sh -c 'echo "deb https://dl.yarnpkg.com/debian/ stable main" >> /etc/apt/sources.list.d/yarn.list'
```

你现在可以继续了。[更新 Ubuntu][7] 或 Debian 系统，以刷新可用软件包列表，然后安装 Yarn：

```
sudo apt update
sudo apt install yarn
```

这将一起安装 Yarn 和 node.js。该过程完成后，请验证是否已成功安装 Yarn。 你可以通过检查 Yarn 版本来做到这一点。

```
yarn --version
```

对我来说，它显示了这样的输出：

```
yarn --version
1.12.3
```

这意味着我的系统上安装了 Yarn 版本 1.12.3。

### 使用 Yarn

我假设你对 JavaScript 编程以及依赖项的工作原理有一些基本的了解。我在这里不做详细介绍。我将向你展示一些基本的 Yarn 命令，这些命令将帮助你入门。

#### 使用 Yarn 创建一个新项目

与 `npm` 一样，Yarn 也可以使用 `package.json` 文件。在这里添加依赖项。所有依赖包都缓存在项目根目录下的 `node_modules` 目录中。

在项目的根目录中，运行以下命令以生成新的 `package.json` 文件：

它会问你一些问题。你可以按回车键跳过或使用默认值。

```
yarn init
yarn init v1.12.3
question name (test_yarn): test_yarn_proect
question version (1.0.0): 0.1
question description: Test Yarn
question entry point (index.js):
question repository url:
question author: abhishek
question license (MIT):
question private:
success Saved package.json
Done in 82.42s.
```

这样，你就得到了一个如下的 `package.json` 文件：

```
{
 "name": "test_yarn_proect",
 "version": "0.1",
 "description": "Test Yarn",
 "main": "index.js",
 "author": "abhishek",
 "license": "MIT"
}
```

现在你有了 `package.json`，你可以手动编辑它以添加或删除包依赖项，也可以使用 Yarn 命令（首选）。

#### 使用 Yarn 添加依赖项

你可以通过以下方式添加对特定包的依赖关系：

```
yarn add <包名>
```

例如，如果你想在项目中使用 [Lodash][8]，则可以使用 Yarn 添加它，如下所示：

```
yarn add lodash
yarn add v1.12.3
info No lockfile found.
[1/4] Resolving packages…
[2/4] Fetching packages…
[3/4] Linking dependencies…
[4/4] Building fresh packages…
success Saved lockfile.
success Saved 1 new dependency.
info Direct dependencies
└─ [email protected]
info All dependencies
└─ [email protected]
Done in 2.67s.
```

你可以看到，此依赖项已自动添加到 `package.json` 文件中：

```
{
 "name": "test_yarn_proect",
 "version": "0.1",
 "description": "Test Yarn",
 "main": "index.js",
 "author": "abhishek",
 "license": "MIT",
 "dependencies": {
 "lodash": "^4.17.11"
 }
}
```

默认情况下，Yarn 将在依赖项中添加最新版本的包。如果要使用特定版本，可以在添加时指定。

```
yarn add package@version-or-tag
```

像往常一样，你也可以手动更新 `package.json` 文件。

#### 使用 Yarn 升级依赖项

你可以使用以下命令将特定依赖项升级到其最新版本：

```
yarn upgrade <包名>
```

它将查看所​​涉及的包是否具有较新的版本，并且会相应地对其进行更新。

你还可以通过以下方式更改已添加的依赖项的版本：

```
yarn upgrade package_name@version_or_tag
```

你还可以使用一个命令将项目的所有依赖项升级到它们的最新版本：

```
yarn upgrade
```

它将检查所有依赖项的版本，如果有任何较新的版本，则会更新它们。

#### 使用 Yarn 删除依赖项

你可以通过以下方式从项目的依赖项中删除包：

```
yarn remove <包名>
```

#### 安装所有项目依赖项

如果对你 `project.json` 文件进行了任何更改，则应该运行：

```
yarn
```

或者，

```
yarn install
```

一次安装所有依赖项。

### 如何从 Ubuntu 或 Debian 中删除 Yarn

我将通过介绍从系统中删除 Yarn 的步骤来完成本教程，如果你使用上述步骤安装 Yarn 的话。如果你意识到不再需要 Yarn 了，则可以将它删除。

使用以下命令删除 Yarn 及其依赖项。

```
sudo apt purge yarn
```

你也应该从源列表中把存储库信息一并删除掉：

```
sudo rm /etc/apt/sources.list.d/yarn.list
```

下一步删除已添加到受信任密钥的 GPG 密钥是可选的。但要做到这一点，你需要知道密钥。你可以使用 `apt-key` 命令获得它：

```
Warning: apt-key output should not be parsed (stdout is not a terminal) pub   rsa4096 2016-10-05 [SC]       72EC F46A 56B4 AD39 C907  BBB7 1646 B01B 86E5 0310 uid           [ unknown] Yarn Packaging yarn@dan.cx sub   rsa4096 2016-10-05 [E] sub   rsa4096 2019-01-02 [S] [expires: 2020-02-02]
```

这里的密钥是以 `pub` 开始的行中 GPG 密钥指纹的最后 8 个字符。

因此，对于我来说，密钥是 `86E50310`，我将使用以下命令将其删除：

```
sudo apt-key del 86E50310
```

你会在输出中看到 `OK`，并且 Yarn 包的 GPG 密钥将从系统信任的 GPG 密钥列表中删除。

我希望本教程可以帮助你在 Ubuntu、Debian、Linux Mint、 elementary OS 等操作系统上安装 Yarn。 我提供了一些基本的 Yarn 命令，以帮助你入门，并完成了从系统中删除 Yarn 的完整步骤。

希望你喜欢本教程，如果有任何疑问或建议，请随时在下面留言。


--------------------------------------------------------------------------------

via: https://itsfoss.com/install-yarn-ubuntu

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[gxlct008](https://github.com/gxlct008)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://yarnpkg.com/lang/en/
[2]: https://code.fb.com/
[3]: https://www.npmjs.com/
[4]: https://itsfoss.com/checksum-tools-guide-linux/
[5]: https://itsfoss.com/install-nodejs-ubuntu/
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/01/yarn-js-ubuntu-debian.jpeg?resize=800%2C450&ssl=1
[7]: https://itsfoss.com/update-ubuntu/
[8]: https://lodash.com/
