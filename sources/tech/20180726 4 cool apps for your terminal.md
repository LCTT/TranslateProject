4 cool apps for your terminal
======

![](https://fedoramagazine.org/wp-content/uploads/2018/07/terminal4cool-816x345.jpg)

Many Linux users think that working in a terminal is either too complex or boring, and try to escape it. Here is a fix, though — four great open source apps for your terminal. They’re fun and easy to use, and may even brighten up your life when you need to spend a time in the command line.

### No More Secrets

This is a simple command line tool that recreates the famous data decryption effect seen in the 1992 movie [Sneakers][1]. The project lets you compile the nms command, which works with piped data and prints the output in the form of messed characters. Once it does so, you can press any key, and see the live “deciphering” of the output with a cool Hollywood-style effect.

![][2]

#### Installation instructions

A fresh Fedora Workstation system already includes everything you need to build No More Secrets from source. Just enter the following command in your terminal:
```
git clone https://github.com/bartobri/no-more-secrets.git
cd ./no-more-secrets
make nms
make sneakers ## Optional
sudo make install

```

The sneakers command is a little bonus for those who remember the original movie, but the main hero is nms. Use a pipe to redirect any Linux command to nms, like this:
```
systemctl list-units --type=target | nms

```

Once the text stops flickering, hit any key to “decrypt” it. The systemctl command above is only an example — you can replace it with virtually anything!

### Lolcat

Here’s a command that colorizes the terminal output with rainbows. Nothing can be more useless, but boy, it looks awesome!

![][3]

#### Installation instructions

Lolcat is a Ruby package available from the official Ruby Gems hosting. So, you’ll need the gem client first:
```
sudo dnf install -y rubygems

```

And then install Lolcat itself:
```
gem install lolcat

```

Again, use the lolcat command in for piping any other command and enjoy rainbows (and unicorns!) right in your Fedora terminal.

### Chafa

![][4]

Chafa is a [command line image converter and viewer][5]. It helps you enjoy your images without leaving your lovely terminal. The syntax is very straightforward:
```
chafa /path/to/your/image

```

You can throw almost any sort of image to Chafa, including JPG, PNG, TIFF, BMP or virtually anything that ImageMagick supports — this is the engine that Chafa uses for parsing input files. The coolest part is that Chafa can also show very smooth and fluid GIF animations right inside your terminal!

#### Installation instructions

Chafa isn’t packaged for Fedora yet, but it’s quite easy to build it from source. First, get the necessary build dependencies:
```
sudo dnf install -y autoconf automake libtool gtk-doc glib2-devel ImageMagick-devel

```

Next, clone the code or download a snapshot from the project’s Github page and cd to the Chafa directory. After that, you’re ready to go:
```
git clone https://github.com/hpjansson/chafa
./autogen.sh
make
sudo make install

```

Large images can take a while to process at the first run, but Chafa caches everything you load with it. Next runs will be nearly instantaneous.

### Browsh

Browsh is a fully-fledged web browser for the terminal. It’s more powerful than Lynx and certainly more eye-catching. Browsh launches the Firefox web browser in a headless mode (so that you can’t see it) and connects it with your terminal with the help of special web extension. Therefore, Browsh renders all rich media content just like Firefox, only in a bit pixelated style.

![][6]

#### Installation instructions

The project provides packages for various Linux distributions, including Fedora. Install it this way:
```
sudo dnf install -y https://github.com/browsh-org/browsh/releases/download/v1.4.6/browsh_1.4.6_linux_amd64.rpm

```

After that, launch the browsh command and give it a couple of seconds to load up. Press Ctrl+L to switch focus to the address bar and start browsing the Web like you never did before! Use Ctrl+Q to get back to your terminal.


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-cool-apps-for-your-terminal/

作者：[atolstoy][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/atolstoy/
[1]:https://www.imdb.com/title/tt0105435/
[2]:https://fedoramagazine.org/wp-content/uploads/2018/07/nms.gif
[3]:https://fedoramagazine.org/wp-content/uploads/2018/07/lolcat.png
[4]:https://fedoramagazine.org/wp-content/uploads/2018/07/sir.gif
[5]:https://hpjansson.org/chafa/
[6]:https://fedoramagazine.org/wp-content/uploads/2018/07/browsh.png
