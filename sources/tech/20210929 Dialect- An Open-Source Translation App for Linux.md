[#]: subject: "Dialect: An Open-Source Translation App for Linux"
[#]: via: "https://itsfoss.com/dialect/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Dialect: An Open-Source Translation App for Linux
======

_**Brief:** Dialect is a straightforward app that lets you translate between languages using web services. To explore more, let us take a closer look._

While you can launch the web browser and directly use any translation service to get the job done, a desktop app can sometimes come in handy.

Dialect is a simple translation app that utilizes web services to translate while giving you some extra abilities.

### Open-Source Translation App with Google Translate &amp; LibreTranslate

![][1]

Dialect is primarily an app tailored for GNOME desktops, but it should work fine with other desktop environments.

It lets you quickly translate languages along with a few extra options.

At its core, it lets you choose between Google Translate or LibreTranslate as the translation service.

Even though LibreTranslate cannot come close to Google Translate’s accuracy, featuring it as an option to switch is an excellent addition. At least, for some basic usage, if a user does not want to utilize Google’s services, you have an alternative ready on your desktop.

### Features of Dialect

![][2]

Along with the ability to switch translation services, you get a few more tweaks:

  * Pronunciation
  * Text to Speech functionality (Google)
  * Dark mode
  * Translation shortcut
  * Live Translation
  * Clipboard buttons to quickly copy/paste
  * Translation history (undo/redo)



As you can notice in the screenshot, the live translation feature may get your IP addressed banned from using the service because of API abuse.

![][3]

I tried using LibreTranslate (as shown in the image above) and Google Translate with the live translation feature enabled, and it worked fine.

Maybe if you rely on translations quite often, you may want to avoid the feature. But, for my quick usage, the services didn’t ban by IP address for quite a few test runs.

It is important to note that you can specify a custom LibreTranslate instance if you want. By default, it uses “translate.astian.org” as the instance.

You may not find a separate translation history section, but the arrow buttons in the top-left corner of the window will let you see your previous translations and the translation settings as well.

So, it works as a redo/undo feature as well.

### Installing Dialect in Linux

Dialect is available as a [Flatpak][4]. So, you should be able to install it on any Linux distro of your choice. If you are new to this, you might want to check out our [Flatpak guide][5] for help.

First, add Flathub repo:

```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

And then install the application:

```
flatpak install flathub com.github.gi_lom.dialect
```

Once installed, look for it in the system menu and start it from there.

You can also explore its [GitHub page][6] for more information.

[Dialect][7]

--------------------------------------------------------------------------------

via: https://itsfoss.com/dialect/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/dialect-screenshot.png?resize=800%2C331&ssl=1
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/dialect-app-options.png?resize=800%2C470&ssl=1
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/dialect-libretranslate.png?resize=800%2C326&ssl=1
[4]: https://itsfoss.com/what-is-flatpak/
[5]: https://itsfoss.com/flatpak-guide/
[6]: https://github.com/dialect-app/dialect/
[7]: https://flathub.org/apps/details/com.github.gi_lom.dialect
