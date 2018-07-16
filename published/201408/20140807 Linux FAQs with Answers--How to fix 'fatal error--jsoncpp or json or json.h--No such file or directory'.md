Linux常见问题与答案——如何修复“fatal error: jsoncpp/json/json.h: No such file or directory”问题
================================================================================
>**问题**：我试着编译一个C++程序，但是我碰到了以下错误：
>
>“fatal error: jsoncpp/json/json.h: No such file or directory”
>
>我怎样修复这个问题呢？

该错误指出你缺少JsonCpp开发文件（例如，JsonCpp库和头文件）。[JsonCpp][1]是一个用于JSON格式数据复制的C++库。下面给出了在不同Linux发行版上安装JsonCpp开发文件的方法。

在Debian, Ubuntu或者Linux Mint上：

    $ sudo apt-get install libjsoncpp-dev

在Fedora上：

    $ sudo yum install jsoncpp-devel

在CentOS上，没有JsonCpp的预编译包。因此你可以通过以下源码构建一个JsonCpp包并安装。

    $ sudo yum install cmake
    $ git clone https://github.com/open-source-parsers/jsoncpp.git
    $ cd jsoncpp
    $ mkdir -p build/debug
    $ cd build/debug
    $ cmake -DCMAKE_BUILD_TYPE=debug -DJSONCPP_LIB_BUILD_SHARED=OFF -G "Unix Makefiles" ../../
    $ make
    $ sudo make install 

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/fix-fatal-error-jsoncpp.html

译者：[GOLinux](https://github.com/GOLinux)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://github.com/open-source-parsers/jsoncpp
