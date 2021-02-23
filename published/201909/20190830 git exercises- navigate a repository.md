[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11379-1.html)
[#]: subject: (git exercises: navigate a repository)
[#]: via: (https://jvns.ca/blog/2019/08/30/git-exercises--navigate-a-repository/)
[#]: author: (Julia Evans https://jvns.ca/)

Git 练习：存储库导航
======

我觉得前几天的 [curl 练习][1]进展顺利，所以今天我醒来后，想尝试编写一些 Git 练习。Git 是一大块需要学习的技能，可能要花几个小时才能学会，所以我分解练习的第一个思路是从“导航”一个存储库开始的。

我本来打算使用一个玩具测试库，但后来我想，为什么不使用真正的存储库呢？这样更有趣！因此，我们将浏览 Ruby 编程语言的存储库。你无需了解任何 C 即可完成此练习，只需熟悉一下存储库中的文件随时间变化的方式即可。

### 克隆存储库

开始之前，需要克隆存储库：

```
git clone https://github.com/ruby/ruby
```

与实际使用的大多数存储库相比，该存储库的最大不同之处在于它没有分支，但是它有很多标签，它们与分支相似，因为它们都只是指向一个提交的指针而已。因此，我们将使用标签而不是分支进行练习。*改变*标签的方式和分支非常不同，但*查看*标签和分支的方式完全相同。

### Git SHA 总是引用同一个代码

执行这些练习时要记住的最重要的一点是，如本页面所述，像`9e3d9a2a009d2a0281802a84e1c5cc1c887edc71` 这样的 Git SHA 始终引用同一个的代码。下图摘自我与凯蒂·西勒·米勒撰写的一本杂志，名为《[Oh shit, git!][2]》。（她还有一个名为 <https://ohshitgit.com/> 的很棒的网站，启发了该杂志。）

![](https://wizardzines.com/zines/oh-shit-git/samples/ohshit-commit.png)

我们将在练习中大量使用 Git SHA，以使你习惯于使用它们，并帮助你了解它们与标签和分支的对应关系。

### 我们将要使用的 Git 子命令

所有这些练习仅使用这 5 个 Git 子命令：

```
git checkout
git log (--oneline, --author, and -S will be useful)
git diff (--stat will be useful)
git show
git status
```

### 练习

1. 查看 matz 从 1998 年开始的 Ruby 提交。提交 ID 为 ` 3db12e8b236ac8f88db8eb4690d10e4a3b8dbcd4`。找出当时 Ruby 的代码行数。
2. 检出当前的 master 分支。
3. 查看文件 `hash.c` 的历史记录。更改该文件的最后一个提交 ID 是什么？
4. 了解最近 20 年来 `hash.c` 的变化：将 master 分支上的文件与提交 `3db12e8b236ac8f88db8eb4690d10e4a3b8dbcd4` 的文件进行比较。
5. 查找最近更改了 `hash.c` 的提交，并查看该提交的差异。
6. 对于每个 Ruby 版本，该存储库都有一堆**标签**。获取所有标签的列表。
7. 找出在标签 `v1_8_6_187` 和标签 `v1_8_6_188` 之间更改了多少文件。
8. 查找 2015 年的提交（任何一个提交）并将其检出，简单地查看一下文件，然后返回 master 分支。
9. 找出标签 `v1_8_6_187` 对应的提交。
10. 列出目录 `.git/refs/tags`。运行 `cat .git/refs/tags/v1_8_6_187` 来查看其中一个文件的内容。
11. 找出当前 `HEAD` 对应的提交 ID。
12. 找出已经对 `test/` 目录进行了多少次提交。 
13. 提交 `65a5162550f58047974793cdc8067a970b2435c0` 和 `9e3d9a2a009d2a0281802a84e1c5cc1c887edc71` 之间的 `lib/telnet.rb` 的差异。该文件更改了几行？
14. 在 Ruby 2.5.1 和 2.5.2 之间进行了多少次提交（标记为 `v2_5_1` 和 `v2_5_3`）（这一步有点棘手，步骤不只一步）
15. “matz”（Ruby 的创建者）作了多少提交？
16. 最近包含 “tkutil” 一词的提交是什么？
17. 检出提交 `e51dca2596db9567bd4d698b18b4d300575d3881` 并创建一个指向该提交的新分支。
18. 运行 `git reflog` 以查看你到目前为止完成的所有存储库导航操作。
  
--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2019/08/30/git-exercises--navigate-a-repository/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://jvns.ca/blog/2019/08/27/curl-exercises/
[2]: https://wizardzines.com/zines/oh-shit-git/
