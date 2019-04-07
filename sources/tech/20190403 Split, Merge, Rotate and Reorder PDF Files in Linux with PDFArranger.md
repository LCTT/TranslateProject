[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Split, Merge, Rotate and Reorder PDF Files in Linux with PDFArranger)
[#]: via: (https://itsfoss.com/pdfarranger-app/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Split, Merge, Rotate and Reorder PDF Files in Linux with PDFArranger
======

PDFArranger is a nifty little tool that allows you to split, merge, rotate and reorder one or multiple PDF files in Linux.

[PDFArranger][1] is actually a fork of [PDF-Shuffler project][2]. Even the icon of both project is the same. PDF-Shuffler has not seen a new development in last seven years so I am glad that someone forked it to continue the development. That’s the beauty of open source where a project is never really dead because others can revive it.

Let’s talk about PDFArranger, what it can do and how it works.

### Using PDFArranger to split, merge, rotate and rearrange PDF documents

You can drag and drop PDF files in the running PDFArranger app or right click on the file and open with PDFArranger.

It displays the PDF document page by page and this is why it takes some time and consumes CPU in opening the file. CPU consumption is minimal once the file has been opened completely.

![PDFArranger displays the PDF docs on per page basis][3]

Keep in mind that PDFArranger is not a PDF viewer. You cannot double click on a page and read its content. You need to know the exact page numbers that you want to cut/merge. So, use your regular PDF reader to read the books, note down the details and then use PDF Arranger as per your requirement.

PDFArranger gives you the following ‘editing’ and operating options:

  * You can rotate page(s) to left or right.
  * You can crop page(s) by giving the percentage of width from left and right and percentage of height from top and bottom.
  * You can zoom in and zoom out.
  * You can delete page(s).
  * You can open multiple files and merge them together.
  * If consecutive pages are selected, you can reverse their order.
  * You can select pages and export them as a new PDF document.
  * You can rearrange the pages by selecting and then drag and drop them to desired place.
  * There is no undo option for reverting individual operating but your changes are not saved unless you save them or export them.
  * Edited files are not saved on the same file on its own. You have to specify the file name. In other words, save (Ctrl+S) is same as export.
  * You won’t be promoted to save the file if you accidentally click the close button.



You can see all these options by right clicking on a page or selection of pages. You can also see some of the options on the menu bar of the application.

![Editing options in PDFArranger][4]

You are not restricted to split part of only one document. You can open multiple PDF documents in one window for merging part of (or entire) PDF files. You’ll also notice that after adding multiple documents, the application changes the title of the opened file to ‘Several documents’.

![Multiple PDF files can be opened for splitting and merging][5]

### Installing PDFArranger in Ubuntu & other Linux

Installing PDFArranger may not be a straightforward task in all the distributions but I’ll try to list the steps anyway.

If you use Arch-based distribution, you can find PDFArranger in the [AUR][6] and in the [community repository][7].

PDFArranger is available in the [Universe repository][8] starting [Ubuntu 19.04][9]. Older Ubuntu versions and other Ubuntu-based distributions such as Linux Mint can use [this unofficial PPA][10]. The [PPA][11] supports Ubuntu 18.04, 18.10 and 16.04. You can use the PPA in Ubuntu 19.04 as well for the newer versions of PDFArranger.

Open a terminal and use the following commands:

```
sudo add-apt-repository ppa:linuxuprising/apps
sudo apt update
sudo apt install pdfarranger
```

I couldn’t find PDFArranger in Fedora repositories but you can still [install PIP][12] and then use PIP to install this application. However, you need to install plenty of dependencies before that. You can find the [installation instructions on the GitHub page of the project][1].

If you want, you can also get the source code of PDFArranger from its release page and compile it on your own.

[PDFArranger Source Code][13]

### Thoughts on PDFArranger

I like such nifty utilities that tries to solve a smaller problem. While there are other [PDF editing apps on Linux][14], some of them could be complicated to use with plenty of options.

PDFArranger focuses on ‘arranging’ PDF documents and it does a fine task there. I am glad that a developer has forked the defunct project PDF -Shuffler project and is continuing to develop and maintain this useful tool.

As far as using PDFArranger is concerned I liked most of its feature. I would like to see the addition of ‘undo’ option and the prompt to save the document when closing an unsaved edited document. I hope these features are implemented in a future release.

Meanwhile, if you have a GitHub account, you may [star the repository][1] to follow the development of the project and thank the developer.

If you use some other PDF editing tool, share it in the comment section below. For PDFArranger, don’t hesitate to share your opinions on the plus and minus of the tool.

--------------------------------------------------------------------------------

via: https://itsfoss.com/pdfarranger-app/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://github.com/jeromerobert/pdfarranger
[2]: https://sourceforge.net/projects/pdfshuffler
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/pdf-arranger-1.png?ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/04/pdf-arranger-2.png?resize=800%2C440&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/04/pdf-arranger-3.png?ssl=1
[6]: https://itsfoss.com/best-aur-helpers/
[7]: https://www.archlinux.org/packages/community/any/pdfarranger/
[8]: https://itsfoss.com/ubuntu-repositories/
[9]: https://itsfoss.com/ubuntu-19-04-release-features/
[10]: https://launchpad.net/~linuxuprising/+archive/ubuntu/apps
[11]: https://itsfoss.com/ppa-guide/
[12]: https://itsfoss.com/install-pip-ubuntu/
[13]: https://github.com/jeromerobert/pdfarranger/releases
[14]: https://itsfoss.com/pdf-editors-linux/
