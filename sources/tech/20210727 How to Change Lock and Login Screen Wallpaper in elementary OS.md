[#]: subject: (How to Change Lock and Login Screen Wallpaper in elementary OS)
[#]: via: (https://www.debugpoint.com/2021/07/change-lock-login-screen-background-elementary-os/)
[#]: author: (Arindam https://www.debugpoint.com/author/admin1/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to Change Lock and Login Screen Wallpaper in elementary OS
======
This tutorial explains the steps you need to change lock and login
screen background in elementary OS. This will replace the default grey
background.
Changing the lock or login screen background grey default wallpaper in elementary OS is a bit difficult. The typical greeter configuration change with the path of the image file would not work.

Unfortunately, it’s not an easier solution because the grey background is an image file and its data is hard coded in the greeter and need to be recompiled with new image to make it work.

Here’s how.

![Lock / Login screen background elementary OS \(Odin\)][1]

### Change Lock and Login Screen Background – elementary OS

  * Open a terminal in your elementary OS.
  * Install git and following dependencies for [greeter package][2].



```
sudo apt install git
```

```
sudo apt install -y gnome-settings-daemon libaccountsservice-dev libgdk-pixbuf2.0-dev libgranite-dev libgtk-3-dev libhandy-1-dev liblightdm-gobject-1-dev libmutter-6-dev libwingpanel-dev libx11-dev meson valac
```

  * Go to temporary /tmp directory and clone the latest greeter master branch from GitHub.



```
cd /tmp
git clone https://github.com/elementary/greeter.git
```

  * After cloning is complete, open the path `/tmp/greeter/data` in a file manager.


  * The elementary OS uses a PNG file of 100×100 px as default background in the login screen/lock screen. The image is tiled, and it gives an impression of grey background.


  * Rename your desired wallpaper image with `texture.png` and overwrite the following file in the path.



![gray background is created using this file][3]

```
/tmp/greeter/data/texture.png
```

  * Open the file `/tmp/greeter/compositor/SystemBackground.vala` in a text editor and replace the following line –



![change the path of image][4]

```
resource:///io/elementary/desktop/gala/texture.png
```

With –

```
resource:///io/elementary/greeter/texture.png
```

  * Save the file.


  * Open the terminal again and build `greeter` using the following commands.



```
cd /tmp/greeter
meson _build --prefix=/usr
sudo ninja install -C _build
```

![building greeter][5]

  * If you face any build error, let me know in the comment below. You should not be seeing any error, as I have tested it.



[][6]

SEE ALSO:   elementary OS 5.1 Hera Released. Here’s What’s New

After the above commands are complete, you can test the login screen by running lightdm in test mode –

```
lightdm --test-mode --debug
```

If it looks good, reboot the system. And you should be seeing your wallpaper in the login screen in elementary OS.

This guide should work in [elementary OS 6 Odin][7], elementary OS 5 Juno and below.

### Closing Notes

I hope this guide helps you to change the background of lock or login screen in your elementary OS. Honestly, its 2021 and changing a background image of login screen requires compilation of code surprises me.

If you run into error, let me know in the comment box below.

* * *

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/07/change-lock-login-screen-background-elementary-os/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/elementary-OS-Login-Screen-in-Odin-1024x768.jpg
[2]: https://github.com/elementary/greeter
[3]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/gray-background-is-created-using-this-file.jpg
[4]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/change-the-path-of-image-1024x450.jpg
[5]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/building-greeter.png
[6]: https://www.debugpoint.com/2019/12/elementary-os-hera-released/
[7]: https://www.debugpoint.com/tag/elementary-os-6
