如何在 Linux 中不安装软测试一个软件包
======
![](https://www.ostechnix.com/wp-content/uploads/2018/06/nix-720x340.png)
出于某种原因，你可能需要在将软件包安装到你的 Linux 系统之前对其进行测试。如果是这样，你很幸运！今天，我将向你展示如何在 Linux 中使用 **Nix** 包管理器来实现。Nix 包管理器的一个显著特性是它允许用户测试软件包而无需先安装它们。当你想要临时使用特定的程序时，这会很有帮助。


### 测试一个软件包而不在 Linux 中安装它

确保你先安装了 Nix 包管理器。如果尚未安装，请参阅以下指南。

例如，假设你想测试你的  C++ 代码。你不必安装 GCC。只需运行以下命令：
```
$ nix-shell -p gcc

```

该命令会构建或下载 gcc 软件包及其依赖项，然后将其放入一个存在 **gcc** 命令的 Bash shell 中，所有这些都不会影响正常环境。
```
 LANGUAGE = (unset),
LC_ALL = (unset),
LANG = "en_US.UTF-8"
are supported and installed on your system.
perl: warning: Falling back to the standard locale ("C").
download-using-manifests.pl: perl: warning: Setting locale failed.
download-using-manifests.pl: perl: warning: Please check that your locale settings:
download-using-manifests.pl: LANGUAGE = (unset),
download-using-manifests.pl: LC_ALL = (unset),
download-using-manifests.pl: LANG = "en_US.UTF-8"
download-using-manifests.pl: are supported and installed on your system.
download-using-manifests.pl: perl: warning: Falling back to the standard locale ("C").
download-from-binary-cache.pl: perl: warning: Setting locale failed.
download-from-binary-cache.pl: perl: warning: Please check that your locale settings:
download-from-binary-cache.pl: LANGUAGE = (unset),
download-from-binary-cache.pl: LC_ALL = (unset),
download-from-binary-cache.pl: LANG = "en_US.UTF-8"

[...]

fetching path ‘/nix/store/6mk1s81va81dl4jfbhww86cwkl4gyf4j-stdenv’...
perl: warning: Setting locale failed.
perl: warning: Please check that your locale settings:
LANGUAGE = (unset),
LC_ALL = (unset),
LANG = "en_US.UTF-8"
are supported and installed on your system.
perl: warning: Falling back to the standard locale ("C").

*** Downloading ‘https://cache.nixos.org/nar/0aznfg1g17a8jdzvnp3pqszs9rq2wiwf2rcgczyg5b3k6d0iricl.nar.xz’ to ‘/nix/store/6mk1s81va81dl4jfbhww86cwkl4gyf4j-stdenv’...
% Total % Received % Xferd Average Speed Time Time Time Current
Dload Upload Total Spent Left Speed
100 8324 100 8324 0 0 6353 0 0:00:01 0:00:01 --:--:-- 6373

[nix-shell:~]$

```

检查GCC版本：
```
[nix-shell:~]$ gcc -v
Using built-in specs.
COLLECT_GCC=/nix/store/dyj2k6ch35r1ips4vr97md2i0yvl4r5c-gcc-5.4.0/bin/gcc
COLLECT_LTO_WRAPPER=/nix/store/dyj2k6ch35r1ips4vr97md2i0yvl4r5c-gcc-5.4.0/libexec/gcc/x86_64-unknown-linux-gnu/5.4.0/lto-wrapper
Target: x86_64-unknown-linux-gnu
Configured with:
Thread model: posix
gcc version 5.4.0 (GCC)

```

现在，继续并测试代码。完成后，输入 **exit** 返回到控制台。
```
[nix-shell:~]$ exit
exit

```

一旦你从 nix-shell 中退出，你就不能使用 GCC。

这是另一个例子。
```
$ nix-shell -p hello

```

这会构建或下载 GNU Hello 和它的依赖关系，然后将其放入 **hello** 命令所在的 Bash shell 中，所有这些都不会影响你的正常环境：
```
[nix-shell:~]$ hello
Hello, world!

```

输入 exit 返回到控制台。
```
[nix-shell:~]$ exit

```

现在测试你的 hello 程序是否可用。
```
$ hello
hello: command not found

```

有关 Nix 包管理器的更多详细信息，请参阅以下指南。

希望本篇对你有帮助！还会有更好的东西。敬请关注！！

干杯!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-test-a-package-without-installing-it-in-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
