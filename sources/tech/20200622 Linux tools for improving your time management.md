[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Linux tools for improving your time management)
[#]: via: (https://opensource.com/article/20/6/linux-time-management)
[#]: author: (Sudeshna Sur https://opensource.com/users/sudeshna-sur)

Linux tools for improving your time management
======
Whether you need help to stay focused, maintain timeliness, or find
shortcuts to avoid repetition, these Linux tools have you covered.
![Business woman on laptop sitting in front of window][1]

Productivity is a subjective term, but essentially, it's a measurement of how efficiently a particular task is completed. Everyone has different things that keep them productive—some people need help staying on task, some people need a particular kind of work environment, some people need alerts and reminders to avoid missed deadlines, and some need assistance with repetitive, manual chores. Luckily, there are myriad tools and technologies available to provide you the specific support you need. In particular, if you are a Linux user, there are some tweaks that can help you increase your productivity; here are two that I use on a regular basis.

### Clipboard Indicator

Are you someone who uses a lot of copy and paste functions between several documents in your day to day usage? If so, then [Clipboard Indicator][2] should become one of your go-to solutions. Install Clipboard Indicator as a GNOME extension to your Linux distribution. In my experience, it has a minimum performance impact on GNOME Shell—at least, less than other solutions I have tried.

This tool adds an indicator menu to the top panel and caches your clipboard history. You can set the history size, preview the number of characters you want to view. It shows notifications on copy and acts as a temporary space to store whatever you copy.

![Clipboard indicator menu on GNOME desktop][3]

The easiest way to install the extension and connector is to use your distro's package manager.

For Fedora, CentOs, or RHEL, use:


```
`$ sudo dnf install chrome-gnome-shell`
```

On Ubuntu or Debian, use `apt install` instead.

Once it's installed, go to <https://extensions.gnome.org/> and check your installed extensions.

If you use Firefox, use the Firefox browser add-on and install the `GNOME Shell integration`**.** You will see a small footprint icon in your Firefox toolbar, which will take you to the Extensions page. On that page, search for the Clipboard Indicator extension and toggle to enable it.

Now, follow the prompts to download the GNOME extension and activate it. You can check your `~/.local/share/gnome-shell/extensions` location to view the extension.

Voila! You'll see a new icon in the top-right corner of your GNOME desktop. Copy anything and experiment with its settings.

A quick installation via Git can also be performed by cloning the repo into your local `gnome-shell extensions` directory using the command:


```
`$ git clone https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator.git ~/.local/share/gnome-shell/extensions/clipboard-indicator@tudmotu.com`
```

Go to the GNOME Tweak tool and activate it from the Extensions screen.

### Pomodoro

![Using the pomodoro timer on GNOME][4]

The Pomodoro Technique is a time management philosophy that aims to provide the user with maximum focus. Each 25-minute work period is called a "pomodoro," (Italian for tomato); after each pomodoro, you take a five-minute break. Every four pomodoros, or 100 minutes, you then take a 15 to 20-minute break. If you have a large and varied to-do list, using the Pomodoro Technique can help you crank through projects faster by forcing you to adhere to strict timing.

The installation procedure can be managed through the GNOME Tweaks webpage (extensions.gnome.org) or through the command line. For the latter, choose your distribution of Linux along with the release version and install using the following command:


```
`$ sudo dnf install gnome-shell-extension-pomodoro`
```

or if you wish to build from source:


```
$ git clone -b gnome-3.34 <https://github.com/codito/gnome-pomodoro.git>
$ cd gnome-pomodoro
```

The source code has a number of dependencies, many of which are likely already installed. To make sure of it, install of the following.


```
`$ sudo dnf install autoconf-archive gettext vala vala-tools pkg-config desktop-file-utils glib2-devel gtk3-devel libappstream-glib-devel libappindicator-gtk3-devel libcanberra-devel libpeas-devel sqlite-devel gom-devel gobject-introspection-devel gsettings-desktop-schemas-devel gstreamer1-devel`
```

Inside unpacked directory of the source code, complete the build.


```
$ ./autogen.sh --prefix=/usr --datadir=/usr/share 
$ make 
$ sudo make install 
```

No matter how we install, go to GNOME Tweaks and turn on the pomodoro timer. If you don't already have GNOME Tweaks, installing it through your package manager or in your software installer of choice. For example, on Fedora:


```
`$ sudo dnf install gnome-tweaks`
```

On Ubuntu or Debian, use `apt install` instead.

Pomodoro desktop integration is currently available for GNOME Shell, and they plan to support more desktops in the future. Check out <https://gnomepomodoro.org/> for the latest on the project. For KDE users in the meantime, there is an alternative called [Fokus][5].

### Productivity on Linux

Productivity is personal, but it's something we all are after in one way or another. Each of these tools has either saved me time or made my working time more productive, and they're a quick integration with Linux.

Do you have a favorite productivity tool? Share it in the comments!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/linux-time-management

作者：[Sudeshna Sur][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sudeshna-sur
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png?itok=-8E2ihcF (Woman using laptop concentrating)
[2]: https://extensions.gnome.org/extension/779/clipboard-indicator/
[3]: https://opensource.com/sites/default/files/uploads/gnome-tweaks-productivity_0.png (Clipboard indicator menu on GNOME desktop)
[4]: https://opensource.com/sites/default/files/uploads/pomodoro-timer-fedora-opensourcecom.png (Using the pomodoro timer on GNOME)
[5]: https://store.kde.org/p/1308861/
