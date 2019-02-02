Managing Digital Files (e.g., Photographs) in Files and Folders
======
Update 2014-05-14: added real world example

Update 2015-03-16: filtering photographs according to their GPS coordinates

Update 2016-08-29: replaced outdated `show-sel.sh` method with new `filetags --filter` method

Update 2017-08-28: Email comment on geeqie video thumbnails

I am a passionate photographer when being on vacation or whenever I see something beautiful. This way, I collected many [JPEG][1] files over the past years. Here, I describe how I manage my digital photographs while avoiding any [vendor lock-in][2] which binds me to a temporary solution and leads to loss of data. Instead, I prefer solutions where I am able to **invest my time and effort for a long-term relationship**.

This (very long) entry is **not about image files only** : I am going to explain further things like my folder hierarchy, file name convention, and so forth. Therefore, this information applies to all kind of files I process.

Before I start explaining my method, we should come to an agreement whether or not we do have the same set of requirements I am trying to match with my method. If you are into [raw image formats][3], storing your photographs somewhere in the cloud or anything else very special to you (and not to me), you might not get satisfied with the things described here. Decide yourself.

### My requirements

For **getting the photographs (and movies) from my digital camera to my computer** , I just want to put the SD card into my computer and invoke the fetch-workflow. This thing also has to **pre-process the files** to meet my file name convention (described further down) and to rotate images that are in portrait orientation (and not in landscape).

Those files are written to my photography inbox folder `$HOME/tmp/digicam/`. In this folder, I want to **look through my image files and play movies** to **sort out/delete, rename, add/remove tags, and put sets of related files into separate destination folders**.

After that, I want to **navigate through my set of folders** containing the sets of image/movie files. In rare occasions, I want to **open an image file in an independent image processing tool** like [the GIMP][4]. Just for **rotating JPEG files** , I want to have a quick method which does not require an image processing tool and which is rotating JPEG images [in a loss-less way][5].

My digital camera has now support for tagging images with [GPS][6] coordinates. Therefore, I need a method to **visualize GPS coordinates for single files as well as for a set of files** showing the path I was walking.

There is another nice feature I want to use: imagine a beautiful vacation in Venice where you took hundreds of photographs. Each of them is so beautiful so that you do not want to delete some of them. On the other side, you might want to get a smaller set of photographs for presenting to your friends at home. And they are only expecting maybe two dozens of files before being too jealous. Therefore, I want to be able to **define and show a certain sub-set of photos**.

In terms of being independent and **avoid lock-in effects** , I do not want to use a tool I am not able to use when a company discontinues a product or service. For the very same reason and because I am a privacy-aware person, **I do not want to use any cloud-based service**. In order to keep myself open for new possibilities, I do not want to invest any effort in something which is only available on one specific operating system platform. **Basic stuff has to be available on any platform** (viewing, navigation, ...). But the **full set of requirements have to work on GNU/Linux** , in my case Debian GNU/Linux.

Before I describe my current solutions to this fairly large set of requirements mentioned above, I have to explain my general folder structure and file naming convention I also use for digital photographs. But first, there is an important fact you have to consider:

#### iPhoto, Picasa, and such considered harmful

Software tools which manage collections of photographs do provide pretty cool features. They offer a nice user interface and try to give you cozy work-flows for all kinds of requirements.

The big issue I do have got with them is numerous. They mostly use proprietary storage formats for almost everything: image files, meta-data, and so forth. This is a huge issue, when you are going to change to a different software in a couple of years. Trust me: **you are going to switch** , some day, in any case, for multiple reasons.

If you are in the position where you need to switch your tool, you are going to realize that iPhoto or Picasa do store original image files and everything you did to them separately. Rotation of images, adding description to image files, tags, cropping, and so forth: **everything will be lost forever** if you are not able to export it and re-import it to the new tool. Chances are very high that you are not going to do this without loss of information or data.

I do not want to invest any effort in a tool which locks away my work. **I refuse to lock-in myself to any proprietary tool.** Been there, done that. Learned my lessons.

This is the reason why I keep time-stamps, image descriptions, or tags in the file name itself. File names are permanent unless I manually change them. They do not get lost when I backup my photographs or when I copy them to USB memory sticks or other operating systems. Everybody is able to read them. Any future system is able to process them.

### My file name convention

All my files which do have a relation to a specific day or a time I start with a **date-stamp** or a **time-stamp** according to an adopted [ISO 8601][7].

Example file name with a date-stamp and two tags: `2014-05-09 Budget export for project 42 -- finance company.csv`

Example file name with a time-stamp (even including optional seconds) and two tags: `2014-05-09T22.19.58 Susan presenting her new shoes -- family clothing.jpg`

I have to use adopted ISO time-stamps because colons are not suitable for the Windows [file system NTFS][8]. Therefore, I replaced colons with dots for separating hours from minutes from the optional seconds.

In case of **time or date duration** , I separate the two date- or time-stamps with two minus signs: "`2014-05-09--2014-05-13 Jazz festival Graz -- folder tourism music.pdf`".

Time/date-stamps in file names have the advantage that they remain unchanged until I manually change them. Meta-data which is included in the file content itself (like [Exif][9]) tends to get lost when files are processed via tools that do not take care of those meta-data. Additionally, starting a file name with such a date/time-stamp ensures that files are displayed in a temporal order instead of alphabetic order. The alphabet is a [totally artificial sort order][10] and it is typically less practical for locating files by the user.

When I want to associate **tags** to a file name, I place them between the original file name and the [file name extension][11] separated by a space, two minus signs and an additional space: "`--`". My tags are lower case English words which do not contain spaces or special characters. Sometimes, I might use concatenated words like `quantifiedself` or `usergenerated`. I [tend to prefer general categories][12] instead of more (too) more specific describing tags. I re-use my tags on Twitter [hashtags][13], file names, folder names, bookmarks, blog entries like this one, and so forth.

Tags as part of the file name have several advantages. You are able to locate files with the help of tags by using your usual desktop search engine. Tags in file-names can not be lost because of copying on different storage media. This usually happens, whenever a system uses a different storage place than the file name: meta-data data-base, [dot-files][14], [alternate data streams][15], and so forth.

Of course, please do **avoid special characters** , umlauts, colons, and so forth in file and folder names in general. Especially when you synchronize files between different operating system platforms.

My **file name convention for folders** is the same as for files.

Note: Because of the clever [filenametimestamps][16]-module of [Memacs][17], all files and folders with a date/time-stamp appear on the very same time/day on my Org-mode calendar (agenda). This way, I get a very cool overview on what happened when on which day including all photographs I took.

### My general folder structure

In this section, I will describe my most important folders within my home folder. NOTE: this might get moved to an independent page somewhere in the future. Or not. Time will tell. :-)

Lots of stuff is only of interest for a certain period of time. These are things like downloads to quickly skim through its content, unpack ZIP files to examine the files contained, minor interesting stuff, and so forth. For **temporary stuff** I do have the `$HOME/tmp/` sub-hierarchy. New photographs are placed in `$HOME/tmp/digicam/`. Stuff I temporary copy from a CD, DVD, or USB memory stick are put in `$HOME/tmp/fromcd/`. Whenever a software tool needs temporary data within my user folder hierarchy, I use `$HOME/tmp/Tools/` as an starting point. A very frequent folder for me is `$HOME/tmp/2del/`: "2del" means "ready for being deleted any time". All my browser are using this folder as the default download folder for example. In case I need to free space on a machine, I firstly look at this `2del`-folder for stuff to delete.

In contrast to the temporary stuff described above, I certainly want to keep files **for a longer period of time** as well. Those files gets moved to my `$HOME/archive/` sub-hierarchy. Its got several sub-folders for backups, web/download-stuff I want to keep, binary files I want to archive, index files of removable media (CD, DVD, memory sticks, external hard drives), and a folder where I place stuff I want to archive (and look for a decent destination folder) in the near future. Sometimes, I am too busy or impatient for the moment to file things properly. Yes, that's me I even have a "do not bug me now"-folder. Is this weird to you? :-)

The most important sub-hierarchy within my archive is `$HOME/archive/events_memories/` and its sub/folders `2014/`, `2013/`, `2012/`, and so forth. As you might have guessed already, there is one **sub-folder per year**. Within each of them, there are single files and folders. The files are named according to my file name convention described in the previous section. Folder names start with an [ISO 8601][7] datestamp in the form "YYYY-MM-DD" followed by a hopefully descriptive name like `$HOME/archive/events_memories/2014/2014-05-08 Business marathon with colleagues/`. Within those date-related folders I keep all kinds of files which are related to a certain event: photographs, (scanned) PDF-files, text files, and so forth.

For **sharing data** , I maintain a `$HOME/share/` sub-hierarchy. There is my Dropbox folder, folders for important people I share data using all kinds of methods (like [unison][18]). I also share data among my set of devices: Mac Mini at home, GNU/Linux notebook at home, Android phone, root-server (my personal cloud), Windows-notebook at work. I don't want to elaborate on my synchronization set-up here. There might be another blog entry for this if you ask nicely. :-)

Within my `$HOME/templates_labels/` sub-hierarchy, I keep all kinds of **template files** ([LaTeX][19], scripts, ...), cliparts and **logos** , and so forth.

My **Org-mode** files, I mostly keep within `$HOME/org/`. I practice retentiveness and do not explain how much I love [Emacs/Org-mode][20] and how much I get out of it this time. You probably have read or heard me elaborating the awesome things I do with it. Just look out for [my `emacs` tag][21] on my blog and its [hashtag `#orgmode`][22] on twitter.

So far about my most important folder sub-hierarchies.

### My workflows

Tataaaa, after you learned about my folder structure and file name convention, here are my current workflows and tools I use for the requirements I described further up.

Please note that **you have to know, what you are doing**. My examples here contain folder paths and more that **only works on my machine or my set-up**. **You have to adopt stuff** like paths, file names, and so forth to meet your requirements!

#### Workflow: Moving files from my SD card to the laptop, rotating portrait images, and renaming files

When I want to move data from my digital camera to my GNU/Linux notebook, I take out its Mini-SD storage card and put it in my notebook. Then it gets mounted on `/media/digicam` automatically.

Then, I invoke [getdigicamdata.sh][23] which does several things: it moves the files from the SD card to a temporary folder for processing. The original file names are being converted to lower-case characters. All portrait photographs are rotated using [jhead][24]. Also with jhead, I generate file-name time-stamps from the Exif header time-stamps. Using [date2name][25] I add time-stamps also to the movie files. After processing all those files, they get moved to the destination folder for new digicam files: $HOME/tmp/digicam/tmp/~.

#### Workflow: Folder navigation, viewing, renaming, deleting image files

For skimming through my image and movie files, I prefer to use [geeqie][26] on GNU/Linux. It is a fairly lightweight image browser which has one big advantage other file browsers are missing: I can add external scripts/tools that can be invoked by a keyboard shortcut. This way, I am able to extend the feature-set of the image browser by arbitrary external commands.

Basic image management functionality is built-in to geeqie: navigating my folder hierarchy, viewing image files in window-mode and in full-screen more (shortcut `f`), renaming file names, deleting files, showing Exif meta-data (shortcut `Ctrl-e`).

On OS X, I use [Xee][27]. Unlike geeqie, it is not extendable by external commands. However, the basic navigation, viewing, and renaming functions are available as well.

#### Workflow: Adding and removing tags

I created a Python script called [filetags][28] which I use for adding and removing tags to single files as well as a set of files.

For digital photographs, I use tags like, e.g., `specialL` for landscape images that I consider suitable for desktop backgrounds and so forth, `specialP` for portrait photographs I would like to show to others, `sel` for a selection, and many more.

##### Initial set-up of filetags with geeqie

Adding filetags to geeqie is a manual step: `Edit > Preferences > Configure Editors ...`. Then create an additional entry with `New`. There, you can define a new desktop-file which looks like this:

add-tags.desktop
```
[Desktop Entry]
Name=filetags
GenericName=filetags
Comment=
Exec=/home/vk/src/misc/vk-filetags-interactive-adding-wrapper-with-gnome-terminal.sh %F
Icon=
Terminal=true
Type=Application
Categories=Application;Graphics;
hidden=false
MimeType=image/*;video/*;image/mpo;image/thm
Categories=X-Geeqie;

```

The wrapper-script `vk-filetags-interactive-adding-wrapper-with-gnome-terminal.sh` is necessary because I want a new terminal window to pop-up in order to add tags to my files:

vk-filetags-interactive-adding-wrapper-with-gnome-terminal.sh
```
#!/bin/sh

/usr/bin/gnome-terminal \
 --geometry=85x15+330+5 \
 --tab-with-profile=big \
 --hide-menubar \
 -x /home/vk/src/filetags/filetags.py --interactive "${@}"

#end

```

In geeqie, you can add a keyboard shortcut in `Edit > Preferences > Preferences ... > Keyboard`. I associated `t` with the `filetags` command.

The filetags script is also able to remove tags from a single file or a set of files. It basically uses the same method as described above. The only difference is the additional `--remove` parameter for the filetags script:

remove-tags.desktop
```
[Desktop Entry]
Name=filetags-remove
GenericName=filetags-remove
Comment=
Exec=/home/vk/src/misc/vk-filetags-interactive-removing-wrapper-with-gnome-terminal.sh %F
Icon=
Terminal=true
Type=Application
Categories=Application;Graphics;
hidden=false
MimeType=image/*;video/*;image/mpo;image/thm
Categories=X-Geeqie;

```

vk-filetags-interactive-removing-wrapper-with-gnome-terminal.sh
```
#!/bin/sh

/usr/bin/gnome-terminal \
 --geometry=85x15+330+5 \
 --tab-with-profile=big \
 --hide-menubar \
 -x /home/vk/src/filetags/filetags.py --interactive --remove "${@}"

#end

```

For removing tags, I created a keyboard shortcut for `T`.

##### Using filetags within geeqie

When I skim though image files in the geeqie file browser, I select files I want to tag (one to many) and press `t`. Then, a small window pops up and asks me for one or more tags. After confirming with `Return`, these tags gets added to the file names.

The same goes for removing tags: selecting multiple files, pressing `T`, entering tags to be removed, and confirming with `Return`. That's it. There is [almost no simpler way to add or remove tags to files][29].

#### Workflow: Advanced file renaming with appendfilename

##### Without appendfilename

Renaming a large set of files can be a tedious process. With original file names like `2014-04-20T17.09.11_p1100386.jpg`, the process to add a description to its file name is quite annoying. You are going to press `Ctrl-r` (rename) in geeqie which opens the file rename dialog. The base-name (file-name without the file extension) is marked by default. So if you do not want to delete/overwrite the file name (but append to it), you have to press the cursor key for `<right>`. Then, the cursor is placed between the base name and the extension. Type in your description (don't forget the initial space character) and confirm with `Return`.

##### Using appendfilename with geeqie

With [appendfilename][30], my process is simplified to gain maximum user experience for appending text to file names: When I press `a` (append) in geeqie, a dialog window pops up, asking for a text. After confirming with `Return`, the entered text gets placed between the time-stamp and the optional tags.

For example when I press `a` on `2014-04-20T17.09.11_p1100386.jpg` and I type `Pick-nick in Graz`, the file name gets changed to `2014-04-20T17.09.11_p1100386 Pick-nick in Graz.jpg`. When I press `a` once again and enter `with Susan`, the file name gets changed to `2014-04-20T17.09.11_p1100386 Pick-nick in Graz with Susan.jpg`. When the file name got tags as well, the appended text gets appended before the tag-separator.

This way, I do not have to be afraid to overwrite time-stamps or tags. The process for renaming gets much more enjoyable for me!

And the best part: when I want to add the same text to multiple selected files, this also works with appendfilename.

##### Initial set-up of appendfilename with geeqie

Add an additional editor to geeqie: `Edit > Preferences > Configure Editors ... > New`. Then enter the desktop file definition:

appendfilename.desktop
```
[Desktop Entry]
Name=appendfilename
GenericName=appendfilename
Comment=
Exec=/home/vk/src/misc/vk-appendfilename-interactive-wrapper-with-gnome-terminal.sh %F
Icon=
Terminal=true
Type=Application
Categories=Application;Graphics;
hidden=false
MimeType=image/*;video/*;image/mpo;image/thm
Categories=X-Geeqie;

```

Once again, I do use a wrapper-script that provides me the terminal window:

vk-appendfilename-interactive-wrapper-with-gnome-terminal.sh
```
#!/bin/sh

/usr/bin/gnome-terminal \
 --geometry=90x5+330+5 \
 --tab-with-profile=big \
 --hide-menubar \
 -x /home/vk/src/appendfilename/appendfilename.py "${@}"

#end

```

#### Workflow: Play movie files

On GNU/Linux, I use [mplayer][31] to play-back video files. Since geeqie does not play movie files on itself, I have to create a set-up where I can open a movie file in mplayer.

##### Initial set-up of mplayer with geeqie

I did already associate movie file extensions to mplayer using [xdg-open][32]. Therefore, I only had to create a general "open" command to geeqie which uses xdg-open to open any file with its associated application.

Once again, visit `Edit > Preferences > Configure Editors ...` in geeqie and add an entry for `open`:

open.desktop
```
[Desktop Entry]
Name=open
GenericName=open
Comment=
Exec=/usr/bin/xdg-open %F
Icon=
Terminal=true
Type=Application
hidden=false
NOMimeType=*;
MimeType=image/*;video/*
Categories=X-Geeqie;

```

When you also associate the shortcut `o` (see above) to geeqie, you are able to open video files (and other files) with their associated application.

##### Opening movie files (and others) with xdg-open

After the set-up process from above, you just have to press `o` when your geeqie cursor is above the file. That's it.

#### Workflow: Open in an external image editor

I rarely want to be able to quickly edit image files in the GIMP. Therefore, I added a shortcut `g` and associated it with the external editor "GNU Image Manipulation Program" (GIMP) which was already created by default by geeqie.

This way, only pressing `g` opens the current image file in the GIMP.

#### Workflow: Move to archive folder

Now that I have added comments to my file names, I want to move single files to `$HOME/archive/events_memories/2014/` or set of files to new folders within this folder like `$HOME/archive/events_memories/2014/2014-05-08 Business-Marathon After-Show-Party`.

The usual way is to select one or multiple files and move them to a folder with the shortcut `Ctrl-m`.

So booooring.

Therefore, I (again) wrote a Python script which does this job for me: [move2archive][33] (in short: `m2a`) expects one or more files as command line parameters. Then, a dialog appears where I am able to enter an optional folder name. When I do not enter anything at all but press `Return`, the files gets moved to the folder of the corresponding year. When I enter a folder name like `Business-Marathon After-Show-Party`, the date-stamp of the first image file is appended to the folder (`$HOME/archive/events_memories/2014/2014-05-08 Business-Marathon After-Show-Party`), the resulting folder gets created, and the files gets moved.

Once again: I am in geeqie, select one or more files, press `m` (move) and either press only `Return` (no special sub-folder) or enter a descriptive text which is the name of the sub-folder to be created (optionally without date-stamp).

**No image managing tool is as quick and as fun to use as my geeqie with appendfilename and move2archive via shotcuts.**

##### Initial set-up of m2a with geeqie

Once again, adding `m2a` to geeqie is a manual step: `Edit > Preferences > Configure Editors ...`. Then create an additional entry with `New`. There, you can define a new desktop-file which looks like this:

m2a.desktop
```
[Desktop Entry]
Name=move2archive
GenericName=move2archive
Comment=Moving one or more files to my archive folder
Exec=/home/vk/src/misc/vk-m2a-interactive-wrapper-with-gnome-terminal.sh %F
Icon=
Terminal=true
Type=Application
Categories=Application;Graphics;
hidden=false
MimeType=image/*;video/*;image/mpo;image/thm
Categories=X-Geeqie;

```

The wrapper-script `vk-m2a-interactive-wrapper-with-gnome-terminal.sh` is necessary because I want a new terminal window to pop-up in order to enter my desired destination folder for my files:

vk-m2a-interactive-wrapper-with-gnome-terminal.sh
```
#!/bin/sh

/usr/bin/gnome-terminal \
 --geometry=157x56+330+5 \
 --tab-with-profile=big \
 --hide-menubar \
 -x /home/vk/src/m2a/m2a.py --pauseonexit "${@}"

#end

```

In geeqie, you can add a keyboard shortcut in `Edit > Preferences > Preferences ... > Keyboard`. I associated `m` with the `m2a` command.

#### Workflow: Rotate images (loss-less)

Usually, portrait photographs are being marked automatically as portrait photographs by my digital camera. However, there are certain situations (like taking a photograph from above the motif) where my camera gets it wrong. In those **rare cases** , I have to manually fix the orientation.

You have to know that the JPEG file format is a lossy format which should be used only for photographs and not for computer-generated stuff like screen-shots or diagrams. Rotating a JPEG image file in the dumb way usually results in decompressing/visualizing the image file, rotating the resulting image, and re-encoding the result once again. This causes a resulting image with [much worse image quality than the original image][5].

Therefore, you should use a lossless method to rotate you JPEG image files.

Once again, I add an "external editor" to geeqie: `Edit > Preferences > Configure Editors ... > New`. There, I add two entries: one for rotating 270 degrees (which is 90 degrees counter-clock-wise) and one for rotating 90 degrees (clock-wise) using [exiftran][34]:

rotate-270.desktop
```
[Desktop Entry]
Version=1.0
Type=Application
Name=Losslessly rotate JPEG image counterclockwise

# call the helper script
TryExec=exiftran
Exec=exiftran -p -2 -i -g %f

# Desktop files that are usable only in Geeqie should be marked like this:
Categories=X-Geeqie;
OnlyShowIn=X-Geeqie;

# Show in menu "Edit/Orientation"
X-Geeqie-Menu-Path=EditMenu/OrientationMenu

MimeType=image/jpeg;

```

rotate-90.desktop
```
[Desktop Entry]
Version=1.0
Type=Application
Name=Losslessly rotate JPEG image clockwise

# call the helper script
TryExec=exiftran
Exec=exiftran -p -9 -i -g %f

# Desktop files that are usable only in Geeqie should be marked like this:
Categories=X-Geeqie;
OnlyShowIn=X-Geeqie;

# Show in menu "Edit/Orientation"
X-Geeqie-Menu-Path=EditMenu/OrientationMenu

# It can be made verbose
# X-Geeqie-Verbose=true

MimeType=image/jpeg;

```

I created geeqie keyboard shortcuts for `[` (counter-clock-wise) and `]` (clock-wise).

#### Workflow: Visualizing GPS coordinates

My digital camera has a GPS sensor which stores the current geographic location within the Exif meta-data of the JPEG files. The location data gets stored in [WGS 84][35] format like "47, 58, 26.73; 16, 23, 55.51" (latitude; longitude). This is not human-readable in the sense I would expect: either a map or a location name. Therefore, I added functionality to geeqie so, that I am able to see the location of a single image file on [OpenStreetMap][36]: `Edit > Preferences > Configure Editors ... > New`

photolocation.desktop
```
[Desktop Entry]
Name=vkphotolocation
GenericName=vkphotolocation
Comment=
Exec=/home/vk/src/misc/vkphotolocation.sh %F
Icon=
Terminal=true
Type=Application
Categories=Application;Graphics;
hidden=false
MimeType=image/bmp;image/gif;image/jpeg;image/jpg;image/pjpeg;image/png;image/tiff;image/x-bmp;image/x-gray;image/x-icb;image/x-ico;image/x-png;image/x-portable-anymap;image/x-portable-bitmap;image/x-portable-graymap;image/x-portable-pixmap;image/x-xbitmap;image/x-xpixmap;image/x-pcx;image/svg+xml;image/svg+xml-compressed;image/vnd.wap.wbmp;

```

This calls my wrapper-script named `vkphotolocation.sh` which uses [ExifTool][37] to extract the coordinates in a suitable format that [Marble][38] is able to read and visualize:

vkphotolocation.sh
```
#!/bin/sh

IMAGEFILE="${1}"
IMAGEFILEBASENAME=`basename ${IMAGEFILE}`

COORDINATES=`exiftool -c %.6f "${IMAGEFILE}" | awk '/GPS Position/ { print $4 " " $6 }'`

if [ "x${COORDINATES}" = "x" ]; then
 zenity --info --title="${IMAGEFILEBASENAME}" --text="No GPS-location found in the image file."
else
 /usr/bin/marble --latlon "${COORDINATES}" --distance 0.5
fi

#end

```

Mapped to the keyboard shortcut `G`, I can quickly get to the **map position of its location of a single image file**.

When I want to visualize the **positions of multiple JPEG image files as a path** , I am using [GpsPrune][39]. I was not able to derive a method where GpsPrune takes a set of files as command line parameters. And because of this, I have to manually start GpsPrune, select a set of files or a folder with `File > Add photos`.

This way, I get a dot for each JPEG location on a map of OpenStreetMap (if configured so). By clicking on such a dot, I get details of the corresponding image.

If you happen to be abroad while taking photographs, visualizing the GPS positions is a **great help for adding descriptions** to the file name!

#### Workflow: Filtering photographs according to their GPS coordinates

This is no workflow of mine. For the sake of completeness, I list features of tools that make this workflow possible. What I would like to do is looking for only those photographs out of a big pile of images, that are within a certain area (rectangle or point + distance).

So far, I found only [DigiKam][40] which is able to [filter according to a rectangle][41]. If you know another tool, please add it to the comments below or write an email.

#### Workflow: Showing a sub-set of a given set

As described in the requirements above, I want to be able to define a sub-set of files within a folder in order to present this small collection to other people.

The work-flow is pretty simple: I add a tag (via `t`/filetags) to the files of the selection. For this, I use the tag `sel` which is short for "selection". After I tagged the set of files, I can press `s` which I associated with a script that shows only the files tagged with `sel`.

Of course, this also works with any tag or tag combination. Therefore, with the same method, you are able to get a decent overview on all photos of your wedding that are tagged with "church" and "rings".

Nifty feature, isn't it? :-)

##### Initial set-up of filetags for filtering according to tags + geeqie

You have to define an additional "external editor": `Edit > Preferences > Configure Editors ... > New`:

filter-tags.desktop
```
[Desktop Entry]
Name=filetag-filter
GenericName=filetag-filter
Comment=
Exec=/home/vk/src/misc/vk-filetag-filter-wrapper-with-gnome-terminal.sh
Icon=
Terminal=true
Type=Application
Categories=Application;Graphics;
hidden=false
MimeType=image/*;video/*;image/mpo;image/thm
Categories=X-Geeqie;

```

This once again calls a wrapper-script I wrote:

vk-filetag-filter-wrapper-with-gnome-terminal.sh
```
#!/bin/sh

/usr/bin/gnome-terminal \
 --geometry=85x15+330+5 \
 --hide-menubar \
 -x /home/vk/src/filetags/filetags.py --filter

#end

```

What `filetags` with parameter `--filter` does is basically the following: the user gets asked to enter one or more tags. Then, all matching files of the current folder are linked to `$HOME/.filetags_tagfilter/` using [symbolic links][42]. Then, a new geeqie instance is started which shows the linked files.

After quitting this new geeqie instance, you see the old geeqie instance, from where you invoked the selection process.

#### Summary with a real world example

Wow, this was a very long blog entry. No wonder that you might have lost the overview here and there. To sum up the things I am able to do within geeqie (that extends the standard feature set), I have this cool table below:

shortcut function `m` m2a `o` open (for non-images) `a` add text to file name `t` filetags (add) `T` filetags (remove) `s` filetags (filter) `g` gimp `G` show GPS position `[` lossless rotate counterclockwise `]` lossless rotate clockwise `Ctrl-e` EXIF `f` full-screen

Parts of a file name (including its path) and tools I use to manipulate the components accordingly:
```
 /this/is/a/folder/2014-04-20T17.09 Pick-nick in Graz -- food graz.jpg
 [ m2a ] [ date2name ] [ appendfilename ] [filetags]

```

In practice, I do the following steps to get my photographs from the camera to my archive: I put the SD memory card into my SD card reader of my computer. Then I start [getdigicamdata.sh][23]. After it is finished, I open `$HOME/tmp/digicam/tmp/` within geeqie. I skim through the photographs and delete the ones that did not work out. If there is an image with the wrong orientation, I correct it by `[` or `]`.

In a second run, I add descriptions to files I consider worth commenting on (`a`). Whenever I want to add tags I do so as well: I quickly mark all files that should share a tag (`Ctrl` \+ mouse-click) and tag them using [filetags][28] (`t`).

To combine files from a given event, I select corresponding files and move them to their "event-folder" within the yearly archive folder by typing the event description in [move2archive][33] (`m`). The rest (no special event folder) is moved to the yearly archive directly by move2archive (`m`) without stating a event description.

To finish my work-flow, I delete all files on my SD card, dismount it from the operating system, and put it back into my digital camera.

That's it.

Because this work-flow requires almost no overhead at all, commenting, tagging, and filing photographs is not a tedious job any more.

### Finally

So, this is a detailed description of my work-flows related to photographs and movies I make. You probably have found additional stuff I might be interested in. So please do not hesitate and leave a comment or email by using the links below.

I also would like to get feed-back if my work-flow works for you as well. And: if you have published your work-flows or find descriptions of other peoples work-flows, please do leave a comment as well!

Have fun and don't waste your time with the wrong tools or inefficient methods!

### Other Tools

Read about [gThumb in this article][43].

Please do suggest your tools of choice when you've got the feeling that they fit my requirements mentioned above.

### Email Comments

> Date: Sat, 26 Aug 2017 22:05:09 +0200
>  Hello Karl,
>  I like your articles and work with memacs and of course orgmode but I am not very familiar with python by the way... in your blog post of "managing-digital-photographs" you write about to open videos with [Geeqie][26].
>  It works, but I cant see any video thumbnails in the browser of Geeqie. Do you have any suggestions to get this to work?
>  Thank you, Thomas

Hi Thomas,

Thanks for your kind words. I always feel great when somebody finds my work useful in his/her life. Unfortunately most of the time, I never hear of them.

Yes, I sometimes use Geeqie to visualize folders that not only contain image files but movie files as well. In those cases, I don't see any thumbnail image of the video. You're absolutely right, there are many file browsers out there which are able to display some kind of preview image of a video.

Quite frankly, I never thought of video thumbnails and I don't miss them. A quick research in the preferences and with my search engine did not suggest that there is a possible way to enable video previews in Geeqie. So no luck here.

--------------------------------------------------------------------------------

via: http://karl-voit.at/managing-digital-photographs/

作者：[Karl Voit][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://karl-voit.at
[1]:https://en.wikipedia.org/wiki/Jpeg
[2]:http://en.wikipedia.org/wiki/Vendor_lock-in
[3]:https://en.wikipedia.org/wiki/Raw_image_format
[4]:http://www.gimp.org/
[5]:http://petapixel.com/2012/08/14/why-you-should-always-rotate-original-jpeg-photos-losslessly/
[6]:https://en.wikipedia.org/wiki/Gps
[7]:https://en.wikipedia.org/wiki/Iso_date
[8]:https://en.wikipedia.org/wiki/Ntfs
[9]:https://en.wikipedia.org/wiki/Exif
[10]:http://www.isisinform.com/reinventing-knowledge-the-medieval-controversy-of-alphabetical-order/
[11]:https://en.wikipedia.org/wiki/File_name_extension
[12]:http://karl-voit.at/tagstore/en/papers.shtml
[13]:https://en.wikipedia.org/wiki/Hashtag
[14]:https://en.wikipedia.org/wiki/Dot-file
[15]:https://en.wikipedia.org/wiki/NTFS#Alternate_data_streams_.28ADS.29
[16]:https://github.com/novoid/Memacs/blob/master/docs/memacs_filenametimestamps.org
[17]:https://github.com/novoid/Memacs
[18]:http://www.cis.upenn.edu/~bcpierce/unison/
[19]:https://github.com/novoid/LaTeX-KOMA-template
[20]:http://orgmode.org/
[21]:http://karl-voit.at/tags/emacs
[22]:https://twitter.com/search?q%3D%2523orgmode&src%3Dtypd
[23]:https://github.com/novoid/getdigicamdata.sh
[24]:http://www.sentex.net/%3Ccode%3Emwandel/jhead/
[25]:https://github.com/novoid/date2name
[26]:http://geeqie.sourceforge.net/
[27]:http://xee.c3.cx/
[28]:https://github.com/novoid/filetag
[29]:http://karl-voit.at/tagstore/
[30]:https://github.com/novoid/appendfilename
[31]:http://www.mplayerhq.hu
[32]:https://wiki.archlinux.org/index.php/xdg-open
[33]:https://github.com/novoid/move2archive
[34]:http://manpages.ubuntu.com/manpages/raring/man1/exiftran.1.html
[35]:https://en.wikipedia.org/wiki/WGS84#A_new_World_Geodetic_System:_WGS_84
[36]:http://www.openstreetmap.org/
[37]:http://www.sno.phy.queensu.ca/~phil/exiftool/
[38]:http://userbase.kde.org/Marble/Tracking
[39]:http://activityworkshop.net/software/gpsprune/
[40]:https://en.wikipedia.org/wiki/DigiKam
[41]:https://docs.kde.org/development/en/extragear-graphics/digikam/using-kapp.html#idp7659904
[42]:https://en.wikipedia.org/wiki/Symbolic_link
[43]:http://karl-voit.at/2017/02/19/gthumb
