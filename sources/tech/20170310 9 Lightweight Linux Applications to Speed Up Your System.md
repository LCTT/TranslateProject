9 Lightweight Linux Applications to Speed Up Your System
======
**Brief:** One of the many ways to [speed up Ubuntu][1] system is to use lightweight alternatives of the popular applications. We have already seen [must have Linux application][2] earlier. we'll see the lightweight alternative applications for Ubuntu and other Linux distributions.

![Use these Lightweight alternative applications in Ubuntu Linux][4]

## 9 Lightweight alternatives of popular Linux applications

Is your Linux system slow? Are the applications taking a long time to open? The best option you have is to use a [light Linux distro][5]. But it's not always possible to reinstall an operating system, is it?

So if you want to stick to your present Linux distribution, but want improved performance, you should use lightweight alternatives of the applications you are using. Here, I'm going to put together a small list of lightweight alternatives to various Linux applications.

Since I am using Ubuntu, I have provided installation instructions for Ubuntu-based Linux distributions. But these applications will work on almost all other Linux distribution. You just have to find a way to install these lightweight Linux software in your distro.

### 1. Midori: Web Browser

Midori is one of the most lightweight web browsers that have reasonable compatibility with the modern web. It is open source and uses the same rendering engine that Google Chrome was initially built on -- WebKit. It is super fast and minimal yet highly customizable.

![Midori Browser][6]

It has plenty of extensions and options to tinker with. So if you are a power user, it's a great choice for you too. If you face any problems browsing round the web, check the [Frequently Asked Question][7] section of their website -- it contains the common problems you might face along with their solution.

[Midori][8]

#### Installing Midori on Ubuntu based distributions

Midori is available on Ubuntu via the official repository. Just run the following commands for installing it:
```
 sudo apt install midori
```

### 2. Trojita: email client

Trojita is an open source robust IMAP e-mail client. It is fast and resource efficient. I can certainly call it one of the [best email clients for Linux][9]. If you can live with only IMAP support on your e-mail client, you might not want to look any further.

![Trojitá][10]

Trojita uses various techniques -- on-demand e-mail loading, offline caching, bandwidth-saving mode etc. -- for achieving its impressive performance.

[Trojita][11]

#### Installing Trojita on Ubuntu based distributions

Trojita currently doesn't have an official PPA for Ubuntu. But that shouldn't be a problem. You can install it quite easily using the following commands:
```
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/jkt-gentoo:/trojita/xUbuntu_16.04/ /' > /etc/apt/sources.list.d/trojita.list"
wget http://download.opensuse.org/repositories/home:jkt-gentoo:trojita/xUbuntu_16.04/Release.key
sudo apt-key add - < Release.key
sudo apt update
sudo apt install trojita
```

### 3. GDebi: Package Installer

Sometimes you need to quickly install DEB packages. Ubuntu Software Center is a resource-heavy application and using it just for installing .deb files is not wise.

Gdebi is certainly a nifty tool for the same purpose, just with a minimal graphical interface.

![GDebi][12]

GDebi is totally lightweight and does its job flawlessly. You should even [make Gdebi the default installer for DEB files][13].

#### Installing GDebi on Ubuntu based distributions

You can install GDebi on Ubuntu with this simple one-liner:
```
sudo apt install gdebi
```

### 4. App Grid: Software Center

If you use software center frequently for searching, installing and managing applications on Ubuntu, App Grid is a must have application. It is the most visually appealing and yet fast alternative to the default Ubuntu Software Center.

![App Grid][14]

App Grid supports ratings, reviews and screenshots for applications.

[App Grid][15]

#### Installing App Grid on Ubuntu based distributions

App Grid has its official PPA for Ubuntu. Use the following commands for installing App Grid:
```
sudo add-apt-repository ppa:appgrid/stable
sudo apt update
sudo apt install appgrid
```

### 5. Yarock: Music Player

Yarock is an elegant music player with a modern and minimal user interface. It is lightweight in design and yet it has a comprehensive list of advanced features.

![Yarock][16]

The main features of Yarock include multiple music collections, rating, smart playlist, multiple back-end option, desktop notification, scrobbling, context fetching etc.

[Yarock][17]

#### Installing Yarock on Ubuntu based distributions

You will have to install Yarock on Ubuntu via PPA using the following commands:
```
sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt update
sudo apt install yarock
```

### 6. VLC: Video Player

Who doesn't need a video player? And who has never heard about VLC? It doesn't really need any introduction.

![VLC][18]

VLC is all you need to play various media files on Ubuntu and it is quite lightweight too. It works flawlessly on even on very old PCs.

[VLC][19]

#### Installing VLC on Ubuntu based distributions

VLC has official PPA for Ubuntu. Enter the following commands for installing it:
```
sudo apt install vlc
```

### 7. PCManFM: File Manager

PCManFM is the standard file manager from LXDE. As with the other applications from LXDE, this one too is lightweight. If you are looking for a lighter alternative for your file manager, try this one.

![PCManFM][20]

Although coming from LXDE, PCManFM works with other desktop environments just as well.

#### Installing PCManFM on Ubuntu based distributions

Installing PCManFM on Ubuntu will just take one simple command:
```
sudo apt install pcmanfm
```

### 8. Mousepad: Text Editor

Nothing can beat command-line text editors like - nano, vim etc. in terms of being lightweight. But if you want a graphical interface, here you go -- Mousepad is a minimal text editor. It's extremely lightweight and blazing fast. It comes with a simple customizable user interface with multiple themes.

![Mousepad][21]

Mousepad supports syntax highlighting. So, you can also use it as a basic code editor.

#### Installing Mousepad on Ubuntu based distributions

For installing Mousepad use the following command:
```
sudo apt install mousepad
```

### 9. GNOME Office: Office Suite

Many of us need to use office applications quite often. Generally, most of the office applications are bulky in size and resource hungry. Gnome Office is quite lightweight in that respect. Gnome Office is technically not a complete office suite. It's composed of different standalone applications and among them, **AbiWord** & **Gnumeric** stands out.

**AbiWord** is the word processor. It is lightweight and a lot faster than other alternatives. But that came to be at a cost  -- you might miss some features like macros, grammar checking etc. It's not perfect but it works.

![AbiWord][22]

**Gnumeric** is the spreadsheet editor. Just like AbiWord, Gnumeric is also very fast and it provides accurate calculations. If you are looking for a simple and lightweight spreadsheet editor, Gnumeric has got you covered.

![Gnumeric][23]

There are some other applications listed under Gnome Office. You can find them in the official page.

[Gnome Office][24]

#### Installing AbiWord & Gnumeric on Ubuntu based distributions

For installing AbiWord & Gnumeric, simply enter the following command in your terminal:
```
sudo apt install abiword gnumeric
```

That's all for today. Would you like to add some other **lightweight Linux applications** to this list? Do let us know!

--------------------------------------------------------------------------------

via: https://itsfoss.com/lightweight-alternative-applications-ubuntu/

作者：[Munif Tanjim][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/munif/
[1]:https://itsfoss.com/speed-up-ubuntu-1310/
[2]:https://itsfoss.com/essential-linux-applications/
[4]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/03/Lightweight-alternative-applications-for-Linux-800x450.jpg
[5]:https://itsfoss.com/lightweight-linux-beginners/
[6]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/03/Midori-800x497.png
[7]:http://midori-browser.org/faqs/
[8]:http://midori-browser.org/
[9]:https://itsfoss.com/best-email-clients-linux/
[10]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/03/Trojit%C3%A1-800x608.png
[11]:http://trojita.flaska.net/
[12]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/03/GDebi.png
[13]:https://itsfoss.com/gdebi-default-ubuntu-software-center/
[14]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/03/AppGrid-800x553.png
[15]:http://www.appgrid.org/
[16]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/03/Yarock-800x529.png
[17]:https://seb-apps.github.io/yarock/
[18]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/03/VLC-800x526.png
[19]:http://www.videolan.org/index.html
[20]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/03/PCManFM.png
[21]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/03/Mousepad.png
[22]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/03/AbiWord-800x626.png
[23]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/03/Gnumeric-800x470.png
[24]:https://gnome.org/gnome-office/
