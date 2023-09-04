[#]: subject: "Linux Users Beware! GNOME 45 is Bad News for Extensions"
[#]: via: "https://news.itsfoss.com/gnome-45-extensions/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux Users Beware! GNOME 45 is Bad News for Extensions
======
GNOME 45 is an impressive upgrade. But this development on extensions
does not sound great!
With every GNOME upgrade, some extensions break; that's not new. But, with GNOME 45, every extension will break 😱

And why is that? Let me tell you more about it.

### GNOME 45 Extension Changes

With every upgrade, there is always a technical improvement or change.

And, [GNOME 45][1] comes with pretty exciting changes, except this one.

![][2]

**GNOME Shell's JavaScript has had a change**. If you are curious, the JavaScript part (and the modules) is responsible for the extension's user interface, including the panel, menus, dialogs, etc.

The technical change is that GNOME Shell and Extensions use ESModules instead of GJS' custom import system.

While this modification was intended to encourage developers to use a more standardized approach for GNOME Shell and Extensions codebase, it might have added a big hassle.

**Why?**

This is because the legacy system and the new modules approach are incompatible.

Here's what **Florian Müllner** had to [mention][3] for the technical bits:

> Modules are loaded differently than scripts, and some statements — namely `import` and `export` — are only valid in modules. That means that trying to import a module with the legacy system will result in a syntax error if the module uses one of those statements (about as likely as a pope being Catholic).

And the hassle? **All GNOME extensions break.**

  * All the extensions targeted for older GNOME versions will no longer work on GNOME 45 (unless ported).
  * New extensions tailored for GNOME 45 will not work on older versions.



The good thing is that a GNOME extension developer can support multiple versions of GNOME. But they will have more work to do and re-upload versions for pre and post-GNOME 45.

So, even if a developer chooses to do that and utilizes the [porting guide][4] to migrate to the new system, it will take extra time for them while the end-users (us) encounter broken extensions when using GNOME 45.

**Not a pretty user experience. Is it?** 😒

GNOME upgrades were not perfect for extension compatibility; now, **it is worse**.

While I do not rely much on any available [GNOME extensions][5], many users do. And, for them, an upgrade that breaks the experience is not good news.

📰 **Want our news updates on your Google News feed? Follow us here:**

![][6]

_💬 What do you think about the change for extensions in GNOME 45? Share your thoughts on it in the comments below._

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/gnome-45-extensions/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/gnome-45/
[2]: https://news.itsfoss.com/content/images/size/w256h256/2022/08/android-chrome-192x192.png
[3]: https://blogs.gnome.org/shell-dev/2023/09/02/extensions-in-gnome-45/
[4]: https://gjs.guide/extensions/upgrading/gnome-shell-45.html#esm
[5]: https://itsfoss.com/gnome-shell-extensions/
[6]: https://ssl.gstatic.com/gnews/logo/google_news_1024.png
