How To Change GDM Login Screen Background In Ubuntu
======
Whenever you log in or lock and unlock your Ubuntu 18.04 LTS desktop, you will be greeted with a plain purple-colored screen. It is the default GDM (GNOME Display Manager) background since Ubuntu version 17.04. Some of you may feel boring to look at this plain background and want to make the Login screen something cool and eye-candy! If so, you’re on the right track. This brief guide describes how to change GDM Login screen background in Ubuntu 18.04 LTS desktop.

### Change GDM Login Screen Background In Ubuntu

Here is how the default GDM login screen background image looks like in Ubuntu 18.04 LTS desktop.
![](https://www.ostechnix.com/wp-content/uploads/2018/11/GDM-login-screen-1.png)

Whether you like it or not, you will stumbled upon this screen every time you log in or lock and unlock the system. No worries! You can change this background with any beautiful image of your choice.

Changing desktop wallpaper and user’s profile picture is not a big deal in Ubuntu. We can do it with a few mouse clicks in no time. However, changing Login/Lock screen background need a little bit editing of a file called **ubuntu.css** located under **/usr/share/gnome-shell/theme** directory.

Before modifying this file, take a backup of this file. So, we can restore it if something went wrong.

```
$ sudo cp /usr/share/gnome-shell/theme/ubuntu.css /usr/share/gnome-shell/theme/ubuntu.css.bak
```

Now, edit ubuntu.css file:

```
$ sudo nano /usr/share/gnome-shell/theme/ubuntu.css
```

Find the following lines under the directive named **“lockDialogGroup”** in the file:

```
#lockDialogGroup {
 background: #2c001e url(resource:///org/gnome/shell/theme/noise-texture.png);
 background-repeat: repeat;
}
```
![](https://www.ostechnix.com/wp-content/uploads/2018/11/ubuntu_css.png)

As you can see, the default image for the GDM login screen is **noise-texture.png**.

Now, change the background image by adding your image path. You can use either .jpg or .png file. Both format images worked fine for me. After editing the file, the contents of file will look like below:

```
#lockDialogGroup {
 background: #2c001e url(file:///home/sk/image.png);
 background-repeat: no-repeat;
 background-size: cover;
 background-position: center;
}
```

Please pay little attention to the modified version of this directive in the ubuntu.css file. I have marked the changes in bold.

As you might have noticed, I have changed the line “… **url(resource:///org/gnome/shell/theme/noise-texture.png);** ” with “ **…url(file:///home/sk/image.png);”**. I.e You should change “… **url(resource** …” to “… **url(file**..”.

Also, I have changed the value of “background-repeat:” parameter from **“repeat”** to **“no-repeat”** and added two more lines. You can simply copy/paste the above lines and change image path with your own in your ubuntu.css file.

Once you are done, save and close the file. And, reboot your system.

Here is my GDM login screen with updated backgrounds:
![](https://www.ostechnix.com/wp-content/uploads/2018/11/GDM-login-screen-2.png)

![](https://www.ostechnix.com/wp-content/uploads/2018/11/GDM-login-screen-3.png)

Cool, yeah? As you can see, changing GDM login screen is not that difficult either. All you have to do is to change the path of the image in ubuntu.css file and restart your system. It is simple as that. Have fun!

You can also edit **gdm3.css** file located under **/usr/share/gnome-shell/theme** directory and modify it as shown above to get the same result. Again, don’t forget to take the backup of the file before making any changes.

And, that’s all now. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-change-gdm-login-screen-background-in-ubuntu/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
