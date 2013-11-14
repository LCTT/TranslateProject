Apache OpenOffice vs. LibreOffice
================================================================================
> The two open source office productivity suites are similar, yet one appears to have a slight advantage.

[Apache OpenOffice][1] and [LibreOffice][2] are the modern descendants of OpenOffice.org. For the last few years, almost all Linux distributions have included LibreOffice as their default office suite. However, in the past eighteen months, OpenOffice has reappeared, newly organized into an Apache project, and free software users now have the choice of two full-featured suites instead of one.

Users also have the difficulty of deciding between two almost-identical choices. The two diverged three years ago, and while that can be a long period in software development, in this case, the differences are only starting to become obvious. While considerable cleanup has gone on behind the scenes, the feature sets and underlying logic in both has mutated in only minor ways from the days of OpenOffice.org.

Here and there, you can find new features in the individual applications, especially in the Writer word processor. However, most of the differences are at a higher level, in support for formats and fonts, the policy towards extensions, and, most of all, in the efforts to modernize and standardize the interface.

### Differences in the Apps ###

Most of the features in LibreOffice's and OpenOffice's applications are the same. In Draw, there appear to be no difference at all. In Impress, the main difference is that LibreOffice's latest release includes support for controlling a slide show from an Android device. And although the selection of slide backgrounds differs between the two, either selection should be adequate unless you are looking for a favorite. Similarly, the greatest difference between the two versions of the Calc spreadsheet is that, in LibreOffice's, you can create data forms.

Even in Writer, the most popular application, the differences are generally in a minor key. In LibreOffice, the status bar at the bottom of the editing window now includes a word and character count. In addition, LibreOffice's comments can be anchored to paragraphs rather than a single point, and, in a correction of a longstanding bug, in footnotes now display besides the text to which they refer. LibreOffice also adds a simplified Find field, similar to one in a web browser, while omitting the option to insert a graphical horizontal line -- a feature that few must have used for the last decade or more.

### Formats and Fonts ###

Some of the more noticeable differences fall under the category of format and font support. For instance, OpenOffice continues to support saving to formats that have gone out of fashion, such as AportisDoc (Palm) and Pocket Word. It can open .docx files, but, unlike LibreOffice, not save to it.

LibreOffice also has the advantage in font support. The latest version supports OpenType, the preferred format for modern fonts because of its support for multiple languages and advanced typography. Even more importantly, by going to File -> Properties -> Fonts, you can embed fonts into the document, eliminating with a single click the need to ensure font compatibility.

Such features give LibreOffice a decided edge when exchanging files with Microsoft Office users. In general, neither OpenOffice nor LibreOffice interact best with Microsoft formats when a document is mostly text and contains a minimum of tables, draw objects, and complex formatting. In both, for example, you are best off sharing something like a brochure in .PDF format rather than the native Open Document Format.

However, if you do exchange native and Microsoft formats, LibreOffice has some decided advantages. Not only does it both read and write to recent Microsoft formats, but its advantages in font handling removes any need for font subsitution -- a major cause of problems when exchanging files. While other problems remain, such as differences in feature implementation, LibreOffice should generally be the more reliable handler of Microsoft Office files.

### Extension Policies ###

Both OpenOffice and LibreOffice support well-rounded collections of extensions that can be downloaded and added in minutes to enhance or alter features. In most cases, an extension that works with one will work with the other.

The difference is that, with LibreOffice, you don't have to install the most popular extensions. Instead, LibreOffice installs with them already enabled or integrated. These extensions include Lightproof, a basic grammar checker; Report Builder for summarizing and printing from data bases; Presentation Minimizer for reducing the size of presentations; Wiki Publisher for blogging, and Presentation Console for delivering slide shows, as well as a number of others.

All these extensions are available for OpenOffice as well. The difference is that, with OpenOffice, you need to know about them and deliberately find them. Effectively, this limitation makes a number of features unavailable to new users. When OpenOffice (and LibreOffice) have made such efforts in recent releases to provide useful modern templates and clip art, this omission is a crippling oversight, especially when it is so easily corrected.

### Interfaces in Transition ###

In the twelve years that Sun Microsystems and Oracle have owned the OpenOffice.org code, the interface, like so many features, was almost entirely neglected. The result is that today, both OpenOffice and LibreOffice are suites with a healthy set of features, but interfaces that are generally stuck in the mid-1990s. Some superficial aspects have been removed, but far more remains to be updated.

In the latest release, OpenOffice's efforts to overhaul the interface have been restricted largely to the sidebar, an feature that has to be specifically enabled in LibreOffice from Tools -> Options -> LibreOffice -> Advance, and is labeled as "experimental."

The sidebar is a collection of features, primarily for manual formatting. Since this use comes at the expense of encouraging the use of styles, as the logic of the code intends, it is easy to dismiss. However, at its best, the sidebar is an immense simplification of some of the tabs for formatting characters and paragraphs, such as the Border tab in all applications, and the Format tab for spreadsheet cells. With luck, its re-conceptualization of controls will eventually find its way to the menus and style dialogue windows.

LibreOffice has been even more adventuresome. For example, the task pane in Impress, while similar to the sidebar, summarizes most of the steps in slide design in the names of its tabs.

But it is the Writer editing window where most of LibreOffice's interface improvements have taken place. A word and character count has been added to the status bar at the bottom of the window, and the cramped sub-menus for managing and editing templates have been replaced with a stream-lined interface in which buttons replace drop-down menus.

Even more obvious, the main text frame has been reduced in LibreOffice to cross-hairs at the four corners. In the same way, headers and footers are invisible until you click where they should be, when four small right angles indicate their borders.

A less successful effort is a tab in LibreOffice's editing window for managing headers and footers. Aside from the fact that the tab encourages manual formatting, it has the annoying habit of hiding part of the first line of a new page as it is typed.

These efforts are far from complete, although LibreOffice has also rearranged options in a number of dialogue windows. At times, they make LibreOffice a disconcerting mixture of vintage interfaces and modern minimalism that can be disconcerting to move between. However, at least LibreOffice is trying to address the long-delayed problem of the interfaces -- something OpenOffice has not had much time to consider.

### Making a Choice ###

An average user, whose documents are rarely longer than two or three pages, would often have to check the title bar to be sure whether they were using LibreOffice or OpenOffice. However, depending on their needs, advanced users will probably find LibreOffice currently has a small, but definite advantage.

This advantage is hardly to be unexpected. For one thing, LibreOffice had many months to advance while OpenOffice was concerned with setting up governance and doing a code audit. These tasks might be useful and necessary, but they do not make for improvements in the code that ordinary users are likely to notice.

For another, the LibreOffice fork was begun largely by members of [Go-oo][3], an unofficial fork of OpenOffice.org that wanted to accelerate change. While Apache OpenOffice was forming, LibreOffice attracted talent around the world who wanted to code and were excited by the idea that everything was suddenly up for reconsideration.

Nobody has any done a census, but my impression is that when the OpenOffice.org community divided, the more adventurous contributors chose to focus on LibreOffice, although a few, such as the semi-independent documentation team, deliberately work for both projects.

However, the most important advantage for LibreOffice is what might be called the license-drain. That is, while the Apache License is compatible with LibreOffice's Lesser GNU General Public License, the Less GNU General Public License is incompatible with the Apache License. In other words, while LibreOffice can borrow code freely from OpenOffice, OpenOffice cannot borrow at all from LibreOffice. Strictly speaking, it must do clean-room implementations of features it wants to borrow from LibreOffice.

This situation may change, especially since Apache OpenOffice enjoys enormous name recognition compared to LibreOffice. Yet LibreOffice has quickly earned widespread support and has an active community that has done more in three years than OpenOffice.org managed in twelve.

For now, whether you use Apache OpenOffice or LibreOffice is likely to make very little difference unless you need a particular feature. However, I suspect that, unless something unexpected happens, LibreOffice's slight advantage is only going to widen. Whichever you decide on, you may want to schedule a re-evaluation in a few years' time.

--------------------------------------------------------------------------------

via: http://www.datamation.com/applications/apache-openoffice-vs.-libreoffice-1.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.openoffice.org/
[2]:http://www.libreoffice.org/
[3]:https://en.wikipedia.org/wiki/Go-oo