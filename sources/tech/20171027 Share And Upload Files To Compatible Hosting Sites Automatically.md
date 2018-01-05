Share And Upload Files To Compatible Hosting Sites Automatically
======
![](https://www.ostechnix.com/wp-content/uploads/2017/10/Upload-720x340.png)
A while ago, we have written a guide about [**Transfer.sh**][1] which allows you to share files over Internet from command-line. Today, we will see yet another file sharing utility called **Anypaste**. It is a simple script to share and upload files to compatible hosting sites depending upon the type of the files, automatically. You don 't need to manually log in to the hosting sites and upload or share your files. Anypaste will **pick the right hosting sites depends upon the type of the file** you want to upload. To put this simply, photos will get uploaded to image hosting sites, videos to video sites, code to pastebins. Cool, yeah? Anypaste is completely free, open source and light-weight script and you can do everything from command line. You don't need to depend on any heavy, memory-consuming GUI apps to upload and share files.

### Anypaste - Share And Upload Files To Compatible Hosting Sites Automatically

#### Installation

Like I already said, it's just a script. So, there won't be any complex installation steps. Just download it somewhere where you can run it, for example /usr/bin/anypaste, make it as executable and start using it in no time. Alternatively, you can run the following two commands to quickly install Anypaste.
```
sudo curl -o /usr/bin/anypaste https://anypaste.xyz/sh
```
```
sudo chmod +x /usr/bin/anypaste
```

That's it. To update the old Anypaste version, just overwrite the old executable file with new one.

Now, let us see some practical examples.

#### Configuration

Anypaste will work just out of the box. No special configuration is required! The default configuration file is **~/.config/anypaste.conf** and it will be automatically created when you run Anypaste for the first time.

The only required configuration option is **ap_plugins**. Anypaste uses plugin system to upload files. Each hosting (upload) site is represented by a specific plugin. You can view the list of enabled plugins under **ap-plugins directive** in anypaste.conf file.
```
# List of plugins
# If there are multiple compatible plugins, precedence is determined
# by which one is listed first in this array
ap_plugins=(
# Videos/Gifs
'sendvid' 'streamable' 'gfycat'
# Images
'tinyimg' 'vgyme'
# Audio
'instaudio'
# Text
'hastebin' 'ixio' 'sprunge'
# Documents
'docdroid'
# Any file
'jirafeau' 'fileio'
)
[...]
```

If you install a new plugin, add it to this list. If you want to disable a default plugin, just remove it! If multiple plugins are compatible, the first one in the array is selected, so **order matters**.

#### Usage

To upload a single file, for example test.png, run:
```
anypaste test.png
```

Sample output would be:
```
Current file: test.png
Attempting to upload with plugin 'tinyimg'
######################################################################## 100.0%

Direct Link: https://tinyimg.io/i/Sa1zsjj.png

Upload complete.
All files processed. Have a nice day!
```

As you can see in the above output, Anypaste has automatically found the compatible hosting site (https://tinyimg.io) to the given image file **test.png** and uploaded into it. Also, it gave us the direct link to view/download the uploaded file.

Not just .png files, you can upload any other image file types. For example, the following command will upload file.gif:
```
$ anypaste file.gif
Current file: file.gif
Plugin 'streamable' is compatible, but missing config parameters: 'streamable_email' 'streamable_password'
You can set them in /home/sk/.config/anypaste.conf
Attempting to upload with plugin 'gfycat'
######################################################################## 100.0%
Reminder: Gfycat needs time to encode. Your video will not appear right away.

Link: https://gfycat.com/MisguidedQuaintBergerpicard
Direct(ish) Link: https://thumbs.gfycat.com/MisguidedQuaintBergerpicard-size_restricted.gif

Upload complete.
All files processed. Have a nice day!
```

You can share the link to your family, friends and colleagues. Here is the screenshot of an image that I just uploaded it to **gfycat** website.

[![][2]][3]

It also possible to multiple files (same file type or different) at once.

Have a look at the following example. In this example, I am uploading two different files, an image and a video file:
```
anypaste image.png video.mp4
```

**Sample output:**
```
Current file: image.png
Attempting to upload with plugin 'tinyimg'
######################################################################## 100.0%

Direct Link: https://tinyimg.io/i/au1PHpg.png

Upload complete.
Current file: video.mp4
Plugin 'streamable' is compatible, but missing config parameters: 'streamable_email' 'streamable_password'
You can set them in /home/sk/.config/anypaste.conf
Attempting to upload with plugin 'sendvid'
######################################################################## 100.0%

Link: http://sendvid.com/wwy7w96h
Delete/Edit: http://sendvid.com/wwy7w96h?secret=39c0af2d-d8bf-4d3d-bad3-ad37432a40a5

Upload complete.
All files processed. Have a nice day!
```

Anypaste has automatically found the compatible hosting sites to both files and uploaded them successfully.

As you may noticed in above examples in the usage section, Anypaste has picked the "best" plugin automatically. Also, you can upload files with a specific plugin. For instance, to upload files to **gfycat** site, run:
```
anypaste -p gfycat file.gif
```

Sample output:
```
Current file: file.gif
Plugin 'streamable' is compatible, but missing config parameters: 'streamable_email' 'streamable_password'
You can set them in /home/sk/.config/anypaste.conf
Attempting to upload with plugin 'gfycat'
######################################################################## 100.0%
Reminder: Gfycat needs time to encode. Your video will not appear right away.

Link: https://gfycat.com/GrayDifferentCollie
Direct(ish) Link: https://thumbs.gfycat.com/GrayDifferentCollie-size_restricted.gif

Upload complete.
All files processed. Have a nice day!
```

To upload with a specific plugin, bypassing compatibility checks, run:
```
anypaste -fp gfycat file.gif
```

If you find a specific plugin is missing in the config file, you still can force Anypaste to use that specific plugin with '-xp' parameter.
```
anypaste -xp gfycat file.gif
```

To upload files with interactive mode, run it with "-i" flag:
```
$ anypaste -i file.gif
Current file: file.gif
Determine compatible plugins automatically? [Y/n] **n**
The following plugins were found: 'sendvid' 'streamable' 'gfycat' 'tinyimg' 'vgyme' 'instaudio' 'hastebin' 'ixio' 'sprunge' 'docdroid' 'jirafeau' 'fileio'

Enter the (partial) name of a plugin, or nothing for automatic selection
**gfycat**
Attempt to upload with plugin 'gfycat'? [Y/n] **y**
Attempting to upload with plugin 'gfycat'
######################################################################## 100.0%
Reminder: Gfycat needs time to encode. Your video will not appear right away.

Link: https://gfycat.com/WaryAshamedBlackbear
Direct(ish) Link: https://thumbs.gfycat.com/WaryAshamedBlackbear-size_restricted.gif

Upload complete.
All files processed. Have a nice day!
```

As you see, Anypaste first asked me to determine plugins automatically. I don't want it to find plugins automatically, so I answered "No". Then, it listed the available plugins and asked me to pick one from the list. Similarly, you can upload and share files of different types. The given files will uploaded to the compatible sites.

Whenever you try to upload a video file, it will uploaded to the any one of following sites:

  1. sendvid
  2. streamable
  3. gfycat



Here note the order. Anypaste will first try to upload the file to sendvid site. If there is no plugin for sendvid, it will try the other two sites in the given order. Of course, you can change this in the config file.

Images will be uploaded to:

  1. tinyimg.io
  2. vgy.me



Audio files will uploaded to:

  1. instaud



Text files will uploaded to:

  1. hastebin
  2. ix.io
  3. sprunge.us



Documents will be uploaded to:

  1. docdroid



Any other files will uploaded to:

  1. jirafeau
  2. file.io



Some of the above listed sites will delete the contents after a particular period of time. So, check the those website's terms and conditions before uploading and sharing contents.

Recommended Read:

#### Conclusion

In my opinion, the idea of file identification to determine where to upload the files is really brilliant, and the developer has perfectly used it in the right way. Anypaste will definitely be useful to everyone who share files frequently over Internet. I hope you will find it useful too.

And, that's all for now. More good stuffs to come.

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/anypaste-share-upload-files-compatible-hosting-sites-automatically/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/easy-fast-way-share-files-internet-command-line/
[2]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]:http://www.ostechnix.com/wp-content/uploads/2017/10/gfycat.png ()
