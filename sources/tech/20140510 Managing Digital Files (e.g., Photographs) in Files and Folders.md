qfzy1233 is translating 



数码文件与文件夹收纳术（以照片为例）
======
更新   2014-05-14:增加了一些具体实例

更新   2015-03-16:根据照片的 GPS 坐标过滤图片

更新   2016-08-29:以新的 `filetags--filter` (LCTT译注：文件标签过滤器)替换已经过时的 `show-sel.sh` 脚本（LCTT译注：show-sel 为 show firmware System Event Log records 即硬件系统事件及日志显示）

更新   2017-08-28: geeqier 视频缩略图的邮件评论

每当度假或去哪游玩时我就会化身为一个富有激情的摄影师。所以，过去的几年中我积累了许多的 [JPEG][1] 文件。这篇文章中我会介绍我是如何避免[vendor lock-in][2]（LCTT译注：vendor lock-in 供应商锁定，原为经济学术语，这里引申为避免服务平台突然倒闭得现象）造成受限于那些临时性的解决方案及数据丢失。相反，我更倾向于使用那些可以让我投入时间和精力打理并能长久使用的解决方案。

这一（相当长的）攻略 **并不仅仅适用于图像文件** ：我将进一步阐述像是文件夹结构，文件的命名规则，等等许多领域的事情。因此，这些规范适用于我所能接触到的所以类型的文件。

在我开始传授我的方法之前，我们应该先就我将要介绍方法的达成一个共识，那就是我们是否有相同的需求。如果你对[raw 图像格式][3]十分推崇，将照片存储在云端或其他你信赖的地方（对我而言可能不会），那么你可能不会认同这篇文章将要描述的方式了。根据你的情况来灵活做出选择。

### 我的需求

对于 **将照片（或视频）从我的数码相机中导出到电脑里**，我只是想将 SD 卡茶道我的电脑里并调用 fetch-workflow 软件。这一步也完成了 **图像软件的预处理** 适用于我提出的文件命名规范（下文会具体论述）同时也可以将图片旋转至正常的方向（而不是横着）。

这些文件将会被存入到我的摄影收藏文件夹 `$HOME/tmp/digicam/`。 在这一文件夹中我希望能完成以下的操作 **浏览图像和视频文件** 以便于 **整理排序/删除，重命名，添加/移除标签，以及将一系列相关的文件移动到相应的文件夹中**。

在完成这些以后，我将会**浏览包含图像/电影文件集的文件夹**。在极少数情况下，我希望**在独立的图像处理工具**中打开一个图像文件，比如[GIMP][4]。如果仅是为了**旋转JPEG文件**，我想找到一个快速的方法，不需要图像处理工具，这是旋转JPEG图像[无损的方式][5]。

我的数码相机支持用[GPS][6]坐标标记图像。因此，我需要一个方法来**可视化GPS坐标的单个文件以及一组文件**显示我走过的路径。

我想安利的另一个好功能是:假设你在威尼斯度假时拍了几百张照片。每一个都很漂亮，所以你每张都舍不得删除。另一方面，你可能想要一组更小的照片，送给家里的朋友。而且，为了不让他们过于嫉妒，他们可能只希望看到20多张照片。因此，我希望能够**定义并显示一组特定的照片**。

就独立性和**避免锁定效应**而言，我不想使用那种一旦公司停止产品或服务就无法使用的工具。出于同样的原因，由于我是一个注重隐私的人，**我不想使用任何基于云的服务**。为了让自己对新的可能性保持开放的心态，我不希望仅在一个特定的操作系统平台上倾注全部的精力。**基本的东西必须在任何平台上可用**(查看、导航、……)。但是**全套需求必须在GNU/Linux上运行**且我选择Debian GNU/Linux。

在我传授当前针对上述大量需求的解决方案之前，我必须解释一下我的一般文件夹结构和文件命名约定，我也使用它来命名数码照片。但首先，你必须考虑一个重要的事实:

#### iPhoto, Picasa, 诸如此类应被认为是有害的

管理照片集合的软件工具确实提供了相当酷的功能。他们提供了一个良好的用户界面，并试图为您提供各种需求的舒适的工作流程。

这些软件的功能和我的个人需求之间的差异很大。它们几乎对所有东西都使用专有的存储格式:图像文件、元数据等等。这是一个大问题，当你打算在几年内换一个不同的软件。相信我:总有一天你会因为多种原因而改变。

如果你现在正打算更换 相应的工具，您将会意识到iPhoto或Picasa确实分别存储原始图像文件和您对它们所做的所有操作。旋转图像，向图像文件添加描述，标签，裁剪，等等，如果你不能导出并重新导入到新工具，那么**所有的东西都将永远丢失**。而无损的进行转换和迁移几乎是不可能的。

我不想在一个锁住我工作的工具上投入任何精力。**我也拒绝把自己锁在任何专有工具上**。我是一个过来人，希望你们吸取我的经验。

这就是我在文件名中保留时间戳、图像描述或标记的原因。文件名是永久性的，除非我手动更改它们。当我把照片备份或复制到u盘或其他操作系统时，它们不会丢失。每个人都能读懂。任何未来的系统都能够处理它们。

### 我的文件命名约定

我所有的文件都与一个特定的日期或时间有关，根据所采用的[ISO 8601][7]规范，我采用的是**日期-标记**或**时间-标记**
带有日期戳和两个标签的示例文件名:`2014-05-09 42号项目的预算 -- 金融公司.csv`

带有时间戳(甚至包括可选秒)和两个标签的示例文件名:`2014-05-09T22.19.58 Susan展示她的新鞋子 -- 家庭衣物.jpg`

由于冒号不适用于Windows[文件系统NTFS][8]，所以我必须使用已采用的ISO时间戳。因此，我用点代替冒号，以便将小时与分钟区别开来。

如果是**时间或日期持续时间**，我将两个日期或时间戳用两个负号分开:`2014-05-09—2014-05-13爵士音乐节Graz—folder 旅游音乐.pdf`。

文件名中的时间/日期戳的优点是，除非我手动更改它们，否则它们保持不变。当通过某些不处理这些元数据的软件进行处理时，包含在文件内容本身中的元数据(如[Exif][9])往往会丢失。此外，使用这样的日期/时间戳启动文件名可以确保文件按时间顺序显示，而不是按字母顺序显示。字母表是一种[完全人工的排序顺序][10]，对于用户定位文件通常不太实用。

当我想将**tags**关联到文件名时，我将它们放在原始文件名和[文件名扩展名][11]之间，中间用空格、两个减号和一个额外的空格分隔"`--`"。我的标签是小写的英文单词，不包含空格或特殊字符。有时，我可能会使用`quantifiedself`或`usergenerated`等连接词。我[倾向于选择一般类别][12]，而不是太过具体的描述标签。我用这一方式在Twitter [hashtags][13]上重用标记、文件名、文件夹名、书签、诸如此类的博客条目等等。

标签作为文件名的一部分有几个优点。通过使用常用的桌面搜索引擎，您可以在标签的帮助下定位文件。文件名称中的标签不能因为在不同的存储介质上复制而丢失。当系统使用与文件名不同的存储位置如:元数据数据库、[dot-files][14]、[备用数据流][15]等，通常会发生这种情况

当然，在一般的文件和文件夹名称中，**请避免使用特殊字符**，umlauts，冒号等。尤其是在不同操作系统平台之间同步文件时。

我的**文件夹名命名约定**与文件的相应规范相同。

注意:由于[Memacs][17]的[filenametimestamp][16]-module的聪明之处，所有带有日期/时间戳的文件和文件夹都在同一时间/天出现在我的组织模式日历(agenda)上。这样，我就能很好地了解当天发生了什么，包括我拍的所有照片。

### 我的一般文件夹结构

在本节中，我将描述主文件夹中最重要的文件夹。注意:这可能在将来的被移动到一个独立的页面。或许不是。让我们等着瞧:-)
很多东西只有在一定的时间内才会引起人们的兴趣。这些内容包括快速浏览其内容的下载、解压缩文件以检查包含的文件、一些有趣的小内容等等。对于**临时的东西**，我有 `$HOME/tmp/ ` 子层次结构。新照片放在`$HOME/tmp/digicam/`中。我从CD、DVD或USB记忆棒临时复制的东西放在`$HOME/tmp/fromcd/`中。每当软件工具需要用户文件夹层次结构中的临时数据时，我就使用` $HOME/tmp/Tools/ `作为起点。我经常使用的文件夹是`$HOME/tmp/2del/`:`2del`的意思是“随时可以删除”。例如，我所有的浏览器都使用这个文件夹作为默认的下载文件夹。如果我需要在机器上腾出空间，我首先查看这个`2del`-文件夹，用于删除内容。

与上面描述的临时文件相比，我当然也想将文件**保存更长的时间**。这些文件被移动到我的`$HOME/archive/`子层次结构中。它有几个子文件夹备份,web /下载我想保留,二进制文件我要存档,索引文件的可移动媒体(CD, DVD,记忆棒、外部硬盘驱动器),和一个文件夹用来存档(和寻找一个合适的的目标文件夹)在不久的将来。有时，我太忙或没有耐心的时候将文件妥善整理。是的，那就是我，我甚至有一个名为`现在不要整理我`的文件夹。这是否对你而言很怪？:-)

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

#### 用一个真实的案例来总结

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

### 最后

所以，这是一个详细描述我关于照片和电影的工作流程的叙述。你可能已经发现了我可能感兴趣的其他东西。所以请不要犹豫，请使用下面的链接留下评论或电子邮件。
我也希望得到反馈，如果我的工作流程适用于你。并且:如果你已经发布了你的工作流程或者找到了其他人工作流程的描述，也请留下评论!
及时行乐，莫让错误的工具或低效的方法浪费了我们的人生!

### 其他工具

阅读关于[本文中关于 gThumb 的部分][43].

当您觉得您以上文中所叙述的符合你的需求时，请根据相关的建议来选择对应的工具。

### 邮件回复

> Date: Sat, 26 Aug 2017 22:05:09 +0200

>  你好卡尔,
我喜欢你的文章，喜欢和memacs一起工作，当然还有orgmode，但是我对python不是很熟悉……在你的博客文章“管理数码照片”，你写了关于打开视频与[Geeqie][26]。是的，但是我在浏览器里看不到任何视频缩略图。你有什么建议吗？

> 谢谢你,托马斯 



你好托马斯,

谢谢你的美言。当有人发现我的工作对他/她的生活有用时，我总是感觉很棒。
不幸的是，大多数时候，我从未听到过这些。
是的，我有时使用Geeqie来可视化文件夹，这些文件夹不仅包含图像文件，还包含电影文件。在这些情况下，我没有看到任何视频的缩略图。你说得对，有很多文件浏览器可以显示视频的预览图像。
坦白地说，我从来没有想过视频缩略图，我也不怀念它们。在我的首选项和搜索引擎上做了一个快速的研究，并没有发现在Geeqie中启用视频预览的相关方法。所以这里要说声抱歉。

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
