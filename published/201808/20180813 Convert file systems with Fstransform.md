使用 Fstransform 转换文件系统
======

![](https://fedoramagazine.org/wp-content/uploads/2018/08/converting-filesystems-816x345.jpg)

很少有人知道他们可以将文件系统从一种类型转换为另一种类型而不会丢失数据（即非破坏性的）。这可能听起来像魔术，但 [Fstransform][1] 可以几乎以任意组合将 ext2、ext3、ext4、jfs、reiserfs 或 xfs 分区转换成另一类型。更重要的是，它可以直接执行，而无需格式化或复制数据。除此之外，还有一点好处：Fstransform 也可以处理 ntfs、btrfs、fat 和 exfat 分区。

### 在运行之前

Fstransform 存在一些警告和限制，因此强烈建议在尝试转换之前进行备份。此外，使用 Fstransform 时需要注意一些限制：

* 你的 Linux 内核必须支持源文件系统和目标文件系统。听起来很明显，如果你想使用 ext2、ext3、ext4、reiserfs、jfs 和 xfs 分区，这样不会出现风险。Fedora 支持所有分区，所以没问题。
* 将 ext2 升级到 ext3 或 ext4 不需要 Fstransform。请使用 Tune2fs。
* 源文件系统的设备必须至少有 5％ 的可用空间。
* 你需要在开始之前卸载源文件系统。
* 源文件系统存储的数据越多，转换的时间就越长。实际速度取决于你的设备，但预计它大约为每分钟 1GB。大量的硬链接也会降低转换速度。
* 虽然 Fstransform 被证明是稳定的，但请备份源文件系统上的数据。

### 安装说明

Fstransform 已经是 Fedora 的一部分。使用以下命令安装：

```
sudo dnf install fstransform
```

### 转换

![][2]

`fstransform` 命令的语法非常简单：`fstransform <源设备> <目标文件系统>`。请记住，它需要 root 权限才能运行，所以不要忘记在开头添加 `sudo`。这是一个例子：

```
sudo fstransform /dev/sdb1 ext4
```

请注意，无法转换根文件系统，这是一种安全措施。请改用测试分区或实验性 USB 盘。与此同时，Fstransform 会在控制台中有许多辅助输出。最有用的部分是预计完成时间，让你随时了解该过程需要多长时间。同样，在几乎空的驱动器上的几个小文件将使 Fstransform 在一分钟左右完成其工作，而更多真实世界的任务可能需要数小时的等待时间。

### 更多支持的文件系统

如上所述，可以尝试在 ntfs、btrfs、fat 和 exfat 分区使用 Fstransform。这些类型是早期实验性的，没有人能保证完美转换。尽管如此，还是有许多成功案例，你可以通过在测试分区上使用示例数据集测试 Fstransform 来添加自己的成功案例。可以使用 `--force-untested-file-systems` 参数启用这些额外的文件系统：

```
sudo fstransform /dev/sdb1 ntfs --force-untested-file-systems
```

有时，该过程可能会因错误而中断。请放心再次执行命令 —— 它可能最终会在两、三次尝试后完成转换。


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/transform-file-systems-in-linux/

作者：[atolstoy][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/atolstoy/
[1]:https://github.com/cosmos72/fstransform
[2]:https://fedoramagazine.org/wp-content/uploads/2018/08/Screenshot_20180805_230116.png
