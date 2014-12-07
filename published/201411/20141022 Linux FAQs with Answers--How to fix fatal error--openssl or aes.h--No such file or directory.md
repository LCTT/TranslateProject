Linux 有问必答：如何修复“fatal error: openssl/aes.h: No such file or directory”
================================================================================
> **Question**：我尝试在Linux编译一个程序，但是编译失败并报了一个错，“fatal error: openssl/aes.h: No such file or directory”。我该怎样安装要求的头文件并在我的Linux上解决这个问题？

    fatal error: openssl/aes.h: No such file or directory

如果你在编译时遇到这个错误，这可能是下面的原因：你尝试编译的程序使用OpenSSL，但是需要和OpenSSL链接的文件（库和头文件）在你Linux平台上缺少。（LCTT 译注：其它类似的错误也可以照此处理）

要解决这个问题，你需要安装**OpenSSL 开发包**，这在所有的现代Linux发行版的标准软件仓库中都有。

要在Debian、Ubuntu或者其他衍生版上安装OpenSSL：

    $ sudo apt-get install libssl-dev

要在Fedora、CentOS或者RHEL上安装OpenSSL开发包：

    $ sudo yum install openssl-devel

安装完后，尝试重新编译程序。

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/fix-fatal-error-openssl.html

译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出