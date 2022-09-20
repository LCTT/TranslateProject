[#]: subject: "GNOME Files Introduces Most-Requested Feature: New File Menu"
[#]: via: "https://www.debugpoint.com/gnome-files-new-file-document/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

GNOME Files Introduces Most-Requested Feature: New File Menu
======
Here’s the “new file” feature in GNOME Files which gives you a new way of creating documents and files. Have a look.

No more tweaking in the backend. The most anticipated feature of creating a new document / new files via the context menu in Files (aka Nautilus) finally arrives.

Developed as part of the [Google Summer of Code 2022][1] (by Ignacy Kuchciński), the change was recently reviewed and merged into the main branch of Files.

### How it looks

When you right-click on the Files, the context menu has a new option, “New File”.

![New File Option in Files Context Menu][2]

The GNOME Files New File option launches an action window, as shown in the below image.

![GNOME Files New File Action Dialog][3]

A couple of things happen behind the scenes when it launches the above dialog box.

You are probably aware that you can create a “Template” folder with templates in your Home directory to easily access commonly used document types. So, Files checks whether you have a Template directory.

If a template directory with templates is present, you get a list of those document types to create a new document.

![GNOME Files New File Template Dialog (when some templates present)][4]

And if you don’t have any templates (which is likely), Files scans your system and shows a list of common file types based on the installed applications in your system.

For example, Text editor, LibreOffice document types – Spreadsheets, presentations, etc.

Some other things happen here. The file extension is selected by default when you choose a file type for a New document. That’s a protected label on the file name text box.

Moreover, if you don’t have any templates or any applications installed, then the Files New Document menu option is not shown at all!

### Future Roadmap

The developer also proposed a future enhancement of this feature, extending its functionality to a greater extent.

When no template is available, the dialog will look like the one below. It will allow you to create files by selecting the applications, including blank files.

In addition, you can directly launch Software to install some applications which can help you create those respective file types.

![Long term vision with additional features (Image Credit: GNOEM Team)][5]

Since this feature is more complex, it may be developed later. There is no timeline as of now.

### Is this available in Files 43 (via GNOME 43)?

However, this change requires some additional design review, in my opinion. I feel it’s not complete. For example, when you have templates, you can not create the standard document types (for text, LibreOffice docs) – those two dialog are mutually exclusive. Also, there are some minor bugs which I find.

Although the feature is [approved and merged][6] at the moment, it could not make it to the [GNOME 43][7] release candidate due to schedule conflicts.

Hopefully, you can get this in GNOME 44 release next year after a good round of review and testing.

### Wrapping Up

Overall, it’s an elegant feature, and I don’t think any other File manager has this advanced design today. Once this FIles New document feature is implemented entirely, it would a nice addition to its excellent set of features.

So, do you like this new design? Do let me know in the comment box.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/gnome-files-new-file-document/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://debugpointnews.com/gsoc-2022/
[2]: https://www.debugpoint.com/wp-content/uploads/2022/09/New-File-Option-in-Files-Context-Menu.jpg
[3]: https://www.debugpoint.com/wp-content/uploads/2022/09/GNOME-Files-New-Document-Action-Dialog.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2022/09/GNOME-Files-New-Document-Template-Dialog.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2022/09/Long-term-vision-with-additional-features.jpg
[6]: https://gitlab.gnome.org/GNOME/nautilus/-/merge_requests/914
[7]: https://www.debugpoint.com/gnome-43/
