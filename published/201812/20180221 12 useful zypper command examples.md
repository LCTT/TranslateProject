12 条实用的 zypper 命令范例
======

`zypper` 是 Suse Linux 系统的包和补丁管理器，你可以根据下面的 12 条附带输出示例的实用范例来学习 `zypper` 命令的使用。

![zypper 命令示例][1]

Suse Linux 使用 `zypper` 进行包管理，其是一个由 [ZYpp 包管理引擎][2]提供的包管理系统。在此篇文章中我们将分享 12 条附带输出示例的实用 `zypper` 命令，能帮助你处理日常的系统管理任务。

不带参数的 `zypper` 命令将列出所有可用的选项，这比参考详细的 man 手册要容易上手得多。

```
root@kerneltalks # zypper
  用法：
        zypper [--global-options] <command> [--command-options] [arguments]
        zypper <subcommand> [--command-options] [arguments]
 
  全局选项：
        --help, -h              帮助
        --version, -V           输出版本号
        --promptids             输出 zypper 用户提示符列表
        --config, -c <file>     使用指定的配置文件来替代默认的
        --userdata <string>     在历史和插件中使用的用户自定义事务 id
        --quiet, -q             忽略正常输出，只打印错误信息
        --verbose, -v           增加冗长程度
        --color
        --no-color              是否启用彩色模式，如果 tty 支持的话
        --no-abbrev, -A         表格中的文字不使用缩写
        --table-style, -s       表格样式（整型）
        --non-interactive, -n   不询问任何选项，自动使用默认答案
        --non-interactive-include-reboot-patches
                                针对带有重启标志的补丁，不使用交互模式
        --xmlout, -x            切换至 XML 输出
        --ignore-unknown, -i    忽略未知的包
 
        --reposd-dir, -D <dir>  使用自定义仓库文件目录
        --cache-dir, -C <dir>   为所有缓存启用可选路径
        --raw-cache-dir <dir>   启用可选 raw 元数据缓存路径
        --solv-cache-dir <dir>  启用可选 solv 文件缓存路径
        --pkg-cache-dir <dir>   启用可选包缓存路径
 
     仓库选项：
        --no-gpg-checks         忽略 GPG 检查失败并跳过
        --gpg-auto-import-keys  自动信任并导入新仓库的签名密钥
        --plus-repo, -p <URI>   使用附加仓库
        --plus-content <tag>    另外使用禁用的仓库来提供特定的关键词
                                尝试使用 '--plus-content debug' 选项来启用仓库
        --disable-repositories  不从仓库中读取元数据
        --no-refresh            不刷新仓库
        --no-cd                 忽略 CD/DVD 中的仓库
        --no-remote             忽略远程仓库
        --releasever            设置所有 .repo 文件中的 $releasever 变量（默认值：发行版版本）
 
     Target Options:
        --root, -R <dir>        在另一个根路径下进行操作
        --disable-system-resolvables
                                不读取已安装包
 
  命令：
        help, ?                 打印帮助
        shell, sh               允许多命令
 
     仓库管理：
        repos, lr               列出所有自定义仓库
        addrepo, ar             添加一个新仓库
        removerepo, rr          移除指定仓库
        renamerepo, nr          重命名指定仓库
        modifyrepo, mr          修改指定仓库
        refresh, ref            刷新所有仓库
        clean                   清除本地缓存
 
     服务管理：
        services, ls            列出所有自定义服务
        addservice, as          添加一个新服务
        modifyservice, ms       修改指定服务
        removeservice, rs       移除指定服务
        refresh-services, refs  刷新所有服务
 
     软件管理：
        install, in             安装包
        remove, rm              移除包
        verify, ve              确认包依赖的完整性
        source-install, si      安装源码包及其构建依赖
        install-new-recommends, inr
                                安装由已安装包建议一并安装的新包
 
     更新管理：
        update, up              更新已安装包至更新版本
        list-updates, lu        列出可用更新
        patch                   安装必要的补丁
        list-patches, lp        列出必要的补丁
        dist-upgrade, dup       进行发行版更新
        patch-check, pchk       检查补丁
 
     查询：
        search, se              查找符合匹配模式的包
        info, if                展示特定包的完全信息
        patch-info              展示特定补丁的完全信息
        pattern-info            展示特定模式的完全信息
        product-info            展示特定产品的完全信息
        patches, pch            列出所有可用的补丁
        packages, pa            列出所有可用的包
        patterns, pt            列出所有可用的模式
        products, pd            列出所有可用的产品
        what-provides, wp       列出提供特定功能的包
 
     包锁定：
        addlock, al             添加一个包锁定
        removelock, rl          移除一个包锁定
        locks, ll               列出当前的包锁定
        cleanlocks, cl          移除无用的锁定
 
     其他命令：
        versioncmp, vcmp        比较两个版本字符串
        targetos, tos           打印目标操作系统 ID 字符串
        licenses                打印已安装包的证书和 EULAs 报告
        download                使用命令行下载指定 rpm 包到本地目录
        source-download         下载所有已安装包的源码 rpm 包到本地目录
 
     子命令：
        subcommand              列出可用子命令
 
输入 'zypper help <command>' 来获得特定命令的帮助。
```

### 如何使用 zypper 安装包

`zypper` 通过 `in` 或 `install` 子命令来在你的系统上安装包。它的用法与 [yum 软件包安装][3] 相同。你只需要提供包名作为参数，包管理器（此处是 `zypper`）就会处理所有的依赖并与你指定的包一并安装。

```
# zypper install telnet
Refreshing service 'SMT-http_smt-ec2_susecloud_net'.
Refreshing service 'cloud_update'.
Loading repository data...
Reading installed packages...
Resolving package dependencies...
 
The following NEW package is going to be installed:
  telnet
 
1 new package to install.
Overall download size: 51.8 KiB. Already cached: 0 B. After the operation, additional 113.3 KiB will be used.
Continue? [y/n/...? shows all options] (y): y
Retrieving package telnet-1.2-165.63.x86_64                                                                                        (1/1),  51.8 KiB (113.3 KiB unpacked)
Retrieving: telnet-1.2-165.63.x86_64.rpm .........................................................................................................................[done]
Checking for file conflicts: .....................................................................................................................................[done]
(1/1) Installing: telnet-1.2-165.63.x86_64 .......................................................................................................................[done]
```

以上是我们安装 `telnet` 包时的输出，供你参考。

推荐阅读：[在 YUM 和 APT 系统中安装包][3]

### 如何使用 zypper 移除包

要在 Suse Linux 中擦除或移除包，使用 `zypper` 附带 `remove` 或 `rm` 子命令。

```
root@kerneltalks # zypper rm telnet
Loading repository data...
Reading installed packages...
Resolving package dependencies...
 
The following package is going to be REMOVED:
  telnet
 
1 package to remove.
After the operation, 113.3 KiB will be freed.
Continue? [y/n/...? shows all options] (y): y
(1/1) Removing telnet-1.2-165.63.x86_64 ..........................................................................................................................[done]
```

我们在此处移除了先前安装的 telnet 包。

### 使用 zypper 检查依赖或者认证已安装包的完整性

有时可以通过强制忽略依赖关系来安装软件包。`zypper` 使你能够扫描所有已安装的软件包并检查其依赖性。如果缺少任何依赖项，它将提供你安装或重新安装它的机会，从而保持已安装软件包的完整性。

使用附带 `verify` 或 `ve` 子命令的 `zypper` 命令来检查已安装包的完整性。

```
root@kerneltalks # zypper ve
Refreshing service 'SMT-http_smt-ec2_susecloud_net'.
Refreshing service 'cloud_update'.
Loading repository data...
Reading installed packages...
 
Dependencies of all installed packages are satisfied.
```

在上面的输出中，你能够看到最后一行说明已安装包的所有依赖都已安装完全，并且无需更多操作。

### 如何在 Suse Linux 中使用 zypper 下载包

`zypper` 提供了一种方法使得你能够将包下载到本地目录而不去安装它。你可以在其他具有同样配置的系统上使用这个已下载的软件包。包会被下载至 `/var/cache/zypp/packages/<repo>/<arch>/` 目录。

```
root@kerneltalks # zypper download telnet
Refreshing service 'SMT-http_smt-ec2_susecloud_net'.
Refreshing service 'cloud_update'.
Loading repository data...
Reading installed packages...
Retrieving package telnet-1.2-165.63.x86_64                                                                                        (1/1),  51.8 KiB (113.3 KiB unpacked)
(1/1) /var/cache/zypp/packages/SMT-http_smt-ec2_susecloud_net:SLES12-SP3-Pool/x86_64/telnet-1.2-165.63.x86_64.rpm ................................................[done]
 
download: Done.
 
# ls -lrt /var/cache/zypp/packages/SMT-http_smt-ec2_susecloud_net:SLES12-SP3-Pool/x86_64/
total 52
-rw-r--r-- 1 root root 53025 Feb 21 03:17 telnet-1.2-165.63.x86_64.rpm
 
```

你能看到我们使用 `zypper` 将 telnet 包下载到了本地。

推荐阅读：[在 YUM 和 APT 系统中只下载包而不安装][4]

### 如何使用 zypper 列出可用包更新

`zypper` 允许你浏览已安装包的所有可用更新，以便你可以提前计划更新活动。使用 `list-updates` 或 `lu` 子命令来显示已安装包的所有可用更新。

```
root@kerneltalks # zypper lu
Refreshing service 'SMT-http_smt-ec2_susecloud_net'.
Refreshing service 'cloud_update'.
Loading repository data...
Reading installed packages...
S | Repository                        | Name                       | Current Version               | Available Version                  | Arch
--|-----------------------------------|----------------------------|-------------------------------|------------------------------------|-------
v | SLES12-SP3-Updates                | at-spi2-core               | 2.20.2-12.3                   | 2.20.2-14.3.1                      | x86_64
v | SLES12-SP3-Updates                | bash                       | 4.3-82.1                      | 4.3-83.5.2                         | x86_64
v | SLES12-SP3-Updates                | ca-certificates-mozilla    | 2.7-11.1                      | 2.22-12.3.1                        | noarch
v | SLE-Module-Containers12-Updates   | containerd                 | 0.2.5+gitr639_422e31c-20.2    | 0.2.9+gitr706_06b9cb351610-16.8.1  | x86_64
v | SLES12-SP3-Updates                | crash                      | 7.1.8-4.3.1                   | 7.1.8-4.6.2                        | x86_64
v | SLES12-SP3-Updates                | rsync                      | 3.1.0-12.1                    | 3.1.0-13.10.1                      | x86_64
```

输出特意被格式化以便于阅读。每一列分别代表包所属仓库名称、包名、已安装版本、可用的更新版本和架构。

### 在 Suse Linux 中列出和安装补丁

使用 `list-patches` 或 `lp` 子命令来显示你的 Suse Linux 系统需要被应用的所有可用补丁。

```
root@kerneltalks # zypper lp
Refreshing service 'SMT-http_smt-ec2_susecloud_net'.
Refreshing service 'cloud_update'.
Loading repository data...
Reading installed packages...
 
Repository                        | Name                                     | Category    | Severity  | Interactive | Status | Summary                                 
----------------------------------|------------------------------------------|-------------|-----------|-------------|--------|------------------------------------------------------------------------------------
SLE-Module-Containers12-Updates   | SUSE-SLE-Module-Containers-12-2018-273   | security    | important | ---         | needed | Version update for docker, docker-runc, containerd, golang-github-docker-libnetwork
SLE-Module-Containers12-Updates   | SUSE-SLE-Module-Containers-12-2018-62    | recommended | low       | ---         | needed | Recommended update for sle2docker       
SLE-Module-Public-Cloud12-Updates | SUSE-SLE-Module-Public-Cloud-12-2018-268 | recommended | low       | ---         | needed | Recommended update for python-ecdsa     
SLES12-SP3-Updates                | SUSE-SLE-SERVER-12-SP3-2018-116          | security    | moderate  | ---         | needed | Security update for rsync               
---- output clipped ----
SLES12-SP3-Updates                | SUSE-SLE-SERVER-12-SP3-2018-89           | security    | moderate  | ---         | needed | Security update for perl-XML-LibXML     
SLES12-SP3-Updates                | SUSE-SLE-SERVER-12-SP3-2018-90           | recommended | low       | ---         | needed | Recommended update for lvm2             
 
Found 37 applicable patches:
37 patches needed (18 security patches)
```

使用相应的表头可以很好地组织输出。你可以轻松地找出并根据情况计划你的补丁更新。我们能看到在我们的系统中，37 个可用补丁中有 18 个是安全补丁，需要被高优先级应用！

你可以通过发出 `zypper patch` 命令安装所有需要的补丁。

### 如何使用 zypper 更新包

要使用 `zypper` 更新包，使用 `update` 或 `up` 子命令后接包名。在上述列出的更新命令中，我们知道在我们的服务器上 `rsync` 包更新可用。让我们现在来更新它吧！

```
root@kerneltalks # zypper update rsync
Refreshing service 'SMT-http_smt-ec2_susecloud_net'.
Refreshing service 'cloud_update'.
Loading repository data...
Reading installed packages...
Resolving package dependencies...
 
The following package is going to be upgraded:
  rsync
 
1 package to upgrade.
Overall download size: 325.2 KiB. Already cached: 0 B. After the operation, additional 64.0 B will be used.
Continue? [y/n/...? shows all options] (y): y
Retrieving package rsync-3.1.0-13.10.1.x86_64                                                                                      (1/1), 325.2 KiB (625.5 KiB unpacked)
Retrieving: rsync-3.1.0-13.10.1.x86_64.rpm .......................................................................................................................[done]
Checking for file conflicts: .....................................................................................................................................[done]
(1/1) Installing: rsync-3.1.0-13.10.1.x86_64 .....................................................................................................................[done]
```

### 在 Suse Linux 上使用 zypper 查找包

如果你不确定包的全名也不要担心。你可以使用 `zypper` 附带的 `se` 或 `search` 子命令并提供查找字符串来查找包。

```
root@kerneltalks # zypper se lvm
Refreshing service 'SMT-http_smt-ec2_susecloud_net'.
Refreshing service 'cloud_update'.
Loading repository data...
Reading installed packages...
 
S  | Name          | Summary                      | Type
---|---------------|------------------------------|-----------
   | libLLVM       | Libraries for LLVM           | package
   | libLLVM-32bit | Libraries for LLVM           | package
   | llvm          | Low Level Virtual Machine    | package
   | llvm-devel    | Header Files for LLVM        | package
   | lvm2          | Logical Volume Manager Tools | srcpackage
i+ | lvm2          | Logical Volume Manager Tools | package
   | lvm2-devel    | Development files for LVM2   | package 
```

在上述示例中我们查找了 `lvm` 字符串并得到了如上输出列表。你能在 `zypper install/remove/update` 命令中使用 `Name` 字段的名字。

### 使用 zypper 检查已安装包信息

你能够使用 `zypper` 检查已安装包的详细信息。`info` 或 `if` 子命令将列出已安装包的信息。它也可以显示未安装包的详细信息，在该情况下，`Installed` 参数将返回 `No` 值。

```
root@kerneltalks # zypper info rsync
Refreshing service 'SMT-http_smt-ec2_susecloud_net'.
Refreshing service 'cloud_update'.
Loading repository data...
Reading installed packages...
 
 
Information for package rsync:
------------------------------
Repository     : SLES12-SP3-Updates
Name           : rsync
Version        : 3.1.0-13.10.1
Arch           : x86_64
Vendor         : SUSE LLC <https://www.suse.com/>
Support Level  : Level 3
Installed Size : 625.5 KiB
Installed      : Yes
Status         : up-to-date
Source package : rsync-3.1.0-13.10.1.src
Summary        : Versatile tool for fast incremental file transfer
Description    :
    Rsync is a fast and extraordinarily versatile file  copying  tool. It can copy
    locally, to/from another host over any remote shell, or to/from a remote rsync
    daemon. It offers a large number of options that control every aspect of its
    behavior and permit very flexible specification of the set of files to be
    copied. It is famous for its delta-transfer algorithm, which reduces the amount
    of data sent over the network by sending only the differences between the
    source files and the existing files in the destination. Rsync is widely used
    for backups and mirroring and as an improved copy command for everyday use.
```

### 使用 zypper 列出仓库

使用 `zypper` 命令附带 `lr` 或 `repos` 子命令列出仓库。

```
root@kerneltalks # zypper lr
Refreshing service 'cloud_update'.
Repository priorities are without effect. All enabled repositories share the same priority.
 
#  | Alias                                                                                | Name                                                  | Enabled | GPG Check | Refresh
---|--------------------------------------------------------------------------------------|-------------------------------------------------------|---------|-----------|--------
 1 | SMT-http_smt-ec2_susecloud_net:SLE-Module-Adv-Systems-Management12-Debuginfo-Pool    | SLE-Module-Adv-Systems-Management12-Debuginfo-Pool    | No      | ----      | ----
 2 | SMT-http_smt-ec2_susecloud_net:SLE-Module-Adv-Systems-Management12-Debuginfo-Updates | SLE-Module-Adv-Systems-Management12-Debuginfo-Updates | No      | ----      | ----
 3 | SMT-http_smt-ec2_susecloud_net:SLE-Module-Adv-Systems-Management12-Pool              | SLE-Module-Adv-Systems-Management12-Pool              | Yes     | (r ) Yes  | No
 4 | SMT-http_smt-ec2_susecloud_net:SLE-Module-Adv-Systems-Management12-Updates           | SLE-Module-Adv-Systems-Management12-Updates           | Yes     | (r ) Yes  | Yes
 5 | SMT-http_smt-ec2_susecloud_net:SLE-Module-Containers12-Debuginfo-Pool                | SLE-Module-Containers12-Debuginfo-Pool                | No      | ----      | ----
 6 | SMT-http_smt-ec2_susecloud_net:SLE-Module-Containers12-Debuginfo-Updates             | SLE-Module-Containers12-Debuginfo-Updates             | No      | ----      | ----
```

此处你需要检查 `enabled` 列来确定哪些仓库是已被启用的而哪些没有。

### 在 Suse Linux 中使用 zypper 添加或移除仓库

要添加仓库你需要仓库或 .repo 文件的 URI，否则你会遇到如下错误。

```
root@kerneltalks # zypper addrepo -c SLES12-SP3-Updates
If only one argument is used, it must be a URI pointing to a .repo file.
```


使用 URI，你可以像如下方式添加仓库：

```
root@kerneltalks # zypper  addrepo -c http://smt-ec2.susecloud.net/repo/SUSE/Products/SLE-SDK/12-SP3/x86_64/product?credentials=SMT-http_smt-ec2_susecloud_net SLE-SDK12-SP3-Pool
Adding repository 'SLE-SDK12-SP3-Pool' ...........................................................................................................................[done]
Repository 'SLE-SDK12-SP3-Pool' successfully added
 
URI         : http://smt-ec2.susecloud.net/repo/SUSE/Products/SLE-SDK/12-SP3/x86_64/product?credentials=SMT-http_smt-ec2_susecloud_net
Enabled     : Yes
GPG Check   : Yes
Autorefresh : No
Priority    : 99 (default priority)
 
Repository priorities are without effect. All enabled repositories share the same priority.
```

在 Suse 中使用附带 `addrepo` 或 `ar` 子命令的 `zypper` 命令添加仓库，后接 URI 以及你需要提供一个别名。

要在 Suse 中移除一个仓库，使用附带 `removerepo` 或 `rr` 子命令的 `zypper` 命令。

```
root@kerneltalks # zypper removerepo nVidia-Driver-SLE12-SP3
Removing repository 'nVidia-Driver-SLE12-SP3' ....................................................................................................................[done]
Repository 'nVidia-Driver-SLE12-SP3' has been removed.
```

### 清除 zypper 本地缓存

使用 `zypper clean` 命令清除 zypper 本地缓存。

```
root@kerneltalks # zypper clean
All repositories have been cleaned up.
```

--------------------------------------------------------------------------------

via: https://kerneltalks.com/commands/12-useful-zypper-command-examples/

作者：[KernelTalks][a]
译者：[cycoe](https://github.com/cycoe)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://kerneltalks.com
[1]:https://a2.kerneltalks.com/wp-content/uploads/2018/02/zypper-command-examples.png
[2]:https://en.wikipedia.org/wiki/ZYpp
[3]:https://kerneltalks.com/tools/package-installation-linux-yum-apt/
[4]:https://kerneltalks.com/howto/download-package-using-yum-apt/
