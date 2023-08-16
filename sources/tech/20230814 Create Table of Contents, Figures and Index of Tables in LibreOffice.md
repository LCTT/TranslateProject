[#]: subject: "Create Table of Contents, Figures and Index of Tables in LibreOffice"
[#]: via: "https://itsfoss.com/libreoffice-table-of-contents/"
[#]: author: "Sreenath https://itsfoss.com/author/sreenath/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Create Table of Contents, Figures and Index of Tables in LibreOffice
======

If you are creating a book, thesis or any such official or academic work, you must add a table of contents to your document.

You may also need to add a table of figures and an index of tables used in the documentation.

In this tutorial, I'll show you how to:

  * Create the table of contents and figures automatically
  * Update the tables when needed
  * Insert the index of tables



### Adding a table of contents in LibreOffice

The table of contents will be generated based on the headings you have. That means a level one heading will be on top; level two and three follows as subsections of the Level one heading and so on.

First, you need to place the cursor on the position where you want to add the Table of Contents because the ToC (table of contents) will be added depending on where your cursor is.

Once you are at the right place, click on the **Insert** button and select **Table of Contents and Index** :

![Select Table of Contents][1]

This will open a dialog box for tweaking the table of contents. For the default ToC, select a name you want for the heading and then press OK.

![Give a Heading and press OK][2]

This will add a simple table of contents for your entire document based on the headings.

![Simple Table of Contents][3]

💡

The elements in the table of contents are clickable. If you want to go to a particular heading, hold down the CTRL key and then click on the item you want to go.

#### Edit an existing table of contents

To tweak the properties of an existing table of contents, right-click on it and select "Edit Index":

![Click on Edit Index][4]

This will open the Table of Contents dialog box, where you can make the changes like the color of the table of contents, etc.

#### Update the table of contents

If you add a table of contents, it is write-protected by default. This means it won't change automatically as the user updates the document.

If you want to make the changes reflect on the Table of Contents, right-click on the ToC and select “ **Update Index** ”.

![Update Index][5]

#### Automatically update the ToC as you add subheadings

But sometimes, for convenience, you may want to update your ToC automatically as you add additional headings.

For this, **uncheck the Protect against manual changes box** on the Table of Contents dialog box. This will give the required permissions to modify the ToC automatically.

![Disable Protection against manual changes][6]

🗒️

I do not prefer the automatic update. First, you should verify the changes and then update the table manually for better control.

#### Multiple-columned table of contents

LibreOffice Writer allows you to add the table of contents in multiple columns.

Go to the Table of Contents dialog box by choosing the 'Edit index' option from the right click context menu.

Now, go to the **Columns** tab. From there, you can change the appearance, like how many columns you want for the ToC.

![Settings for a Two Column Table of Contents][7]

Once you press the OK button, you can see the table of content changed into more than one column.

![Two column table of contents][8]

####

#### Table of contents for chapters

Don't want to apply ToC for the entire document? You can add ToC for chapters, too.

To do this, on the ToC dialog box, select "Chapters" instead of "Entire Document":

![Table of Contents for Chapter][9]

🚧

If you don't have chapters on your document, the table of contents will appear blank.

### Create table of figures

Some academic documents require a table for all the figures and diagrams used.

To create the table of figures, you need to add captions to your image. To do that, right-click on an image you inserted and select "Insert Caption":

![Click on Insert Caption][10]

On the next screen, enter the caption for that image and click OK.

![Add caption to an image][11]

Once you have the captions for all the figures, position the cursor on a place where you want to add the table of figures. Now, select **Insert > Table of Contents and Index**.
From there, select “Table of Figures” from the dropdown menu on the Table of Contents dialog box.

![Setting to add a simple Table of Figures][12]

Here, you can see that I have selected the **Captions** option and selected "Figure" as Category and "Caption Text" as Display.

This way, it will create a Table of Figures with the caption text as entries.

![Table of Figures Appearance][13]

You can CTRL + click on the entry to navigate between them.

### Create an index of tables

An index of tables comes in handy when your document has many tables. In fact, some academic documents require an index of tables.

First, as in the case of the table of figures, adding a caption to your tables will be very helpful in retrieving information. So, right-click on the tables you have added and select “Insert Caption”. Now, provide a caption text and click OK.

![Add caption to a table][14]

Once the tables are ready with the caption, position your cursor on the document where you want the Index of Tables to appear. Now, click on **Insert > Table of Contents and Index**. Select Index of Tables from the drop-down in the Table of Contents dialog box.

![Settings for Index of Tables][15]

Upon clicking OK, you can see that an Index of Tables has been added.

![Index of Tables Appearance][16]

### Bonus: Make table of content attractive

It is possible to make the ToC more attractive by changing the color, adding background image, etc. You can do this on the Table of Contents Dialog box.

For this, go to the "Background" tab. From there, select the color button to apply different background colors to your Table of Contents blocks.

![Add colors to Table of Contents][17]

Or, select the “Image” button to add images, textures, etc. as background for your Table of Content.

![Add an Image background to Table of Contents][18]

### **More on LibreOffice**

There are many more advanced Table of Contents settings in LibreOffice. You can try them all in a sample document.

You may also check out this article on LibreOffice tips.

![][19]

Did you find any other productivity tips and suggestions on this? Comment them below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/libreoffice-table-of-contents/

作者：[Sreenath][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sreenath/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/content/images/2023/08/Select-ToC-from-Insert.png
[2]: https://itsfoss.com/content/images/2023/08/give-a-heading-and-press-ok-for-default-table-of-contents.png
[3]: https://itsfoss.com/content/images/2023/08/Table-of-contents-simple.png
[4]: https://itsfoss.com/content/images/2023/08/click-on-edit-index.png
[5]: https://itsfoss.com/content/images/2023/08/update-index.png
[6]: https://itsfoss.com/content/images/2023/08/protect-against-manual-changes-disabled.png
[7]: https://itsfoss.com/content/images/2023/08/two-column-toc.png
[8]: https://itsfoss.com/content/images/2023/08/multiple-coulmn-toc.png
[9]: https://itsfoss.com/content/images/2023/08/table-of-contents-for-a-chapter.png
[10]: https://itsfoss.com/content/images/2023/08/click-on-insert-caption.png
[11]: https://itsfoss.com/content/images/2023/08/add-caption-to-an-image.png
[12]: https://itsfoss.com/content/images/2023/08/add-a-simple-table-of-figure.png
[13]: https://itsfoss.com/content/images/2023/08/displaying-table-of-figures.png
[14]: https://itsfoss.com/content/images/2023/08/add-caption-to-table.png
[15]: https://itsfoss.com/content/images/2023/08/Index-of-tables-settings.png
[16]: https://itsfoss.com/content/images/2023/08/index-of-tables-applied.png
[17]: https://itsfoss.com/content/images/2023/08/add-colors-to-ToC.png
[18]: https://itsfoss.com/content/images/2023/08/Add-image-background-to-ToC.png
[19]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
