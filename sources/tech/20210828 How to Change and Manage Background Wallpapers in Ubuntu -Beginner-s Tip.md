[#]: subject: "How to Change and Manage Background Wallpapers in Ubuntu [Beginner’s Tip]"
[#]: via: "https://itsfoss.com/change-wallpaper-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Change and Manage Background Wallpapers in Ubuntu [Beginner’s Tip]
======

The simplest way to customize Ubuntu is to change the wallpaper. A good wallpaper changes the looks of the desktop drastically.

Changing desktop background in [Ubuntu][1] is just a matter of a right click. However, I am writing this tutorial to share a few behind-the-scene tips and information which you might miss or never know even after using Ubuntu for years.

### Change desktop background from Ubuntu settings

If you are using Ubuntu with the default GNOME desktop, you should find a dedicated background option in the system settings.

Press the Windows/Super key and look for Settings (or background).

![Go to Settings][2]

Go to the Background tab and you’ll see a bunch of wallpapers. These are the [default Ubuntu wallpapers][3] that come pre-installed with the operating system.

The current wallpaper is displayed at the top. You’ll also notice that some wallpapers have a clock icon. These wallpapers change throughout the day at a regular time interval. I’ll explain about them later in this article.

![Background Settings ubuntu][4]

To change the wallpaper, just select one of the available images. The change takes place immediately.

You are not restricted to just the handful of pre-installed wallpapers. You can [download beautiful Ubuntu wallpapers][5] from the internet. The ‘Add Picture’ option at the top lets you add additional pictures.

Add the pictures of your choice and select the one you what to set as the desktop background. You can remove the additional wallpapers by clicking the x icon on the images.

![Adding additional wallpapers][6]

This is fine but there is an even easier way to set custom desktop backgrounds.

### Set any image as desktop background in Ubuntu

You have got some images that you can use as wallpaper. Select the image, right click and select “Set as Wallpaper” option. It immediately changes the desktop background.

![Set an image as wallpaper][7]

When you use this method of setting the wallpaper, your selected image is copied and stored in the **Wallpapers folder under the Pictures**. This way, even if you accidentally delete the original image file from the Downloads folder (or other location), it keeps on displaying the wallpaper.

![Some additional wallpapers are stored in ~/Pictures/Wallpapers folder][8]

Another way of setting an image as wallpaper is to open the image by double click it. Now right click on it and select “Set as Wallpaper”.

![Open an image, right click and set it as wallpaper][9]

When you use this method of setting wallpaper, the original image is not copied to the Wallpapers folder under Pictures.

**Tip**: Personally, when I download a new wallpaper, I use right click to set it first. When it is saved in the Wallpapers folder, I double click on the saved images and then set them as wallpaper. This way, the same image is not copied more than once in the Wallpaper directory.

Also note that only standard image types like JPEG, PNG can be used as wallpaper. [Images in newer formats like WebP][10] cannot be used as wallpaper for the moment.

### Making a wallpaper slideshow

By default, Ubuntu provides a few set of wallpapers that could be rotated. You identify them with the small clock icon. But what if you want to rotate your chosen set of images?

Things are not that simple when it comes to the slideshow. Ubuntu keeps the default wallpapers in /usr/share/backgrounds directory. The rotating wallpaper slideshow is controlled via xml files in /usr/share/gnome-background-properties directory.

![The default wallpaper slideshow in Ubuntu is governed by an XML file][11]

With a little knowledge and care, you may edit this XML file and add your custom images, but this is not something everyone will be comfortable with.

As an alternative, you may use [dedicated wallpaper applications in Ubuntu][12]. These applications allow you to create a slideshow of wallpapers with your selected images or download and rotate images from selected sources from the internet.

Wallch is one such tool. You may also use Variety or BingWall.

![Creating a wallpaper slideshow with Wallch][13]

If you are [using a multi-monitor setup and want to set a different wallpaper on different screens][14], you’ll have to use a tool like [HydraPaper][15].

![Setting different wallpaper on different screen][16]

I know you might wonder if changing wallpaper in Ubuntu required a dedicated tutorial. But I think that it may help the absolute beginner and even teach something new to regular Ubuntu users.

Did you learn something new from this tutorial?

--------------------------------------------------------------------------------

via: https://itsfoss.com/change-wallpaper-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://ubuntu.com/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/settings-application-ubuntu.jpg?resize=800%2C247&ssl=1
[3]: https://itsfoss.com/ubuntu-default-wallpapers-download/
[4]: https://itsfoss.com/wp-content/uploads/2021/08/background-settings-ubuntu-800x520.webp
[5]: https://itsfoss.com/beautiful-ubuntu-wallpapers/
[6]: https://itsfoss.com/wp-content/uploads/2021/08/additional-wallpapers-ubuntu-800x520.webp
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/setting-an-image-as-wallpaper-ubuntu.png?resize=800%2C515&ssl=1
[8]: https://itsfoss.com/wp-content/uploads/2021/08/wallpapers-folder-ubuntu-800x426.webp
[9]: https://itsfoss.com/wp-content/uploads/2021/08/add-image-as-background-ubuntu-800x477.webp
[10]: https://itsfoss.com/webp-ubuntu-linux/
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/ubuntu-wallpaper-slideshow-xml.png?resize=800%2C541&ssl=1
[12]: https://itsfoss.com/applications-manage-wallpapers-ubuntu/
[13]: https://itsfoss.com/wp-content/uploads/2021/08/wallpaper-slideshow-with-wallch-800x504.webp
[14]: https://itsfoss.com/wallpaper-multi-monitor/
[15]: https://gitlab.com/gabmus/HydraPaper
[16]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/05/different-wallpaper-each-monitor-hydrapaper-1.jpeg?resize=799%2C639&ssl=1
