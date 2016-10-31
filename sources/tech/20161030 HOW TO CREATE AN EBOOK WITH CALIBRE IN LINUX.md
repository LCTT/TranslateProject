HOW TO CREATE AN EBOOK WITH CALIBRE IN LINUX [COMPLETE GUIDE]
====


[![Guide to create an eBoook in Linux with Calibre](https://itsfoss.com/wp-content/uploads/2016/10/Create-an-eBook-in-Linux.jpg)][8]

_Brief: This beginner’s guide shows you how to quickly create an ebook with Calibre tool in Linux._

Ebooks have been growing by leaps and bounds in popularity since Amazon started selling them several years ago. The good news is that they are very easy to create with Free and Open Source tools.

In this tutorial, I’ll show you how to create an eBook in Linux.

### CREATING AN EBOOK IN LINUX

To create an ebook you’ll need two pieces of software: a word processor (I’ll be using [LibreOffice][7], of course) and Calibre. [Calibre][6]is a great ebook reader and library program. You can use it to [open ePub files in Linux][5] or to manage your collection of eBooks.

Besides this software, you also need an ebook cover (1410×2250) and your manuscript.

### STEP 1

First, you need to open your manuscript with your word processor. Calibre can automatically create a table of contents for you. In order to do so, you need to set the chapter titles into your manuscript to Heading 1\. Just highlight the chapter titles and selection “Heading 1” from the paragraph style drop down box.

![ebook creation with Calibre](https://itsfoss.com/wp-content/uploads/2016/10/header1.png)

If you plan to have sub-chapters and want them to be added to the TOC, then make all those titles Heading 2.

Now, save your document as an HTML file.

### STEP 2

In Calibre, click the “Add books” button. After the dialog box appears, you can browse to where your HTML file is located and add it to the program.

![create ebooks with Calibre](https://itsfoss.com/wp-content/uploads/2016/10/calibre1.png)

### STEP 3

Once the new HTML file is added to the Calibre library, select the new file and click the “Edit metadata” button. From here you can add the following information: Title, Author, cover image, description and more. When you’re done, click “OK”.

![creating ebooks with Calibre in Linux](https://itsfoss.com/wp-content/uploads/2016/10/calibre2.png)

### STEP 4

Now click the “Convert books” button.

In the new windows, there are quite a few options available, but you don’t need to use them all.

[Suggested ReadFix Pear Updater Issue In Pear OS 8][4]

![creating ebooks with Calibre in Linux -2](https://itsfoss.com/wp-content/uploads/2016/10/calibre3.png)

From the top right of the new screen, you select epub. Calibre also gives your the option to create a mobi file, but I found that those files didn’t always work the way I wanted them to.

![creating ebooks with Calibre in Linux -3](https://itsfoss.com/wp-content/uploads/2016/10/calibre4.png)

### STEP 5

Click the “Look & Feel” tab from the left side of the new dialog box. Now, select the “Remove spacing between paragraphs”.

![creating ebooks with Calibre in Linux - 4](https://itsfoss.com/wp-content/uploads/2016/10/calibre5.png)

Next, we will create the table of contents. If don’t plan to use a table of contents in your book, you skip this step. Select the Table of Contents tab. From there, click on the select the wand icon to the right of “Level 1 TOC (XPath expression)”.

![creating ebooks with Calibre in Linux - 5](https://itsfoss.com/wp-content/uploads/2016/10/calibre6.png)

In the new window, select “h1” from the drop down menu under “Match HTML tags with tag name”. Click “OK” to close the window. If you set up sub-chapters, set the “Level 2 TOC (XPath expression)” to h2.

![creating ebooks with Calibre in Linux - 6](https://itsfoss.com/wp-content/uploads/2016/10/calibre7.png)

Before we start the conversion, select EPUB Output. On the new page, select the “Insert inline Table of Contents” option.

![creating ebooks with Calibre in Linux - 7](https://itsfoss.com/wp-content/uploads/2016/10/calibre8.png)

Now all you have to do is click “OK” to start the conversion process. Unless you have a huge file, the conversion should finish fairly quickly.

There you go, you just created a quick ebook

For the more advanced users who know how to write CSS, Calibre gives your the option to add CSS styling to your text. Just go to the “Look & Feel” section and select the styling tab. If you try to do this with mobi, it won’t accept all of the styling for some reason.

![creating ebooks with Calibre in Linux - 8](https://itsfoss.com/wp-content/uploads/2016/10/calibre9.png)

Well, that was fairly easy, isn’t it? I hope this tutorial helped you to create eBooks in Linux.


--------------------------------------------------------------------------------

via: https://itsfoss.com/create-ebook-calibre-linux/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+ItsFoss+%28Its+FOSS%21+An+Open+Source+Blog%29

作者：[John Paul ][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[1]:http://pinterest.com/pin/create/button/?url=https://itsfoss.com/create-ebook-calibre-linux/&description=How+To+Create+An+Ebook+With+Calibre+In+Linux+%5BComplete+Guide%5D&media=https://itsfoss.com/wp-content/uploads/2016/10/Create-an-eBook-in-Linux.jpg
[2]:https://www.linkedin.com/cws/share?url=https://itsfoss.com/create-ebook-calibre-linux/
[3]:https://twitter.com/share?original_referer=https%3A%2F%2Fitsfoss.com%2F&source=tweetbutton&text=How+To+Create+An+Ebook+With+Calibre+In+Linux+%5BComplete+Guide%5D&url=https%3A%2F%2Fitsfoss.com%2Fcreate-ebook-calibre-linux%2F&via=%40itsfoss
[4]:https://itsfoss.com/fix-updater-issue-pear-os-8/
[5]:https://itsfoss.com/open-epub-books-ubuntu-linux/
[6]:http://calibre-ebook.com/
[7]:https://www.libreoffice.org/
[8]:https://itsfoss.com/wp-content/uploads/2016/10/Create-an-eBook-in-Linux.jpg
