[#]: subject: "How to check for update info and changelogs with rpm-ostree db"
[#]: via: "https://fedoramagazine.org/how-to-check-for-update-info-and-changelogs-with-rpm-ostree-db/"
[#]: author: "Mateus Rodrigues Costa https://fedoramagazine.org/author/mateusrodcosta/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13803-1.html"

如何用 rpm-ostree 数据库检查更新信息和更新日志
======

![][1]

这篇文章将教你如何使用 `rpm-ostree` 数据库及其子命令检查更新、检查更改的软件包和阅读更新日志。

这些命令将在 Fedora Silverblue 上进行演示，并且应该在任何使用 `rpm-ostree` 的操作系统上工作。

### 简介

假设你对不可更改的系统感兴趣。在基于容器技术构建用例时使用只读的基本系统听起来非常有吸引力，它会说服你选择使用 `rpm-ostree` 的发行版。

你现在发现自己在 [Fedora Silverblue][4]（或其他类似的发行版）上，你想检查更新。但你遇到了一个问题。虽然你可以通过 GNOME Software 找到 Fedora Silverblue 上的更新包，但你实际上无法阅读它们的更新日志。你也不能 [使用 dnf updateinfo 在命令行上读取它们][5]，因为主机系统上没有 DNF。

那么，你应该怎么做呢？嗯，`rpm-ostree` 有一些子命令可以在这种情况下提供帮助。

### 检查更新

第一步是检查更新。只需运行：

```
$ rpm-ostree upgrade --check
...
AvailableUpdate:
        Version: 34.20210905.0 (2021-09-05T20:59:47Z)
         Commit: d8bab818f5abcfb58d2c038614965bf26426d55667e52018fcd295b9bfbc88b4
   GPGSignature: Valid signature by 8C5BA6990BDB26E19F2A1A801161AE6945719A39
  SecAdvisories: 1 moderate
           Diff: 4 upgraded
```

请注意，虽然它没有在输出中告诉更新的软件包，但它显示了更新的提交为 `d8bab818f5abcfb58d2c038614965bf26426d55667e52018fcd295b9bfbc88b4`。这在后面会很有用。

接下来你需要做的是找到你正在运行的当前部署的提交。运行 `rpm-ostree status` 以获得当前部署的<ruby>基提交<rt>BaseCommit</rt></ruby>：

```
$ rpm-ostree status
State: idle
Deployments:
● fedora:fedora/34/x86_64/silverblue
                   Version: 34.20210904.0 (2021-09-04T19:16:37Z)
                BaseCommit: e279286dcd8b5e231cff15c4130a4b1f5a03b6735327b213ee474332b311dd1e
              GPGSignature: Valid signature by 8C5BA6990BDB26E19F2A1A801161AE6945719A39
       RemovedBasePackages: ...
           LayeredPackages: ...
...
```

对于这个例子，基提交是`e279286dcd8b5e231cff15c4130a4b1f5a03b6735327b213ee474332b311dd1e`。

现在你可以用 `rpm-ostree db diff [commit1] [commit2]` 找到这两个提交的差异。在这个命令中，`[commit1]` 将是当前部署的基提交，`[commit2]` 将是升级检查命令中的提交。

```
$ rpm-ostree db diff e279286dcd8b5e231cff15c4130a4b1f5a03b6735327b213ee474332b311dd1e d8bab818f5abcfb58d2c038614965bf26426d55667e52018fcd295b9bfbc88b4
ostree diff commit from: e279286dcd8b5e231cff15c4130a4b1f5a03b6735327b213ee474332b311dd1e
ostree diff commit to:   d8bab818f5abcfb58d2c038614965bf26426d55667e52018fcd295b9bfbc88b4
Upgraded:
  soundtouch 2.1.1-6.fc34 -> 2.1.2-1.fc34
```

`diff` 输出显示 `soundtouch` 被更新了，并指出了版本号。通过在前面的命令中加入 `-changelogs` 来查看更新日志：

```
$ rpm-ostree db diff e279286dcd8b5e231cff15c4130a4b1f5a03b6735327b213ee474332b311dd1e d8bab818f5abcfb58d2c038614965bf26426d55667e52018fcd295b9bfbc88b4 --changelogs
ostree diff commit from: e279286dcd8b5e231cff15c4130a4b1f5a03b6735327b213ee474332b311dd1e
ostree diff commit to:   d8bab818f5abcfb58d2c038614965bf26426d55667e52018fcd295b9bfbc88b4
Upgraded:
  soundtouch 2.1.1-6.fc34.x86_64 -> 2.1.2-1.fc34.x86_64
    * dom ago 29 2021 Uwe Klotz <uwe.klotz@gmail.com> - 2.1.2-1
    - Update to new upstream version 2.1.2
      Bump version to 2.1.2 to correct incorrect version info in configure.ac

    * sex jul 23 2021 Fedora Release Engineering <releng@fedoraproject.org> - 2.1.1-7
    - Rebuilt for https://fedoraproject.org/wiki/Fedora_35_Mass_Rebuild
```

这个输出显示了提交说明以及版本号。

### 总结

使用 `rpm-ostree db`，你现在可以拥有相当于 `dnf check-update` 和 `dnf updateinfo` 的功能。

如果你想检查你所安装的更新的详细信息，这将非常有用。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-check-for-update-info-and-changelogs-with-rpm-ostree-db/

作者：[Mateus Rodrigues Costa][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mateusrodcosta/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/09/rpm-ostree-db_changelog-816x345.jpg
[2]: https://unsplash.com/@dancristianp?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/backdrop?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://fedoramagazine.org/what-is-silverblue/
[5]: https://fedoramagazine.org/use-dnf-updateinfo-to-read-update-changelogs/
