[#]: collector: "lujun9972"
[#]: translator: "furrybear"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-11215-1.html"
[#]: subject: "How to create a pull request in GitHub"
[#]: via: "https://opensource.com/article/19/7/create-pull-request-github"
[#]: author: "Kedar Vijay Kulkarni https://opensource.com/users/kkulkarn"

如何在 Github 上创建一个拉取请求
======

> 学习如何复刻一个仓库，进行更改，并要求维护人员审查并合并它。

![a checklist for a team][1]

你知道如何使用 git 了，你有一个 [GitHub][2] 仓库并且可以向它推送。这一切都很好。但是你如何为他人的 GitHub 项目做出贡献？ 这是我在学习 git 和 GitHub 之后想知道的。在本文中，我将解释如何<ruby>复刻<rt>fork</rt></ruby>一个 git 仓库、进行更改并提交一个<ruby>拉取请求<rt>pull request</rt></ruby>。

当你想要在一个 GitHub 项目上工作时，第一步是复刻一个仓库。

![Forking a GitHub repo][3]

你可以使用[我的演示仓库][4]试一试。

当你在这个页面时，单击右上角的 “Fork”（复刻）按钮。这将在你的 GitHub 用户账户下创建我的演示仓库的一个新副本，其 URL 如下：

```
https://github.com/<你的用户名>/demo
```

这个副本包含了原始仓库中的所有代码、分支和提交。

接下来，打开你计算机上的终端并运行命令来<ruby>克隆<rt>clone</rt></ruby>仓库：

```
git clone https://github.com/<你的用户名>/demo
```

一旦仓库被克隆后，你需要做两件事：

1、通过发出命令创建一个新分支 `new_branch` ：

```
git checkout -b new_branch
```

2、使用以下命令为上游仓库创建一个新的<ruby>远程<rt>remote</rt></ruby>：

```
git remote add upstream https://github.com/kedark3/demo
```

在这种情况下，“上游仓库”指的是你创建复刻来自的原始仓库。

现在你可以更改代码了。以下代码创建一个新分支，进行任意更改，并将其推送到 `new_branch` 分支：

```
$ git checkout -b new_branch
Switched to a new branch ‘new_branch’
$ echo “some test file” &gt; test
$ cat test
Some test file
$ git status
On branch new_branch
No commits yet
Untracked files:
  (use "git add &lt;file&gt;..." to include in what will be committed)
    test
nothing added to commit but untracked files present (use "git add" to track)
$ git add test
$ git commit -S -m "Adding a test file to new_branch"
[new_branch (root-commit) 4265ec8] Adding a test file to new_branch
 1 file changed, 1 insertion(+)
 create mode 100644 test
$ git push -u origin new_branch
Enumerating objects: 3, done.
Counting objects: 100% (3/3), done.
Writing objects: 100% (3/3), 918 bytes | 918.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0)
Remote: Create a pull request for ‘new_branch’ on GitHub by visiting:
Remote:   <http://github.com/example/Demo/pull/new/new\_branch>
Remote:
 * [new branch]         new_branch -&gt; new_branch
```

一旦你将更改推送到您的仓库后， “Compare & pull request”（比较和拉取请求）按钮将出现在GitHub。

![GitHub's Compare & Pull Request button][5]

单击它，你将进入此屏幕：

![GitHub's Open pull request button][6]

单击 “Create pull request”（创建拉取请求）按钮打开一个拉取请求。这将允许仓库的维护者们审查你的贡献。然后，如果你的贡献是没问题的，他们可以合并它，或者他们可能会要求你做一些改变。

### 精简版

总之，如果您想为一个项目做出贡献，最简单的方法是：

  1. 找到您想要贡献的项目
  2. 复刻它
  3. 将其克隆到你的本地系统
  4. 建立一个新的分支
  5. 进行你的更改
  6. 将其推送回你的仓库
  7. 单击 “Compare & pull request”（比较和拉取请求）按钮
  8. 单击 “Create pull request”（创建拉取请求）以打开一个新的拉取请求

如果审阅者要求更改，请重复步骤 5 和 6，为你的拉取请求添加更多提交。

快乐编码！

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/create-pull-request-github

作者：[Kedar Vijay Kulkarni][a]
选题：[lujun9972][b]
译者：[furrybear](https://github.com/furrybear)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/kkulkarnhttps://opensource.com/users/fontanahttps://opensource.com/users/mhanwellhttps://opensource.com/users/mysentimentshttps://opensource.com/users/greg-p
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/checklist_hands_team_collaboration.png?itok=u82QepPk "a checklist for a team"
[2]: https://github.com/
[3]: https://opensource.com/sites/default/files/uploads/forkrepo.png "Forking a GitHub repo"
[4]: https://github.com/kedark3/demo
[5]: https://opensource.com/sites/default/files/uploads/compare-and-pull-request-button.png "GitHub's Compare & Pull Request button"
[6]: https://opensource.com/sites/default/files/uploads/open-a-pull-request_crop.png "GitHub's Open pull request button"
