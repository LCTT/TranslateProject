Systemd Services: Monitoring Files and Directories
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/systemd-filesystem.png?itok=iGjxwoJR)

So far in this systemd multi-part tutorial, we’ve covered [how to start and stop a service by hand][1], [how to start a service when booting your OS and have it stop on power down][2], and [how to boot a service when a certain device is detected][3]. This installment does something different yet again and covers how to create a unit that starts a service when something changes in the filesystem. For the practical example, you'll see how you can use one of these units to extend the [surveillance system we talked about last time][4].

### Where we left off

[Last time we saw how the surveillance system took pictures, but it did nothing with them][3]. In fact, it even overwrote the last picture it took when it detected movement so as not to fill the storage of the device.

Does that mean the system is useless? Not by a long shot. Because, you see, systemd offers yet another type of units, _paths_ , that can help you out. _Path_ units allow you to trigger a service when an event happens in the filesystem, say, when a file gets deleted or a directory accessed. And, overwriting an image is exactly the kind of event we are talking about here.

### Anatomy of a Path Unit

A systemd path unit takes the extension _.path_ , and it monitors a file or directory. A _.path_ unit calls another unit (usually a _.service_ unit with the same name) when something happens to the monitored file or directory. For example, if you have a _picchanged.path_ unit to monitor the snapshot from your webcam, you will also have a _picchanged.service_ that will execute a script when the snapshot is overwritten.

Path units contain a new section, `[Path]`, with few more directives. First, you have the what-to-watch-for directives:

  * **`PathExists=`** monitors whether the file or directory exists. If it does, the associated unit gets triggered. `PathExistsGlob=` works in a similar fashion, but lets you use globbing, like when you use `ls *.jpg` to search for all the JPEG images in a directory. This lets you check, for example, whether a file with a certain extension exists.
  * **`PathChanged=`** watches a file or directory and activates the configured unit whenever it changes. It is not activated on every write to the watched file but only when a monitored file open for for writing is changed and then closed. The associated unit is executed when the file is closed.
  * **`PathModified=`** , on the other hand, does activate the unit when anything is changed in the file you are monitoring, even before you close the file.
  * **`DirectoryNotEmpty=`** does what it says on the box, that is, it activates the associated unit if the monitored directory contains files or subdirectories.



Then, we have `Unit=` that tells the _.path_ which _.service_ unit to activate, in case you want to give it a different name to that of your _.path_ unit; `MakeDirectory=` can be `true` or `false` (or `0` or `1`, or `yes` or `no`) and creates the directory you want to monitor before monitoring starts. Obviously, using `MakeDirectory=` in combination with `PathExists=` does not make sense. However, `MakeDirectory=` can be used in combination with `DirectoryMode=`, which you use to set the the mode (permissions) of the new directory. If you don't use `DirectoryMode=`, the default permissions for the new directory are `0755`.

### Building _picchanged.path_

All these directives are very useful, but you will be just looking for changes made to one single file, so your _.path_ unit is very simple:

```
#picchanged.path
[Unit]
Wants= webcam.service

[Path]
PathChanged= /home/[user name]/monitor/monitor.jpg
```

In the `Unit=` section the line that says

```
Wants= webcam.service
```

The `Wants=` directive is the preferred way of starting up a unit the current unit needs to work properly. [`webcam.service` is the name you gave the surveillance service that you saw in the previous article][3] and is the service that actually controls the webcam and makes it take a snap every half second. This means it’s _picchanged.path_ that is going to start up _webcam.service_ now, and not the [Udev rule you saw in the prior article][3]. You will use the Udev rule to start _picchanged.path_ instead.

To summarize: the Udev rule pulls in your new _picchanged.path_ unit, which, in turn pulls in the _webcam.service_ as a requirement for everything to work perfectly.

The "thing" that _picchanged.path_ monitors is the _monitor.jpg_ file in the _monitor/_ directory in your home directory. As you saw last time, _webcam.service_ called a script, _checkimage.sh_ , took a picture at the beginning of its execution and stored it in _monitor/temp.jpg_. _checkimage.sh_ then took another pic, _temp.jpg_ , and compared it with _monitor.jpg_. If it found significant differences (like when somebody walks into frame) the script overwrote _monitor.jpg_ with the _temp.jpg_. That is when _picchanged.path_ fires.

As you haven't included a `Unit=` directive in your _.path_ , the unit systemd expects a matching _picchanged.service_ unit which it will trigger when _/home/[ _user name_ ]/monitor/monitor.jpg_ gets modified:

```
#picchanged.service
[Service]
Type= simple
ExecStart= /home/[user name]/bin/picmonitor.sh
```

For the time being, let’s make _picmonitor.sh_ save a time-stamped copy of _monitor.jpg_ every time changes get detected:

```
#!/bin/bash
# This is the pcmonitor.sh script

cp /home/[user name]/monitor/monitor.jpg /home/[user name]/monitor/"`date`.jpg"
```

### Udev Changes

You have to change the custom Udev rule you wrote in [the previous installment][3] so everything works. Edit _/etc/udev/rules.d/01-webcam.rules_ so instead of looking like this:

```
ACTION=="add", SUBSYSTEM=="video4linux", ATTRS{idVendor}=="03f0",
  ATTRS{idProduct}=="e207", SYMLINK+="mywebcam", TAG+="systemd",
  MODE="0666", ENV{SYSTEMD_WANTS}="webcam.service"
```

It looks like this:

```
ACTION=="add", SUBSYSTEM=="video4linux", ATTRS{idVendor}=="03f0",
  ATTRS{idProduct}=="e207", SYMLINK+="mywebcam", TAG+="systemd",
  MODE="0666", ENV{SYSTEMD_WANTS}="picchanged.path"
```

The new rule, instead of calling _webcam.service_ , now calls _picchanged.path_ when your webcam gets detected. (Note that you will have to change the `idVendor` and `IdProduct` to those of your own webcam -- you saw how to find these out previously).

For the record, I also changed _checkimage.sh_ from using PNG to JPEG images. I did this because I found some dependency problems with PNG images when working with _mplayer_ on some versions of Debian. _checkimage.sh_ now looks like this:

```
#!/bin/bash

mplayer -vo jpeg -frames 1 tv:// -tv driver=v4l2:width=640:height=480:device=
  /dev/mywebcam &>/dev/null
mv 00000001.jpg /home/paul/monitor/monitor.jpg

while true
do
 mplayer -vo jpeg -frames 1 tv:// -tv driver=v4l2:width=640:height=480:device=
  /dev/mywebcam &>/dev/null
 mv 00000001.jpg /home/paul/monitor/temp.jpg

 imagediff=`compare -metric mae /home/paul/monitor/monitor.jpg
  /home/paul/monitor/temp.jpg /home/paul/monitor/diff.png 2>&1 >
  /dev/null | cut -f 1 -d " "`

 if [ `echo "$imagediff > 700.0" | bc` -eq 1 ]
 then
 mv /home/paul/monitor/temp.jpg /home/paul/monitor/monitor.jpg
 fi

 sleep 0.5
done
```

### Firing up

This is a multi-unit service that, when all its bits and pieces are in place, you don't have to worry much about: you plug in the designated webcam (or boot the machine with the webcam already connected), _picchanged.path_ gets started thanks to the Udev rule and takes over, bringing up the _webcam.service_ and starting to check on the snaps. There is nothing else you need to do.

### Conclusion

Having the process split into two doesn't only help explain how path units work, but it’s also very useful for debugging. One service does not "touch" the other in any way, which means that you could, for example, improve the "motion detection" part, and it would be very easy to roll back if things didn't work as expected.

Admittedly, the example is a bit goofy, as there are definitely [better ways of monitoring movement using a webcam][5]. But remember: the main aim of these articles is to help you learn how systemd units work within a context.

Next time, we'll finish up with systemd units by looking at some of the other types of units available and show how to improve your home-monitoring system further by setting up service that sends images to another machine.

Learn more about Linux through the free ["Introduction to Linux" ][6]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/intro-to-linux/2018/6/systemd-services-monitoring-files-and-directories

作者：[Paul Brown][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/bro66
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/blog/learn/intro-to-linux/2018/5/writing-systemd-services-fun-and-profit
[2]: https://www.linux.com/blog/learn/2018/5/systemd-services-beyond-starting-and-stopping
[3]: https://www.linux.com/blog/intro-to-linux/2018/6/systemd-services-reacting-change
[4]: https://www.linux.com/blog/learn/intro-to-linux/2018/6/systemd-services-monitoring-files-and-directories
[5]: https://www.linux.com/learn/how-operate-linux-spycams-motion
[6]: https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
