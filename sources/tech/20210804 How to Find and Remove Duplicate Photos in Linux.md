[#]: subject: (How to Find and Remove Duplicate Photos in Linux)
[#]: via: (https://itsfoss.com/find-remove-duplicate-photos-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (zpl1025)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to Find and Remove Duplicate Photos in Linux
======

Clicked too many similar photos? Have saved the same photo in different folders? I know that feel.

You click photos on camera, send it through WhatsApp. Now you back up the images and you have two copies of the photos from the gallery and WhatsApp. It is annoying, cluttered and takes extra space unnecessarily.

I came across this issue while going through my father-in-law’s photo collection. Here’s what I did to find the duplicate photos and remove thm.

### Find and remove duplicate photos with digiKam

[digiKam][1] is a free and [open source utility for managing photo collections][2]. It is primarily aimed at photographers but you do not need to be a professional camera person for using it.

Let me show you how you can use this tool for finding duplicate photos and if you feel like it, remove the duplicate ones.

#### Step 1

First thing first, install digiKam. It is a popular application and you should be able to install it from the software center or using the package manager of your distribution.

![Install digikam from the software center][3]

#### Step 2

When you start digiKam for the first time, it asks for the location of your image collection. Then it creates a SQLite database and then imports the images.

![][4]

![][5]

![][6]

#### Step 3

Now that you have imported your photos, go to **Tools-&gt;Find Duplicates** from the file menu.

![From the file menu, go to Tools->Find Duplicates][7]

#### Step 4

It will take some time depending on the number of images you have in your collection. After that, you should see all the photos that have duplicate images in the left sidebar. It also shows the duplicate photos for the selected image in the right sidebar.

![Duplicate images found with digiKam][8]

In the screenshot above, there are four copies of the same photo that I have selected in the left sidebar. You can see one of the images is labelled as ‘Reference image’. But it is up to you to believe which is original and which is duplicate.

By default, the duplicate photos are divided into sections based on their location, i.e. folders. You may change that by going to **View-&gt;Separate Items** in the file menu.

**To delete the duplicate photos**, select the image(s) in the right sidebar and then hit the delete button.

You can repeat this by selecting the image in the left sidebar and then delete the duplicates one by one. Too time taking? There is a trick to delete multiple duplicates at a time.

#### Deleting multiple duplicates images in digiKam

If you want to delete duplicate photos for more than images at the same time, select all the images from the left sidebar.

Now, go to the **file menu -&gt; View -&gt; Sort Items** and select By Similarity.

![Removing multiple duplicate photos][9]

This will put all the referenced images at the bottom. You can select all the images in the right sidebar that are NOT labelled as duplicate and press the delete button.

#### Bonus Tip: There is a trash bin for restoring deleted photos

Accident happens. It is common to accidentally delete the wrong photos. This is why images are never really deleted by digiKam immediately. Instead, it creates a hidden .dtrash folder in the same folder where your photos are stored and moves the ‘deleted’ photos here.

Even on the application interface, you can see the Trash folder. You can find your ‘deleted’ photos here and restore the ones you want.

![Trash folder in digiKam][10]

I hope you like this quick tutorial on finding and removing duplicate images in Linux. On a similar note, you may want to know about [using GUI tools for finding duplicate files in your Linux system][11].

Have questions or suggestions? Please leave a comment below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/find-remove-duplicate-photos-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.digikam.org/
[2]: https://itsfoss.com/linux-photo-management-software/
[3]: https://itsfoss.com/wp-content/uploads/2021/08/digikam-software-center-800x452.webp
[4]: https://itsfoss.com/wp-content/uploads/2021/08/digikam-initial-setup-1.webp
[5]: https://itsfoss.com/wp-content/uploads/2021/08/digikam-initial-setup-2.webp
[6]: https://itsfoss.com/wp-content/uploads/2021/08/digikam-initial-setup-3-800x607.webp
[7]: https://itsfoss.com/wp-content/uploads/2021/08/find-duplicates-digikam-800x462.webp
[8]: https://itsfoss.com/wp-content/uploads/2021/08/duplicate-images-found-with-digikam-800x530.webp
[9]: https://itsfoss.com/wp-content/uploads/2021/08/remove-multiple-duplicate-photos-800x528.webp
[10]: https://itsfoss.com/wp-content/uploads/2021/08/trash-option-digiKam-800x545.webp
[11]: https://itsfoss.com/find-duplicate-files-linux/
