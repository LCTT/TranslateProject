如何修复 Ubuntu 上“...script returned error exit status 1”的错误
================================================================================
![](https://1102047360.rsc.cdn77.org/wp-content/uploads/2014/04/ubuntu-790x558.png)

今天，我在更新VirtualBox新版本的时候遇到了一个问题。

> E: /var/cache/apt/archives/ subprocess new pre-removal script returned error exit status 1

![](http://www.unixmen.com/wp-content/uploads/2015/03/Update-Manager_0011.png)

### 解决： ###

我google了一下并找到了方法。下面是我解决的方法。

    sudo apt-get clean
    sudo apt-get update && sudo apt-get upgrade

这样几乎可以修复这个问题了。

如果你仍然有问题，那就试试下面的命令：

    sudo dpkg --configure -a
    sudo apt-get -f install

或者你可以按照下面的方法从[Oracle VirtualBox][1]官网下载最新版本并安装。

    sudo apt-get update 
    sudo dpkg -i virtualbox-4.3_4.3.24-98716~Ubuntu~raring_amd64.deb 
    sudo apt-get -f install
    sudo apt-get autoclean && sudo apt-get autoremove

干杯！

--------------------------------------------------------------------------------

via: http://www.unixmen.com/linux-basics-how-to-fix-e-varcacheaptarchives-subprocess-new-pre-removal-script-returned-error-exit-status-1-in-ubuntu/

作者：[SK][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://www.unixmen.com/author/sk/
[1]:https://www.virtualbox.org/wiki/Downloads
