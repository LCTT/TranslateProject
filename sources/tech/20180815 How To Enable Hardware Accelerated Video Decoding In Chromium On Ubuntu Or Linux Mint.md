How To Enable Hardware Accelerated Video Decoding In Chromium On Ubuntu Or Linux Mint
======
You may have noticed that watching HD videos from Youtube and other similar websites in Google Chrome or Chromium browsers on Linux considerably increases your CPU usage and, if you use a laptop, it gets quite hot and the battery drains very quickly. That's because Chrome / Chromium (Firefox too but there's no way to force this) doesn't support hardware accelerated video decoding on Linux.

**This article explains how to install a Chromium development build which includes a patch that enables VA-API on Linux, bringing support for GPU accelerated video decoding, which should significantly decrease the CPU usage when watching HD videos online. The instructions cover only Intel and Nvidia graphics cards, as I don't have an ATI/AMD graphics card to try this, nor do I have experience with such graphics cards.**

This is Chromium from the Ubuntu (18.04) repositories without GPU accelerated video decoding playing a 1080p YouTube video:

![](https://4.bp.blogspot.com/-KtUQni2PMvE/W3KlJ62yLLI/AAAAAAAABW4/NrNVFaTAkZ8AmwqWwRvWD6czT51ni-R-gCLcBGAs/s1600/chromium-default-no-accel.png)

The same 1080p YouTube video playing in Chromium with the VA-API patch and hardware accelerated video decode enabled on Ubuntu 18.04:

![](https://4.bp.blogspot.com/-0c-wb4UNhW8/W3KlQBfeFnI/AAAAAAAABW8/WVUAYzM6hA8wRTlCcrPXPMpoXoFVR6b1QCLcBGAs/s1600/chromium-hardware-acceleration-enabled.png)

Notice the CPU usage in the screenshots. Both screenshots were taken on my old, but still quite powerful desktop. On my laptop, the Chromium CPU usage without hardware acceleration goes way higher.

The _Enable VAVDA, VAVEA and VAJDA on linux with VAAPI only_ " was was initially submitted to Chromium more than a year ago, but it has yet to be merged.

Chrome has an option to override the software rendering list (

`#ignore-gpu-blacklist`

), but this option does not enable hardware accelerated video decoding. After enabling this option, you may find the following when visiting

`chrome://gpu`

: " _Video Decode: Hardware accelerated_ ", but this does not mean it actually works. Open a HD video on YouTube and check the CPU usage in a tool such as

`htop`

(this is what I'm using in the screenshots above to check the CPU usage) - you should see high CPU usage because GPU video decoding is not actually enabled. There's also a section below for how to check if you're actually using hardware accelerated video decoding.

**The patches used by the Chromium Ubuntu builds with VA-API enabled used in this article are available[here][1].**

### Installing and using Chromium browser with VA-API support on Ubuntu or Linux Mint

**It should be clear to everyone reading this that Chromium Dev Branch is not considered stable. So you might find bugs, it may crash, etc. It works fine right now but who knows what may happen after some update.**

**What's more, the Chromium Dev Branch PPA requires you to perform some extra steps if you want to enable Widevine support** (so you can play Netflix videos and paid YouTube videos, etc.), **or if you need features like Sync** (which needs registering an API key and setting it up on your system). Instructions for performing these tweaks are explained in the

Chromium with the VA-API patch is also available for some other Linux distributions, in third-party repositories, like

**1\. Install Chromium Dev Branch with VA-API support.**

There's a Chromium Beta PPA with the VA-API patch, but it lacks vdpau-video for Ubuntu 18.04. If you want, you can use the `vdpau-va-driver` from the You can add the Chromium
```
sudo add-apt-repository ppa:saiarcot895/chromium-dev
sudo apt-get update
sudo apt install chromium-browser

```

**2\. Install the VA-API driver**

For Intel graphics cards, you'll need to install the `i965-va-driver` package (it may already be installed):
```
sudo apt install i965-va-driver

```

For Nvidia graphics cards (it should work with both the open source Nouveau drivers and the proprietary Nvidia drivers), install `vdpau-va-driver` :
```
sudo apt install vdpau-va-driver

```

**3\. Enable the Hardware-accelerated video option in Chromium.**

Copy and paste the following in the Chrome URL bar: `chrome://flags/#enable-accelerated-video` (or search for the `Hardware-accelerated video` option in `chrome://flags`) and enable it, then restart Chromium browser.

On a default Google Chrome / Chromium build, this option shows as unavailable, but you'll be able to enable it now because we've used the VA-API enabled Chromium build.

**4\. Install[h264ify][2] Chrome extension.**

YouTube (and probably some other websites as well) uses VP8 or VP9 video codecs by default, and many GPUs don't support hardware decoding for this codec. The h264ify extension will force YouTube to use H.264, which should be supported by most GPUs, instead of VP8/VP9.

This extension can also block 60fps videos, useful on lower end machines.

You can check the codec used by a YouTube video by right clicking on the video and selecting `Stats for nerds` . With the h264ify extension enabled, you should see avc / mp4a as the codecs. Without this extension, the codec should be something like vp09 / opus.

### How to check if Chromium is using GPU video decoding

Open a video on YouTube. Next, open a new tab in Chromium and enter the following in the URL bar: `chrome://media-internals` .

On the `chrome://media-internals` tab, click on the video url (in order to expand it), scroll down and look under `Player Properties` , and you should find the `video_decoder` property. If the `video_decoder` value is `GpuVideoDecoder` it means that the video that's currently playing on YouTube in the other tab is using hardware-accelerated video decoding.

![](https://4.bp.blogspot.com/-COBJWVT_Y0Q/W3KnG7AeHsI/AAAAAAAABXM/W2XAJA_S0BIHug4eQKTMOdIfXHhgkXhhQCLcBGAs/s1600/chromium-gpuvideodecoder-linux.png)

If it says `FFmpegVideoDecoder` or `VpxVideoDecoder` , accelerated video decoding is not working, or maybe you forgot to install or disabled the h264ify Chrome extension.

If it's not working, you could try to debug it by running `chromium-browser` from the command line and see if it shows any VA-API related errors. You can also run `vainfo` (install it in Ubuntu or Linux Mint: `sudo apt install vainfo`) and `vdpauinfo` (for Nvidia; install it in Ubuntu or Linux Mint: `sudo apt install vdpauinfo`) and see if it shows an error.


--------------------------------------------------------------------------------

via: https://www.linuxuprising.com/2018/08/how-to-enable-hardware-accelerated.html

作者：[Logix][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
