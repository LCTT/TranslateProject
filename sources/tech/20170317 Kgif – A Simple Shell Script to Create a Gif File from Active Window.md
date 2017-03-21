translating---geekpi

Kgif – A Simple Shell Script to Create a Gif File from Active Window
============================================================

[Kgif][2] is a simple shell script which create a Gif file from active window. I felt this app especially designed to capture the terminal activity. I personally used, very often for that purpose.

It captures activity as a series of PNG images, then combines all together to create a animated GIF. The script taking a screenshot of the active window at 0.5s intervals. If you feel, its not matching your requirement, straight away you can modify the script as per your need.

Originally it was created for capturing tty output and creating preview for github projects.

Make sure you have installed scrot and ImageMagick packages before running Kgif.

Suggested Read : [Peek – Create a Animated GIF Recorder in Linux][3]

What’s ImageMagick ImageMagick is a command line tool which used for image conversion and editing. It support all kind of image formats (over 200) such as PNG, JPEG, JPEG-2000, GIF, TIFF, DPX, EXR, WebP, Postscript, PDF, and SVG.

What’s Scrot Scrot stand for SCReenshOT is an open source, command line tool to capture a screen shots of your Desktop, Terminal or a Specific Window.

#### Install Dependencies

Kgif required scrot and ImageMagick to work.

For Debian based Systems

```
$ sudo apt-get install scrot imagemagick
```

For RHEL/CentOS based Systems

```
$ sudo yum install scrot ImageMagick
```

For Fedora Systems

```
$ sudo dnf install scrot ImageMagick
```

For openSUSE Systems

```
$ sudo zypper install scrot ImageMagick
```

For Arch Linux based Systems

```
$ sudo pacman -S scrot ImageMagick
```

#### Install Kgif & Usage

Installation of Kgif not a big deal because no installation required. Just clone the source file from developer github page wherever you want and run the `kgif.sh` file to capture the active window. By default, it’s sets delay to 1 sec, you can modify this by including `--delay` option with kgif. Finally press `Ctrl+c` to stop capturing.

```
$ git clone https://github.com/luminousmen/Kgif
$ cd Kgif
$ ./kgif.sh
Setting delay to 1 sec

Capturing...
^C
Stop capturing
Converting to gif...
Cleaning...
Done!
```

Check whether dependencies are presents in system.

```
$ ./kgif.sh --check
OK: found scrot
OK: found imagemagick
```

Set delay in seconds with script to start capturing, after N seconds.

```
$ ./kgif.sh --delay=5

Setting delay to 5 sec

Capturing...
^C
Stop capturing
Converting to gif...
Cleaning...
Done!
```

It save the gif file name as a `terminal.gif` and overwrite every time whenever get a new file. So, i advise you to add `--filename`option to save the file in a different name.

```
$ ./kgif.sh --delay=5 --filename=2g-test.gif

Setting delay to 5 sec

Capturing...
^C
Stop capturing
Converting to gif...
Cleaning...
Done!
```

Set noclean with script to keep the source png screen shots.

```
$ ./kgif.sh --delay=5 --noclean
```

To know more all the options.

```
$ ./kgif.sh --help

usage: ./kgif.sh [--delay] [--filename ] [--gifdelay] [--noclean] [--check] [-h]
  -h, --help                   Show this help, exit
      --check                  Check if all dependencies are installed, exit
      --delay=            Set delay in seconds to specify how long script will wait until start capturing.
      --gifdelay=         Set delay in seconds to specify how fast images appears in gif.
      --filename=   Set file name for output gif.
      --noclean                Set if you don't want to delete source *.png screenshots.
```

Default capturing output.
[
 ![](http://www.2daygeek.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][4]

I felt, the default capturing is very fast, then i made few changes and got the proper output.
[
 ![](http://www.2daygeek.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][5]

--------------------------------------------------------------------------------

via: http://www.2daygeek.com/kgif-create-animated-gif-file-active-window-screen-recorder-capture-arch-linux-mint-fedora-ubuntu-debian-opensuse-centos/

作者：[MAGESH MARUTHAMUTHU][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.2daygeek.com/author/magesh/
[1]:http://www.2daygeek.com/author/magesh/
[2]:https://github.com/luminousmen/Kgif
[3]:http://www.2daygeek.com/kgif-create-animated-gif-file-active-window-screen-recorder-capture-arch-linux-mint-fedora-ubuntu-debian-opensuse-centos/www.2daygeek.com/peek-create-animated-gif-screen-recorder-capture-arch-linux-mint-fedora-ubuntu/
[4]:http://www.2daygeek.com/wp-content/uploads/2017/03/kgif-test.gif
[5]:http://www.2daygeek.com/wp-content/uploads/2017/03/kgif-test-delay-modified.gif
