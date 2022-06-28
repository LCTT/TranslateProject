[#]: subject: "Firefox 102 Release Lets You Disable Download Panel and Improves Picture-in-Picture Mode"
[#]: via: "https://news.itsfoss.com/firefox-102-release/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Firefox 102 Release Lets You Disable Download Panel and Improves Picture-in-Picture Mode
======
Mozilla Firefox 102 release is here with some solid changes, and useful feature additions!

![][1]

A new Firefox version upgrade is here. While it may not be a major feature update like [Firefox 100][2], it includes some useful enhancements for a better browsing experience.

Here’s what’s new:

### Firefox 102: New Additions and Improvements

With this release, you can finally disable the automatic opening of the download panel every time a new download starts. So, you won’t have too many windows crowding your screen.

It also seems that they have added some refinements to the Picture-in-Picture feature with subtitles. You should have better support for it with more streaming platforms, including Disney+ Hotstar, HBO Max, SonyLIV, and a few others.

![][3]

Firefox 102 also improves security by moving audio decoding into a separate process with enhanced sandboxing. The process remains isolated, thus giving you more security.

Additionally, there are some screen reader improvements on Windows.

For **developers**, there are a couple of important changes that include:

* Introducing support for [Transform streams][4] which also includes new interfaces.
* Support for [readable byte streams][5].
* Removal of Firefox-only properly Window.sidebar.
* You can now filter style sheets in the Style Editor tab of our developer tools

Firefox also adds a new enterprise policy adding a configuration setting that makes sure that the downloads that are meant to be opened are initially stored in a temporary folder.

If the downloaded file is saved, it will be stored in the download folder. Mozilla explains more about it:

> There is now an enterprise policy (`StartDownloadsInTempDirectory` ) and an about:config pref (`browser.download.start_downloads_in_tmp_dir` ) that will once again cause Firefox to initially put downloads in (a subfolder of) the OS temp folder, instead of the download folder configured in Firefox. Files opened from the “what should Firefox do with this file” dialog, or set to open in helper applications automatically, will stay in this folder. Files saved (not opened as previously mentioned) will still end up in the Firefox download folder.

To learn more about the release, refer to the [full release notes][6].

### Download Firefox 102

You can download the latest Firefox 102 release from its official website or wait for the package update on your Linux distribution.

In either case, you can always use the [Snap package][7] to get the latest update now.

[Firefox 102 Download][8]

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/firefox-102-release/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/06/firefox-102.jpg
[2]: https://news.itsfoss.com/firefox-100-release/
[3]: https://news.itsfoss.com/wp-content/uploads/2022/06/firefox-102-pip.jpg
[4]: https://developer.mozilla.org/en-US/docs/Web/API/TransformStream
[5]: https://developer.mozilla.org/en-US/docs/Web/API/Streams_API#bytestream-related_interfaces
[6]: https://www.mozilla.org/en-US/firefox/102.0/releasenotes/
[7]: https://snapcraft.io/firefox
[8]: https://www.mozilla.org/en-US/firefox/
