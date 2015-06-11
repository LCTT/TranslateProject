translating----geekpi

How to Install nginx and google pagespeed on Ubuntu 15.04 (Vivid Vervet)
================================================================================
Nginx (engine-x) is a open source and high performance HTTP server, reverse proxy and IMAP/POP3 proxy server. The outstanding features of Nginx are: stability, rich feature set, simple configuration and low resource consumption. Nginx is being used by some of the largest websites on the internet and is gaining more and more popularity in the webmaster community. This tutorials shows how to build a nginx .deb package for Ubuntu 15.04 from source that has Google pagespeed module compiled in.


Pagespeed is a web server module developed by Google to speed up a website response times, optimize html and reduce the page load time. ngx_pagespeed features include :

- Image optimization: stripping meta-data, dynamic resizing, recompression.
- CSS & JavaScript minification, concatenation, inlining, and outlining.
- Small resource inlining.
- Deferring image and JavaScript loading.
- HTML rewriting.
- Cache lifetime extension.

see more [https://developers.google.com/speed/pagespeed/module/][1].

### Prerequisites ###

Ubuntu Server 15.04 64 bit
root privileges

What we will do in this tutorial :

- Install the prerequisite packages.
- Installing nginx with ngx_pagespeed.
- Testing.

#### Install the prerequisite packages ####

sudo apt-get install dpkg-dev build-essential zlib1g-dev libpcre3 libpcre3-dev

#### Installing nginx with ngx_pagespeed ####

**Step 1 - Adding nginx repository**

    vim /etc/apt/sources.list.d/nginx.list

add the line:

    deb http://nginx.org/packages/ubuntu/ trusty nginx
    deb-src http://nginx.org/packages/ubuntu/ trusty nginx

Update your repository:

    sudo apt-get update

note : if you get the messege : GPG error [...] NO_PUBKEY [...] bla bla

please add the the key:

    sudo sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys KEYNUMBER
    sudo apt-get update

**Step 2 - Download nginx 1.8 from ubuntu repository**

    sudo su
    cd ~
    mkdir -p ~/new/nginx_source/
    cd ~/new/nginx_source/
    apt-get source nginx
    apt-get build-dep nginx

**Step 3 - Download Pagespeed**

    cd ~
    mkdir -p ~/new/ngx_pagespeed/
    cd ~/new/ngx_pagespeed/
    ngx_version=1.9.32.3
    wget https://github.com/pagespeed/ngx_pagespeed/archive/release-${ngx_version}-beta.zip
    unzip release-${ngx_version}-beta.zip
    
    cd ngx_pagespeed-release-1.9.32.3-beta/
    wget https://dl.google.com/dl/page-speed/psol/${ngx_version}.tar.gz
    tar -xzf 1.9.32.3.tar.gz

**Step 4 - Configure nginx to build with Pagespeed**

    cd ~/new/nginx_source/nginx-1.8.0/debin/
    vim rules

add the module under CFLAGS `.configure` :

    --add-module=../../ngx_pagespeed/ngx_pagespeed-release-1.9.32.3-beta \

![adding pagespeed to nginx](https://www.howtoforge.com/images/nginx_pagespeed_ubuntu_15_04/big/1.png)

![adding pagespeed to nginx](https://www.howtoforge.com/images/nginx_pagespeed_ubuntu_15_04/big/2.png)

**Step 5 - Build nginx package and Install**

    cd ~/new/nginx_source/nginx-1.8.0/
    dpkg-buildpackage -b

The dpkg-buildpackage command will build the nginx.deb under ~/new/ngix_source/ Once package building is complete, please look in the directory:

    cd ~/new/ngix_source/
    ls

![nginx builded with pagespeed](https://www.howtoforge.com/images/nginx_pagespeed_ubuntu_15_04/big/3.png)

And then install nginx.

    dpkg -i nginx_1.8.0-1~trusty_amd64.deb

![Install nginx](https://www.howtoforge.com/images/nginx_pagespeed_ubuntu_15_04/big/4.png)

#### Testing ####

Run nginx -V to see the ngx_pagespeed was builted with nginx.

    nginx -V

![nginx -V](https://www.howtoforge.com/images/nginx_pagespeed_ubuntu_15_04/big/5.png)

### Conclusion ###

The nginx web server there is a stable and fast open source http server that supports a variety of modules for optimization. One of these modules is the 'PageSpeed module' which is developed by google. Unlike apache, nginx modules are not dynamically loadable, so you have to select the desired modules before you build the nginx package.

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-install-nginx-and-google-pagespeed-on-ubuntu-15-04/#step-build-nginx-package-and-install

作者：Muhammad Arul
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:https://developers.google.com/speed/pagespeed/module/
