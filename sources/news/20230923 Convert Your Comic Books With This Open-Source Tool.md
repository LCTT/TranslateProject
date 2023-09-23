[#]: subject: "Convert Your Comic Books With This Open-Source Tool!"
[#]: via: "https://news.itsfoss.com/cbconvert/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Convert Your Comic Books With This Open-Source Tool!
======
Here's something interesting for you to try!
An interesting open-source tool with a very specific use case.

**CBconvert** is **a comic book converter** that can convert comics into different formats to fit all sorts of devices.

For me, personally, this will be a first, since I have never tried a converter like this before. Here, I explore and highlight what this tool has to offer.

🚧

The app is fairly new and is in active development. Expect things to change.

### CBconvert: Overview ⭐

![][1]

Written primarily in the [Go][2] programming language, CBconvert aims to act as a one-stop app for all your comic book conversion needs.

It can read the most commonly used file formats, such as **CBR** (RAR), XPS, **CB7** (7Z), **CBT** (TAR), **PDF** , and more.

You can convert those files into two distinct formats, **CBZ** (ZIP) and **CBT** (TAR).

Don't think that CBconvert's only purpose is to convert comic books, you can also use it to make some visual tweaks. I'll talk about that in a second.

**Key Features:**

  * **Useful editing tools**
  * **Comic book conversion**
  * **Extract cover images from comics**



Without any further ado, let's dive into CBconvert.

### Initial Impressions 👨‍💻

While the converter can run on **Linux, Windows, and macOS** , I tried it on a Linux system.

I started by adding a few comics (available in the public domain) to the app by using the 'Add Files' option in the sidebar menu. I was able to add multiple comics, without many issues.

Likewise, I then moved on to take a look at the various function tabs.

The **first tab called 'Input'** housed a few options, such as to **set the minimum size limit** , **opting for only grayscale images** , and more. I didn't need to use those, but the options are certainly useful if you want to add prerequisites to the files you wish to convert.

![][3]

The **second tab is where you can do the conversion of comics** , it is called 'Output'. I set the output directory, and selected the 'ZIP' archive format for getting a **.cbz file output**.

It also had the option to add a suffix to the output file, and to remove any non-image files from the archive, as shown below.

![][4]

After all the output settings were set, I clicked on ' **Convert'**. It then started to process all the comics one by one. The operation was quick, with the desired end-results.

![][5]

You're maybe wondering; _why does this cover look different from the one before?_

Well, before converting these comics, I took the liberty of trying my hand at tweaking the visuals of the comic books.

Thanks to the ' **Transform** ' tab that allowed me to play around with various settings such as the **brightness** , **contrast** , **input/output levels** , and more.

![][6]

I would say that **this feature needs more polishing** , as the changes were not being reflected in real-time for a preview, it took some time for the changes to appear.

📋

Do keep in mind that I didn't have to select the other comics, all of them received the same tweaks, alongside the 'Daredevil' one.

Then, **there's a third tab called 'Image'** , it allowed me to export the cover photo in various image formats such as JPEG, PNG, TIFF, WebP and more.

![][7]

CBconvert also features some options to **create a thumbnail from the cover pic** , **tweak the image quality** , **make it into grayscale** , and even **apply some resizing filters** to it.

### 📥 Get CBconvert

You can grab the latest release of CBconvert from its [GitHub][8] repo for other platforms, and for Linux, you can opt for the Flathub package from [Flathub][9].

[CBconvert (Flathub)][9]

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/cbconvert/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/content/images/2023/09/CBconvert_1.jpg
[2]: https://go.dev/
[3]: https://news.itsfoss.com/content/images/2023/09/CBconvert_2.jpg
[4]: https://news.itsfoss.com/content/images/2023/09/CBconvert_3.jpg
[5]: https://news.itsfoss.com/content/images/2023/09/CBconvert_6.jpg
[6]: https://news.itsfoss.com/content/images/2023/09/CBconvert_5.jpg
[7]: https://news.itsfoss.com/content/images/2023/09/CBconvert_4.jpg
[8]: https://github.com/gen2brain/cbconvert
[9]: https://flathub.org/apps/io.github.gen2brain.cbconvert
