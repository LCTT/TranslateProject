SUSE Linux – Zypper 命令示例
================================================================================
Zypper是SuSE Linux中用于安装，升级，卸载，管理仓库、进行各种包查询的命令行接口。本篇将会讨论zypper的几个不同命令的例子。

语法：

    # zypper [--global-opts] <command> [--command-opts] [command-arguments]

中括号中的部分可以不需要。执行zypper最简单的方法是输入 zypper 及 <command>。

### 例子1：列出可用的全局选项和命令 ###

打开终端，输入zypper并按回车，它会显示所有可用的全局选项和命令。

    linux-xa3t:~ # zypper

### 例子2：获得zypper的某个命令的帮助 ###

语法： zypper help [command]

    linux-xa3t:~ # zypper help remove
    remove (rm) [options] <capability> ...
    
    Remove packages with specified capabilities.
    A capability is NAME[.ARCH][OP<VERSION>], where OP is one of <, <=, =, >=, >.
    
    Command options:
    -r, --repo <alias|#|URI> Load only the specified repository.
    -t, --type <type> Type of package (package, patch, pattern, product).
    
     Default: package.
    -n, --name Select packages by plain name, not by capability.
    -C, --capability Select packages by capability.
    --debug-solver Create solver test case for debugging.
    -R, --no-force-resolution Do not force the solver to find solution,let it ask.
    --force-resolution Force the solver to find a solution (even an aggressive one).
    -u, --clean-deps Automatically remove unneeded dependencies.
    -U, --no-clean-deps No automatic removal of unneeded dependencies.
    -D, --dry-run Test the removal, do not actually remove.

### 例子3：打开zypper shell/会话 ###

    linux-xa3t:~ # zypper sh
    zypper>
    
或
    
    linux-xa3t:~ # zypper shell
    zypper>

### 例子4：列出已定义的仓库 ###

    linux-xa3t:~ # zypper repos

![](http://www.linuxtechi.com/wp-content/uploads/2014/10/zypper-repos.png)

或

    linux-xa3t:~ # zypper lr

#### 4.1) 以表格的形式列出仓库的URI ####

![](http://www.linuxtechi.com/wp-content/uploads/2014/10/zypper-repos-uri.png)

#### 4.2) 以优先级列出仓库 ####

    linux-xa3t:~ # zypper lr -p

![](http://www.linuxtechi.com/wp-content/uploads/2014/10/zypper-repos-priority.png)

### 例子5：刷新仓库 ###

    linux-xa3t:~ # zypper ref
    Repository 'openSUSE-13.1-Non-Oss' is up to date.
    Repository 'openSUSE-13.1-Oss' is up to date.
    Repository 'openSUSE-13.1-Update' is up to date.
    Repository 'openSUSE-13.1-Update-Non-Oss' is up to date.
    All repositories have been refreshed.

### 例子6：修改zypper仓库 ###

zypper仓库可以通过别名、数字或者URI或者通过‘–all、 –remote、 –local、 –medium-type’这些选项修改。

linux-xa3t:~ # zypper mr -d 6              #禁用6号仓库
linux-xa3t:~ # zypper mr -rk -p 70 upd 	   #启用自动书信并为‘upd’仓库设置rpm文件‘缓存’，且设置它的优先级为70
linux-xa3t:~ # zypper mr -Ka               #为所有的仓库禁用rpm文件缓存
linux-xa3t:~ # zypper mr -kt               #为远程仓库设置rpm文件缓存

### 例子7：添加仓库 ###

语法： zypper addrepo 或者 zypper ar <仓库的URL或者别名>

    linux-xa3t:~ # zypper ar http://download.opensuse.org/update/13.1/ update
    Adding repository 'update' .............................................[done]
    Repository 'update' successfully added
    Enabled: Yes
    Autorefresh: No
    GPG check: Yes
    URI: http://download.opensuse.org/update/13.1/

### 例子8：移除仓库 ###

语法： zypper removerepo <仓库名> <别名>

或者

zypper rr <仓库名> <别名>

    linux-xa3t:~ # zypper rr openSUSE-13.1-1.10 openSUSE-13.1-1.10
    Removing repository 'openSUSE-13.1-1.10' ............................[done]
    Repository 'openSUSE-13.1-1.10' has been removed.

### 例子9：安装软件包 ###

语法： zypper install <包名>  或者  zypper in <包名>

    linux-xa3t:~ # zypper install vlc

### 例子10：卸载软件包 ###

语法： zypper remove <包名> 或者 zypper rm <包名>

    linux-xa3t:~ # zypper remove sqlite

### 例子11：导出和导入仓库 ###

导出仓库的语法 : zypper repos –export 或者 zypper lr -e

    linux-xa3t:~ # zypper lr --export repo-backup/back.repo
    Repositories have been successfully exported to repo-backup/back.repo.

导入仓库的语法 :

    linux-xa3t:~ # zypper ar repo-backup/back.repo

### 例子12：更新一个软件包 ###

语法： zypper update <包名> 或者 zypper up <包名>

    linux-xa3t:~ # zypper update bash

### 例子13：安装源码包 ###

语法： zypper source-install <源码包> 或 zypper si <源码包>

    linux-xa3t:~ # zypper source-install zypper

### 例子14：只安装依赖包 ###

例子13中的命令会安装和构建特定包的依赖。如果你想要安装源码包就用-D选项

    # zypper source-install -D package_name

只安装依赖就使用-d

    # zypper source-install -d package_name

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/suse-linux-zypper-command-examples/

作者：[Pradeep Kumar][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/