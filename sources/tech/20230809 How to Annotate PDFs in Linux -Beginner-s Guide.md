[#]: subject: "How to Annotate PDFs in Linux [Beginner's Guide]"
[#]: via: "https://itsfoss.com/annotate-pdf-linux/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Annotate PDFs in Linux [Beginner's Guide]
======

Reading something interesting in PDF format and feel the need of adding a comment or highlight certain text? Perhaps you want to provide feedback on the PDF document?

There are [several PDF editors available for Linux users][1]. But you don't need a dedicated PDF editor just for this simple task.

Most PDF readers have built-in annotation features and you can use it to quickly and easily highlight text and add comments.

I recently 'discovered' it when I was reviewing the upcoming 4th edition of the [Linux Pocket Guide book by O'Reilly][2]. The publisher requested suggestions on the PDF file itself.

Let me share how you can annotate PDFs in Linux using Evince (the default PDF reader in GNOME). The same can be achieved with Okular (the default PDF reader in KDE) too.

Most Linux distributions should come with either of the above tools. If not, you can easily install them. I am not going into the installation process. Please look for them in your distribution's software manager.

### Annotating PDFs with Evince Document Viewer

Open the desired PDF file with Evince (also known as Document Viewer in GNOME).

You'll see an edit option in the top left side of the Document Viewer application. Click on it and the following two options will appear:

  * Note text (for adding comments)
  * Highlight text (for highlighting selected text)



![][3]

Let me share their workings in detail.

#### Adding comments in PDF

To add a comment, **click on Note text** option.

You'll notice that the cursor gets changed into a **+** sign. You can click anywhere in the document and it will immediately add a note icon and open another window for adding your notes.

![][4]

I suggest clicking at the end of the line so that the note icon is on the white space and doesn't obstruct the actual text of the file.

Once you have added the desired note, you can **click the x button on the note field to close** the note text window.

💡

You can move the annotation icons by dragging them across the screen.

#### Highlight text in PDF

Similarly, you can choose the Highlight text option to highlight specific text in the PDF file.

After that, just select the text you want to highlight. It will start highlighting as soon as you start moving the cursor.

![][5]

💡

You can also add notes on the highlighted text to provide some context on the highlight. To add text, click on the highlighted text (which is clickable now).

#### Saving the annotated file

You might have added the note on the PDF but the changes are not saved yet.

Saving the change is simple. Press the `Ctrl+S` keys and it will give you the option of where you want to save the file.

You can overwrite the existing PDF file or save it as a new one.

![][6]

📋

The notes, comments and highlights are attached to the PDF file and they should be available even if you open the PDF file with some other tool that can read annotations.

#### Reading the annotations

To read a text note or comment, just hover over the note icon or highlighted text. It will show the notes immediately.

![][7]

Don't click the icons to read the text. Clicking will open it for editing.

#### Edit an existing annotation

Let's say you noticed that you need to add more details to an existing note. All you have to do is to click the Note icon.

It will open the added text. You can read it and you can also edit it if you like. The same works for the notes in the highlighted text section.

However, it won't work completely for editing the highlighted text. It will work if you think you have to highlight more text around an existing one. But if you want to shorten the highlighted text, it won't work.

For that, you have to delete the highlight and add it again.

#### Delete an existing annotation

Deleting annotations is as simple as right-clicking on the annotation and selecting the 'Remove Annotation' option.

![][8]

The same is valid for highlighted text too.

#### Modifying the look and feel of the annotations

Don't like the default yellow color or the notes icon? All this can be changed.

Right-click on an existing annotation and select the 'Annotation Properties...' option.

![][9]

You can change the author of the comment, color and opacity of the annotation. You can also change the icons for the notes and markup type for highlights (strikeout, underline etc).

![][10]

This is for existing annotations only. I could not find a way to change the properties by default for all future annotations.

### More PDF edition options

Dedicated PDF editors are available if you need more than simple text notes and highlighting.

![][11]

These tools may allow you to rearrange or merge PDF files.

![][11]

You can also [compress the PDF files][12] if you want.

![][11]

There is no end to PDF editing. I hope you liked this beginner's tip on PDF annotation in Linux.

KDE's Okular also provides PDF annotation options. Perhaps I could do a similar article on Okular some other day.

Please provide your feedback in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/annotate-pdf-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/pdf-editors-linux/
[2]: https://www.oreilly.com/library/view/linux-pocket-guide/9780596806347/?ref=itsfoss.com
[3]: https://itsfoss.com/content/images/2023/08/annotate-pdf-with-gnome-document-viewer-in-linux.png
[4]: https://itsfoss.com/content/images/2023/08/adding-comments-to-pdf-linux.png
[5]: https://itsfoss.com/content/images/2023/08/highlight-text-pdf-linux.png
[6]: https://itsfoss.com/content/images/2023/08/save-annotated-file.png
[7]: https://itsfoss.com/content/images/2023/08/reading-annotations-pdf-linux-1.png
[8]: https://itsfoss.com/content/images/2023/08/remove-annotations-from-pdf-in-linux.png
[9]: https://itsfoss.com/content/images/2023/08/change-annotation-design-pdf.png
[10]: https://itsfoss.com/content/images/2023/08/changing-annotation-properties.png
[11]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[12]: https://itsfoss.com/compress-pdf-linux/
