Fedora 内核是由什么构成的？
====================================

![](https://cdn.fedoramagazine.org/wp-content/uploads/2016/06/kernel-945x400.png)

每个 Fedora 系统都运行着一个内核。许多代码片段组合在一起使之成为现实。

每个 Fedora 内核都起始于一个来自于[上游社区][1]的基线版本——通常称之为 vanilla 内核。上游内核就是标准。（Fedora 的）目标是包含尽可能多的上游代码，这样使得 bug 修复和 API 更新更加容易，同时也会有更多的人审查代码。理想情况下，Fedora 能够直接获取 kernel.org 的内核，然后发送给所有用户。

现实情况是，使用 vanilla 内核并不能完全满足 Fedora。Vanilla 内核可能并不支持一些 Fedora 用户希望拥有的功能。用户接收的 [Fedora 内核] 是在 vanilla 内核之上打了很多补丁的内核。这些补丁被认为“不在树上（out of tree）”。许多这些位于补丁树之外的补丁都不会存在太久。如果某补丁能够修复一个问题，那么该补丁可能会被合并到 Fedora 树，以便用户能够更快地收到修复。当内核变基到一个新版本时，在新版本中的补丁都将被清除。

一些补丁会在 Fedora 内核树上存在很长时间。一个很好的例子是，安全启动补丁就是这类补丁。这些补丁提供了 Fedora 希望支持的功能，即使上游社区还没有接受它们。保持这些补丁更新是需要付出很多努力的，所以 Fedora 尝试减少不被上游内核维护者接受的补丁数量。

通常来说，想要在 Fedora 内核中获得一个补丁的最佳方法是先给 [Linux 内核邮件列表（LKML）][3] 发送补丁，然后请求将该补丁包含到 Fedora 中。如果某个维护者接受了补丁，就意味着 Fedora 内核树中将来很有可能会包含该补丁。一些来自于 GitHub 等地方的还没有提交给 LKML 的补丁是不可能进入内核树的。首先向 LKML 发送补丁是非常重要的，它能确保 Fedora 内核树中携带的补丁是功能正常的。如果没有社区审查，Fedora 最终携带的补丁将会充满 bug 并会导致问题。

Fedora 内核中包含的代码来自许多地方。一切都需要提供最佳的体验。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/makes-fedora-kernel/

作者：[Laura Abbott][a]
译者：[ChrisLeeGit](https://github.com/chrisleegit)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/makes-fedora-kernel/
[1]: http://www.kernel.org/
[2]: http://pkgs.fedoraproject.org/cgit/rpms/kernel.git/
[3]: http://www.labbott.name/blog/2015/10/02/the-art-of-communicating-with-lkml/
