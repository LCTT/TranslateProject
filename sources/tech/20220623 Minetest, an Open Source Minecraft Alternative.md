[#]: subject: "Minetest, an Open Source Minecraft Alternative"
[#]: via: "https://itsfoss.com/minetest/"
[#]: author: "John Paul https://itsfoss.com/author/john/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Minetest, an Open Source Minecraft Alternative
======
Back in 2009, Minecraft was introduced to the world. Since then, it has become a cultural phenomenon. In that time period, several developers have released open-source games with similar ideas and mechanics. Today, we will look at one of the biggest ones: Minetest.

### What is Minetest?

![minetest start][1]

[Minetest][2], put simply, is a voxel based sandbox game, very similar to Minecraft. Unlike Minecraft, Minetest is written in C++ and is designed to run natively on most systems. It also has a very large map area. With a map size of “62,000 × 62,000 × 62,000 blocks”, “you can mine 31,000 blocks down, or build 31,000 blocks up”.

Interestingly, Minetest was originally released under a proprietary license but was later relicensed as GPL. It has since been relicensed to LGPL.

Minetest has a couple of modes. You can either build and be creative, or you can try to survive the elements. You aren’t limited to these modes. There is a wealth of [extra content available][3] to Minetest in terms of mods, texture packs, and games built within Minetest. This is largely done using Minetest’s [modding API][4] and Lua.

![minetest packages][5]

For those who have played Minecraft, you will find a very similar experience in Minetest. You can dig for resources, build structures, and combine materials to make tools. The one thing that I have not noticed in Minetest is monsters. I don’t think there are any creatures in Minetest, but then again, I’ve on only played in creative mode. I haven’t played survival mode.

Minetest is also used in [education][6]. For example, the people at CERN in Switzerland created a game with Minetest to [show how the Internet works][7] and how it was created. Minetest has also been [used to teach][8] programming, earth sciences, and calculus and trigonometry.

![minetes map1][9]

### How to Install Minetest?

Minetest is available on almost every system. Here is a list of commands that you can use to install Minetest in some of the most popular Linux distros.

#### Ubuntu or Debian

If you have a distro based on Ubuntu or Debian, just enter this command in the terminal:

```
sudo apt install mintest
```

#### Arch or Manjaro

For systems based on Arch (such as Manjaro), use:

```
sudo pacman -S minetest
```

#### Fedora

You can install Mintest from the Fedora servers by entering:

```
sudo dnf install mintest
```

#### openSUSE

openSUSE users can install Minetest using this command:

```
sudo zypper in mintest
```

#### FreeBSD

FreeBSD users are in luck. They can install Mintest using this command:

```
pkg install minetest minetest_game
```

![minetest map2][10]

#### Snap

To install a Snap of Minetest, enter the following command in the terminal:

```
sudo snap install minetest
```

#### Flathub

To install, enter`:`

```
flatpak install flathub net.minetest.Minetest
```

You can download a portable executable for Windows [here][11]. You can also install Minetest on Android, either by going to [Google Play][12] or [download the APK][13].

### Final Thoughts

![minetest about][14]

I’ve spent hours in Minetest building and exploring on my local system. It’s great fun. I haven’t gotten around to trying out any of the extra content because I’ve been more than happy with the relatively small portion of the game I’ve played. The only trouble that I’ve encountered was that it ran slow on Fedora, for some reason. I might have had something configured wrong.

If you ever thought that Minecraft looked interesting, but didn’t want to spend the money, check out Minetest. You’ll be glad that you did.

If you have played Minetest, tell us how your experience was in the comments.

--------------------------------------------------------------------------------

via: https://itsfoss.com/minetest/

作者：[John Paul][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/wp-content/uploads/2022/03/minetest-start-800x411.jpg
[2]: https://www.minetest.net/
[3]: https://content.minetest.net/
[4]: https://dev.minetest.net/Modding_Intro
[5]: https://itsfoss.com/wp-content/uploads/2022/03/minetest-packages-800x411.jpg
[6]: https://www.minetest.net/education/
[7]: https://forum.minetest.net/viewtopic.php?t=22871
[8]: https://en.wikipedia.org/wiki/Minetest#Usage_in_education
[9]: https://itsfoss.com/wp-content/uploads/2022/03/minetes-map1-800x411.png
[10]: https://itsfoss.com/wp-content/uploads/2022/03/minetest-map2-800x413.png
[11]: https://www.minetest.net/downloads/
[12]: https://play.google.com/store/apps/details?id=net.minetest.minetest&utm_source=website&pcampaignid=MKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1
[13]: https://github.com/minetest/minetest/releases/download/5.5.0/app-armeabi-v7a-release.apk
[14]: https://itsfoss.com/wp-content/uploads/2022/03/minetest-about-800x407.jpg
