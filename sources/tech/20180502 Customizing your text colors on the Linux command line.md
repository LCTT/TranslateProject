Customizing your text colors on the Linux command line
======

![](https://images.idgesg.net/images/article/2018/05/numbers-100756457-large.jpg)
If you spend much time on the Linux command line (and you probably wouldn't be reading this if you didn't), you've undoubtedly noticed that the ls command displays your files in a number of different colors. You've probably also come to recognize some of the distinctions — directories appearing in one color, executable files in another, etc.

How that all happens and what options are available for you to change the color assignments might not be so obvious.

One way to get a big dose of data showing how these colors are assigned is to run the **dircolors** command. It will show you something like this:
```
$ dircolors
LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do
=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg
=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01
;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01
;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=0
1;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31
:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.
xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.t
bz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.j
ar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.a
lz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.r
z=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.
mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:
*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:
*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;3
5:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;
35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01
;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01
;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01
;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;3
5:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;3
5:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;3
6:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;
36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;
36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS

```

If you're good at parsing, you probably noticed that there's a pattern to this listing. Break it on the colons, and you'll see something like this:
```
$ dircolors | tr ":" "\n" | head -10
LS_COLORS='rs=0
di=01;34
ln=01;36
mh=00
pi=40;33
so=01;35
do=01;35
bd=40;33;01
cd=40;33;01
or=40;31;01

```

OK, so we have a pattern here — a series of definitions that have one to three numeric components. Let's hone in on one of definition.
```
pi=40;33

```

The first question someone is likely to ask is "What is pi?" We're working with colors and file types here, so this clearly isn't the intriguing number that starts with 3.14. No, this "pi" stands for "pipe" — a particular type of file on Linux systems that makes it possible to send data from one program to another. So, let's set one up.
```
$ mknod /tmp/mypipe p
$ ls -l /tmp/mypipe
prw-rw-r-- 1 shs shs 0 May 1 14:00 /tmp/mypipe

```

When we look at our pipe and a couple other files in a terminal window, the color differences are quite obvious.

![font colors][1] Sandra Henry-Stocker

The "40" in the definition of pi (shown above) makes the file show up in the terminal (or PuTTY) window with a black background. The 31 makes the font color red. Pipes are special files, and this special handling makes them stand out in a directory listing.

The **bd** and **cd** definitions are identical to each other — 40;33;01 and have an extra setting. The settings cause block (bd) and character (cd) devices to be displayed with a black background, an orange font, and one other effect — the characters will be in bold.

The following list shows the color and font assignments that are made by **file type** :
```
setting           file type
=======         =========
rs=0            reset to no color
di=01;34        directory
ln=01;36        link
mh=00           multi-hard link
pi=40;33        pipe
so=01;35        socket
do=01;35        door
bd=40;33;01     block device
cd=40;33;01     character device
or=40;31;01     orphan
mi=00           missing?
su=37;41        setuid
sg=30;43        setgid
ca=30;41        file with capability
tw=30;42        directory with sticky bit and world writable
ow=34;42        directory that is world writable
st=37;44        directory with sticky bit
ex=01;93        executable

```

You may have noticed that in our **dircolors** command output, most of our definitions started with asterisks (e.g., *.wav=00;36). These define display attributes by **file extension** rather than file type. Here's a sampling:
```
$ dircolors | tr ":" "\n" | tail -10
*.mpc=00;36
*.ogg=00;36
*.ra=00;36
*.wav=00;36
*.oga=00;36
*.opus=00;36
*.spx=00;36
*.xspf=00;36
';
export LS_COLORS

```

These settings (all 00:36 in the listing above) would have these file names displaying in cyan. The available colors are shown below.

![all colors][2] Sandra Henry-Stocker

### How to change your settings

The colors and font changes described require that you use an alias for ls that turns on the color feature. This is usually the default on Linux systems and will look like this:
```
alias ls='ls --color=auto'

```

If you wanted to turn off font colors, you could run the **unalias ls** command and your file listings would then show in only the default font color.

You can alter your text colors by modifying your $LS_COLORS settings and exporting the modified setting:
```
$ export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;...

```

NOTE: The command above is truncated.

If you want your modified text colors to be permanent, you would need to add your modified LS_COLORS definition to one of your startup files (e.g., .bashrc).

### More on command line text

You can find additional information on text colors in this [November 2016][3] post on NetworkWorld.


--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3269587/linux/customizing-your-text-colors-on-the-linux-command-line.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/
[1]:https://images.idgesg.net/images/article/2018/05/font-colors-100756483-large.jpg
[2]:https://images.techhive.com/images/article/2016/11/all-colors-100691990-large.jpg
[3]:https://www.networkworld.com/article/3138909/linux/coloring-your-world-with-ls-colors.html
