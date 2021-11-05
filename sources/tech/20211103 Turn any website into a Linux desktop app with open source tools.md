[#]: subject: "Turn any website into a Linux desktop app with open source tools"
[#]: via: "https://opensource.com/article/21/11/linux-apps-nativefier"
[#]: author: "Ayush Sharma https://opensource.com/users/ayushsharma"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Turn any website into a Linux desktop app with open source tools
======
Nativefier and Electron creates desktop apps from any website.
![Text editor on a browser, in blue][1]

Mastodon is a great open source, decentralised social network. I use Mastodon every day, and it's probably most common to use Mastodon through its web interface (although being open source, there are many different ways to interact with it, including terminal-based applications and mobile apps), but I prefer dedicated application windows.

Recently, I discovered [Nativefier][2], and I can now enjoy Mastodon, or any other web app, as a desktop application on my Linux desktop. Nativefier takes a URL and wraps it with the Electron framework, which runs the open source Chromium browser as its backend but runs as its own executable application. Nativefier is licensed under the MIT license and is available for Linux, Windows, and macOS.

### Installing Nativefier

Nativefier requires Node.js

Installing Nativefier is as simple as running:


```
`$ sudo npm install -g nativefier`
```

On my Ubuntu desktop, I had to upgrade NodeJS first, so be sure to check what versions of Node is required when you install Nativefier.

Once installed, you can check your version of Nativefier to verify that it's been installed:


```
$ nativefier --version
45.0.4
```

Running `nativefier --help` lists all options the app supports.

### Setup

I recommend that you create a new folder called `~/NativeApps` before you start creating apps with Nativefier. This helps keep your applications nice and organized.


```
$ mkdir ~/NativeApps
cd ~/NativeApps
```

### Creating an app for Mastodon

I'll start by creating an app for [mastodon.technology][3].

Use the command:


```
$ nativefier --name Mastodon \
\--platform linux --arch x64 \
\--width 1024 --height 768 \
\--tray --disable-dev-tools \
\--single-instance <https://mastodon.technology>
```

The options in this example do the following:

  * `--name`: Sets the app name to Mastodon
  * `--platform`: Sets the app's platform to Linux
  * \--arch x64: Sets the architecture to x64
  * `--width 1024 --height 768`: Sets the apps' dimensions on launch
  * `--tray`: Creates a tray icon for the app
  * `--disable-dev-tools`: Disables Chrome dev tools
  * `--single-instance`: Only allows one instance of the app



Running that single command shows the following output:


```
Preparing Electron app...

Converting icons...
Packaging... This will take a few seconds, maybe minutes if the requested Electron isn't cached yet...
Packaging app for platform linux x64 using electron v13.4.0 Finalizing build...

App built to /home/tux/NativeApps/Mastodon-linux-x64, move to wherever it makes sense for you and run the contained executable file (prefixing with ./ if necessary)

Menu/desktop shortcuts are up to you, because Nativefier cannot know where you're going to move the app. Search for "linux .desktop file" for help, or see <https://wiki.archlinux.org/index.php/Desktop\_entries>
```

The output shows that the files get placed in `/home/tux/NativeApps/Mastodon-linux-x64`. When you `cd` into this folder, you see a file named Mastodon. This is the main executable that launches the app. Before you can launch it, you must give it the appropriate permissions.


```
$ cd Mastodon-linux-x64
chmod +x Mastodon
```

Now, execute `./Mastodon` to see your Linux app launch!

![Mastodon app launched][4]

(Ayush Sharma, [CC BY-SA 4.0][5])

### Creating an app for my blog

For fun, I'm going to create an app for my blog website as well. What good is having a tech blog if there's no Linux app for it?

![Ayush Sharma blog][6]

(Ayush Sharma, [CC BY-SA 4.0][5])

The command:


```
$ nativefier -n ayushsharma \
-p linux -a x64 \
\--width 1024 --height 768 \
\--tray --disable-dev-tools \
\--single-instance <https://ayushsharma.in>

$ cd ayushsharma-linux-x64
chmod +x ayushsharma
```

### Creating an app for findmymastodon.com

And finally, here's an app for my pet project, [findmymastodon.com][7].

![Find my mastodon website][8]

(Ayush Sharma, [CC BY-SA 4.0][5])

The command:


```
$ nativefier -n findmymastodon \
-p linux -a x64 \
\--width 1024 --height 768 \
\--tray --disable-dev-tools \
\--single-instance <https://findmymastodon.com>

$ cd findmymastodon-linux-x64
chmod +x findmymastodon
```

### Creating Linux desktop icons

With the apps created and the executables ready to go, it's time to create desktop icons.

As a demonstration, here's how to create a desktop icon for the Mastodon launcher. First, download an icon for [Mastodon][9]. Place the icon in its Nativefier app directory as `icon.png`.

Then create a file called `Mastodon.desktop` and enter this text:


```
[Desktop Entry]
Type=Application
Name=Mastodon
Path=/home/tux/NativeApps/Mastodon-linux-x64
Exec=/home/tux/NativeApps/Mastodon-linux-x64/Mastodon
Icon=/home/tux/NativeApps/Mastodon-linux-x64/icon.png
```

You can move the `.desktop` file to your Linux desktop to have it as a desktop launcher. You can also place a copy of it in `~/.local/share/applications` so it shows up in your application menu or activity launcher.

### Conclusion

I love having dedicated apps for tools I use often. My favorite feature about having an app for Mastodon is that once I log in to Mastodon, I don't have to log in again! Nativefier runs Chromium underneath. So it's able to remember your session just like any browser does. I'd like to give a special thanks to the Nativefier team for taking the Linux desktop one step closer to perfection.

* * *

_This article originally appeared on the [author's website][10] and is republished with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/linux-apps-nativefier

作者：[Ayush Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ayushsharma
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_blue_text_editor_web.png?itok=lcf-m6N7 (Text editor on a browser, in blue)
[2]: https://github.com/nativefier/nativefier
[3]: https://mastodon.technology/
[4]: https://opensource.com/sites/default/files/uploads/2_launch-mastodon-app.png (Mastodon app launched)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/sites/default/files/uploads/3_ayush-shama-blog.png (Ayush Sharma blog)
[7]: https://findmymastodon.com/
[8]: https://opensource.com/sites/default/files/uploads/4_find-my-mastodon-app.png (Find my mastodon website)
[9]: https://icons8.com/icons/set/mastodon
[10]: https://ayushsharma.in/2021/10/make-linux-apps-for-notion-mastodon-webapps-using-nativefier
