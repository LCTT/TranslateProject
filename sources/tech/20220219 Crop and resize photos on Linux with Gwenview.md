[#]: subject: "Crop and resize photos on Linux with Gwenview"
[#]: via: "https://opensource.com/article/22/2/crop-resize-photos-gwenview-kde"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Crop and resize photos on Linux with Gwenview
======
Gwenview is an excellent photo editor for casual photographers to use on
the Linux KDE desktop.
![Polaroids and palm trees][1]

A good photo can be a powerful thing. It expresses what you saw in a very literal sense, but it also speaks to what you experienced. Little things say a lot: the angle you choose when taking the photo, how large something looms in the frame, and by contrast the absence of those conscious choices.

Photos are often not meant as documentation of what really happened, and instead they become insights into how you, the photographer, perceived what happened.

This is one of the reasons photo editing is so commonplace. When you're posting pictures to your online image gallery or social network, you shouldn't have to post a photo that doesn't accurately represent the feelings the photo encapsulates. But by the same token, you also shouldn't have to become a professional photo compositer just to crop out the random photo bomber who poked their head into your family snapshot at the last moment. If you're using KDE, you have a casual photo editor available in the form of Gwenview.

### Install Gwenview on Linux

If you're running the KDE Plasma Desktop, you probably already have Gwenview installed. If you don't have it installed, or you're using a different desktop and you want to try Gwenview, then you can install it with your package manager.

I recommend installing both Gwenview and the Kipi plugin set, which connects Gwenview with several online photo services so you can easily upload photos. On Fedora, Mageia, and similar distributions:


```
`$ sudo dnf install gwenview kipi-plugins`
```

On Debian, Elementary, and similar:


```
`$ sudo apt install gwenview kipi-plugins`
```

### Using Gwenview

Gwenview is commonly launched in one of two ways. You can click on an image file in Dolphin and choose to open it in Gwenview, or you can launch Gwenview and hunt for a photo in your folders with Gwenview acting more or less as your file manager. The first method is a direct method, great for previewing an image file quickly and conveniently. The second method you're likely to use when you're browsing through lots of photos, unsure of which version of a photo is the "right" one.

Regardless of how you launch Gwenview, the interface and functionality is the same: there's a workspace on the right, and a panel on the left.

![Gwenview][2]

(Seth Kenlon [CC BY-SA 4.0][3], Photo courtesy [Andrea De Santis][4])

Below the panel on the left, there are three tabs.

  * Folders: Displays a tree view of the folders on your computer so you can browse your files for more photos.
  * Information: Provides metadata about the photo you're currently viewing.
  * Operations: Allows you to make small modifications to the current photo, such as rotating between landscape and portrait, resizing, and cropping.



Gwenview is always aware of the file system, so you can press the **Right** or **Left** **Arrow** on your keyboard to see the previous or next photo in a folder.

To leave the single-photo view and see all of the images in a folder, click the **Browse** button in the top toolbar.

![Browsing photos in a folder][5]

(Seth Kenlon, [CC BY-SA 4.0][3])

You can also have both views at the same time. Click the **Thumbnail Bar** button at the bottom of Gwenview to see the other images in your current folder as a filmstrip, with the currently selected photo in the main panel.

![Thumbnail view][6]

(Seth Kenlon, [CC BY-SA 4.0][3])

### Editing photos with Gwenview

Digital photos are pretty common, and so it's equally as common to need to make minor adjustments to a photo before posting it online or sharing it with friends. There are very good applications that can edit photos, and in fact one of the best of them is another KDE application called Krita (you can read about how I use it for photographs in my [Krita for photographers][7] article), but small adjustments shouldn't require an art degree. That's exactly what Gwenview ensures: easy and quick photo adjustments with a casual but powerful application that's integrated into the rest of your Plasma Desktop.

The most common adjustments most of us make to photos are:

  * **Rotation**: When your camera doesn't provide the correct metadata for your computer to know whether a photo is meant to be viewed in landscape or portrait orientation, you can fix it manually.
  * **Mirror**: Many laptop or face cameras mimic a mirror, which is useful because that's how we're used to seeing ourselves. However, it renders writing backward. The **Mirror** function flips (or flops?) an image from right to left.
  * **Flip**: Less common with digital cameras and laptops, the phenomenon of taking a photo with an upside-down device is not uncommon with a mobile phone with a screen that flips no matter how you're holding your phone. The **Flip** function rotates an image 180 degrees.
  * **Resize**: Digital images are often in super HD sizes now, and sometimes that's a lot more than you need. If you're sending a photo by email or posting it on a web page you want to optimize for loading time, you can shrink the dimensions (and file size accordingly) to something smaller.
  * **Crop**: You have a great picture of yourself, and accidentally a random person you thought was just out of frame. Cut out everything you don't want in frame with the **Crop** tool.
  * **Red** **Eye**: When your retinas reflect the flash of your camera back into the camera, you get a red eye effect. Gwenview can reduce this by desaturating and darkening the red channel in an adjustable area.



All of these tools are available in the **Operations** side panel or in the **Edit** menu. The operations are destructive, so after you make a change, click **Save As** to save a _copy_ of the image.

![Cropping a photo in Gwenview][8]

(Seth Kenlon, [CC BY-SA 4.0][3], Photo courtesy [Elise Wilcox][9])

### Sharing photos

When you're ready to share a photo, click the **Share** button in the top toolbar, or go to the **Plugins** menu and select **Export**. Gwenview, along with the Kipi plug-in set, can share photos with [Nextcloud][10], [Piwigo][11], plain old email, and services like Google Drive, Flickr, Dropbox, and more.

### Photo editing essentials on Linux

Gwenview has all the essentials for a desktop photo manager. If you need more than the basics, you can open a photo in Krita or [Digikam][12] and make major modifications as needed. For everything else, from browsing, ranking, tagging, and small adjustments, you have Gwenview close at hand.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/crop-resize-photos-gwenview-kde

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/design_photo_art_polaroids.png?itok=SqPLgWxJ (Polaroids and palm trees)
[2]: https://opensource.com/sites/default/files/kde-gwenview-ui.jpg (Gwenview)
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: http://unsplash.com/@santesson89
[5]: https://opensource.com/sites/default/files/kde-gwenview-browse.jpg (Browsing photos in a folder)
[6]: https://opensource.com/sites/default/files/kde-gwenview-thumbnail.jpg (Thumbnail view)
[7]: https://opensource.com/article/21/12/open-source-photo-editing-krita
[8]: https://opensource.com/sites/default/files/kde-gwenview-crop.jpg (Cropping a photo in Gwenview)
[9]: http://unsplash.com/@elise_outside
[10]: https://opensource.com/article/20/7/nextcloud
[11]: https://opensource.com/alternatives/google-photos
[12]: https://opensource.com/life/16/5/how-use-digikam-photo-management
