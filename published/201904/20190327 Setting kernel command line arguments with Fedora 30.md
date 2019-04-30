[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10715-1.html)
[#]: subject: (Setting kernel command line arguments with Fedora 30)
[#]: via: (https://fedoramagazine.org/setting-kernel-command-line-arguments-with-fedora-30/)
[#]: author: (Laura Abbott https://fedoramagazine.org/makes-fedora-kernel/)

如何在 Fedora 30 中设置内核命令行参数
======

![][1]

在调试或试验内核时，向内核命令行添加选项是一项常见任务。即将发布的 Fedora 30 版本改为使用 Bootloader 规范（[BLS][2]）。根据你修改内核命令行选项的方式，你的工作流可能会更改。继续阅读获取更多信息。

要确定你的系统是使用 BLS 还是旧的规范，请查看文件：

```
/etc/default/grub
```

如果你看到：

```
GRUB_ENABLE_BLSCFG=true
```

看到这个，你运行的是 BLS，你可能需要更改设置内核命令行参数的方式。

如果你只想修改单个内核条目（例如，暂时解决显示问题），可以使用 `grubby` 命令：

```
$ grubby --update-kernel /boot/vmlinuz-5.0.1-300.fc30.x86_64 --args="amdgpu.dc=0"
```

要删除内核参数，可以传递 `--remove-args` 参数给 `grubby`：

```
$ grubby --update-kernel /boot/vmlinuz-5.0.1-300.fc30.x86_64 --remove-args="amdgpu.dc=0"
```

如果有应该添加到每个内核命令行的选项（例如，你希望禁用 `rdrand` 指令生成随机数），则可以运行 `grubby` 命令：

```
$ grubby --update-kernel=ALL --args="nordrand"
```

这将更新所有内核条目的命令行，并保存作为将来条目的命令行选项。

如果你想要从所有内核中删除该选项，则可以再次使用 `--remove-args` 和 `--update-kernel=ALL`：

```
$ grubby --update-kernel=ALL --remove-args="nordrand"
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/setting-kernel-command-line-arguments-with-fedora-30/

作者：[Laura Abbott][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/makes-fedora-kernel/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/03/f30-kernel-1-816x345.jpg
[2]: https://fedoraproject.org/wiki/Changes/BootLoaderSpecByDefault
