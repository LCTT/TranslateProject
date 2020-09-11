[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12156-1.html)
[#]: subject: (Manage complex Git workspaces with Great Teeming Workspaces)
[#]: via: (https://opensource.com/article/20/2/git-great-teeming-workspaces)
[#]: author: (Daniel Gryniewicz https://opensource.com/users/dang)

使用 GTWS 管理复杂的 Git 工作空间
======

> GTWS 是一系列脚本，它使我们在开发环境中管理不同的项目和项目的各个版本变得很容易。

![](https://img.linux.net.cn/data/attachment/album/202004/27/182149xh9s7kb5bkf5875b.jpg)

[Great Teeming Workspaces][2]（GTWS）是一个 Git 的复杂工作空间管理工具包，它使我们在开发环境中管理不同的项目和项目的各个版本变得很容易。

有点像 Python 的 [venv][3]，但不是为 Python 语言准备的。GTWS 用来管理多个项目的多个版本的工作空间。你可以很容易地创建、更新、进入和离开工作空间，每个项目或版本的组合（最多）有一个本地的  origin，用来与 upstream 同步 — 其余的所有工作空间都从本地的 origin 更新。

### 部署

```
${GTWS_ORIGIN}/<project>/<repo>[/<version>]
${GTWS_BASE_SRCDIR}/<project>/<version>/<workspacename>/{<repo>[,<repo>...]}
```

源代码目录的每一级（包括全局的家目录）可以包含一个 `.gtwsrc` 文件，这个文件中维护与当前级相关的设置和 bash 代码。每一级的配置会覆盖上一级。

### 安装

用下面的命令检出 GTWS：

```
git clone https://github.com/dang/gtws.git
```

配置你的 `${HOME}/.gtwsrc`。它应该包含 `GTWS_ORIGIN`，也可以再包含 `GTWS_SETPROMPT`。

把仓库目录加到环境变量中：

```
export PATH="${PATH}:/path/to/gtws
```

### 配置

通过级联 `.gtwsrc` 文件来进行配置。它从根目录向下遍历，会执行在每级目录中找到的 `.gtwsrc` 文件。下级目录的文件会覆盖上一级。

在你最上层的文件 `~/.gtws/.gtwsrc` 中进行如下设置：

  * `GTWS_BASE_SRCDIR`：所有项目源文件目录树的基目录。默认为 `$HOME/src`。
  * `GTWS_ORIGIN`： 指定 origin git 目录树的路径。默认为 `$HOME/origin`。
  * `GTWS_SETPROMPT`： 可选配置。如果配置了这个参数，shell 提示符会有工作空间的名字。
  * `GTWS_DEFAULT_PROJECT`： 不指定项目或项目未知时默认的项目名。如果不指定，使用命令行时必须指明项目。
  * `GTWS_DEFAULT_PROJECT_VERSION`： 检出的默认版本。默认为 `master`。

在每个项目的根目录进行以下设置：

  * `GTWS_PROJECT`： 项目的名字（和基目录）。
  * `gtws_project_clone`： 这个函数用于克隆一个项目的指定版本。如果未定义，它会假定项目的 origin 对每一个版本都有一个单独的目录，这样会导致克隆一堆 Git 仓库。
  * `gtws_project_setup`： 在克隆完所有的仓库后，可以选择是否调用这个函数，调用后可以对项目进行必要的配置，如在 IDE 中配置工作空间。

在项目版本级进行以下设置：

  * `GTWS_PROJECT_VERSION：` 项目的版本。用于正确地从 origin 拉取代码。类似 Git 中的分支名字。

下面这些参数可以在目录树的任意地方进行配置，如果能生效，它们可以被重写多次：

  * `GTWS_PATH_EXTRA`： 这些是工作空间中加到路径后的额外的路径元素。
  * `GTWS_FILES_EXTRA`： 这些是不在版本控制内，但应该在工作空间中被检出的额外的文件。这些文件包括 `.git/info/exclude`，每个文件都与仓库的基目录相关联。

### origin 目录

`GTWS_ORIGIN` （大部分脚本中）指向拉取和推送的原始 Git 检出目录。

`${GTWS_ORIGIN}` 部署：

  * `/<project>`
    * 这是一个项目的仓库的基目录。
    * 如果指定了 `gtws_project_clone`，你可以配置任意的部署路径。
    * 如果没有指定 `gtws_project_clone`，这个路径下必须有个名为 `git` 的子目录，且 `git` 目录下有一系列用来克隆的裸 Git 仓库。

### 工作流示例

假设你有一个项目名为 `Foo`，它的 upstream 为 `github.com/foo/foo.git`。这个仓库有个名为 `bar` 的子模块，它的 upstream 是 `github.com/bar/bar.git`。Foo 项目在 master 分支开发，使用稳定版本的分支。

为了能在 Foo 中使用 GTWS，你首先要配置目录结构。本例中假设你使用默认的目录结构。

  * 配置你最上层的 `.gtwsrc`：
    * `cp ${GTWS_LOC}/examples/gtwsrc.top ~/.gtwsrc`
    * 根据需要修改 `~/.gtwsrc`。
  * 创建顶级目录：
    * `mkdir -p ~/origin ~/src`
  * 创建并配置项目目录：
    * `mkdir -p ~/src/foo`

        `cp ${GTWS_LOC}/examples/gtwsrc.project ~/src/foo/.gtwsrc`
    * 根据需要修改 `~/src/foo/.gtwsrc`。
  * 创建并配置 master 版本目录：
    * `mkdir -p ~/src/foo/master`

        `cp ${GTWS_LOC}/examples/gtwsrc.version ~/src/foo/master/.gtwsrc`
    * 根据需要修改 `~/src/foo/master/.gtwsrc`。
  * 进入版本目录并创建一个临时工作空间来配置镜像：
    * `mkdir -p ~/src/foo/master/tmp`

        `cd ~/src/foo/master/tmp`

        `git clone --recurse-submodules git://github.com/foo/foo.git`

        `cd foo`

        `gtws-mirror -o ~/origin -p foo`（译注：这个地方原文有误，不加 `-s` 参数会报错）
    * 上面命令会创建 `~/origin/foo/git/foo.git` 和 `~/origin/foo/submodule/bar.git`。
    * 以后的克隆操作会从这些 origin 而不是 upstream 克隆。
    * 现在可以删除工作空间了。

到现在为止，Foo 的 master 分支的工作可以结束了。假设你现在想修复一个 bug，名为 `bug1234`。你可以脱离你当前的工作空间为修复这个 bug 单独创建一个工作空间，之后在新创建的工作空间中开发。

  * 进入版本目录，创建一个新的工作空间：
    * `cd ~/src/foo/master`

        `mkws bug1234`
    * 上面的命令创建了 `bug1234/`，在这个目录下检出了 Foo（和它的子模块 `bar`），并创建了 `build/foo` 来构建它。
  * 有两种方式进入工作空间：
    * `cd ~/src/foo/master/bug1234`

        `startws` 
        
        或者 
        
        `cd ~/src/foo/master/`
        
        `startws bug1234`
    * 上面的命令在 `bug1234` 工作空间中开启了一个子 shell。这个 shell 有 GTWS 的环境和你在各级 `.gtwsrc` 文件中设置的环境。它也把你工作空间的基目录加入到了 CD，因此你可以从 base 路径 `cd` 到相关的目录中。
    * 现在你可以修复 `bug1234` 了，构建、测试、提交你的修改。当你可以把代码推送到 upstream 时，执行下面的命令：

        `cd foo`
        
        `wspush` 
    * `wspush` 会把代码推送到与你工作空间相关的分支 — 先推送到本地的 origin，再推送到 upstream。
    * 当 upstream 有修改时，你可以用下面的命令同步到本地：

        `git sync`
    * 上面的命令调用了 GTWS 的 `git-sync` 脚本，会从本地 origin 更新代码。使用下面的命令来更新本地的 origin：

        `git sync -o` 
    * 上面的命令会更新你本地的 origin 和子模块的镜像，然后用那些命令来更新你的检出仓库的代码。`git-sync` 也有一些其他的很好的工鞥。
    * 当要结束工作空间中的工作时，直接退出 shell：

        `exit`
    * 你可以在任何时间重复进入工作空间，也可以在同一时间在相同的工作空间中开多个 shell。
  * 当你不需要某个工作空间时，你可以使用 `rmws` 来删除它，或者直接删除它的目录树。
  * 还有一个脚本 `tmws` 使用 tmux 进入工作空间，能创建一系列的窗口/窗格，这完美契合我的工作流。你可以根据你自己的需求来修改它。


--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/git-great-teeming-workspaces

作者：[Daniel Gryniewicz][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dang
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: https://github.com/dang/gtws
[3]: https://docs.python.org/3/library/venv.html
