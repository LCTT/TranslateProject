Ubuntu 更新错误修复大全
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Fix_Ubuntu_Update_Error.jpeg)

在Ubuntu更新中，谁没有碰见个错误？在Ubuntu和其它基于Ubuntu的Linux发行版中，更新错误是一个共性的错误，也经常发生。这些错误出现的原因多种多样，修复起来也很简单。在本文中，我们将见到Ubuntu中各种类型频繁发生的更新错误以及它们的修复方法。

### 合并列表问题 ###

当你在终端中运行更新命令时，你可能会碰到这个错误“[合并列表错误][1]”，就像下面这样：

> E:Encountered a section with no Package: header,
> 
> E:Problem with MergeList /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_precise_universe_binary-i386_Packages,
> 
> E:The package lists or status file could not be parsed or opened.’

可以使用以下命令来修复该错误：

    sudo rm -r /var/lib/apt/lists/*
    sudo apt-get clean && sudo apt-get update

### 下载仓库信息失败 -1 ###

实际上，有两种类型的[下载仓库信息失败错误][2]。如果你的错误是这样的：

> W:Failed to fetch bzip2:/var/lib/apt/lists/partial/in.archive.ubuntu.com_ubuntu_dists_oneiric_restricted_binary-i386_Packages Hash Sum mismatch,
> 
> W:Failed to fetch bzip2:/var/lib/apt/lists/partial/in.archive.ubuntu.com_ubuntu_dists_oneiric_multiverse_binary-i386_Packages Hash Sum mismatch,
> 
> E:Some index files failed to download. They have been ignored, or old ones used instead

那么，你可以用以下命令修复：

    sudo rm -rf /var/lib/apt/lists/*
    sudo apt-get update

### 下载仓库信息失败 -2 ###

下载仓库信息失败的另外一种类型是由于PPA过时导致的。通常，当你运行更新管理器，并看到这样的错误时：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2013/04/Failed-to-download-repository-information-Ubuntu-13.04.png)

你可以运行sudo apt-get update来查看哪个PPA更新失败，你可以把它从源列表中删除。你可以按照这个截图指南来[修复下载仓库信息失败错误][3]。

### 下载包文件失败错误 ###

一个类似的错误是[下载包文件失败错误][4]，像这样：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Ubuntu_Update_error.jpeg)

该错误很容易修复，只需修改软件源为主服务器即可。转到“软件和更新”，在那里你可以修改下载服务器为主服务器：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Change_server_Ubuntu.jpeg)

### 部分更新错误 ###

在终端中运行更新会出现[部分更新错误][5]：

> Not all updates can be installed
> 
> Run a partial upgrade, to install as many updates as possible

在终端中运行以下命令来修复该错误：

    sudo apt-get install -f

### 加载共享库时发生错误 ###

该错误更多是安装错误，而不是更新错误。如果尝试从源码安装程序，你可能会碰到这个错误：

> error while loading shared libraries:
> 
> cannot open shared object file: No such file or directory

该错误可以通过在终端中运行以下命令来修复：

    sudo /sbin/ldconfig -v

你可以在这里查找到更多详细内容[加载共享库时发生错误][6]。

### 无法获取锁 /var/cache/apt/archives/lock ###

在另一个程序在使用APT时，会发生该错误。假定你正在Ubuntu软件中心安装某个东西，然后你又试着在终端中运行apt。

> E: Could not get lock /var/cache/apt/archives/lock – open (11: Resource temporarily unavailable)
> 
> E: Unable to lock directory /var/cache/apt/archives/

通常，只要你把所有其它使用apt的程序关了，这个问题就会好的。但是，如果问题持续，可以使用以下命令：

    sudo rm /var/lib/apt/lists/lock

如果上面的命令不起作用，可以试试这个命令：

    sudo killall apt-get

关于该错误的更多信息，可以在[这里][7]找到。

### GPG错误： 下列签名无法验证 ###

在添加一个PPA时，可能会导致以下错误[GPG错误： 下列签名无法验证][8]，这通常发生在终端中运行更新时：

> W: GPG error: http://repo.mate-desktop.org saucy InRelease: The following signatures couldn’t be verified because the public key is not available: NO_PUBKEY 68980A0EA10B4DE8

我们所要做的，就是获取系统中的这个公钥，从信息中获取密钥号。在上述信息中，密钥号为68980A0EA10B4DE8。该密钥可通过以下方式使用：

    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 68980A0EA10B4DE8

在添加密钥后，再次运行更新就没有问题了。

### BADSIG错误 ###

另外一个与签名相关的Ubuntu更新错误是[BADSIG错误][9]，它看起来像这样：

> W: A error occurred during the signature verification. The repository is not updated and the previous index files will be used. GPG error: http://extras.ubuntu.com precise Release: The following signatures were invalid: BADSIG 16126D3A3E5C1192 Ubuntu Extras Archive Automatic Signing Key
> 
> W: GPG error: http://ppa.launchpad.net precise Release:
> 
> The following signatures were invalid: BADSIG 4C1CBC1B69B0E2F4 Launchpad PPA for Jonathan French W: Failed to fetch http://extras.ubuntu.com/ubuntu/dists/precise/Release

要修复该BADSIG错误，请在终端中使用以下命令：

    sudo apt-get clean
    cd /var/lib/apt
    sudo mv lists oldlist
    sudo mkdir -p lists/partial
    sudo apt-get clean
    sudo apt-get update

本文汇集了你可能会碰到的**Ubuntu更新错误**，我希望这会对你处理这些错误有所帮助。你在Ubuntu中是否也碰到过其它更新错误呢？请在下面的评论中告诉我，我会试着写个快速指南。

--------------------------------------------------------------------------------

via: http://itsfoss.com/fix-update-errors-ubuntu-1404/

作者：[Abhishek][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://itsfoss.com/how-to-fix-problem-with-mergelist/
[2]:http://itsfoss.com/solve-ubuntu-error-failed-to-download-repository-information-check-your-internet-connection/
[3]:http://itsfoss.com/failed-to-download-repository-information-ubuntu-13-04/
[4]:http://itsfoss.com/fix-failed-download-package-files-error-ubuntu/
[5]:http://itsfoss.com/fix-partial-upgrade-error-elementary-os-luna-quick-tip/
[6]:http://itsfoss.com/solve-open-shared-object-file-quick-tip/
[7]:http://itsfoss.com/fix-ubuntu-install-error/
[8]:http://itsfoss.com/solve-gpg-error-signatures-verified-ubuntu/
[9]:http://itsfoss.com/solve-badsig-error-quick-tip/
