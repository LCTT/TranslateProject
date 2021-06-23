[#]: subject: (Replace du with dust on Linux)
[#]: via: (https://opensource.com/article/21/6/dust-linux)
[#]: author: (Sudeshna Sur https://opensource.com/users/sudeshna-sur)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Replace du with dust on Linux
======
The dust command is a more intuitive implementation of the du command
written in Rust.
![Sand dunes][1]

If you work on the Linux command line, you will be familiar with the `du` command. Knowing commands like `du`, which returns information about disk usage quickly, is one of the ways the command line makes programmers more productive. Yet if you're looking for a way to save even more time and make your life even easier, take a look at [dust][2], which is `du` rewritten in Rust with more intuitiveness.

In short, `dust` is a tool that provides a file's type and metadata. If you trigger `dust` in a directory, it will report that directory's disk utilization in a couple of ways. It provides a very informative graph that tells you which folder is using the most disk space. If there is a nested folder, you can see the percentage of space used by each folder.

### Install dust

You can install `dust` using Rust's Cargo package manager:


```
`$ cargo install du-dust`
```

Alternately, you might find it in your software repository on Linux, and on macOS, use [MacPorts][3] or [Homebrew][4].

### Explore dust

Issuing the `dust` command on a directory returns a graph that shows its contents and what percentage each item holds in a tree format.


```
$ dust
 5.7M   ┌── exa                                                           │                                                ██ │   2%
 5.9M   ├── tokei                                                         │                                                ██ │   2%
 6.1M   ├── dust                                                          │                                                ██ │   2%
 6.2M   ├── tldr                                                          │                                                ██ │   2%
 9.4M   ├── fd                                                            │                                                ██ │   4%
 2.9M   │ ┌── exa                                                         │                                              ░░░█ │   1%
  15M   │ ├── rustdoc                                                     │                                              ░███ │   6%
  18M   ├─┴ bin                                                           │                                              ████ │   7%
  27M   ├── rg                                                            │                                            ██████ │  11%
 1.3M   │     ┌── libz-sys-1.1.3.crate                                    │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█ │   0%
 1.4M   │     ├── libgit2-sys-0.12.19+1.1.0.crate                         │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█ │   1%
 4.5M   │   ┌─┴ github.com-1ecc6299db9ec823                               │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█ │   2%
 4.5M   │ ┌─┴ cache                                                       │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█ │   2%
 1.0M   │ │   ┌── git2-0.13.18                                            │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓█ │   0%
 1.4M   │ │   ├── exa-0.10.1                                              │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓█ │   1%
 1.5M   │ │   │ ┌── src                                                   │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓█ │   1%
 2.2M   │ │   ├─┴ idna-0.2.3                                              │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓█ │   1%
 1.2M   │ │   │       ┌── linux                                           │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓█ │   0%
 1.6M   │ │   │     ┌─┴ linux_like                                        │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓█ │   1%
 2.6M   │ │   │   ┌─┴ unix                                                │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓█ │   1%
 3.1M   │ │   │ ┌─┴ src                                                   │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓█ │   1%
 3.1M   │ │   ├─┴ libc-0.2.94                                             │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓█ │   1%
 1.2M   │ │   │     ┌── test                                              │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓█ │   0%
 2.6M   │ │   │   ┌─┴ zlib-ng                                             │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓█ │   1%
 904K   │ │   │   │   ┌── vstudio                                         │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓█ │   0%
 2.0M   │ │   │   │ ┌─┴ contrib                                           │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓█ │   1%
 3.4M   │ │   │   ├─┴ zlib                                                │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓█ │   1%
 6.1M   │ │   │ ┌─┴ src                                                   │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓██ │   2%
 6.1M   │ │   ├─┴ libz-sys-1.1.3                                          │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓██ │   2%
 1.6M   │ │   │     ┌── pcre                                              │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓█ │   1%
 2.5M   │ │   │   ┌─┴ deps                                                │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓█ │   1%
 3.8M   │ │   │   ├── src                                                 │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓█ │   1%
 7.4M   │ │   │ ┌─┴ libgit2                                               │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓██ │   3%
 7.6M   │ │   ├─┴ libgit2-sys-0.12.19+1.1.0                               │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓██ │   3%
  26M   │ │ ┌─┴ github.com-1ecc6299db9ec823                               │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██████ │  10%
  26M   │ ├─┴ src                                                         │               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██████ │  10%
 932K   │ │   ┌── .cache                                                  │               ░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█ │   0%
  11M   │ │   │     ┌── pack-c3e3a51a17096a3078196f3f014e02e5da6285aa.idx │               ░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███ │   4%
 135M   │ │   │     ├── pack-c3e3a51a17096a3078196f3f014e02e5da6285aa.pack│               ░░░░░░▓▓███████████████████████████ │  53%
 147M   │ │   │   ┌─┴ pack                                                │               ░░░░░░█████████████████████████████ │  57%
 147M   │ │   │ ┌─┴ objects                                               │               ░░░░░░█████████████████████████████ │  57%
 147M   │ │   ├─┴ .git                                                    │               ░░░░░░█████████████████████████████ │  57%
 147M   │ │ ┌─┴ github.com-1ecc6299db9ec823                               │               ░░░░░░█████████████████████████████ │  57%
 147M   │ ├─┴ index                                                       │               ░░░░░░█████████████████████████████ │  57%
 178M   ├─┴ registry                                                      │               ███████████████████████████████████ │  69%
 257M ┌─┴ .                                                               │██████████████████████████████████████████████████ │ 100%
$
```

To apply `dust` to a specific directory:


```
`$ dust ~/Work/`
```

![Dust output from a specific directory][5]

(Sudeshna Sur, [CC BY-SA 4.0][6])

The `-r` option shows the output in reverse order, with root at the bottom:


```
`$ dust -r ~/Work/`
```

Using `dust -d 3` returns three levels of subdirectories and their disk utilization:


```
`$ dust -d 3 ~/Work/wildfly/jaxrs/target/classes`[/code] [code]

$ dust -d 3 ~/Work/wildfly/jaxrs/target/classes
 4.0K     ┌── jaxrs.xml                                                           │                                         █ │   1%
 4.0K   ┌─┴ subsystem-templates                                                   │                                         █ │   1%
 4.0K   │   ┌── org.jboss.as.controller.transform.ExtensionTransformerRegistration│                                         █ │   1%
 4.0K   │   ├── org.jboss.as.controller.Extension                                 │                                         █ │   1%
 8.0K   │ ┌─┴ services                                                            │                                         █ │   2%
 8.0K   ├─┴ META-INF                                                              │                                         █ │   2%
 4.0K   │ ┌── jboss-as-jaxrs_1_0.xsd                                              │                                        ░█ │   1%
 8.0K   │ ├── jboss-as-jaxrs_2_0.xsd                                              │                                        ░█ │   2%
  12K   ├─┴ schema                                                                │                                        ██ │   3%
 408K   │   ┌── as                                                                │  ████████████████████████████████████████ │  94%
 408K   │ ┌─┴ jboss                                                               │  ████████████████████████████████████████ │  94%
 408K   ├─┴ org                                                                   │  ████████████████████████████████████████ │  94%
 432K ┌─┴ classes                                                                 │██████████████████████████████████████████ │ 100%
$
```

### Conclusion

The beauty of `dust` lies in being a small, simple, and easy-to-understand command. It uses a color scheme to denote the largest subdirectories, making it easy to visualize your directory. It's a popular project, and contributions are welcome.

Have you used or considered using `dust`? If so, please let us know your thoughts in the comments below.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/dust-linux

作者：[Sudeshna Sur][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sudeshna-sur
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/sand_dunes_desert_hills_landscape_nature.jpg?itok=wUByylBb
[2]: https://github.com/bootandy/dust
[3]: https://opensource.com/article/20/11/macports
[4]: https://opensource.com/article/20/6/homebrew-mac
[5]: https://opensource.com/sites/default/files/uploads/dust-work.png (Dust output from a specific directory)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
