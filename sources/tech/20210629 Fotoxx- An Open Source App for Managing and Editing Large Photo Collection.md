[#]: subject: (Fotoxx: An Open Source App for Managing and Editing Large Photo Collection)
[#]: via: (https://itsfoss.com/fotoxx/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Fotoxx: An Open Source App for Managing and Editing Large Photo Collection
======

When it comes to [photo management software in Linux][1], Shotwell is perhaps the most famous of them all. No wonder it comes preinstalled in many distributions.

But if you are looking for a Shotwell like application which is a bit faster, Fotoxx could be a good choice.

It may not have a modern user interface, but it is fast in handling a large collection of photos. And it matters because indexing and showing thumbnails for thousands of photos could take considerable time and computing resources.

### Manage photos and edit them in Linux with Fotoxx

![Fotoxx interface][2]

As you can see in the screenshot above, it is not the nicest interface. Looks more like an application from around 2010. What it lacks in the visual department, it makes up with features and performance.

You can import a huge collection of photos, including RAW images. The images stay where they are. They are not copied or moved. They just get indexed in the application.

You can edit image metadata like tags, geotags, dates, ratings, captions etc. You can search images based on these matadata.

It also has a map feature that groups and displays images belonging to a certain location (based on geotag data on the images).

![Map view][3]

Since it focuses on managing large collection of photos, it has several batch functions to rename, resize, copy/move, convert image format and edit metadata.

You can select images to create albums and slideshows and all this happens without duplicating the images. Photos can be combined to create 360-degree panoramas.

Fotoxx also has several editing functions that can be used to retouch the images, add effect (like sketching, painting), trim, rotate and more.

There is also options for removing red eyes and dust spots from the old, scanned photo prints.

I can go on with the features list but it won’t end. Its website describes its full capabilities and you should check it out.

[Fotoxx Feature Overview][4]

If it interests you, you can watch this video that demonstrates the features of Fotoxx:

[Subscribe to It’s FOSS YouTube channel][5]

### Installing Fotoxx on Linux

Please keep in mind that **Fotoxx developer recommends a strong computer** with 4+ CPU cores, 16+ GB memory for proper functioning. Lesser computers may be slow or may fail to edit large images.

Fotoxx is available in the repositories of most Linux distributions like Debian, Ubuntu, Fedora and Arch Linux. Just use your distribution’s package manager or software center to search for Fotoxx and install it.

On Ubuntu and Debian based distributions, you can use the apt command to install it like this:

```
sudo apt install fotoxx
```

When you first run it, it will ask to search the home directory for images. You may continue with it or limit the search location to selected folders.

![][6]

I noticed that despite indexing over 4,700 in a minute or so, it didn’t start displaying the images immediately. I had to **click on Gallery-&gt;All Folders and the select the folder(s) and then it showed the images**. So, this is something to keep in mind.

Fotoxx is an extensive tool and it will take some time in getting used to it and explore all its features. Its webapge lists several examples that you should have a look at.

[Fotoxx Feature Examples][4]

As I said earlier, it is not the prettiest application, but it gets the job done with a huge list of features. If you are a photographer or have a large collection of images, you may give Fotoxx a try and see if it fits your need. And when you do that, please do share your experience with it in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/fotoxx/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/linux-photo-management-software/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/06/fotoxx-interface.jpg?resize=800%2C561&ssl=1
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/fotoxx-geotag-map-view.jpg?resize=800%2C466&ssl=1
[4]: https://kornelix.net/fotoxx/fotoxx.html
[5]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/fotoxx-indexing.png?resize=800%2C617&ssl=1
