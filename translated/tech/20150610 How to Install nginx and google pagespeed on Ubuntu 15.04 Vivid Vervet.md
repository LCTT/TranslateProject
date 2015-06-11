如何在Ubuntu 15.04(Vivid Vervet)中安装nginx和google pagespeed
================================================================================
Nginx (engine-x)是一个开源高性能http、反向代理和IMAP/POP3代理服务器。nginx杰出的功能有：稳定、丰富的功能集、简单的配置和低资源消耗。nginx被用于一些高性能网站并在站长之间变得越来越流行。本教程会从源码构建一个带有google paespeed模块用于Ubuntu 15.04中的.deb包。


pagespeed是一个由google开发的web服务器模块来加速网站响应时间、优化html和减少页面加载时间。ngx_pagespeed的功能如下：

- 图像优化：去除meta数据、动态剪裁、重压缩。
- CSS与JavaScript 放大、串联、内联、外联。
- 小资源内联
- 延迟图像与JavaScript加载
- HTML重写。
- 缓存生命期插件

更多请见 [https://developers.google.com/speed/pagespeed/module/][1].

### 预备要求 ###

Ubuntu Server 15.04 64位
root 权限

本篇我们将要：

- 安装必备包
- 安装带ngx_pagespeed的nginx
- 测试

#### 安装必备包 ####

sudo apt-get install dpkg-dev build-essential zlib1g-dev libpcre3 libpcre3-dev

#### 安装带ngx_pagespeed的nginx ####

**第一步 - 添加nginx仓库**

    vim /etc/apt/sources.list.d/nginx.list

加入下面的行：

    deb http://nginx.org/packages/ubuntu/ trusty nginx
    deb-src http://nginx.org/packages/ubuntu/ trusty nginx

更新仓库：

    sudo apt-get update

注意：如果你看到信息：GPG error [...] NO_PUBKEY [...] 等等

请添加key：

    sudo sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys KEYNUMBER
    sudo apt-get update

**第二步 - 从仓库下载nginx 1.8**

    sudo su
    cd ~
    mkdir -p ~/new/nginx_source/
    cd ~/new/nginx_source/
    apt-get source nginx
    apt-get build-dep nginx

**第三步 - 下载Pagespeed**

    cd ~
    mkdir -p ~/new/ngx_pagespeed/
    cd ~/new/ngx_pagespeed/
    ngx_version=1.9.32.3
    wget https://github.com/pagespeed/ngx_pagespeed/archive/release-${ngx_version}-beta.zip
    unzip release-${ngx_version}-beta.zip
    
    cd ngx_pagespeed-release-1.9.32.3-beta/
    wget https://dl.google.com/dl/page-speed/psol/${ngx_version}.tar.gz
    tar -xzf 1.9.32.3.tar.gz

**第三步 - 配置nginx来编译Pagespeed**

    cd ~/new/nginx_source/nginx-1.8.0/debin/
    vim rules

在CFLAGS `.configure`下添加模块：

    --add-module=../../ngx_pagespeed/ngx_pagespeed-release-1.9.32.3-beta \

![adding pagespeed to nginx](https://www.howtoforge.com/images/nginx_pagespeed_ubuntu_15_04/big/1.png)

![adding pagespeed to nginx](https://www.howtoforge.com/images/nginx_pagespeed_ubuntu_15_04/big/2.png)

**第五步 - 打包nginx包并安装**

    cd ~/new/nginx_source/nginx-1.8.0/
    dpkg-buildpackage -b

dpkg-buildpackage会编译 ~/new/ngix_source/成nginx.deb。打包完成后，看一下目录：

    cd ~/new/ngix_source/
    ls

![nginx builded with pagespeed](https://www.howtoforge.com/images/nginx_pagespeed_ubuntu_15_04/big/3.png)

接着安装nginx。

    dpkg -i nginx_1.8.0-1~trusty_amd64.deb

![Install nginx](https://www.howtoforge.com/images/nginx_pagespeed_ubuntu_15_04/big/4.png)

#### 测试 ####

运行nginx -V测试nginx是否已经自带ngx_pagespeed。

    nginx -V

![nginx -V](https://www.howtoforge.com/images/nginx_pagespeed_ubuntu_15_04/big/5.png)

### 总结 ###

稳定、快速、开源的nginx支持许多不同的优化模块。这其中之一是google开发的‘pagespeed’。不像apache，nginx模块不是动态加载的，因此你必须在编译之前就选择完需要的模块。

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-install-nginx-and-google-pagespeed-on-ubuntu-15-04/#step-build-nginx-package-and-install

作者：Muhammad Arul
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:https://developers.google.com/speed/pagespeed/module/
