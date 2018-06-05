translating---geekpi

A Bittorrent Filesystem Based On FUSE
======

![](https://www.ostechnix.com/wp-content/uploads/2018/05/Bittorrent-720x340.png)
The torrents have been around for a long time to share and download data from the Internet. There are plethora of GUI and CLI torrent clients available on the market. Sometimes, you just can not sit and wait for your download to complete. You might want to watch the content immediately. This is where **BTFS** , the bittorent filesystem, comes in handy. Using BTFS, you can mount the torrent file or magnet link as a directory and then use it as any read-only directory in your file tree. The contents of the files will be downloaded on-demand as they are read by applications. Since BTFS runs on top of FUSE, it does not require intervention into the Linux Kernel.

## BTFS – A Bittorrent Filesystem Based On FUSE

### Installing BTFS

BTFS is available in the default repositories of most Linux distributions.

On Arch Linux and its variants, run the following command to install BTFS.
```
$ sudo pacman -S btfs

```

On Debian, Ubuntu, Linux Mint:
```
$ sudo apt-get install btfs

```

On Gentoo:
```
# emerge -av btfs

```

BTFS can also be installed using [**Linuxbrew**][1] package manager.
```
$ brew install btfs

```

### Usage

BTFS usage is fairly simple. All you have to find the .torrent file or magnet link and mount it in a directory. The contents of the torrent file or magnet link will be mounted inside the directory of your choice. When a program tries to access the file for reading, the actual data will be downloaded on demand. Furthermore, tools like **ls** , **cat** and **cp** works as expected for manipulating the torrents. Applications like **vlc** and **mplayer** can also work without changes. The thing is the players don’t even know that the actual content is not physically present in the local disk and the content is collected in parts from peers on demand.

Create a directory to mount the torrent/magnet link:
```
$ mkdir mnt

```

Mount the torrent/magnet link:
```
$ btfs video.torrent mnt

```

[![][2]][3]

Cd to the directory:
```
$ cd mnt

```

And, start watching!
```
$ vlc <path-to-video.mp4>

```

Give BTFS a few moments to find and get the website tracker. Once the real data is loaded, BTFS won’t require the tracker any more.

![][4]

To unmount the BTFS filesystem, simply run the following command:
```
$ fusermount -u mnt

```

Now, the contents in the mounted directory will be gone. To access the contents again, you need to mount the torrent as described above.

The BTFS application will turn your VLC or Mplayer into Popcorn Time. Mount your favorite TV show or movie torrent file or magnet link and start watching without having to download the entire contents of the torrent or wait for your download to complete. The contents of the torrent or magnet link will be downloaded on demand when accessed by the applications.

And, that’s all for now. Hope this was useful. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/btfs-a-bittorrent-filesystem-based-on-fuse/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/linuxbrew-common-package-manager-linux-mac-os-x/
[2]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]:http://www.ostechnix.com/wp-content/uploads/2018/05/btfs.png
[4]:http://www.ostechnix.com/wp-content/uploads/2018/05/btfs-1.png
