如何在 Ubuntu 或 Linux Mint 启用 Chromium 硬件加速的视频解码
======

你或许已经注意到了，在 Linux 上使用 Google Chrome 或 Chromium 浏览器在 YouTube 或其它类似网站观看高清视频会增加你的 CPU 使用率，如果你用的是笔记本，电脑会发热而且电池会很快用完。这是因为 Chrome/Chromium（Firefox 也是如此，但是 Firefox 的问题没有办法解决）在 Linux 上不支持硬件加速的视频解码。

这篇文章讲述了如何在 Linux 环境安装带有 VA-API 补丁的 Chromium 开发版，它支持 GPU 加速的视频解码，可以显著减少观看在线高清视频时的 CPU 使用率，这篇教程只适用于 Intel 和 Nvidia 的显卡，我没有 ATI/AMD 的显卡可以试验，也没有使用过这几种显卡。

这是 Chromium 浏览器在 Ubuntu18.04 中，在没有 GPU 加速视频解码的情况下播放一个 1080p 的 YouTube 视频：

![](https://4.bp.blogspot.com/-KtUQni2PMvE/W3KlJ62yLLI/AAAAAAAABW4/NrNVFaTAkZ8AmwqWwRvWD6czT51ni-R-gCLcBGAs/s1600/chromium-default-no-accel.png)

这是带有 VA-API 补丁的 Chromium 浏览器在 Ubuntu18.04 中，在带有 GPU 加速视频解码的情况下播放同样的 1080p 的 YouTube 视频：

![](https://4.bp.blogspot.com/-0c-wb4UNhW8/W3KlQBfeFnI/AAAAAAAABW8/WVUAYzM6hA8wRTlCcrPXPMpoXoFVR6b1QCLcBGAs/s1600/chromium-hardware-acceleration-enabled.png)

注意截图中的 CPU 使用率。两张截图都是在我老旧而依然强大的桌面计算机上捕捉的。在我的笔记本电脑上，没有硬件加速的 Chromium 带来更高的 CPU 使用率。

“只需 VA-API 即可在 Linux 启用 VAVDA、VAVEA 和 VAJDA” 这个[补丁][3]在一年多以前就提交给了 Chromium，但是它还没有合并。

Chrome 有一个选项可以覆盖软件渲染列表（`#ignore-gpu-blacklist`），但是这个选项不能启用硬件加速的视频解码。启用这个选项以后，你或许会在访问 `chrome://gpu` 时发现这些信息：“_Video Decode: Hardware accelerated_ “，然而这个并不意味着真的可以工作。在 YouTube 打开一个高清视频并用诸如 `htop` 的工具查看 CPU 使用率（这是我在以上截图中用来查看 CPU 使用率的）。因为 GPU 视频解码没有真的被启用，你应该看到较高的 CPU 使用率。下面有一个部分是关于检查你是否真的在使用硬件加速的视频解码的。

**文中使用的 Chromium 浏览器 Ubuntu 版启用 VA-API 的补丁在[这个地址][1]可以获得**

### 在 Ubuntu 和 Linux Mint 安装和使用带有 VA-API 支持的 Chromium 浏览器

每个人都该知道 Chromium 开发版本没有理想中那么稳定。所以你可能发现 bug，它可能会发生崩溃等情况。它现在可能正常运行，但是谁知道几次更新以后会发生什么。

还有，如果你想启用 Widevine 支持（这样你才能观看 Netflix 视频和 YouTube 付费视频），Chromium dev 分支 PPA 要求你执行一些额外步骤。 如果你想要一些功能，比如同步，也是如此（需要注册 API 密钥还要在你的系统上设置好）。执行这些任务的说明在 [Chromium 开发版本的 PPA][4] 中有详细解释。

对于 Nvidia 显卡，vdpau 视频驱动程序需要更新以便显示 vaQuerySurfaceAttributes。所以 Nvidia 需要使用打过补丁的 vdpau-va-driver。值得庆幸的是，Chromium-dev PPA 提供了这个打过补丁的包。

带有 VA-API 补丁的 Chromium 也可用于其它 Linux 发行版，在第三方仓库，比如说 [Arch Linux][5]（对于 Nvidia 你需要[这个][6]补丁过的 libva-vdpau-driver）。如果你不使用 Ubuntu 或 Linux Mint，你得自己找那些包。

#### 1、安装带有 VA-API 补丁的 Chromium

有一个带 VA-API 补丁的 Chromium Beta PPA，但是它缺少适用于 Ubuntu 18.04 的 vdpau-video。如果你需要，你可以使用这个 [Beta PPA][7]，而不是我在下面的步骤中使用 [Dev PPA][8]，不过如果你使用 Nvidia 显卡，你需要从这个 Dev PPA 中下载安装 vdpau-va-driver，并确认 Ubuntu/Linux Mint 不更新这个包（有点复杂，如果你准备根据下面步骤使用 Dev PPA 的话，不需要手动做这些）。

你可以添加 [Chromium 开发分支 PPA][4]，并在 Ubuntu 或 Linux Mint（及其它基于 Ubuntu 的发行版，如 elementary，以及 Ubuntu 或 Linux Mint 的风味版，如 Xubuntu、Kubuntu、Ubuntu MATE、Linux Mint MATE 等等）上安装最新的 Chromium 浏览器开发版：


```
sudo add-apt-repository ppa:saiarcot895/chromium-dev
sudo apt-get update
sudo apt install chromium-browser

```

#### 2、安装 VA-API 驱动

对于 Intel 的显卡，你需要安装 `i965-va-driver` 这个包（它可能早就安装好了）

```
sudo apt install i965-va-driver
```

对于 Nvidia 的显卡（在开源的 Nouveau 驱动和闭源的 Nvidia 驱动上，它应该都有效）， 安装 `vdpau-va-driver`：

```
sudo apt install vdpau-va-driver
```

#### 3、在 Chromium 启用硬件加速视频选项

复制这串地址，粘贴进 Chromium 的 URL 栏: `chrome://flags/#enable-accelerated-video` （或者在 `chrome://flags` 搜索 `Hardware-accelerated video` ）并启用它，然后重启 Chromium 浏览器。

在默认的 Google Chrome / Chromium 版本，这个选项不可用，但是你可以在启用了 VP-API 的 Chromium 版本启用它。

#### 4、安装 [h264ify][2] Chrome 扩展

YouTube（可能还有其它一些网址也是如此）默认使用 VP8 或 VP9 编码解码器，许多 GPU 不支持这种编码解码器的硬件解码。h264ify 会强制 YouTube 使用大多数 GPU 都支持的 H.264 而不是 VP8/VP9。

这个扩展还能阻塞 60fps 的视频，对低性能机器有用。

你可以在视频上右键点击，并且选择 `Stats for nerds` 以查看 Youtube 视频所使用额编码解码器，如果启用了 h264ify 扩展，你可以看到编码解码器是 avc / mp4a。如果没有启用，编码解码器应该是 vp09 / opus。

### 如何检查 Chromium 是否在使用 GPU 视频解码

在 YouTube 打开一个视频，然后，在 Chromium 打开一个新的标签页并将以下地址输入 URL 栏：`chrome://media-internals`。

在 `chrome://media-internals` 标签页中，点击视频的 URL（为了展开它）， 往下滚动查看 `Player Properties` 的下面，你应该可以找到  `video_decoder` 属性。如果`video_decoder` 的值是 `GpuVideoDecoder` ，这说明当前在另一个标签页播放的 YouTube 视频正在使用硬件加速的的视频解码。

![](https://4.bp.blogspot.com/-COBJWVT_Y0Q/W3KnG7AeHsI/AAAAAAAABXM/W2XAJA_S0BIHug4eQKTMOdIfXHhgkXhhQCLcBGAs/s1600/chromium-gpuvideodecoder-linux.png)

如果它显示的是 `FFmpegVideoDecoder` 或 `VpxVideoDecoder` ，说明加速视频解码无效或者你忘记安装或禁用了 h264ify 这个 Chrome 扩展。

如果无效，你可以通过在命令行运行 `chromium-browser` ，通过查看是否有 VA-API 相关的错误显示出来以调试。你也可以运行 `vainfo`（在 Ubuntu 或 Linux Mint 上安装：`sudo apt install vainfo`）和 `vdpauinfo` （对于 Nvidia，在 Ubuntu 或 Linux Mint 上安装：`sudo apt install vdpauinfo`）并且查看是否有显示任何错误。

--------------------------------------------------------------------------------

via: https://www.linuxuprising.com/2018/08/how-to-enable-hardware-accelerated.html

作者：[Logix][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[GraveAccent](https://github.com/GraveAccent)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/118280394805678839070
[1]:https://github.com/saiarcot895/chromium-ubuntu-build/tree/master/debian/patches
[2]:https://chrome.google.com/webstore/detail/h264ify/aleakchihdccplidncghkekgioiakgal
[3]:https://chromium-review.googlesource.com/c/chromium/src/+/532294
[4]:https://launchpad.net/~saiarcot895/+archive/ubuntu/chromium-dev
[5]:https://aur.archlinux.org/packages/?O=0&SeB=nd&K=chromium+vaapi&outdated=&SB=n&SO=a&PP=50&do_Search=Go
[6]:https://aur.archlinux.org/packages/libva-vdpau-driver-chromium/
[7]:https://launchpad.net/~saiarcot895/+archive/ubuntu/chromium-beta
[8]:https://launchpad.net/~saiarcot895/+archive/ubuntu/chromium-dev/+packages
