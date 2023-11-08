[#]: subject: "Tracking Changes and Version Management with LibreOffice"
[#]: via: "https://itsfoss.com/libreoffice-version-control/"
[#]: author: "Sreenath https://itsfoss.com/author/sreenath/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Tracking Changes and Version Management with LibreOffice
======

LibreOffice, the free and open-source office suite comes with a handy collaborative edit feature, which records changes to a document.

It lets you view the changes, comment on it, approve or reject changes etc. You can find this feature handy if **multiple users (or a workgroup) utilize LibreOffice Writer** or Spreadsheets.

So, how can you use this feature? What do you have to do to track changes and versions of a document meant for collaboration?

Considering you already have the [latest LibreOffice installed][1], let me tell you about it here.

📋

For real-time collaboration, you need LibreOffice online (managed or your own hosted solution). We are not discussing that here.

### Enabling to Record Changes

By default, the feature is not enabled. So, first, you need to enable it.

Open LibreOffice and go to **Edit → Track Changes → Record**.

![Toggle Record feature][2]

Now, you need to enable the Track changes toolbar, for convenience. For this, go to **View → Toolbars → Track Changes**.

![Enable Track Changes][3]

You can see a small toolbar appeared on the bottom.

![Track Changes Toolbar][4]

You can use these buttons to manage the changes. Options like accept/reject/ changes, adding comments, and comparing versions can be found here.

### Add User Data

Before you start working with recording changes, you must add User Data, to identify changes. Without this, any change made will be marked as something done by “Unknown user”.

First, go to **Tools → Options**.

![Click on Options][5]

Here, inside the “ **User Data** ” section, add your **name** , **address** , **email** etc., if you prefer, but **name is a must**.

![Enter User Data][6]

That's it. You are good to go.

**Suggested Read 📖**

![][7]

### Working with Recording Changes

Now, let us take a look at how all of this works:

#### Locating Changes

First, when you add a new word to the document, it appears in a yellow text.

![Changes are recorded in LibreOffice][8]

As, you can see from the above screenshot, when a word is removed, it is not deleted from the document. Instead, it is marked with a strikeout annotation. When you add another word in its place, that also appears highlighted and underlined.

You can notice a small bar on the extreme left of the lines that include some kind of change, **even if it is a small comma addition**.

#### Knowing about the changes

Now that you have located the changes appearing to the document, what about the author who made the change?

LibreOffice also notes the author (user) who has made the change to a particular document. You can get this detail through several places.

Hover over the marked text, to know about that particular change. It will show the author, changed date and time.

![Author of Changes][9]

Or, you can click on the **manage track changes button** on the bottom toolbar, to get an overview of all changes as shown in the screenshot below:

![Manage Changes window \(Click to enlarge the image\)][10]

#### Accepting/Rejecting Changes

To accept or reject a particular change, first, click on that particular change.

Next, click on the **Accept change button** (with a tick mark) to accept it. Or use the **Reject button** (with a cross mark) to reject the change.

![Accept and Reject Button \(Click to enlarge the image\)][11]

If you accept a change, the text will be fixed and will change to black color in case of addition. If you are removing something, the highlighted word will be removed.

On the other hand, if you reject a change, the addition/deletion will be cancelled.

Similarly, you can accept/reject all the changes at once, using the **Accept All/ Reject All** buttons. It is placed adjacent to the individual accept and reject buttons on the toolbar.

![Accept or Reject All Changes][12]

Another way to accept and reject changes is through the **Manage Changes** dialog box. Click on the Manage Changes button on the bottom toolbar, as described in the previous section.

Now, you can select a particular change and then use the bottom buttons for Accepting/Rejecting.

![Manage Changes through Dialog Box][13]

#### Inserting Comments

You can either insert a comment at a random position, or add a comment to a particular change.

To add a comment on a place, click on that particular position (to bring the cursor there). Next, click on the **Add Comment button** on the bottom toolbar.

![Click on Add Comment Button \(Click to enlarge the image\)][14]

This will open up a right sidebar while pointing out the place you will be adding the comment. Type the message there as shown below:

![Enter Comment Text][15]

You can click on the adjacent rectangle button to get several actions on that comment. Use the top “ **Comment** ” button, to hide/unhide the comments.

Similarly, you can click on a particular change, and then click on the “ **Insert Track Change Comment** ” button.

![Track Change Comment \(Click to enlarge the image\)][16]

It will look a bit different, but serves the same purpose. In the next dialog box, enter the comment. Now, click OK to save the comment.

![Insert Track Change Comment \(Click to enlarge the image\)][17]

You have now added a comment to that change.

So, when you head to the **Manage Changes** dialog box, you can see the comment right to the mentioned change. Pretty handy, right? Of course, one of the [best open-source alternatives to Microsoft Office][18]. You should not expect any less 😉

![View Track Change Comment][19]

#### Save a Version

While there is an auto-save feature to protect your document from a crash, there is no auto-versioning of documents.

So, once you have made some changes, you can save a version of it.

Go to **File → Versions**.

![File → Versions][20]

Here, you can save the current version of the document.

![Click on Save New Version][21]

Insert a version comment to identify it easily, and then click OK.

![Insert Version Comment][22]

You can now view multiple versions of the document by navigating to the same menu option. Instead of saving a new version, you can select the existing version and hit " **Open** " to access it.

**Suggested Read 📖**

![][7]

#### Filter Changes

LibreOffice provides a way to filter the changes based on author, time range, etc. This should help you find certain changes fast when there are lots of it.

First, hit the **Manage Changes** button to get to the dialog box where you see the changes. Here, go to the **Filters Tab**.

![Filter based on Author][23]

Next, you can set the criteria.

I have set to **view the changes made by the author “It's FOSS”**. So, when we go to the “List” tab, only changes made by author “It's FOSS” will be listed.

![Changes made by a particular Author][24]

#### Compare with Original Document

Once you have completed collaborative editing, you can compare the changed document with the original one. This needs the original one to be saved separately.

So, click on the **Compare button** on the bottom toolbar.

![Click on Compare Button][25]

Now, select the original file from the file chooser.

![Select the Document to Compare][26]

This will give you a highlighted document with changes from the original, along with the Manage Changes dialog box.

![Changes compared][27]

💡

This is useful, when one of the authors has modified a document without recording them.

#### Merge with Original

Once you have completed the changes, save the document.

🚧

If you are planning to merge the collaboratively edited document into an original document, you should not accept changes on the editing document.

Once you have made all the changes, save it, without accepting the changes.

Now, open the original document in LibreOffice and go to **Edit → Track Changes → Merge Document**.

![Select Merge Documents option][28]

From the file chooser, select the edited document, and click Open.

![Open Edited Document to Merge][29]

On the next screen, changes to the original document will be listed, along with a “Manage Changes” dialog box. Click on “ **Accept All** ” and the original document will be merged with the changes.

![Accept All Changes to Merge][30]

**Suggested Read 📖**

![][7]

### Wrapping Up

LibreOffice is a feature-packed document suite. You can do all sorts of things when compared to the proprietary alternatives.

You can also explore more [LibreOffice tips][31] to use it more effectively.

However, many users fail to find/know how to use a certain feature. With this article, I hope, you can now quickly track changes and versions of your document for a good collaborative editing experience.

_💬 What is your favorite part of the LibreOffice Writer editing experience? Any other feature that you want to highlight? Share all about it in the comments below._

--------------------------------------------------------------------------------

via: https://itsfoss.com/libreoffice-version-control/

作者：[Sreenath][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sreenath/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-libreoffice-ubuntu/
[2]: https://itsfoss.com/content/images/2023/11/Click-on-record-to-start-recording-changes.png
[3]: https://itsfoss.com/content/images/2023/11/enable-track-changes-toolbar.png
[4]: https://itsfoss.com/content/images/2023/11/track-changes-toolbar.png
[5]: https://itsfoss.com/content/images/2023/11/Click-on-tools-and-then-select-options.png
[6]: https://itsfoss.com/content/images/2023/11/set-user-data.png
[7]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[8]: https://itsfoss.com/content/images/2023/11/tracking-changes-in-libreoffice-with-annotated-words.png
[9]: https://itsfoss.com/content/images/2023/11/changes-made-by-who.png
[10]: https://itsfoss.com/content/images/2023/11/manage-changes-1.png
[11]: https://itsfoss.com/content/images/2023/11/accept-and-reject-button.png
[12]: https://itsfoss.com/content/images/2023/11/accept-or-reject-all.png
[13]: https://itsfoss.com/content/images/2023/11/manage-changes-through-dialog-box.png
[14]: https://itsfoss.com/content/images/2023/11/Click-on-add-comment-button.png
[15]: https://itsfoss.com/content/images/2023/11/enter-comment-on-the-appropriate-place.png
[16]: https://itsfoss.com/content/images/2023/11/click-on-add-track-change-comment.png
[17]: https://itsfoss.com/content/images/2023/11/inserting-track-change-comment.png
[18]: https://itsfoss.com/best-free-open-source-alternatives-microsoft-office/
[19]: https://itsfoss.com/content/images/2023/11/view-track-change-comment.png
[20]: https://itsfoss.com/content/images/2023/11/go-to-file-versions.png
[21]: https://itsfoss.com/content/images/2023/11/click-on-save-new-version-button.png
[22]: https://itsfoss.com/content/images/2023/11/insert-a-version-comment-and-click-OK.png
[23]: https://itsfoss.com/content/images/2023/11/filter-based-on-author.png
[24]: https://itsfoss.com/content/images/2023/11/Changes-made-by-author-itsfoss.png
[25]: https://itsfoss.com/content/images/2023/11/Click-on-compare-button.png
[26]: https://itsfoss.com/content/images/2023/11/select-the-original-document-to-compare.png
[27]: https://itsfoss.com/content/images/2023/11/compared-changes-highlighted.png
[28]: https://itsfoss.com/content/images/2023/11/select-merge-documents-option.png
[29]: https://itsfoss.com/content/images/2023/11/open-edited-document-to-merge.png
[30]: https://itsfoss.com/content/images/2023/11/accept-all-changes-to-merge-1.png
[31]: https://itsfoss.com/libreoffice-tips/
