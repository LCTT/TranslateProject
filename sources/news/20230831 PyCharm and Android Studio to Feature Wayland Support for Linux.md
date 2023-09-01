[#]: subject: "PyCharm and Android Studio to Feature Wayland Support for Linux"
[#]: via: "https://news.itsfoss.com/intellij-wayland-support/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

PyCharm and Android Studio to Feature Wayland Support for Linux
======
If you are a developer using Linux or WSL, you are in for a treat.
Good news for developers using Linux!

The Jet Brains platform announced that IntelliJ-based IDEs will finally support the Wayland [display server][1] protocol. If you did not know, PyCharm and IntelliJ IDEA are some impressive IDEs based on the IntelliJ platform, and Android Studio is also an example (built by Google).

The Wayland protocol is gradually becoming the default for Linux distributions to provide a faster, secure, and stable experience compared to X11. And, if the coding environments you use support it, the user experience will be enhanced.

But what are the enhancements, and how do they plan to do it? Let me tell you.

**Suggested Read** 📖

![][2]

### Fractional Scaling and WSL Integration

Users utilizing an IDE like [IntelliJ IDEA for Linux][3] can finally benefit from fractional scaling to customize the size of fonts/icons on a high-resolution display.

Multi-monitor setups and high-resolution displays both get an enhanced IDE experience with Wayland support.

You do not have to worry about blurry texts on your IDE anymore.

Not just limited to the native Linux experience but also for users who rely on Windows Subsystem for Linux or, if you would like to call it, '[Bash on Windows][4]'.

The Wayland support will ensure that you get a seamless WSL integration.

In addition, you should have the following new benefits with Wayland:

  * Pop-up windows
  * HiDPI support
  * Interactive resizing of windows



Overall, IntelliJ based IDEs should have more responsiveness, stability, and security by introducing the Wayland support.

**Suggested Read** 📖

![][2]

### Building a Wayland Toolkit

Wayland support on Java is not easy, but IntelliJ has a solution.

Jet Brains and the Oracle desktop team built a **Wayland toolkit** based on OpenJDK 21 to achieve this.

With the toolkit, you get some abilities like:

  * Software-based rendering.
  * Minimal window decorations.
  * Popup windows, including those that are used for top-level menus.
  * HiDPI and multi-monitor support, including different per-monitor scales.



Furthermore, they plan to add clipboard **drag and drop support** , **Vulkan-based accelerated rendering** , and **switching between windows** using a shortcut.

You can keep an eye on the Wayland toolkit's progress on the [OpenJDK wiki][5].

There's no particular timeline to expect the Wayland support. But, it is good to hear that it is an ongoing effort, and IntelliJ as a platform also cares about its Linux-focused users.

You can learn more about it in its [official announcement post][6].

_💬 What do you think about IntelliJ's decision to add Wayland native support to its IDEs? Share your thoughts in the comments below._

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/intellij-wayland-support/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/display-server/
[2]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[3]: https://itsfoss.com/install-intellij-ubuntu-linux/
[4]: https://itsfoss.com/install-bash-on-windows/
[5]: https://wiki.openjdk.org/display/wakefield/Work+breakdown
[6]: https://blog.jetbrains.com/platform/2023/08/wayland-support/
