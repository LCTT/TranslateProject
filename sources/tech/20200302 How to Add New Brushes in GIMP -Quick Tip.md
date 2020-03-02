[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Add New Brushes in GIMP [Quick Tip])
[#]: via: (https://itsfoss.com/add-brushes-gimp/)
[#]: author: (Community https://itsfoss.com/author/itsfoss/)

How to Add New Brushes in GIMP [Quick Tip]
======

[GIMP][1], is the most popular free and open-source image editor and perhaps the best [Adobe Photoshop alternative][2] on Linux.

When you [install GIMP on Ubuntu][3] or any other operating system, you’ll find a few brushes already installed for basic image editing. If you need something more specific, you can always add new brushes in GIMP.

How? Let me show you that in this quick tutorial.

### How to add brushes in GIMP

![][4]

There are three steps involved in installing new brushes in GIMP:

  * Get new brush
  * Put it in the designated folder
  * Refresh the brushes in GIMP



#### Step 1: Download new GIMP brushes

The first step is to get new brushes for GIMP. Where do you get it from? From the internet, of course.

You can search on Google or [alternative private search engines like Duck Duck Go][5] for ‘GIMP brushes’ and download the ones you like from a reputed website.

GIMP brushes are usually available in .gbr and .gih file formats. The .gbr file is for regular brushes while .gih is used for animated brushes.

Did you know?

For the versions 2.4 and above, GIMP makes installing and using Photoshop brushes (.abr file) quite straightforward. All you need to do is place the Photoshop brush files in the proper folder.
Do keep in mind that the latest Photoshop brushes might not work with GIMP flawlessly.

#### Step 2: Copy the new brushes into its location

After you get your brush file, the next step is to copy and paste it to the right folder in GIMP configuration directory.

On **Windows**, you’ll have to go to a folder like “**C:\Documents and Settings\myusername.gimp-2.10\brushes**“.

I’ll show detailed steps for **Linux** because It’s FOSS is a Linux-focused website.

After selecting the brush files press **Ctrl+h** in your **Home** folder to [see hidden files in Linux][6].

![Press Ctrl+H to see hidden files in the home directory][7]

You should go to **.config/GIMP/2.10/brushes** folder (if you are using GIMP version 2.10). If you are using some other version, you should see an equivalent folder under .config/GIMP.

![Adding New Brushes in GIMP][8]

Paste the brush files in this folder. Optionally, you can hide the hidden files by pressing **Ctrl+h** again.

#### Step 3: Refresh the brushes (to avoid restarting GIMP)

GIMP will automatically load brushes when it’s launched. If you are already running it and don’t want to close it, you can refresh the brushes.

In GIMP go to **Windows**-&gt;**Dockable Dialogues**-&gt;**Brushes** in the main menu.

![Refresh GIMP Brushes by going go to Windows->Dockable Dialogues-> Brushes][9]

Locate the **refresh** icon in the **Brushes** dialog on the right side bar.

![Refresh GIMP Brushes][10]

If your brushes are not present, you can always try to restart GIMP.

Bonus Tip!

Adding new brushes in [GIMP also allows you easily watermark images][11]. Just use your logo as a brush and add it to the images in a single click.

I hope you enjoyed this quick GIMP tip. Stay tuned for more.

--------------------------------------------------------------------------------

via: https://itsfoss.com/add-brushes-gimp/

作者：[Community][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/itsfoss/
[b]: https://github.com/lujun9972
[1]: https://www.gimp.org/
[2]: https://itsfoss.com/open-source-photoshop-alternatives/
[3]: https://itsfoss.com/gimp-2-10-release/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/Install-New-Brushes-in-GIMP.jpg?ssl=1
[5]: https://itsfoss.com/privacy-search-engines/
[6]: https://itsfoss.com/hide-folders-and-show-hidden-files-in-ubuntu-beginner-trick/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/adding-brushes-GIMP-1.jpg?ssl=1
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/adding-brushes-GIMP.png?ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/Refresh-GIMP-Brushes.jpg?ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/Refresh-GIMP-Brushes-2.jpg?ssl=1
[11]: https://itsfoss.com/add-watermark-gimp-linux/
