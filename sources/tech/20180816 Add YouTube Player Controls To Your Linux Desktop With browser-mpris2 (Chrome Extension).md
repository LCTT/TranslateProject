translating---geekpi

Add YouTube Player Controls To Your Linux Desktop With browser-mpris2 (Chrome Extension)
======
A Unity feature that I miss (it only actually worked for a short while though) is automatically getting player controls in the Ubuntu Sound Indicator when visiting a website like YouTube in a web browser, so you could pause or stop the video directly from the top bar, as well as see the video / song information and a preview.

This Unity feature is long dead, but I was searching for something similar for Gnome Shell and I came across **[browser-mpris2][1], an extension that implements a MPRIS v2 interface for Google Chrome / Chromium, which currently only supports YouTube** , and I thought there might be some Linux Uprising readers who'll like this.

**The extension also works with Chromium-based web browsers like Opera and Vivaldi.**
**
** **browser-mpris2 also supports Firefox but since loading extensions via about:debugging is temporary, and this is needed for browser-mpris2, this article doesn't include Firefox instructions. The developer[intends][2] to submit the extension to the Firefox addons website in the future.**

**Using this Chrome extension you get YouTube media player controls (play, pause, stop and seeking) in MPRIS2-capable applets**. For example, if you use Gnome Shell, you get YouTube media player controls as a permanent notification or, you can use an extension like Media Player Indicator for this. In Cinnamon / Linux Mint with Cinnamon, it shows up in the Sound Applet.

**It didn't work for me on Unity** , I'm not sure why. I didn't try this extension with other MPRIS2-capable applets available in various desktop environments (KDE, Xfce, MATE, etc.). If you give it a try, let us know if it works with your desktop environment / MPRIS2 enabled applet.

Here is a screenshot with [Media Player Indicator][3] displaying information about the currently playing YouTube video, along with its controls (play/pause, stop and seeking), on Ubuntu 18.04 with Gnome Shell and Chromium browser:

![](https://1.bp.blogspot.com/-rsc4FpYBSrI/W3VtPphfdOI/AAAAAAAABXY/YfKV6pBncs0LAwTwYSS0tKRJADDfZDBfwCLcBGAs/s640/browser-mpris2-gnome-shell-sound-indicator.png)

And in Linux Mint 19 Cinnamon with its default sound applet and Chromium browser:

![](https://2.bp.blogspot.com/-I2DuYetv7eQ/W3VtUUcg26I/AAAAAAAABXc/Tv-RemkyO60k6CC_mYUxewG-KfVgpFefACLcBGAs/s1600/browser-mpris2-cinnamon-linux-mint.png)

### How to install browser-mpris2 for Google Chrome / Chromium

**1\. Install Git if you haven't already.**

In Debian / Ubuntu / Linux Mint, use this command to install git:
```
sudo apt install git

```

**2\. Download and install the[browser-mpris2][1] required files.**

The commands below clone the browser-mpris2 Git repository and install the chrome-mpris2 file to `/usr/local/bin/` (run the "git clone..." command in a folder where you can continue to keep the browser-mpris2 folder because you can't remove it, as it will be used by Chrome / Chromium):
```
git clone https://github.com/otommod/browser-mpris2
sudo install browser-mpris2/native/chrome-mpris2 /usr/local/bin/

```

**3\. Load the extension in Chrome / Chromium-based web browsers.**

![](https://3.bp.blogspot.com/-yEoNFj2wAXM/W3Vvewa979I/AAAAAAAABXo/dmltlNZk3J4sVa5jQenFFrT28ecklY92QCLcBGAs/s640/browser-mpris2-chrome-developer-load-unpacked.png)

Open Google Chrome, Chromium, Opera or Vivaldi web browsers, go to the Extensions page (enter `chrome://extensions` in the URL bar), enable `Developer mode` using the toggle available in the top right-hand side of the screen, then select `Load Unpacked` and select the chrome-mpris2 directory (make sure to not select a subfolder).

Copy the extension ID and save it because you'll need it later (it's something like: `emngjajgcmeiligomkgpngljimglhhii` but it's different for you so make sure to use the ID from your computer!) .

**4\. Run** `install-chrome.py` (from the `browser-mpris2/native` folder), specifying the extension id and chrome-mpris2 path.

Use this command in a terminal (replace `REPLACE-THIS-WITH-EXTENSION-ID` with the browser-mpris2 extension ID displayed under `chrome://extensions` from the previous step) to install this extension:
```
browser-mpris2/native/install-chrome.py REPLACE-THIS-WITH-EXTENSION-ID /usr/local/bin/chrome-mpris2

```

You only need to run this command once, there's no need to add it to startup or anything like that. Any YouTube video you play in Google Chrome or Chromium browsers should show up in whatever MPRISv2 applet you're using. There's no need to restart the web browser.

--------------------------------------------------------------------------------

via: https://www.linuxuprising.com/2018/08/add-youtube-player-controls-to-your.html

作者：[Logix][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/118280394805678839070
[1]:https://github.com/otommod/browser-mpris2
[2]:https://github.com/otommod/browser-mpris2/issues/11
[3]:https://extensions.gnome.org/extension/55/media-player-indicator/
