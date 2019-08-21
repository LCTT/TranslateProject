[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (ANGRYsearch – Quick Search GUI Tool for Linux)
[#]: via: (https://itsfoss.com/angrysearch/)
[#]: author: (John Paul https://itsfoss.com/author/john/)
[#]: url: ( )

ANGRYsearch – Quick Search GUI Tool for Linux
======

A search application is one of the most important tools you can have on your computer. Most are slow to indexes your system and find results. However, today we will be looking at an application that can display results as you type. Today, we will be looking at ANGRYsearch.

### What is ANGRYsearch?

![][1]
Newly installed ANGRYsearch

[ANGRYsearch][2] is a Python-based application that delivers results as you type your search query. The overall idea and design of the application are both inspired by [Everything][3] a search tool for Windows. (I discovered Everything ad couple of years ago and install it wherever I use Windows.)

ANGRYsearch is able to display the search results so quickly because it only indexes filenames. After you install ANGRYsearch, you create a database of filenames by indexing your system. ANGRYsearch then quickly filters filenames as you type your query.

Even though there is not much to ANGRYsearch, there are several things you can do to customize the experience. First, ANGRYsearch has two different display modes: lite and full. Lite mode only shows the filename and path. Full mode displays filename, path, size, and date of the last modification. Full mode, obviously, takes longer to display. The default is lite mode. In order to switch to full mode, you need to edit the config file at `~/.config/angrysearch/angrysearch.conf`. In that file change the `angrysearch_lite` value to false.

ANGRYsearch also has three different search modes: fast, slow, and regex. Fast mode displays filenames that start with your search term. For example, if you had a folder full of the latest releases of a bunch of Linux distros and you searched “Ubuntu”, ANGRYsearch would display Ubuntu, Ubuntu Mate, Ubuntu Budgie, but not Kubuntu, Xubuntu, or Lubuntu. Fast mode is on by default and can be turned off by unchecking the checkbox next to the “update” button. Slow mode is slightly slower (obviously), but it will display files that have your search term anywhere in their name. In the previous example, ANGRYsearch would show all Ubuntu distros. Regex mode is the slowest and most precise. It uses [regular expressions][4] and is case insensitive. Regex mode is activated by pressing F8.

You can also tell ANGRYsearch to ignore certain folders when it indexes your system. Just click the “update” button and enter the names of the folders you want to be ignored in the space provided. You can also choose from several icon themes, though it doesn’t make that much difference.

![][5]Fast mode results

### Installing ANGRYsearch on Linux

ANGRYsearch is available in the [Arch User Repository][6]. It has also been packaged for [Fedora and openSUSE][7].

To install on other distros, follow these instructions. Instructions are written for a Debian or Ubuntu based system.

ANGRYsearch depends on `python3-pyqt5` and`xdg-utils` so you will need to install them first. Most distros have `xdg-utils`already installed.

`sudo apt install python3-pyqt5`

Next. download the latest version (1.0.1).

`wget https://github.com/DoTheEvo/ANGRYsearch/archive/v1.0.1.zip`

Now, unzip the archive file.

`unzip v1.0.1.zip`

Next, we will navigate to the new folder (ANGRYsearch-1.0.1) and run the installer.

`cd ANGRYsearch-1.0.1`

`chmod +x install.sh`

`sudo ./install.sh`

The installation process is very quick, so don’t be surprised when a new command line is displayed as soon as you hit `Enter`.

The first time that you start ANGRYsearch, you will need to index your system. ANGRYsearch does not automatically keep its database updated. You can use `crontab` to schedule a system scan.

To open a text editor to create a new cronjob, use `crontab -e`. To make sure that the ANGRYsearch database is updated every 6 hours, use this command `0 */6 选题模板.txt 中文排版指北.md core.md Dict.md lctt2014.md lctt2016.md lctt2018.md LCTT翻译规范.md LICENSE published README.md scripts sources translated 选题模板.txt 中文排版指北.md core.md Dict.md lctt2014.md lctt2016.md lctt2018.md LCTT翻译规范.md LICENSE published README.md scripts sources translated 选题模板.txt 中文排版指北.md core.md Dict.md lctt2014.md lctt2016.md lctt2018.md LCTT翻译规范.md LICENSE published README.md scripts sources translated /usr/share/angrysearch/angrysearch_update_database.py`. `crontab` does not run the job if it is powered off when the timer does off. In some case, you may need to manually update the database, but it should not take long.

![][8]ANGRYsearch update/options menu

### Experience

In the past, I was always frustrated by how painfully slow it was to search my computer. I knew that Windows had the Everything app, but I thought Linux out of luck. It didn’t even occur to me to look for something similar on Linux. I’m glad I accidentally stumbled upon ANGRYsearch.

I know there will be quite a few people complaining that ANGRYsearch only searches filenames, but most of the time that is all I need. Thankfully, most of the time I only need to remember part of the name to find what I am looking for.

The only thing that annoys me about ANGRYsearch is that fact that it does not automatically update its database. You’d think there would be a way for the installer to create a cron job when you install it.

![][9]Slow mode results

### Final Thoughts

Since ANGRYsearch is basically a Linux port of one of my favorite Windows apps, I’m pretty happy with it. I plan to install it on all my systems going forward.

I know that I have ragged on other Linux apps for not being packaged for easy install, but I can’t do the same for ANGRYsearch. The installation process is pretty easy. I would definitely recommend it for Linux noobs.

Have you ever used [ANGRYsearch][2]? If not, what is your favorite Linux search application? Let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][10].

--------------------------------------------------------------------------------

via: https://itsfoss.com/angrysearch/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/11/angrysearch3.jpg?resize=800%2C627&ssl=1
[2]: https://github.com/dotheevo/angrysearch/
[3]: https://www.voidtools.com/
[4]: http://www.aivosto.com/articles/regex.html
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/11/angrysearch1.jpg?resize=800%2C627&ssl=1
[6]: https://aur.archlinux.org/packages/angrysearch/
[7]: https://software.opensuse.org/package/angrysearch
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/11/angrysearch2.jpg?resize=800%2C626&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/11/angrysearch4.jpg?resize=800%2C627&ssl=1
[10]: http://reddit.com/r/linuxusersgroup
