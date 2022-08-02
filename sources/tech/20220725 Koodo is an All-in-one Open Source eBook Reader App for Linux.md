[#]: subject: "Koodo is an All-in-one Open Source eBook Reader App for Linux"
[#]: via: "https://itsfoss.com/koodo-ebook-reader/"
[#]: author: "Abhishek Prakash https://itsfoss.com/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Koodo is an All-in-one Open Source eBook Reader App for Linux
======

There are [several ebook readers available for desktop Linux users][1].

Almost all distributions come with a document reader that can open PDF files. It may also support other file formats like epub or Mobi, but that’s not guaranteed.

This is why specialized applications like [Foliate][2] and Calibre are needed to read and manage ebooks in various formats.

Recently, I came across another open source software that boasts several exciting features for an ebook reader.

### Koodo: It has all you can think of

[Koodo][3] is an all-in-one open source ebook reader with features to help you better manage and read your ebooks. It is a cross-platform app you can download on Linux, Windows, and macOS. You can even [use it in a web browser][4].

The user interface looks modern, probably because it is an Electron app. You’ll have to import the books and add them to Koodo. It doesn’t import books by folders. You can select multiple files for import, though. Got too many books? Add some to your favorites for quick access.

![Koodo ebook reader interface][5]

I used the AppImage format, and for reasons unknown, it didn’t show the thumbnails for the file.

![Koodo ebook reader dark mode interface][6]

It supports popular ebook file formats like PDF, Mobi, and Epub. But it doesn’t end here. It also supports comic book formats like CBR, CBZ, and CBT. There is more. It can also read FictionBooks (.fb2), Markdown, and Rich Text Format (RTF), along with MS Office word documents (Docx).

Apart from supporting the huge number of file formats, it also provides several features to improve your reading experience.

You can highlight texts and annotate them with text notes. You can also search for selected text in the current document or on Google.

![Annotate, highlight or translate selected text][7]

The highlighted text and notes can be accessed from the sidebar in the main application window.

There are options for text-to-speech and translating selected text. However, neither of the two features worked in my testing. I used the AppImage version of Koodo.

Koodo supports various layouts. You can read the documents in single-column, two-column, or continuous scrolling layouts. For ePub and Mobi format, it automatically opens in a two-column layout. For PDF, single column layout is selected by default.

You can customize the UI as per your liking. Change the fonts, size, paragraph spacing, text color, background color, line spacing, brightness, and more.

![koodo additional features][8]

Koodo supports night reading mode along with five different themes. You can switch between the themes as per your preference.

You can also synchronize your books and reading data (like highlights, notes, etc.) across devices with Dropbox or other [cloud services][9] that support Webdav protocol.

![You can backup your data in your preferred cloud service][10]

### Getting Koodo on Linux

If you want to experience Koodo for experimentation, you can try its online version. You get to use Koodo in a web browser. Your data is stored locally in the browser, and if you clean the browser cache, you lose the data (highlights, notes, etc. but not the books stored on your computer).

[Try Koodo Online][11]

If you like its features, you can opt to install Koodo on your computer.

There are several options available for Linux users. You have deb file for Debian and Ubuntu-based distributions, RPM for Red Hat and Fedora and Snap, AppImage and ex file for all distributions.

You can get the installer of your choice from the project’s homepage.

[Download Koodo][12]

### Conclusion

Koodo is not perfect. It has a huge list of features, but not everything works flawlessly, as I found in my testing.

Still, it’s a good application that has the potential to become popular among users. There are only a few applications that package so many features.

Kudos to Koodo developer for creating a promising open source application for desktop users.

You can [visit the project’s repository][13] to look into source code, report bugs, or show some love to developers by starring the project.

--------------------------------------------------------------------------------

via: https://itsfoss.com/koodo-ebook-reader/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/best-ebook-readers-linux/
[2]: https://itsfoss.com/foliate-ebook-viewer/
[3]: https://koodo.960960.xyz/en
[4]: https://reader.960960.xyz/#/manager/empty
[5]: https://itsfoss.com/wp-content/uploads/2022/07/koodo-ebook-reader-interface.webp
[6]: https://itsfoss.com/wp-content/uploads/2022/07/koodo-interface.png
[7]: https://itsfoss.com/wp-content/uploads/2022/07/koobo-ebook-reader-features.webp
[8]: https://itsfoss.com/wp-content/uploads/2022/07/koodo-additional-features.webp
[9]: https://itsfoss.com/cloud-services-linux/
[10]: https://itsfoss.com/wp-content/uploads/2022/07/koodo-backup-restore-feature.png
[11]: https://reader.960960.xyz/
[12]: https://koodo.960960.xyz/en
[13]: https://github.com/troyeguo/koodo-reader
