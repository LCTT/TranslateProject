[#]: collector: (lujun9972)
[#]: translator: (summer2233)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Back up your phone's storage with this Linux utility)
[#]: via: (https://opensource.com/article/20/7/gphoto2-linux)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Back up your phone's storage with this Linux utility
======
Take as many shots as you want; gphoto2 makes transferring photos from
your device to your Linux computer quick and easy.
![A person looking at a phone][1]

One of the great failings of mobile devices is how difficult it can be to transfer data from your device to your computer. Mobile devices have a long history of this. Early mobiles, like Pilot and Handspring PDA devices, required special synchronization software (which you had to do religiously for fear of your device running out of batteries and losing all of your data forever). Old iPods required a platform-specific interface. Modern mobile devices default to sending your data to an online account so you can download it again on your computer.

Good news—if you're running Linux, you can probably interface with your mobile device using the `gphoto2` command. Originally developed as a way to communicate with digital cameras back when a digital camera was just a camera, `gphoto2` can talk to many different kinds of mobile devices now. Don't let the name fool you, either. It can handle all types of files, not just photos. Better yet, it's scriptable, flexible, and a lot more powerful than most GUI interfaces.

If you've ever struggled with finding a comfortable way to sync your data between your computer and mobile, take a look at `gphoto2`.

### Install gPhoto2

Chances are your Linux system already has libgphoto2 installed, because it's a key library for interfacing with mobile devices. You may have to install the command `gphoto2`, however, which is probably available from your repository.

On Fedora or RHEL:


```
$ sudo dnf install gphoto2
```

On Debian or Ubuntu:


```
$ sudo apt install gphoto2
```

### Verify compatibility

To verify that your mobile device is supported, use the `--list-cameras` piped through `less`:


```
`$ gPhoto2 --list-cameras | less`
```

Or you can pipe it through `grep` to search for a term. For example, if you have a Samsung Galaxy, then use `grep` with case sensitivity turned off with the `-i` switch:


```
$ gphoto2 --list-cameras | grep -i galaxy
  "Samsung Galaxy models (MTP)"
  "Samsung Galaxy models (MTP+ADB)"
  "Samsung Galaxy models Kies mode"
```

This confirms that Samsung Galaxy devices are supported through MTP and MTP with ADB.

If you can't find your device listed, you can still try using `gphoto2` on the off chance that your device is actually something on the list masquerading as a different brand.

### Find your mobile device

To use gPhoto2, you first have to have a mobile device plugged into your computer, set to MTP mode, and you probably need to give your computer permission to interact with it. This usually requires physical interaction with your device, specifically pressing a button in the UI to permit its filesystem to be accessed by the computer it's just been attached to.

![Screenshot of allow access message][2]

If you don't give your computer access to your mobile, then gPhoto2 detects your device, but it isn't unable to interact with it.

To ensure your computer detects the device you've attached, use the `--auto-detect` option:


```
$ gphoto2 --auto-detect
Model                       Port
\---------------------------------------
Samsung Galaxy models (MTP) usb:002,010
```

If your device isn't detected, check your cables first, and then check that your device is configured to interface over MTP or ADB, or whatever protocol gPhoto2 supports for your device, as shown in the output of `--list-cameras`.

### Query your device for features

With modern devices, there's usually a plethora of potential features, but not all features are supported. You can find out for sure with the `--abilities` option, which I find rather intuitive.


```
$ gphoto2 --abilities
Abilities for camera            : Samsung Galaxy models (MTP)
Serial port support             : no
USB support                     : yes
Capture choices                 : Capture not supported by driver
Configuration support           : no
Delete selected files on camera : yes
Delete all files on camera      : no
File preview (thumbnail) support: no
File upload support             : yes
```

There's no need to specify what device you're querying as long as you only have one device attached. If you have attached more than one device that gPhoto2 can interact with, though, you can specify the device by port, camera model, or usbid.

### Interacting with your device

If your device supports capture, then you can grab media through your camera from your computer. For instance, to capture an image:


```
$ gphoto2 --capture-image
```

To capture an image and immediately transfer it to the computer you're on:


```
$ gphoto2 --capture-image-and-download
```

You can also capture video and sound. If you have more than one camera attached, you can specify which device you want to use by port, camera model, or usbid:


```
$ gphoto2 --camera "Samsung Galaxy models (MTP)" \
\--capture-image-and-download
```

### Files and folders

To interact with files on your device intelligently, you need to understand the structure of the filesystem being exposed to gPhoto2.

You can view available folders with the `--get-folders` option:


```
$ gphoto2 --list-folders
There are 2 folders in folder '/'.                                            
 - store_00010001
 - store_00020002
There are 0 folders in folder '/store_00010001'.
There are 0 folders in folder '/store_00020002'.
```

Each of these folders represents a storage destination on the device. In this example, `store_00010001` is the internal storage and `store_00020002` is an SD card. Your device may be structured differently.

### Getting files

Now that you know the folder layout of your device, you can ingest photos from your device. There are many different options you can use, depending on what you want to take from the device.

You can get a specific file, providing you know the full path:


```
`$ gphoto2 --get-file IMG_0001.jpg --folder /store_00010001/myphotos`
```

You can get all files at once:


```
`$ gphoto2 --get-all-files --folder /store_00010001/myfiles`
```

You can get just audio files:


```
`gphoto2 --get-all-audio-data --folder /store_00010001/mysounds`
```

There are other options, too, and most of them depend on what your device, and the protocol you're using, support.

### Uploading files

Now that you know your potential target folders, you can upload files from your computer to your device. For example, assuming there's a file called `example.epub` in your current directory, you can send the file to your device with the `--upload-file` option combined with the `--folder` option to specify which storage location you want to upload to:


```
$ gphoto2 --upload file example.epub \
\--folder store_00010001
```

You can make a directory on your device, should you prefer to upload several files to a consolidated location:


```
$ gphoto2 --mkdir books \
\--folder store_00010001
$ gphoto2 --upload-file *.epub \
\--folder store_00010001/books
```

### Listing files

To see files uploaded to your device, use the `--list-files` option:


```
$ gphoto2 --list-files --folder /store_00010001
There is 1 file in folder '/store_00010001'
#1     example.epub 17713 KB application/x-unknown
$ gphoto2 --list-files --folder /store_00010001/books
There is 1 file in folder '/store_00010001'
#1    example0.epub 17713 KB application/x-unknown
#2    example1.epub 12264 KB application/x-unknown
[...]
```

### Exploring your options

Much of gPhoto2's power depends on your device, so your experience will be different than anyone else's. There are many operations listed in `gphoto2 --help` for you to explore. Use gPhoto2 and never struggle with transferring files from your device to your computer ever again!

These open source photo libraries help you stay organized while making your pictures look great.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/gphoto2-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/idea_innovation_mobile_phone.png?itok=RqVtvxkd (A person looking at a phone)
[2]: https://opensource.com/sites/default/files/uploads/gphoto2-mtp-allow.jpg (Screenshot of allow access message)
