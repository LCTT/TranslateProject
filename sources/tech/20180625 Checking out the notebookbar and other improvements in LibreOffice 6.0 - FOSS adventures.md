Checking out the notebookbar and other improvements in LibreOffice 6.0 – FOSS adventures
======

With any new openSUSE release, I am interested in the improvements that the big applications have made. One of these big applications is LibreOffice. Ever since LibreOffice has forked from OpenOffice.org, there has been a constant delivery of new features and new fixes every 6 months. openSUSE Leap 15 brought us the upgrade from LibreOffice 5.3.3 to LibreOffice 6.0.4. In this post, I will highlight the improvements that I found most newsworthy.

### Notebookbar

One of the experimental features of LibreOffice 5.3 was the Notebookbar. In LibreOffice 6.0 this feature has matured a lot and has gained a new form: the groupedbar. Lets take a look at the 3 variants. You can enable the Notebookbar by clicking on View –> Toolbar Layout and then Notebookbar.

![][1]

Please be aware that switching back to the Default Toolbar Layout is a bit of a hassle. To list the tricks:

  * The contextual groups notebookbar shows the menubar by default. Make sure that you don’t hide it. Change the Layout via the View menu in the menubar.
  * The tabbed notebookbar has a hamburger menu on the upper right side. Select menubar. Then change the Layout via the View menu in the menubar.
  * The groupedbar notebookbar has a menu dropdown menu on the upper right side. Make sure to maximize the window. Otherwise it might be hidden.



The most talked about version of the notebookbar is the tabbed version. This looks similar to the Microsoft Office 2007 ribbon. That fact alone is enough to ruffle some feathers in the open source community. In comparison to the ribbon, the tabs (other than Home) can feel rather empty. The reason for that is that the icons are not designed to be big and bold. Another reason is that there are no sub-sections in the tabs. In the Microsoft version of the ribbon, you have names of the sub-sections underneath the icons. This helps to fill the empty space. However, in terms of ease of use, this design does the job. It provides you with a lot of functions in an easy to understand interface.

![][2]

The most successful version of the notebookbar is in my opinion the groupedbar. It gives you all of the most needed functions in a single overview. And the dropdown menus (File / Edit / Styles / Format / Paragraph / Insert / Reference) all show useful functions that are not so often used.

![][3]

By the way, it also works great for Calc (Spreadsheets) and Impress (Presentations).

![][4]

![][5]

Finally there is the contextual groups version. The “groups” version is not very helpful. It shows a very limited number of basic functions. And it takes up a lot of space. If you want to use more advanced functions, you need to use the traditional menubar. The traditional menubar works perfectly, but in that case I rather combine it with the Default toolbar layout.

![][6]

The contextual single version is the better version. If you compare it to the “normal” single toolbar, it contains more functions and the order in which the functions are arranged is easier to use.

![][7]

There is no real need to make the switch to the notebookbar. But it provides you with choice. One of these user interfaces might just suit your taste.

### Microsoft Office compatibility

Microsoft Office compatibility (especially .docx, .xlsx and .pptx) is one of the things that I find very important. As a former Business Consultant I have created a lot of documents in the past. I have created 200+ page reports. They need to work flawless, including getting the page brakes right, which is incredibly difficult as the margins are never the same. Also the index, headers, footers, grouped drawings and SmartArt drawings need to display as originally composed. I have created large PowerPoint presentations with branded slides with +30 layouts, grouped drawings and SmartArt drawings. I need these to render perfectly in the slideshow. Furthermore, I have created large multi-tabbed Excel sheets with filters, pivot tables, graphs and conditional formatting. All of these need to be conserved when I open these files in LibreOffice.

And no, LibreOffice is still not perfect. But damn, it is close. This time I have seen no major problems when opening older documents. Which means that LibreOffice finally gets SmartArt drawings right. In Writer, the page breaks in different places compared to Microsoft Word. That has always been an issue. But I don’t see many other issues. In Calc, the rendering of the graphs is less beautiful. But it’s similar enough to Excel. In Impress, presentations can look strange, because sometimes you see bigger/smaller fonts in the same slide (and that is not on purpose). But I was very impressed to see branded slides with multiple sections render correctly. If I needed to score it, I would give LibreOffice a 7 out of 10 for Microsoft Office compatibility. A very solid score. Below some examples of compatibility done right.

![][8]

![][9]

![][10]

### Noteworthy features

Finally, there are the noteworthy features. I will only highlight the ones that I find cool. The first one is the ability to rotate images in any degree. Below is an example of me rotating a Gecko.

![][11]

The second cool feature is that the old collection of autoformat table styles are now replaced with a new collection of table styles. You can access these styles via the menubar: Table –> AutoFormat Styles. In the screenshots below, I show how to change a table from the Box List Green to the Box List Red format.

![][12]

![][13]

The third feature is the ability to copy-past unformatted text in Calc. This is something I will use a lot, making it a cool feature.

![][14]

The final feature is the new and improved LibreOffice Online help. This is not the same as the LibreOffice help (press F1 to see what I mean). That is still there (and as far as I know unchanged). But this is the online wiki that you will find on the LibreOffice.org website. Some contributors obviously put a lot of effort in this feature. It looks good, now also on a mobile device. Kudos!

![][15]

If you want to learn about all of the other introduced features, read the [release notes][16]. They are really well written.

### And that’s not all folks

I discussed LibreOffice on openSUSE Leap 15. However, LibreOffice is also available on Android and in the Cloud. You can get the Android version from the [Google Play Store][17]. And you can see the Cloud version in action if you go to the [Collabora website][18]. Check them out for yourselves.

--------------------------------------------------------------------------------

via: https://www.fossadventures.com/checking-out-the-notebookbar-and-other-improvements-in-libreoffice-6-0/

作者：[Martin De Boer][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.fossadventures.com/author/martin_de_boer/
[1]:https://www.fossadventures.com/wp-content/uploads/2018/06/LibreOffice06.jpeg
[2]:https://www.fossadventures.com/wp-content/uploads/2018/06/LibreOffice09.jpeg
[3]:https://www.fossadventures.com/wp-content/uploads/2018/06/LibreOffice11.jpeg
[4]:https://www.fossadventures.com/wp-content/uploads/2018/06/LibreOffice10.jpeg
[5]:https://www.fossadventures.com/wp-content/uploads/2018/06/LibreOffice08.jpeg
[6]:https://www.fossadventures.com/wp-content/uploads/2018/06/LibreOffice07.jpeg
[7]:https://www.fossadventures.com/wp-content/uploads/2018/06/LibreOffice12.jpeg
[8]:https://www.fossadventures.com/wp-content/uploads/2018/06/LibreOffice14.jpeg
[9]:https://www.fossadventures.com/wp-content/uploads/2018/06/LibreOffice15.jpeg
[10]:https://www.fossadventures.com/wp-content/uploads/2018/06/LibreOffice16.jpeg
[11]:https://www.fossadventures.com/wp-content/uploads/2018/06/LibreOffice01.jpeg
[12]:https://www.fossadventures.com/wp-content/uploads/2018/06/LibreOffice02.jpeg
[13]:https://www.fossadventures.com/wp-content/uploads/2018/06/LibreOffice03.jpeg
[14]:https://www.fossadventures.com/wp-content/uploads/2018/06/LibreOffice04.jpeg
[15]:https://www.fossadventures.com/wp-content/uploads/2018/06/LibreOffice05.jpeg
[16]:https://wiki.documentfoundation.org/ReleaseNotes/6.0
[17]:https://play.google.com/store/apps/details?id=org.documentfoundation.libreoffice&hl=en
[18]:https://www.collaboraoffice.com/press-releases/collabora-office-6-0-released/
