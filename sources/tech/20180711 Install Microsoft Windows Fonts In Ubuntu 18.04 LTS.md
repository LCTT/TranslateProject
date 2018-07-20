Translating by Auk7F7

Install Microsoft Windows Fonts In Ubuntu 18.04 LTS
======

![](https://www.ostechnix.com/wp-content/uploads/2016/07/Install-Microsoft-Windows-Fonts-in-Ubuntu-1-720x340.png)

Most of the educational institutions are still using Microsoft Fonts. I am not sure about other countries. But, in Tamilnadu (An Indian state), **Times New Roman** and **Arial** fonts are being mostly used by almost all sorts of documentation works, projects, and assignments in colleges and schools. Not only the educational institutions, some small organizations, offices, and shops are still using MS Windows Fonts. Just in case, if you are in a situation where you need to use Microsoft fonts in your Ubuntu Linux desktop, here is how to do it.

**Disclaimer:** Microsoft has released its core fonts for free. However, **Please be aware that usage of Microsoft fonts is prohibited in other operating systems**. Read the EULA carefully before installing MS Fonts in any Linux operating system. We (OSTechNix) are not responsible for any kind of piracy act.

### Install MS Fonts in Ubuntu 18.04 LTS desktop

Install MS TrueType Fonts as shown below:
```
$ sudo apt update

$ sudo apt install ttf-mscorefonts-installer

```

Microsoft’s End user agreement wizard will appear. Click **OK** to continue.

![][2]

Click **Yes** to accept the Microsoft agreement:

![][3]

After installing the fonts, we need to update the font cache using command:
```
$ sudo fc-cache -f -v

```

**Sample output:**
```
/usr/share/fonts: caching, new cache contents: 0 fonts, 6 dirs
/usr/share/fonts/X11: caching, new cache contents: 0 fonts, 4 dirs
/usr/share/fonts/X11/Type1: caching, new cache contents: 8 fonts, 0 dirs
/usr/share/fonts/X11/encodings: caching, new cache contents: 0 fonts, 1 dirs
/usr/share/fonts/X11/encodings/large: caching, new cache contents: 0 fonts, 0 dirs
/usr/share/fonts/X11/misc: caching, new cache contents: 89 fonts, 0 dirs
/usr/share/fonts/X11/util: caching, new cache contents: 0 fonts, 0 dirs
/usr/share/fonts/cMap: caching, new cache contents: 0 fonts, 0 dirs
/usr/share/fonts/cmap: caching, new cache contents: 0 fonts, 5 dirs
/usr/share/fonts/cmap/adobe-cns1: caching, new cache contents: 0 fonts, 0 dirs
/usr/share/fonts/cmap/adobe-gb1: caching, new cache contents: 0 fonts, 0 dirs
/usr/share/fonts/cmap/adobe-japan1: caching, new cache contents: 0 fonts, 0 dirs
/usr/share/fonts/cmap/adobe-japan2: caching, new cache contents: 0 fonts, 0 dirs
/usr/share/fonts/cmap/adobe-korea1: caching, new cache contents: 0 fonts, 0 dirs
/usr/share/fonts/opentype: caching, new cache contents: 0 fonts, 2 dirs
/usr/share/fonts/opentype/malayalam: caching, new cache contents: 3 fonts, 0 dirs
/usr/share/fonts/opentype/noto: caching, new cache contents: 24 fonts, 0 dirs
/usr/share/fonts/truetype: caching, new cache contents: 0 fonts, 46 dirs
/usr/share/fonts/truetype/Gargi: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/Gubbi: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/Nakula: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/Navilu: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/Sahadeva: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/Sarai: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/abyssinica: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/dejavu: caching, new cache contents: 6 fonts, 0 dirs
/usr/share/fonts/truetype/droid: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/fonts-beng-extra: caching, new cache contents: 6 fonts, 0 dirs
/usr/share/fonts/truetype/fonts-deva-extra: caching, new cache contents: 3 fonts, 0 dirs
/usr/share/fonts/truetype/fonts-gujr-extra: caching, new cache contents: 5 fonts, 0 dirs
/usr/share/fonts/truetype/fonts-guru-extra: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/fonts-kalapi: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/fonts-orya-extra: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/fonts-telu-extra: caching, new cache contents: 2 fonts, 0 dirs
/usr/share/fonts/truetype/freefont: caching, new cache contents: 12 fonts, 0 dirs
/usr/share/fonts/truetype/kacst: caching, new cache contents: 15 fonts, 0 dirs
/usr/share/fonts/truetype/kacst-one: caching, new cache contents: 2 fonts, 0 dirs
/usr/share/fonts/truetype/lao: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/liberation: caching, new cache contents: 16 fonts, 0 dirs
/usr/share/fonts/truetype/liberation2: caching, new cache contents: 12 fonts, 0 dirs
/usr/share/fonts/truetype/lohit-assamese: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/lohit-bengali: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/lohit-devanagari: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/lohit-gujarati: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/lohit-kannada: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/lohit-malayalam: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/lohit-oriya: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/lohit-punjabi: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/lohit-tamil: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/lohit-tamil-classical: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/lohit-telugu: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/malayalam: caching, new cache contents: 11 fonts, 0 dirs
/usr/share/fonts/truetype/msttcorefonts: caching, new cache contents: 60 fonts, 0 dirs
/usr/share/fonts/truetype/noto: caching, new cache contents: 2 fonts, 0 dirs
/usr/share/fonts/truetype/openoffice: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/padauk: caching, new cache contents: 4 fonts, 0 dirs
/usr/share/fonts/truetype/pagul: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/samyak: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/samyak-fonts: caching, new cache contents: 3 fonts, 0 dirs
/usr/share/fonts/truetype/sinhala: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/tibetan-machine: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/tlwg: caching, new cache contents: 58 fonts, 0 dirs
/usr/share/fonts/truetype/ttf-khmeros-core: caching, new cache contents: 2 fonts, 0 dirs
/usr/share/fonts/truetype/ubuntu: caching, new cache contents: 13 fonts, 0 dirs
/usr/share/fonts/type1: caching, new cache contents: 0 fonts, 1 dirs
/usr/share/fonts/type1/gsfonts: caching, new cache contents: 35 fonts, 0 dirs
/usr/local/share/fonts: caching, new cache contents: 0 fonts, 0 dirs
/home/sk/.local/share/fonts: skipping, no such directory
/home/sk/.fonts: skipping, no such directory
/var/cache/fontconfig: cleaning cache directory
/home/sk/.cache/fontconfig: cleaning cache directory
/home/sk/.fontconfig: not cleaning non-existent cache directory
fc-cache: succeeded

```

### Install MS Fonts in Dual boot with Linux and Windows

If you have dual boot system with Linux and Windows operating system, you can easily install the MS fonts from Windows C drive. All you have to do is mount the Windows partition (C:/Windows).

I assume you have mounted the **C:\Windows** partition at **/Windowsdrive** directory in linux.

Now, link the fonts location to your Linux system’s fonts folder as shown below.
```
ln -s /Windowsdrive/Windows/Fonts /usr/share/fonts/WindowsFonts

```

After linking the fonts folder, regenerate the fontconfig cache using command:
```
fc-cache

```

Alternatively, copy all Windows fonts to **/usr/share/fonts** directory and install the fonts using the following commands:
```
mkdir /usr/share/fonts/WindowsFonts

cp /Windowsdrive/Windows/Fonts/* /usr/share/fonts/WindowsFonts

chmod 755 /usr/share/fonts/WindowsFonts/*

```

Finally, regenerate the fontconfig cache using command:
```
fc-cache

```

### Test Windows font

Open LibreOffice or GIMP after installing MS Fonts. Now, you will see there the Microsoft coretype fonts.

![][4]

That’s it. Hope this guide useful. Again, I warn you usage of MS fonts in other operating system is prohibited. Please read the Microsoft License agreement before installing the MS fonts.

If you find our guides useful, please share them on your social, professional networks and support OSTechNix. More good stuffs to come. Keep visiting!

Cheers!!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/install-microsoft-windows-fonts-ubuntu-16-04/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2016/07/ms-fonts-1.png
[3]:http://www.ostechnix.com/wp-content/uploads/2016/07/ms-fonts-2.png
[4]:http://www.ostechnix.com/wp-content/uploads/2016/07/ms-fonts-3.png
