7 Best eBook Readers for Linux
======
**Brief:** In this article, we are covering some of the best ebook readers for Linux. These apps give a better reading experience and some will even help in managing your ebooks.

![Best eBook readers for Linux][1]

Lately, the demand for digital books has increased as people find it more comfortable in reading a book on their handheld devices, Kindle or PC. When it comes to the Linux users, there are various ebook apps that will serve your purpose in reading and organizing your ebook collections.

In this article, we have compiled seven best ebook readers for Linux. These ebook readers are best suited for pdf, epubs and other ebook formats.

## Best eBook readers for Linux

I have provided installation instructions for Ubuntu as I am using Ubuntu right now. If you use [non-Ubuntu Linux distributions][2], you can find most of these eBook applications in the software repositories of your distro.

### 1. Calibre

[Calibre][3] is one of the most popular eBook apps for Linux. To be honest, it's a lot more than just a simple eBook reader. It's a complete eBook solution. You can even [create professional eBooks with Calibre][4].

With a powerful eBook manager and easy to use interface, it features creation and editing of an eBook. Calibre supports a variety of formats and syncing with other ebook readers. It also lets you convert one eBook format to another with ease.

The biggest drawback of Calibre is that it's too heavy on resources and that makes it a difficult choice as a standalone eBook reader.

![Calibre][5]

#### Features

  * Managing eBook: Calibre allows sorting and grouping eBooks by managing metadata. You can download metadata for an eBook from various sources or create and edit the existing field.
  * Supports all major eBook formats: Calibre supports all major eBook formats and is compatible with various e-readers.
  * File conversion: You can convert any ebook format to another one with the option of changing the book style, creating a table of content or improving margins while converting. You can convert your personal documents to an ebook too.
  * Download magazines from the web: Calibre can deliver stories from various news sources or through RSS feed.
  * Share and backup your library: It gives an option of hosting your eBook collection over its server which you can share with your friends or acccess from anywhere, using any device. Backup and import/export feature allows you to keep your collection safe and easy portability.



#### Installation

You can find it in the software repository of all major Linux distributions. For Ubuntu, search for it in Software Center or use he command below:

`sudo apt-get install calibre`

### 2. FBReader

![FBReader: eBook reader for Linux][6]

[FBReader][7] is an open source, lightweight, multi-platform ebook reader supporting various formats like ePub, fb2, mobi, rtf, html etc. It includes access to popular network libraries from where you can download ebooks for free or buy one.

FBReader is highly customizable with options to choose colors, fonts, page-turning animations, bookmarks and dictionaries.

#### Features

  * Supports a variety of file formats and devices like Android, iOS, Windows, Mac and more.
  * Synchronize book collection, reading positions and bookmarks.
  * Manage your library online by adding any book from your Linux desktop to all your devices.
  * Web browser access to your stored collection.
  * Supports storage of books in Google Drive and organizing of books by authors, series or other attributes.



#### Installation

You can install FBReader ebook reader from the official repository or by typing the below command in terminal.
```
sudo apt-get install fbreader
```

Or, you can grab a .deb package from [here][8] and install it on your Debian based distributions.

### 3. Okular

[Okular][9] is another open source and cross-platform document viewer developed by KDE and is shipped as part of the KDE Application release.

![Okular][10]

#### Features

  * Okular supports various document formats like PDF, Postscript, DjVu, CHM, XPS, ePub and others.
  * Supports features like commenting on PDF documents, highlighting and drawing different shapes etc.
  * These changes are saved separately without modifying the original PDF file.
  * Text from an eBook can be extracted to a text file and has an inbuilt text reading service called Jovie.



Note: While checking the app, I did discover that the app doesn't support ePub file format in Ubuntu and its derivatives. The other distribution users can still utilize it's full potential.

#### Installation

Ubuntu users can install it by typing below command in Terminal :
```
sudo apt-get install okular
```

### 4. Lucidor

Lucidor is a handy e-book reader supporting epub file formats and catalogs in OPDS formats. It also features organizing the collection of e-books in local bookcase, searching and downloading from the internet and converting web feeds and web pages into e-books.

Lucidor is XULRunner application giving you a look of Firefox with tabbed layout and behaves like it while storing data and configurations. It's the simplest ebook reader among the list and includes configurations like text justifications and scrolling options.

![lucidor][11]

You can look out for the definition from Wiktionary.org by selecting a word and right click > lookup word options. It also includes options to Web feeds or web pages as e-books.

You can download and install the deb or RPM package from [here.][12]

### 5. Bookworm

![Bookworm eBook reader for Linux][13]

Bookworm is another free and open source ebook reader supporting different file formats like epub, pdf, mobi, cbr and cbz. I wrote a dedicated article on features and installation for Bookworm apps, read it here: [Bookworm: A Simple yet Magnificent eBook Reader for Linux][14]

#### Installation
```
sudo apt-add-repository ppa:bookworm-team/bookworm
sudo apt-get update
sudo apt-get install bookworm
```

### 6. Easy Ebook Viewer

[Easy Ebook Viewer][15] is another fantastic GTK Python app for reading ePub files. With features like basic chapter navigation, continuing from the last reading positions, importing from other ebook file formats, chapter jumping and more, Easy Ebook Viewer is a simple and minimalist ePub reader.

![Easy-Ebook-Viewer][16]

The app is still in its initial stage and has support for only ePub files.

#### Installation

You can install Easy Ebook Viewer by downloading the source code from [github][17] and compiling it yourself along with the dependencies. Alternatively, the following terminal commands will do the exact same job.
```
sudo apt install git gir1.2-webkit-3.0 libwebkitgtk-3.0-0 gir1.2-gtk-3.0 python3-gi
git clone https://github.com/michaldaniel/Ebook-Viewer.git
cd Ebook-Viewer/
sudo make install
```

After successful completion of the above steps, you can launch it from the Dash.

### 7. Buka

[Buka][18] is mostly an ebook manager with a simple and clean user interface. It currently supports PDF formats and is designed to help the user focus more on the content. With all the basic features of pdf reader, Buka lets you navigate through arrow keys, has zoom options and you can view 2 pages side by side.

You can create separate lists of your PDF files and switch between them easily. Buka also provides a built-in translation tool but you need an active internet connection to use the feature.

![Buka][19]

#### Installation

You can download an AppImage from the [official download page.][20] If you are not aware of it, read [how to use AppImage in Linux][21]. Alternatively, you can install it from the command line:
```
sudo snap install buka
```

### Final Words

Personally, I find Calibre best suited for my needs. Also, Bookworm looks promising to me and I am using it more often these days. Though, the selection of an ebook application totally depends on your preference.

Which ebook app do you use? Let us know in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/best-ebook-readers-linux/

作者：[Ambarish Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/ambarish/
[1]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/10/best-ebook-readers-linux-800x450.png
[2]:https://itsfoss.com/non-ubuntu-beginner-linux/
[3]:https://www.calibre-ebook.com
[4]:https://itsfoss.com/create-ebook-calibre-linux/
[5]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/09/Calibre-800x603.jpeg
[6]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/10/fbreader-800x624.jpeg
[7]:https://fbreader.org
[8]:https://fbreader.org/content/fbreader-beta-linux-desktop
[9]:https://okular.kde.org/
[10]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/09/Okular-800x435.jpg
[11]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/09/lucidor-2.png
[12]:http://lucidor.org/lucidor/download.php
[13]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/08/bookworm-ebook-reader-linux-800x450.jpeg
[14]:https://itsfoss.com/bookworm-ebook-reader-linux/
[15]:https://github.com/michaldaniel/Ebook-Viewer
[16]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/09/Easy-Ebook-Viewer.jpg
[17]:https://github.com/michaldaniel/Ebook-Viewer.git
[18]:https://github.com/oguzhaninan/Buka
[19]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/09/Buka2-800x555.png
[20]:https://github.com/oguzhaninan/Buka/releases
[21]:https://itsfoss.com/use-appimage-linux/
