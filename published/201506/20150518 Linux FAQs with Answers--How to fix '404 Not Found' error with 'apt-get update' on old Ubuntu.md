Linux有问必答：如何更新过期版本的Ubuntu
================================================================================
> **问题**： 我的PC上安装了旧版的Ubuntu 13.04（急切的浣熊）。当我在上面运行“sudo apt-get update”时，它丢给了我一大堆“404 Not Found”错误，结果是我不能使用apt-get或aptitude来安装或更新任何软件包了。由于该错误的原因，我甚至不能将它升级到更新的版本。我怎样才能修复这个问题啊？
> 
![](https://farm6.staticflickr.com/5460/17634085636_996b2a8ab5_b.jpg)

每个Ubuntu版本都有生命结束周期（EOL）时间；常规的Ubuntu发行版提供18个月的支持，而LTS（长期支持）版本则长达3年（服务器版本）和5年（桌面版本）。当某个Ubuntu版本达到生命结束周期时，其仓库就不能再访问了，你也不能再从Canonical获取任何维护更新和安全补丁。在撰写本文时，Ubuntu 13.04（急切的浣熊）已经达到了它的生命结束周期。

如果你所使用的Ubuntu系统已经被结束生命周期，你就会从apt-get或aptitude得到以下404错误，因为它的仓库已经被遗弃了。

    W: Failed to fetch http://us.archive.ubuntu.com/ubuntu/dists/raring-backports/multiverse/binary-i386/Packages  404  Not Found [IP: 91.189.91.13 80]
    
    W: Failed to fetch http://extras.ubuntu.com/ubuntu/dists/raring/main/binary-amd64/Packages  404  Not Found
    
    W: Failed to fetch http://security.ubuntu.com/ubuntu/dists/raring-security/universe/binary-i386/Packages  404  Not Found [IP: 91.189.88.149 80]
    
    E: Some index files failed to download. They have been ignored, or old ones used instead

对于那些还在使用旧版本Ubuntu的用户，Canonical维护了一个old-releases.ubuntu.com的网站，这里包含了结束生命周期的仓库归档。因此，当Canonical对你安装的Ubuntu版本结束支持时，你需要将仓库切换到old-releases.ubuntu.com（除非你在结束生命周期之前想要升级）。

这里，通过切换到旧版本仓库提供了一个快速修复“404 Not Found”错误的便捷方式。

首先，使用old-releases仓库替换main/security仓库，就像下面这样。

    $ sudo sed -i -r 's/([a-z]{2}\.)?archive.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list
    $ sudo sed -i -r 's/security.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list

然后，使用文本编辑器打开/etc/apt/sources.list，并查找extras.ubuntu.com。该仓库也不再支持Ubuntu 13.04了，所以你需要使用“#”号将extras.ubuntu.com注释掉。

    #deb http://extras.ubuntu.com/ubuntu raring main
    #deb-src http://extras.ubuntu.com/ubuntu raring main

现在，你应该可以在旧版不受支持的Ubuntu上安装或更新软件包了。

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/404-not-found-error-apt-get-update-ubuntu.html

作者：[Dan Nanni][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
