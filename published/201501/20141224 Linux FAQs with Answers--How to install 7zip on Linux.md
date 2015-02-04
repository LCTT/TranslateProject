Linux有问必答：Linux 中如何安装 7zip 
================================================================================
> **问题**: 我需要要从 ISO 映像中获取某些文件，为此我想要使用 7zip 程序。那么我应该如何安装 7zip 软件呢，[在 Linux 发布版本上完全安装]? 

7zip 是一款开源的归档应用程序，开始是为 Windows 系统而开发的。它能对多种格式的档案文件进行打包或解包处理，除了支持其原生的 7z 格式的文档外，还支持包括 XZ、GZIP、TAR、ZIP 和 BZIP2 等这些格式。 通常，7zip 也用来解压 RAR、DEB、RPM 和 ISO 等格式的文件。除了简单的归档功能，7zip 还具有支持 AES-256 算法加密以及自解压和建立多卷存档功能。在支持 POSIX 标准的系统上（Linux、Unix、BSD），原生的 7zip 程序被移植过来并被命名为 p7zip（“POSIX 7zip” 的简称）。

下面介绍如何在 Linux 中安装 7zip （或 p7zip）。

### 在 Debian、Ubuntu 或 Linux Mint 系统中安装 7zip ###

在基于的 Debian 的发布系统中存在有三种 7zip 的软件包。

- **p7zip**: 包含 7zr（最小的 7zip 归档工具），仅仅只能处理原生的 7z 格式。
- **p7zip-full**: 包含 7z ，支持 7z、LZMA2、XZ、ZIP、CAB、GZIP、BZIP2、ARJ、TAR、CPIO、RPM、ISO 和 DEB 格式。
- **p7zip-rar**: 包含一个能解压 RAR 文件的插件。

建议安装 p7zip-full 包（不是 p7zip），因为这是最完全的 7zip 程序包，它支持很多归档格式。此外，如果您想处理 RAR 文件话，还需要安装 p7zip-rar 包，做成一个独立的插件包的原因是因为 RAR 是一种专有格式。

    $ sudo apt-get install p7zip-full p7zip-rar 

### 在 Fedora 或 CentOS/RHEL 系统中安装 7zip ###

基于红帽的发布系统上提供了两个 7zip 的软件包。

- **p7zip**: 包含 7za 命令，支持 7z、ZIP、GZIP、CAB、ARJ、BZIP2、TAR、CPIO、RPM 和 DEB 格式。
- **p7zip-plugins**: 包含 7z 命令，额外的插件，它扩展了 7za 命令（例如支持 ISO 格式的抽取）。

在 CentOS/RHEL 系统中，在运行下面命令前您需要确保 [EPEL 资源库][1] 可用，但在 Fedora 系统中就不需要额外的资源库了。

    $ sudo yum install p7zip p7zip-plugins 

注意，跟基于 Debian 的发布系统不同的是，基于红帽的发布系统没有提供 RAR 插件，所以您不能使用 7z 命令来抽取解压 RAR 文件。

### 使用 7z 创建或提取归档文件 ###

一旦安装好 7zip 软件后，就可以使用 7z 命令来打包解包各式各样的归档文件了。7z 命令会使用不同的插件来辅助处理对应格式的归档文件。

![](https://farm8.staticflickr.com/7583/15874000610_878a85b06a_b.jpg)

使用 “a” 选项就可以创建一个归档文件，它可以创建 7z、XZ、GZIP、TAR、 ZIP 和 BZIP2 这几种格式的文件。如果指定的归档文件已经存在的话，它会把文件“附加”到存在的归档中，而不是覆盖原有归档文件。

    $ 7z a <archive-filename> <list-of-files> 

使用 “e” 选项可以抽取一个归档文件，抽取出的文件会放在当前目录。抽取支持的格式比创建时支持的格式要多的多，包括 7z、XZ、GZIP、TAR、ZIP、BZIP2、LZMA2、CAB、ARJ、CPIO、RPM、ISO 和 DEB 这些格式。

    $ 7z e <archive-filename>

解包的另外一种方式是使用 “x” 选项。和 “e” 选项不同的是，它使用的是全路径来抽取归档的内容。

    $ 7z x <archive-filename>

要查看归档的文件列表，使用 “l” 选项。

    $ 7z l <archive-filename>

要更新或删除归档文件，分别使用 “u” 和 “d” 选项。

    $ 7z u <archive-filename> <list-of-files-to-update>
    $ 7z d <archive-filename> <list-of-files-to-delete>

要测试归档的完整性，使用：

    $ 7z t <archive-filename> 

--------------------------------------------------------------------------------

via:http://ask.xmodulo.com/install-7zip-linux.html 

译者：[runningwater](https://github.com/runningwater)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linux.cn/article-2324-1.html