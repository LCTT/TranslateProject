Download Subtitles Via Right Click From File Manager Or Command Line With OpenSubtitlesDownload.py
======
**If you're looking for a quick way to download subtitles from OpenSubtitles.org from your Linux desktop or server, give[OpenSubtitlesDownload.py][1] a try. This neat Python tool can be used as a Nautilus, Nemo or Caja script, or from the command line.**

![](https://4.bp.blogspot.com/-Aq1A6erIWMI/W1sMHL89yTI/AAAAAAAABPg/LOs17N9XfUwftE9Mj_up48v8fcC9cb3EgCLcBGAs/s1600/opensubtitles-downloader-found.png)

The Python script **searches for subtitles on OpenSubtitles.org using the video hash sum to find exact matches** , and thus avoid out of sync subtitles. In case no match is found, it then tries to perform a search based on the video file name, although such subtitles may not always be in sync.

OpenSubtitlesDownload.py has quite a few cool features, including **support for more than 60 languages,** and it can query both multiple subtitle languages and videos in the same time (so it **supports mass subtitle search and download** ).

The **optional graphical user interface** (uses Zenity for Gnome and Kdialog for KDE) can display multiple subtitle matches and by digging into its settings you can enable the display of some extra information, like the subtitles download count, rating, language, and more.

Other OpenSubtitlesDownload.py features include:

  * Option to download subtitles automatically if only one is available, choose the one you want otherwise.
  * Option to rename downloaded subtitles to match source video file. Possibility to append the language code to the file name (ex: movie_en.srt).



The Python tool does not yet support downloading subtitles for movies within a directory recursively, but this is a planned feature.

In case you encounter errors when downloading a large number of subtitles, you should be aware that OpenSubtitles has a daily subtitle download limit (it appears it was 200 subtitles downloads / day a while back, I'm not sure if it changed). For VIP users it's 1000 subtitles per day, but OpenSubtitlesDownload.py does not allow logging it to an OpenSubtitles account and thus, you can't take advantage of a VIP account while using this tool.

### Installing and using OpenSubtitlesDownload.py as a Nautilus, Nemo or Caja script

The instructions below explain how to install OpenSubtitlesDownload.py as a script for Caja, Nemo or Nautilus file managers. Thanks to this you'll be able to right click (context menu) one or multiple video files in your file manager, select `Scripts > OpenSubtitlesDownload.py` and the script will search for and download subtitles from OpenSubtitles.org for your video files.

This is OpenSubtitlesDownload.py used as a Nautilus script:

![](https://3.bp.blogspot.com/-9w0n1TW_s9w/W1sNZWPhSoI/AAAAAAAABPs/kMn3aO-ZQqE9FZIxRe9z9XXoBXXMdx8_wCLcBGAs/s1600/opensubtitles-downloader-nautilus.png)

And as a Nemo script:

![](https://1.bp.blogspot.com/-DXyjV9Jvbvw/W1sNe_Jn8GI/AAAAAAAABPw/LdPJtKdcUCUMyF6_ihurIUM6wdHraB4ywCLcBGAs/s1600/opensubtitles-downloader-nemo.png)

To install OpenSubtitlesDownload.py as a Nautilus, Nemo or Caja script, see the instructions below.

1\. Install the dependencies required by OpenSubtitlesDownload.py

You'll need to install `gzip` , `wget` and `zenity` before using OpenSubtitlesDownload.py. The instructions below assume you already have Python (both Python 2 and 3 will do it), as well as `ps` and `grep` available.

In Debian, Ubuntu, or Linux Mint, install `gzip` , `wget` and `zenity` using this command:
```
sudo apt install gzip wget zenity

```

2\. Now you can download the OpenSubtitlesDownload.py
```
wget https://raw.githubusercontent.com/emericg/OpenSubtitlesDownload/master/OpenSubtitlesDownload.py

```

3\. Use the commands below to move the downloaded OpenSubtitlesDownload.py script to the file manager scripts folder and make it executable (use the commands for your current file manager - Nautilus, Nemo or Caja):

  * Nautilus (default Gnome, Unity and Solus OS file manager):


```
mkdir -p ~/.local/share/nautilus/scripts
mv OpenSubtitlesDownload.py ~/.local/share/nautilus/scripts/
chmod u+x ~/.local/share/nautilus/scripts/OpenSubtitlesDownload.py

```

  * Nemo (default Cinnamon file manager):


```
mkdir -p ~/.local/share/nemo/scripts
mv OpenSubtitlesDownload.py ~/.local/share/nemo/scripts/
chmod u+x ~/.local/share/nemo/scripts/OpenSubtitlesDownload.py

```

  * Caja (default MATE file manager):


```
mkdir -p ~/.config/caja/scripts
mv OpenSubtitlesDownload.py ~/.config/caja/scripts/
chmod u+x ~/.config/caja/scripts/OpenSubtitlesDownload.py

```

4\. Configure OpenSubtitlesDownload.py

Since it's running as a file manager script, without any arguments, you'll need to modify the script if you want to change some of its settings, like enabling the GUI, changing the subtitles language, and so on. These are optional of course, and you can use it directly to automatically download subtitles using its default settings.

To Configure OpenSubtitlesDownload.py, you'll need to open it with a text editor. The script path should now be:

  * Nautilus:

`~/.local/share/nautilus/scripts`

  * Nemo:

`~/.local/share/nemo/scripts`

  * Caja:

`~/.config/caja/scripts`




Navigate to that folder using your file manager and open the OpenSubtitlesDownload.py file with a text editor.

Here's what you may want to change in this file:

  * To change the subtitle language, search for `opt_languages = ['eng']` and change the language from `['eng']` (English) to `['fre']` (French), or whatever language you want to use. The ISO codes for each language supported by OpenSubtitles.org are available on [this][2] page (use the code in the first column).

  * If you want a GUI to present you with all subtitles options and let you choose which to download, find the `opt_selection_mode = 'default'` setting and change it to `'manual'` . You'll not want to change this to 'manual' (or better yet, change it to 'auto') if you want to download multiple subtitles in the same time and avoid having a window popup for each video!

  * To force the Gnome GUI to be used, search for `opt_gui = 'auto'` and change `'auto'` to `'gnome'`

  * You can also enable multiple info columns in the GUI:

  * Search for `opt_selection_rating = 'off'` and change it to `'auto'` to display user ratings if available

  * Search for `opt_selection_count = 'off'` and change it to `'auto'` to display the subtitle number of downloads if available


**You can find a list of OpenSubtitlesDownload.py settings with explanations by visiting[this page][3].**

And you're done. OpenSubtitlesDownload.py should now appear in Nautilus, Nemo or Caja, when right clicking a file and selecting Scripts. Clicking OpenSubtitlesDownload.py should search and download subtitles for the selected video(s).

### Installing and using OpenSubtitlesDownload.py from the command line

1\. Install the dependencies required by OpenSubtitlesDownload.py (command line only)

You'll need to install `gzip` and `wget` . On Debian, Ubuntu or Linux Mint you can install these packages by using this command:
```
sudo apt install wget gzip

```

2\. Install the `/usr/local/bin/` and set it so it uses the command line interface by default:
```
wget https://raw.githubusercontent.com/emericg/OpenSubtitlesDownload/master/OpenSubtitlesDownload.py -O opensubtitlesdownload
sed -i "s/opt_gui = 'auto'/opt_gui = 'cli'/" opensubtitlesdownload
sudo install opensubtitlesdownload /usr/local/bin/

```

Now you can start using it. To use the script with automatic selection and download of the best available subtitle, type:
```
opensubtitlesdownload --auto /path/to/video.mkv

```

You can specify the language by appending `--lang LANG` , where `LANG` is the ISO code for a language supported by OpenSubtitles.org, available on
```
opensubtitlesdownload --lang SPA /home/logix/Videos/Sintel.2010.720p.mkv

```

Which provides this output (it allows you to choose the best subtitle since we didn't use `--auto` only, nor did we append `--select manual` to allow manual selection):
```
>> Title: Sintel
>> Filename: Sintel.2010.720p.mkv
>> Available subtitles:
[1] "Sintel (2010).spa.srt" > "Language: Spanish"
[2] "sintel_es.srt" > "Language: Spanish"
[3] "Sintel.2010.720p.x264-VODO-spa.srt" > "Language: Spanish"
[0] Cancel search
>> Enter your choice (0-3): 1
>> Downloading 'Spanish' subtitles for 'Sintel'
2018-07-27 14:37:04 URL:http://dl.opensubtitles.org/en/download/src-api/vrf-19c10c57/sid-8rL5O0xhUw2BgKG6lvsVBM0p00f/filead/1955318590.gz [936/936] -> "-" [1]

```

These are all the available options:
```
$ opensubtitlesdownload --help
usage: OpenSubtitlesDownload.py [-h] [-g GUI] [--cli] [-s SEARCH] [-t SELECT]
 [-a] [-v] [-l [LANG]]
 filePathListArg [filePathListArg ...]

This software is designed to help you find and download subtitles for your favorite videos!


 -h, --help show this help message and exit
 -g GUI, --gui GUI Select the GUI you want from: auto, kde, gnome, cli (default: auto)
 --cli Force CLI mode
 -s SEARCH, --search SEARCH
 Search mode: hash, filename, hash_then_filename, hash_and_filename (default: hash_then_filename)
 -t SELECT, --select SELECT
 Selection mode: manual, default, auto
 -a, --auto Force automatic selection and download of the best subtitles found
 -v, --verbose Force verbose output
 -l [LANG], --lang [LANG]
 Specify the language in which the subtitles should be downloaded (default: eng).
 Syntax:
 -l eng,fre: search in both language
 -l eng -l fre: download both language

```

**The theme used for the screenshots in this article is called[Canta][4].**

**You may also be interested in:[How To Replace Nautilus With Nemo File Manager On Ubuntu 18.04 Gnome Desktop (Complete Guide)][5]**

--------------------------------------------------------------------------------

via: https://www.linuxuprising.com/2018/07/download-subtitles-via-right-click-from.html

作者：[Logix][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/118280394805678839070
[1]:https://emericg.github.io/OpenSubtitlesDownload/
[2]:http://www.opensubtitles.org/addons/export_languages.php
[3]:https://github.com/emericg/OpenSubtitlesDownload/wiki/Adjust-settings
[4]:https://www.linuxuprising.com/2018/04/canta-is-amazing-material-design-gtk.html
[5]:https://www.linuxuprising.com/2018/07/how-to-replace-nautilus-with-nemo-file.html
[6]:https://raw.githubusercontent.com/emericg/OpenSubtitlesDownload/master/OpenSubtitlesDownload.py
