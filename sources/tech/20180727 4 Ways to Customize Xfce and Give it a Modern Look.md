4 Ways to Customize Xfce and Give it a Modern Look
======
**Brief: Xfce is a great lightweight desktop environment with one drawback. It looks sort of old. But you don’t have to stick with the default looks. Let’s see various ways you can customize Xfce to give it a modern and beautiful look.**

![Customize Xfce desktop envirnment][1]

To start with, Xfce is one of the most [popular desktop environments][2]. Being a lightweight DE, you can run Xfce on very low resource and it still works great. This is one of the reasons why many [lightweight Linux distributions][3] use Xfce by default.

Some people prefer it even on a high-end device stating its simplicity, easy of use and non-resource hungry nature as the main reasons.

[Xfce][4] is in itself minimal and provides just what you need. The one thing that bothers is its look and feel which feel old. However, you can easily customize Xfce to look modern and beautiful without reaching the limit where a Unity/GNOME session eats up system resources.

### 4 ways to Customize Xfce desktop

Let’s see some of the ways by which we can improve the look and feel of your Xfce desktop environment.

The default Xfce desktop environment looks something like this :

![Xfce default screen][5]

As you can see, the default Xfce desktop is kinda boring. We will use some themes, icon packs and change the default dock to make it look fresh and a bit revealing.

#### 1. Change themes in Xfce

The first thing we will do is pick up a theme from [xfce-look.org][6]. My favorite Xfce theme is [XFCE-D-PRO][7].

You can download the theme from [here][8] and extract it somewhere.

You can copy this extracted file to **.theme** folder in your home directory. If the folder is not present by default, you can create one and the same goes for icons which needs a **.icons** folder in the home directory.

Open **Settings > Appearance > Style** to select the theme, log out and login to see the change. Adwaita-dark from default is also a nice one.

![Appearance Xfce][9]

You can use any [good GTK theme][10] on Xfce.

#### 2. Change icons in Xfce

Xfce-look.org also provides icon themes which you can download, extract and put it in your home directory under **.icons** directory. Once you have added the icon theme in the .icons directory, go to **Settings > Appearance > Icons** to select that icon theme.

![Moka icon theme][11]

I have installed [Moka icon set][12] that looks awesome.

![Moka theme][13]

You can also refer to our list of [awesome icon themes][14].

##### **Optional: Installing themes through Synaptic**

If you want to avoid the manual search and copying of the files, install Synaptic Manager in your system. You can look for some best themes over web and icon sets, and using synaptic manager you can search and install it.
```
sudo apt-get install synaptic

```

**Searching and installing theme/icons through Synaptic**

Open synaptic and click on **Search**. Enter your desired theme, and it will display the list of matching items. Mark all the additional required changes and click on **Apply**. This will download the theme and then install it.

![Arc Theme][15]

Once done, you can open the **Appearance** option to select the desired theme.

In my opinion, this is not the best way to install themes in Xfce.

#### 3. Change wallpapers in Xfce

Again, the default Xfce wallpaper is not bad at all. But you can change the wallpaper to something that matches with your icons and themes.

To change wallpapers in Xfce, right click on the desktop and click on Desktop Settings. You can change the desktop background from your custom collection or the defaults one given.

Right click on the desktop and click on **Desktop Settings**. Choose **Background** from the folder option, and choose any one of the default backgrounds or a custom one.

![Changing desktop wallpapers][16]

#### 4. Change the dock in Xfce

The default dock is nice and pretty much does what it is for. But again, it looks a bit boring.

![Docky][17]

However, if you want your dock to be better and with a little more customization options, you can install another dock.

Plank is one of the simplest and lightweight docks and is highly configurable.

To install Plank use the command below:

`sudo apt-get install plank`

If Plank is not available in the default repository, you can install it from this PPA.
```
sudo add-apt-repository ppa:ricotz/docky
sudo apt-get update
sudo apt-get install plank

```

Before you use Plank, you should remove the default dock by right-clicking in it and under Panel Settings, clicking on delete.

Once done, go to **Accessory > Plank** to launch Plank dock.

![Plank][18]

Plank picks up icons from the one you are using. So if you change the icon themes, you’ll see the change is reflected in the dock also.

### Wrapping Up

XFCE is a lightweight, fast and highly customizable. If you are limited on system resource, it serves good and you can easily customize it to look better. Here’s how my screen looks after applying these steps.

![XFCE desktop][19]

This is just with half an hour of effort. You can make it look much better with different themes/icons customization. Feel free to share your customized XFCE desktop screen in the comments and the combination of themes and icons you are using.

--------------------------------------------------------------------------------

via: https://itsfoss.com/customize-xfce/

作者：[Ambarish Kumar][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/ambarish/
[1]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/xfce-customization.jpeg
[2]:https://itsfoss.com/best-linux-desktop-environments/
[3]:https://itsfoss.com/lightweight-linux-beginners/
[4]:https://xfce.org/
[5]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/06/1-1-800x410.jpg
[6]:http://xfce-look.org
[7]:https://www.xfce-look.org/p/1207818/XFCE-D-PRO
[8]:https://www.xfce-look.org/p/1207818/startdownload?file_id=1523730502&file_name=XFCE-D-PRO-1.6.tar.xz&file_type=application/x-xz&file_size=105328&url=https%3A%2F%2Fdl.opendesktop.org%2Fapi%2Ffiles%2Fdownloadfile%2Fid%2F1523730502%2Fs%2F6019b2b57a1452471eac6403ae1522da%2Ft%2F1529360682%2Fu%2F%2FXFCE-D-PRO-1.6.tar.xz
[9]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/4.jpg
[10]:https://itsfoss.com/best-gtk-themes/
[11]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/6.jpg
[12]:https://snwh.org/moka
[13]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/11-800x547.jpg
[14]:https://itsfoss.com/best-icon-themes-ubuntu-16-04/
[15]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/5-800x531.jpg
[16]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/7-800x546.jpg
[17]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/8.jpg
[18]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/9.jpg
[19]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/10-800x447.jpg
