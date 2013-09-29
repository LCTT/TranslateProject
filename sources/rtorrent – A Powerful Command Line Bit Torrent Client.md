rtorrent – A Powerful Command Line Bit Torrent Client
================================================================================
If you avoid using a CLI based torrent client because you think that it might be very complex to use. Think again. I believe that CLI based bit torrent clients are far more addictive once you are used to any of them — you can start and monitor the progress from within your terminal window and that too very easily . In this article, we will discuss a powerful command line bit torrent client — **rtorrent**.

**NOTE** – All the examples and instructions presented in this article are tested on Ubuntu 13.04.

## rtorrent – Command Line Bit Torrent Client ##

![](http://mylinuxbook.com/wp-content/uploads/2013/09/rtorrent-main.png)

**A Brief Tutorial**

rtorrent is a BitTorrent client for command line (ncurses based) that can be used for downloading files easily. Once this torrent client is installed, it can be executed by running the following command :

    rtorrent

Here is a snapshot of rtorrent window when it is executed :

![](http://mylinuxbook.com/wp-content/uploads/2013/09/rtorrent-3.png)

Well, I agree that the main window is not very eye pleasing and the information displayed is a bit confusing. Don’t worry, just press enter from your keyboard and a prompt should appear at the bottom of the window.

Here is the snapshot :

![](http://mylinuxbook.com/wp-content/uploads/2013/09/rtorrent-4.png)

Observe that a prompt load.normal> appeared on the screen. The next step is to just type the name of the torrent file. For example in my case, the torrent file name was **Fedora-20-Alpha-x86_64-DVD.torrent**.

![](http://mylinuxbook.com/wp-content/uploads/2013/09/rtorrent-6.png)

Note that you just have to write the torrent file name (or complete path, if not in current directory). You can easily use bash short cuts like [TAB] to complete file names and paths. Once done, just press enter again.

![](http://mylinuxbook.com/wp-content/uploads/2013/09/rtorrent-7.png)

So you can see that the torrent file is loaded now but you need to activate it and start the download. For this, first press the down arrow key. This should display \*\*stars\*\* before the loaded file details.

![](http://mylinuxbook.com/wp-content/uploads/2013/09/rtorrent-8.png)

Observe that \*\*stars\*\* were displayed in the beginning of torrent file related information. Now, press Ctrl+s to start the download.

![](http://mylinuxbook.com/wp-content/uploads/2013/09/rtorrent-9.png)

Observe that rtorrent has started downloading the actual file now.  Use **Ctrl+d** to stop the download process and another **Ctrl+d** to remove the torrent i.e., unload it. To quit, use **Ctrl+q**.

So you can see that despite of being command line based, it’s actually not very difficult to operate rtorrent utility.

**Download/Install**

Here are some of the important links related to rtorrent utility :

- Home page
- Download Link

Ubuntu users can download rtorrent utility from Ubuntu Software Centre. The version used for this review was 0.9.2.

Once rtorrent is downloaded and installed, you have to set-up a resource file — **.rtorrent.rc**. The utility will not start functioning properly until this file is in place. This was what I got when I executed rtorrent without setting up **~/.rtorrent.rc** :

![](http://mylinuxbook.com/wp-content/uploads/2013/09/rtorrent-1.png)

So you can see that the utility displayed an error that it could not read the specified resource file. To set-up this resource file, first download the [resource file template][1] and make necessary changes.

Note – I mentioned the above link just because it is official download link. The file .rtorrent.rc is a bit different in my case.

Here is the resource file in my case :

    # For temporary downloaded files
    directory = ~/rTempDownloadFiles

    # Directory to save and resume torrent sessions
    session = ~/rSession

    # Other Tunables
    upload_rate = 30
    download_rate = 200
    peer_exchange = yes

    # DHT enabled
    dht = auto

    # custom throttles
    throttle_up = low,10
    throttle_down = low,10
    throttle_up = med,20
    throttle_down = med,20

    # Watch a directory for new torrents, restart torrents that have been
    # copied back and stop those that have been deleted.

    schedule = watch_directory,0,10,load_start=~/rWatch/*.torrent
    schedule = tied_directory,10,10,start_tied=
    schedule = untied_directory,10,10,close_untied=

    # Enable the default ratio group
    ratio.enable=

    # Change the limits, the defaults should be sufficient.
    ratio.min.set=50
    ratio.max.set=150
    ratio.upload.set=20M

    # Changing the command triggered when the ratio is reached.
    system.method.set = group.seeding.ratio.command, d.close=, d.erase=

    # Move finished torrents to completed
    system.method.set_key = event.download.finished,rm_torrent,”execute=rm,$d.get_tied_to_file=”
    system.method.set_key = event.download.finished,move_complete,”execute=mv,-u,$d.get_base_path=,~/rFullDownloadFiles/ ;d.set_directory=~/rFullDownloadFiles/”

Note – The resource file was referenced from [this link][2].

To use the this resource file as it is, don’t forget to run following set of commands (to create certain directories mentioned in resource file) :

    mkdir /home/<your-username>/rTempDownloadFiles
    mkdir /home/<your-username>/rFullDownloadFiles
    mkdir /home/<your-username>/rSession
    mkdir /home/<your-username>/rWatch

Replace <your-username> with user name of your account. Also, make sure that the resource file-name is **.rtorrent.rc** (with leading dot) and not **rtorrent.rc** and save it in your home directory (/home/himanshu in my case).

To know more about using rtorrent, read its [UserGuide][3]. Also, do go through this [detailed tutorial][4] on rtorrent utility.

**Pros**

- Feature rich
- Lots of customizable options

**Cons**

- Requires a bit of effort in initial configuration
- A user might take time to get used to it.

**Conclusion**

rtorrent is for those who would like to have a command line alternative to GUI based BitTorrent clients. Though it requires some initial configuration effort and a bit of practice to get used to, but the effort is worth it. Do give it a try, It will definitely impress you.

*Do you use any CLI based bit torrent client? What are the pros and cons of it? Share your experience with us.*


via: http://mylinuxbook.com/rtorrent-bit-torrent-client/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[译者ID][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://libtorrent.rakshasa.no/export/1170/trunk/rtorrent/doc/rtorrent.rc
[2]:http://ankursinha.fedorapeople.org/misc/rtorrentconf/rtorrent.rc
[3]:http://libtorrent.rakshasa.no/wiki/RTorrentUserGuide
[4]:http://fsk141.com/rtorrent-the-complete-guide/