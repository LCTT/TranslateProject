Termux turns Android into a Linux development environment
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tux_penguin_linux_android.jpg?itok=ctgANLI7)
So you finally figured out how to exit Vim and you can write the most highly optimized version of "Hello World" this side of the Mississippi. Now it's time to up your game! Check out [Termux][1] for Android.

### What is Termux?

Termux is an Android terminal emulator and Linux environment. What that means in practice is that you can install Termux on most Android devices and do almost anything you would do in a full Linux development environment on that device. That all sounds cool, but you're probably asking yourself, "why would I want to code on my phone on a touch screen? That just sounds awful." Start thinking more along the lines of tablets paired with a keyboards or Chromebooks that can now run Android applications. These are very cheap devices that can now be used to introduce people to Linux hacking and development. I know many of us in the Linux community started out by installing Linux on an old PC.

Tablets and Chromebooks are this generation's old, junky computers. And there are plenty to go around. Why not use them to introduce the next generation to Linux? And since Termux can be installed with a click in the [Google Play Store][2] , I would argue Termux is the easiest way to introduce anyone to Linux. But don't leave all the fun for the noobs. Termux can accommodate many of your needs for a Linux development environment.

Termux is Linux, but it is based on Android and runs in a container. That means you can install it with no root access required—but it also means it may take some getting used to. In this article, I'll outline some tips and tricks I found to get Termux working as a full-time development environment.

### Where's all my stuff?

The base of the Termux filesystem that you can see starts around `/data/data/com.termux/files/`. Under that directory, you'll find your home directory and the `usr` directory, where all the Linux packages are installed. This is kind of weird, but no big deal right? You would be wrong, because almost every script on the planet is hard coded for `/bin/bash`. Other libraries, executables, and configuration files are in places inconsistent with other Linux distributions.

Termux provides lots of [packages][3] that have been modified to run correctly. Try looking there first instead of doing a custom build. However, you will still probably need to custom-build many things. You can try modifying your package's source code, and even though changing paths is easy, it gets old quick. Thankfully Termux also comes bundled with [termux-exec][4]. Termux-exec will redirect script paths on the fly to get them to work correctly.

You may still run into some hard-coded paths that termux-exec doesn't handle. Since you don't have root access in Termux, you can't just create a symlink to fix path issues. However, you can create a [chroot jail][5]. Using the [PRoot][6] package, you can create a chroot that you have full control over and allows you to modify anything you want. You can also make chroots of different Linux distributions. If you are a Fedora fan, you can use Termux and run it in a chroot jail. Check out the [PRoot page][6] for more distros and installation details, or you can use [this script][7] to make a Termux chroot jail. I've only tried the Termux chroot and the Ubuntu chroot. The Ubuntu chroot had some issues that needed to be worked around, so your mileage may vary depending on the version of Linux you choose.

### One user to rule them all

In Termux, everything is installed and run under one user. This isn't so much a problem, rather something you need to get used to. This also means the typical services and user groups you might be familiar with are nowhere to be found. And nothing auto-starts on boot, so it's up to you to manage the start and stop of services you might use, like databases, SSH, etc. Also remember, your one user can't modify the base system, so you will need to use a chroot if you need to do that. Since you don't have nice, preset start scripts, you will probably have to come up with some of your own.

For everyday development, I needed Postgres, Nginx, and Redis. I'd never started these services manually before; normally they start and stop for me automatically, and I had to do a little digging to find out how to start my favorite services. Here is a sample of the three services I just mentioned. Hopefully, these examples will point you in the right direction to use your favorite service. You can also look at a package's documentation to find information on how to start and stop it.

#### Postgres

Start: `pg_ctl -D $PREFIX/var/lib/postgresql start`
Stop: `pg_ctl -D $PREFIX/var/lib/postgresql stop`

#### Nginx

Start: `nginx`
Stop: `nginx -s stop`

#### Redis

Start: `redis-server $PREFIX/etc/redis.conf`
Stop: `kill "$("$PREFIX/bin/applets/cat" "$PREFIX/var/run/redis_6379.pid"`

### Broken dependencies

Android is built differently than other versions of Linux, and its kernel and libraries don't always match those in typical Linux software. You can see the [common porting problems][8] when trying to build software in Termux. You can work around most of them, but it may be too much effort to fix every dependency in your software.

For example, the biggest problem I ran into as a Python developer is by the Android kernel not supporting semaphores. The multi-processing library in Python depends on this functionality, and fixing this on my own was too difficult. Instead, I hacked around it by using a different deployment mechanism. Before I was using [uWSGI][9] to run my Python web services, so I switched to [Gunicorn][10]. This allowed me to route around using the standard Python multi-processing library. You may have to get a little creative to find alternative software dependencies when switching to Termux, but your list will probably be very small.

### Everyday Termux

When using Termux on a daily basis, you'll want to learn its [touch screen][11] or [hardware keyboard][12] shortcuts. You'll also need a text editor or IDE for coding. All the likely console-based editors are available through a quick package install: Vim, Emacs, and Nano. Termux is only console-based, so you won't be able to install any editors based on a graphical interface. I wanted to make sure Termux had a great IDE to go along with it, so I built the web-based Neutron64 editor to interface seamlessly with Termux. Just go to [Neutron64.com][13] and install [Neutron Beam][14] on Termux to start coding.

Check out [Termux][1] and turn your old Android devices into development powerhouses. Happy coding!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/termux

作者：[Paul Bailey][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/pizzapanther
[1]:https://termux.com/
[2]:https://play.google.com/store/apps/details?id=com.termux&hl=en_US
[3]:https://termux.com/package-management.html
[4]:https://wiki.termux.com/wiki/Termux-exec
[5]:https://en.wikipedia.org/wiki/Chroot
[6]:https://wiki.termux.com/wiki/PRoot
[7]:https://github.com/Neo-Oli/chrooted-termux
[8]:https://github.com/termux/termux-packages/blob/master/README.md#common-porting-problems
[9]:https://uwsgi-docs.readthedocs.io/en/latest/
[10]:http://gunicorn.org/
[11]:https://termux.com/touch-keyboard.html
[12]:https://termux.com/hardware-keyboard.html
[13]:https://www.neutron64.com/
[14]:https://www.neutron64.com/help/neutron-beam
