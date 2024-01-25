[#]: subject: "Ah, Snap! Firefox is Finally Providing Deb Package for Debian and Ubuntu Users"
[#]: via: "https://news.itsfoss.com/mozilla-firefox-deb/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1705972010"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Ah, Snap! Firefox is Finally Providing Deb Package for Debian and Ubuntu Users
======
Mozilla Firefox has a new native package available for Linux.
I come bearing some good news! Mozilla has introduced a new _.deb_ package for Firefox that is meant for Ubuntu, Debian, and other [Debian-based distros][1].

You can now switch from other package formats (or the snap package) that's been bothering you with its slow launches. So, join me as I take you through this, and show you **how to install it on your Linux system**.

**Suggested Read** 📖

![][2]

### Firefox .deb Package: What to Expect?

![][3]

Built from the ground up by Mozilla, the new Linux package is all set to give users **a native .deb package** , similar to Snap or Flatpak that just works out of the box.

All the _.deb_ packages for Firefox that were available before this were maintained by individuals and organizations that weren't associated with Mozilla. But, we finally have an official one.

On the release, Mozilla added:

> For more than 25 years, Mozilla has built a reputation for building free and open-source web browsers. Because the Firefox browser is open-source, we know Firefox inside and out, including how to get the best from it.

While Firefox is already performance-focused, the deb package should help you make the most out of the optimizations done under-the-hood.

You're maybe wondering; **what about updates?**

Well, Mozilla has introduced **a new APT repository** that is in sync with the Firefox release process. So, you will receive updates whenever there's a new one, and you just have to restart Firefox to apply them.

![][4]

Handy, ain't it? I like what they have done with this, I am now considering switching to the .deb package from the Flatpak that I have installed now, but that's just me.

#### How to Install the Official .deb of Firefox?

To install the latest .deb release from Mozilla, you can refer to the steps shown below **on your Ubuntu, Debian or other Debian-based system**.

If you have the Snap version of Firefox installed, then you can run the following commands to remove it completely from your system:

🚧

Running these commands will completely remove any data related to the Snap version of Firefox, proceed with caution!

```

    sudo snap disable firefox

    sudo snap remove --purge firefox

```

Next, we create a directory for storing the APT repo keys by running the following command:

```

    sudo install -d -m 0755 /etc/apt/keyrings

```

Now, import the Mozilla APT repo signing key:

```

    wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null

```

Then, you have to run the following command:

```

    gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | awk '/pub/{getline; gsub(/^ +| +$/,""); print "\n"$0"\n"}'

```

Ensure that the fingerprint matches this after the command is run:

> 35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3

Thereafter, you have to add the Mozilla APT repo to your sources list:

```

    echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null

```

Next, you have to set up APT to prioritize packages from the Mozilla repo:

```

    echo '
    Package: *
    Pin: origin packages.mozilla.org
    Pin-Priority: 1000
    ' | sudo tee /etc/apt/preferences.d/mozilla

```

And, finally, run the following command and confirm the installation by entering “ _Y_ ” when prompted:

```

    sudo apt update && sudo apt install firefox

```

![][5]

That's it, you have now successfully installed the official .deb package of Firefox on your Linux system!

This is the final step that I mentioned earlier, you just have to type “ _Y_ ” and the installation should continue, with Firefox being installed onto your system by the end of it.

![][6]

There is also a way to **install different language packs** for Firefox, I highly suggest you go through the [official documentation][7] for that.

_💬 Would you go for the official .deb package over Snap or Flatpak? Let us know below!_

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/mozilla-firefox-deb/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/debian-based-distros/
[2]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[3]: https://news.itsfoss.com/content/images/2024/01/Mozilla_Firefox_Deb_a.png
[4]: https://news.itsfoss.com/content/images/2023/04/Follow-us-on-Google-News.png
[5]: https://news.itsfoss.com/content/images/2024/01/Mozilla_Firefox_Deb_b.png
[6]: https://news.itsfoss.com/content/images/2024/01/Mozilla_Firefox_Deb_c-1.png
[7]: https://support.mozilla.org/en-US/kb/install-firefox-linux
