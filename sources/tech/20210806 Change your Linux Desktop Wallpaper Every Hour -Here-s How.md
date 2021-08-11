[#]: subject: "Change your Linux Desktop Wallpaper Every Hour [Here’s How]"
[#]: via: "https://www.debugpoint.com/2021/08/change-wallpaper-every-hour/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Change your Linux Desktop Wallpaper Every Hour [Here’s How]
======
This shell script styli.sh helps to change your Linux desktop wallpaper
in every hour automatically and with several options.GNOMEXfceKDE
PlasmaSway
A nice wallpaper to start your day with, your desktop is refreshing. But it is very cumbersome to find wallpaper, then saving and eventually set as wallpaper. All these steps can be done by this script called [styli.sh][1].

### styli.sh – Change your Linux Desktop Wallpaper Every Hour

This is a shell script which you can download from GitHub. When runs, it fetches the wallpapers from popular Subreddits from Reddit and set it as your wallpaper.

This script works with all popular desktop environments such as GNOME, KDE Plasma, Xfce and Sway window manager.

It is loaded with features, and you can run the script with via crontab in every and get a fresh wallpaper in a specific interval.

### Download and Install, Run

Open a terminal and clone the GitHub repo. You need to install [feh][2] and git if not installed.

```
git clone https://github.com/thevinter/styli.sh
cd styli.sh
```

To set a random wallpaper, run below as per your desktop environment.

![Change your Linux Desktop Wallpaper Every Hour using styli.sh][3]

```
./styli.sh -g
```

```
./styli.sh -x
```

```
./styli.sh -k
```

```
./styli.sh -y
```

### Change every hour

To change background every hour, run the following command –

```
crontab -e
```

And add the following to the opened file. Don’t forget to change the script path.

```
@hourly script/path/styli.sh
```

### Change the subreddits

In the source directory, there is a file called subreddits. It is filled up with some standard subreddits. If you want some more, just add the Subreddit names at the end of the file.

### More Config options

The types of wallpapers, size, can also be set. These are some unique configuration option of this script.

> To set a random 1920×1080 background
>  ./styli.sh
>
> To specify a desired width or height
>  ./styli.sh -w 1080 -h 720
>  ./styli.sh -w 2560
>  ./styli.sh -h 1440
>
> To set a wallpaper based on a search term
>  ./styli.sh -s island
>  ./styli.sh -s “sea sunset”
>  ./styli.sh -s sea -w 1080
>
> To get a random wallpaper from one of the set subreddits
>  NOTE: The width/height/search parameters DON’T work with reddit
>  ./styli.sh -l reddit
>
> To get a random wallpaper from a custom subreddit
>  ./styli.sh -r
>  ./styli.sh -r wallpaperdump
>
> To use the builtin feh –bg options
>  ./styli.sh -b
>  ./styli.sh -b bg-scale -r widescreen-wallpaper
>
> To add custom feh flags
>  ./styli.sh -c
>  ./styli.sh -c –no-xinerama -r widescreen-wallpaper
>
> To automatically set the terminal colors
>  ./styli.sh -p
>
> To use nitrogen instead of feh
>  ./styli.sh -n
>
> To update &gt; 1 screens using nitrogen
>  ./styli.sh -n -m
>
> Choose a random background from a directory
>  ./styli.sh -d /path/to/dir

### Closing Notes

A unique and handy script, low on memory and can directly fetch images in an interval – like an hour. And make your desktop look [fresh and productive][4] all the time. If you do not like the wallpaper, you can simply run the script from the terminal again to cycle through.

[][5]

SEE ALSO:   List of All Default Ubuntu Official Wallpapers [Gallery]

Do you like this script? Or do you know anything like this for wallpaper switcher? Let me know in the comment box below.

* * *

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/08/change-wallpaper-every-hour/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://github.com/thevinter/styli.sh
[2]: https://feh.finalrewind.org/
[3]: https://www.debugpoint.com/blog/wp-content/uploads/2021/08/Change-your-Linux-Desktop-Wallpaper-Every-Hour-using-styli.sh_.jpg
[4]: https://www.debugpoint.com/category/themes
[5]: https://www.debugpoint.com/2019/09/a-list-of-all-default-ubuntu-official-wallpapers-gallery/
