使用 Stratis 从命令行管理 Linux 存储
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/find-file-linux-code_magnifying_glass_zero.png?itok=E2HoPDg0)

正如本系列的[第一部分][1]和[第二部分][2]中所讨论的，Stratis 是一个具有与 [ZFS][3] 和 [Btrfs] [4] 相似功能的卷管理文件系统。在本文中，我们将介绍如何在命令行上使用 Stratis。

### 安装 Stratis

对于非开发人员，现在尝试 Stratis 最简单的方法是在 [Fedora 28][5] 中。

你可以用以下命令安装 Stratis 守护进程和 Stratis 命令行工具：
```
# dnf install stratis-cli stratisd

```

### 创建一个池

Stratis 有三个概念：blockdevs、池和文件系统。 Blockdevs 是组成池的块设备，例如磁盘或磁盘分区。一旦创建池，就可以从中创建文件系统。

假设你的系统上有一个名为 `vdg` 的块设备，它目前没有被使用或挂载，你可以在它上面创建一个 Stratis 池：
```
# stratis pool create mypool /dev/vdg

```

这假设 `vdg` 是完全清零并且是空的。如果它没有被使用，但有旧数据，则可能需要使用 `pool create` 的 ` - force` 选项。如果正在使用，请勿将它用于 Stratis。

如果你想从多个块设备创建一个池，只需在 `pool create` 命令行中列出它们。你也可以稍后使用 `blockdev add-data` 命令添加更多的 blockdevs。请注意，Stratis 要求 blockdevs 的大小至少为 1 GiB。

### 创建文件系统

在你创建了一个名为 `mypool` 的池后，你可以从它创建文件系统：
```
# stratis fs create mypool myfs1

```

从 `mypool` 池创建一个名为 `myfs1` 的文件系统后，可以使用 Stratis 在 /dev/stratis 中创建的条目来挂载并使用它：
```
# mkdir myfs1

# mount /dev/stratis/mypool/myfs1 myfs1

```

文件系统现在已被挂载在 `myfs1` 上并准备可以使用。

### 快照

除了创建空文件系统之外，你还可以创建一个文件系统作为现有文件系统的快照：
```
# stratis fs snapshot mypool myfs1 myfs1-experiment

```

这样做后，你可以挂载新的 `myfs1-experiment`，它将初始包含与 `myfs1` 相同的文件内容，但它可能随着文件系统的修改而改变。无论你对 `myfs1-experiment` 所做的任何更改都不会反映到 `myfs1` 中，除非你卸载了 `myfs1` 并将其销毁：
```
# umount myfs1

# stratis fs destroy mypool myfs1

```

然后进行快照以重新创建并重新挂载它：
```
# stratis fs snapshot mypool myfs1-experiment myfs1

# mount /dev/stratis/mypool/myfs1 myfs1

```

### 获取信息

Stratis 可以列出系统中的池：
```
# stratis pool list

```

随着文件系统写入更多数据，你将看到 “Total Physical Used” 值的增加。当这个值接近 “Total Physical Size” 时要小心。我们仍在努力处理这个问题。

列出池中的文件系统：
```
# stratis fs list mypool

```

列出组成池的 blockdevs：
```
# stratis blockdev list mypool

```

目前只提供这些最少的信息，但它们将在未来提供更多信息。

#### 摧毁池

当你了解了 Stratis 可以做什么后，要摧毁池，首先确保从它创建的所有文件系统都被卸载并销毁，然后使用 `pool destroy` 命令：
```
# umount myfs1

# umount myfs1-experiment (if you created it)

# stratis fs destroy mypool myfs1

# stratis fs destroy mypool myfs1-experiment

# stratis pool destroy mypool

```

`stratis pool list`  现在应该显示没有池。

就是这些！有关更多信息，请参阅手册页：“man stratis”。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/stratis-storage-linux-command-line

作者：[Andy Grover][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/agrover
[1]:https://opensource.com/article/18/4/stratis-easy-use-local-storage-management-linux
[2]:https://opensource.com/article/18/4/stratis-lessons-learned
[3]:https://en.wikipedia.org/wiki/ZFS
[4]:https://en.wikipedia.org/wiki/Btrfs
[5]:https://fedoraproject.org/wiki/Releases/28/Schedule
