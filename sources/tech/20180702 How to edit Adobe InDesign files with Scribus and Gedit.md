How to edit Adobe InDesign files with Scribus and Gedit
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/open-indesign-scribus-gedit-graphic.jpg?itok=OPJaGdA5)

To be a good graphic designer, you must be adept at using the profession's tools, which for most designers today are the ones in the proprietary Adobe Creative Suite.

However, there are times that open source tools will get you out of a jam. For example, imagine you're a commercial printer tasked with printing a file created in Adobe InDesign. You need to make a simple change (e.g., fixing a small typo) to the file, but you don't have immediate access to the Adobe suite. While these situations are admittedly rare, open source tools like desktop publishing software [Scribus][1] and text editor [Gedit][2] can save the day.

In this article, I'll show you how I edit Adobe InDesign files with Scribus and Gedit. Note that there are many open source graphic design solutions that can be used instead of or in conjunction with Adobe InDesign. For more on this subject, check out my articles: [Expensive tools aren't the only option for graphic design (and never were)][3] and [2 open][4][source][4][Adobe InDesign scripts][4].

When developing this solution, I read a few blogs on how to edit InDesign files with open source software but did not find what I was looking for. One suggestion I found was to create an EPS from InDesign and open it as an editable file in Scribus, but that did not work. Another suggestion was to create an IDML (an older InDesign file format) document from InDesign and open that in Scribus. That worked much better, so that's the workaround I used in the following examples.

### Editing a business card

Opening and editing my InDesign business card file in Scribus worked fairly well. The only issue I had was that the tracking (the space between letters) was a bit off and the upside-down "J" I used to create the lower-case "f" in "Jeff" was flipped. Otherwise, the styles and colors were all intact.


![Business card in Adobe InDesign][6]

Business card designed in Adobe InDesign.

![InDesign IDML file opened in Scribus][8]

InDesign IDML file opened in Scribus.

### Deleting copy in a paginated book

The book conversion didn't go as well. The main body of the text was OK, but the table of contents and some of the drop caps and footers were messed up when I opened the InDesign file in Scribus. Still, it produced an editable document. One problem was some of my blockquotes defaulted to Arial font because a character style (apparently carried over from the original Word file) was on top of the paragraph style. This was simple to fix.

![Book layout in InDesign][10]

Book layout in InDesign.

![InDesign IDML file of book layout opened in Scribus][12]

InDesign IDML file of book layout opened in Scribus.

Trying to select and delete a page of text produced surprising results. I placed the cursor in the text and hit Command+A (the keyboard shortcut for "select all"). It looked like one page was highlighted. However, that wasn't really true.

![Selecting text in Scribus][14]

Selecting text in Scribus.

When I hit the Delete key, the entire text string (not just the highlighted page) disappeared.

![Both pages of text deleted in Scribus][16]

Both pages of text deleted in Scribus.

Then something even more interesting happened… I hit Command+Z to undo the deletion. When the text came back, the formatting was messed up.

![Undo delete restored the text, but with bad formatting.][18]

Command+Z (undo delete) restored the text, but the formatting was bad.

### Opening a design file in a text editor

If you open a Scribus file and an InDesign file in a standard text editor (e.g., TextEdit on a Mac), you will see that the Scribus file is very readable whereas the InDesign file is not.

You can use TextEdit to make changes to either type of file and save it, but the resulting file is useless. Here's the error I got when I tried re-opening the edited file in InDesign.

![InDesign error message][20]

InDesign error message.

I got much better results when I used Gedit on my Linux Ubuntu machine to edit the Scribus file. I launched Gedit from the command line and voilà, the Scribus file opened, and the changes I made in Gedit were retained.

![Editing Scribus file in Gedit][22]

Editing a Scribus file in Gedit.

![Result of the Gedit edit in Scribus][24]

Result of the Gedit edit opened in Scribus.

This could be very useful to a printer that receives a call from a client about a small typo in a project. Instead of waiting to get a new file, the printer could open the Scribus file in Gedit, make the change, and be good to go.

### Dropping images into a file

I converted an InDesign doc to an IDML file so I could try dropping in some PDFs using Scribus. It seems Scribus doesn't do this as well as InDesign, as it failed. Instead, I converted my PDFs to JPGs and imported them into Scribus. That worked great. However, when I exported my document as a PDF, I found that the files size was rather large.

![Huge PDF file][26]

Exporting Scribus to PDF produced a huge file.

I'm not sure why this happened—I'll have to investigate it later.

Do you have any tips for using open source software to edit graphics files? If so, please share them in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/adobe-indesign-open-source-tools

作者：[Jeff Macharyas][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/rikki-endsley
[1]:https://www.scribus.net/
[2]:https://wiki.gnome.org/Apps/Gedit
[3]:https://opensource.com/life/16/8/open-source-alternatives-graphic-design
[4]:https://opensource.com/article/17/3/scripts-adobe-indesign
[5]:/file/402516
[6]:https://opensource.com/sites/default/files/uploads/1-business_card_designed_in_adobe_indesign_cc.png (Business card in Adobe InDesign)
[7]:/file/402521
[8]:https://opensource.com/sites/default/files/uploads/2-indesign_.idml_file_opened_in_scribus.png (InDesign IDML file opened in Scribus)
[9]:/file/402531
[10]:https://opensource.com/sites/default/files/uploads/3-book_layout_in_indesign.png (Book layout in InDesign)
[11]:/file/402536
[12]:https://opensource.com/sites/default/files/uploads/4-indesign_.idml_file_of_book_opened_in_scribus.png (InDesign IDML file of book layout opened in Scribus)
[13]:/file/402541
[14]:https://opensource.com/sites/default/files/uploads/5-command-a_in_the_scribus_file.png (Selecting text in Scribus)
[15]:/file/402546
[16]:https://opensource.com/sites/default/files/uploads/6-deleted_text_in_scribus.png (Both pages of text deleted in Scribus)
[17]:/file/402551
[18]:https://opensource.com/sites/default/files/uploads/7-command-z_in_scribus.png (Undo delete restored the text, but with bad formatting.)
[19]:/file/402556
[20]:https://opensource.com/sites/default/files/uploads/8-indesign_error_message.png (InDesign error message)
[21]:/file/402561
[22]:https://opensource.com/sites/default/files/uploads/9-scribus_edited_in_gedit_on_linux.png (Editing Scribus file in Gedit)
[23]:/file/402566
[24]:https://opensource.com/sites/default/files/uploads/10-scribus_opens_after_gedit_changes.png (Result of the Gedit edit in Scribus)
[25]:/file/402571
[26]:https://opensource.com/sites/default/files/uploads/11-large_pdf_size.png (Huge PDF file)
