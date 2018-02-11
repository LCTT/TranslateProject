A File Transfer Utility To Download Only The New Parts Of A File
======

![](https://www.ostechnix.com/wp-content/uploads/2018/02/Linux-1-720x340.png)

Just because Internet plans are getting cheaper every day, you shouldn’t waste your data by repeatedly downloading the same stuff over and over. The one fine example is downloading development version of Ubuntu or any Linux images. As you may know, Ubuntu developers releases daily builds, alpha, beta ISO images every few months for testing. In the past, I used to download those images whenever they are available to test and review each edition. Not anymore! Thanks to **Zsync** file transfer program. Now it is possible to download only the new parts of the ISO image. This will save you a lot of time and Internet bandwidth. Not just time and bandwidth, it will save you the resources on server side and client side.

Zsync uses the same algorithm as **Rsync** , but it only download the new parts of a file that you have a copy of an older version of the file on your computer already. Rsync is mainly for synchronizing data between computers, whereas Zsync is for distributing data. To put this simply, the one file on a central location can be distributed to thousands of downloaders using Zsync. It is completely free and open source released under the Artistic License V2.

### Installing Zsync

Zsync is available in the default repositories of most Linux distributions.

On **Arch Linux** and derivatives, install it using command:
```
$ sudo pacman -S zsync

```

On **Fedora** :

Enable Zsync repository:
```
$ sudo dnf copr enable ngompa/zsync

```

And install it using command:
```
$ sudo dnf install zsync

```

On **Debian, Ubuntu, Linux Mint** :
```
$ sudo apt-get install zsync

```

For other distributions, you can download the binary from the [**Zsync download page**][1] and manually compile and install it as shown below.
```
$ wget http://zsync.moria.org.uk/download/zsync-0.6.2.tar.bz2
$ tar xjf zsync-0.6.2.tar.bz2
$ cd zsync-0.6.2/
$ configure
$ make
$ sudo make install

```

### Usage

Please be mindful that **zsync is only useful if people offer zsync downloads**. Currently, Debian, Ubuntu (all flavours) ISO images are available as .zsync downloads. For example, visit the following link.

As you may noticed, Ubuntu 18.04 LTS daily build is available as direct ISO and .zsync file. If you download .ISO file, you have to download the full ISO whenever the ISO gets new updates. But, if you download .zsync file, the Zsync will download only the new changes in future. You don’t need to download the whole ISO image each time.

A .zsync file contains a meta-data needed by zsync program. This file contains the pre-calculated checksums for the rsync algorithm; it is generated on the server, once, and is then used by any number of downloaders. To download a .zsync file using Zsync client program, all you have to do:
```
$ zsync <.zsync-file-URL>

```

Example:
```
$ zsync http://cdimage.ubuntu.com/ubuntu/daily-live/current/bionic-desktop-amd64.iso.zsync

```

If you already have the old image file on your system, Zsync will calculate the difference between the old and new file in the remote server and download only the new parts. You will see the calculation process as a series of dots or stars on your Terminal.

If there is an old version of the file you’re just downloading is available in the current working directory, Zsync will download only the new parts. Once the download is finished, you will get two images, the one you just downloaded and the old image with **.iso.zs-old** extension on its filename.

If there is no relevent local data found, Zsync will download the whole file.

![](http://www.ostechnix.com/wp-content/uploads/2018/02/Zsync-1.png)

You can cancel the download process at any time by pressing **CTRL-C**.

Just imagine if you use the direct .ISO file or torrent, you will lose around 1.4GB bandwidth whenever you download new image. So, instead of downloading entire alpha, beta and daily build images, Zsync just downloads the new parts of the ISO file that you already have a copy of an older version of it on your system.

And, that’s all for today. Hope this helps. I will be soon here with another useful guide. Until then stay tuned with OSTechNix!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/zsync-file-transfer-utility-download-new-parts-file/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:http://zsync.moria.org.uk/downloads
