创建一个简易 APT 仓库
======

作为我工作的一部分，我所维护的 [PATHspider][5] 依赖于 [cURL][6] 和 [PycURL][7]中的一些[刚刚][8][被][9]合并或仍在[等待][10]被合并的功能。我需要构建一个包含这些 Debian 包的 Docker 容器，所以我需要快速构建一个 APT 仓库。

Debian 仓库本质上可以看作是一个静态的网站，而且内容是经过 GPG 签名的，所以它不一定需要托管在某个可信任的地方（除非可用性对你的程序来说是至关重要的）。我在 [Netlify][11]（一个静态的网站主机）上托管我的博客，我认为它很合适这种情况。他们也[支持开源项目][12]。

你可以用下面的命令安装 netlify 的 CLI 工具：

```
sudo apt install npm
sudo npm install -g netlify-cli
```

设置仓库的基本步骤是：

```
mkdir repository
cp /path/to/*.deb repository/
cd repository
apt-ftparchive packages . > Packages
apt-ftparchive release . > Release
gpg --clearsign -o InRelease Release
netlify deploy
```

当你完成这些步骤后，并在 Netlify 上创建了一个新的网站，你也可以通过 Web 界面来管理这个网站。你可能想要做的一些事情是为你的仓库设置自定义域名，或者使用 Let's Encrypt 启用 HTTPS。（如果你打算启用 HTTPS，请确保命令中有 `apt-transport-https`。）

要将这个仓库添加到你的 apt 源：

```
gpg --export -a YOURKEYID | sudo apt-key add -
echo "deb https://SUBDOMAIN.netlify.com/ /" | sudo tee -a /etc/apt/sources.list
sudo apt update
```

你会发现这些软件包是可以安装的。注意下 [APT pinnng][13]，因为你可能会发现，根据你的策略，仓库上的较新版本实际上并不是首选版本。

**更新**：如果你想要一个更适合平时使用的解决方案，请参考 [repropro][14]。如果你想让最终用户将你的 apt 仓库作为第三方仓库添加到他们的系统中，请查看 [Debian wiki 上的这个页面][15]，其中包含关于如何指导用户使用你的仓库。

**更新 2**：有一位评论者指出用 [aptly][16]，它提供了更多的功能，并消除了 repropro 的一些限制。我从来没有用过 aptly，所以不能评论具体细节，但从网站看来，这是一个很好的工具。

--------------------------------------------------------------------------------

via: https://iain.learmonth.me/blog/2017/2017w383/

作者：[Iain R. Learmonth][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://iain.learmonth.me
[1]:https://iain.learmonth.me/tags/netlify/
[2]:https://iain.learmonth.me/tags/debian/
[3]:https://iain.learmonth.me/tags/apt/
[4]:https://iain.learmonth.me/tags/foss/
[5]:https://pathspider.net
[6]:http://curl.haxx.se/
[7]:http://pycurl.io/
[8]:https://github.com/pycurl/pycurl/pull/456
[9]:https://github.com/pycurl/pycurl/pull/458
[10]:https://github.com/curl/curl/pull/1847
[11]:http://netlify.com/
[12]:https://www.netlify.com/open-source/
[13]:https://wiki.debian.org/AptPreferences
[14]:https://mirrorer.alioth.debian.org/
[15]:https://wiki.debian.org/DebianRepository/UseThirdParty
[16]:https://www.aptly.info/
