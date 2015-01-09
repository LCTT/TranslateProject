Translating By H-mudcup

Easy File Comparisons With These Great Free Diff Tools
================================================================================
by Frazer Kline

File comparison compares the contents of computer files, finding their common contents and their differences. The result of the comparison is often known as a diff.

diff is also the name of a famous console based file comparison utility that outputs the differences between two files. The diff utility was developed in the early 1970s on the Unix operating system. diff will output the parts of the files where they are different.

Linux has many good GUI tools that enable you to clearly see the difference between two files or two versions of the same file. This roundup selects 5 of my favourite GUI diff tools, with all but one released under an open source license.

These utilities are an essential software development tool, as they visualize the differences between files or directories, merge files with differences, resolve conflicts and save output to a new file or patch, and assist file changes reviewing and comment production (e.g. approving source code changes before they get merged into a source tree). They help developers work on a file, passing it back and forth between each other. The diff tools are not only useful for showing differences in source code files; they can be used on many text-based file types as well. The visualisations make it easier to compare files.

----------

![](http://www.linuxlinks.com/portal/content2/png/Meld.png)

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-Meld.png)

Meld is an open source graphical diff viewer and merge application for the Gnome desktop. It supports 2 and 3-file diffs, recursive directory diffs, diffing of directories under version control (Bazaar, Codeville, CVS, Darcs, Fossil SCM, Git, Mercurial, Monotone, Subversion), as well as the ability to manually and automatically merge file differences.

Meld's focus is on helping developers compare and merge source files, and get a visual overview of changes in their favourite version control system.

Features include

- Edit files in-place, and your comparison updates on-the-fly
- Perform twoand three-way diffs and merges
- Easily navigate between differences and conflicts
- Visualise global and local differences with insertions, changes and conflicts marked
- Built-in regex text filtering to ignore uninteresting differences
- Syntax highlighting (with optional gtksourceview)
- Compare two or three directories file-by-file, showing new, missing, and altered files
- Directly open file comparisons of any conflicting or differing files
- Filter out files or directories to avoid seeing spurious differences
- Auto-merge mode and actions on change blocks help make merges easier
- Simple file management is also available
- Supports many version control systems, including Git, Mercurial, Bazaar and SVN
- Launch file comparisons to check what changes were made, before you commit
- View file versioning statuses
- Simple version control actions are also available (i.e., commit/update/add/remove/delete files)
- Automatically merge two files using a common ancestor
- Mark and display the base version of all conflicting changes in the middle pane
- Visualise and merge independent modifications of the same file
- Lock down read-only merge bases to avoid mistakes
- Command line interface for easy integration with existing tools, including git mergetool
- Internationalization support
- Visualisations make it easier to compare your files

- Website: [meldmerge.org][1]
- Developer: Kai Willadsen
- License: GNU GPL v2
- Version Number: 1.8.5

----------

![](http://www.linuxlinks.com/portal/content2/png/DiffMerge.png)

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-DiffMerge.png)
注：上面这个图访问不到，图的地址是原文地址的小图的链接地址，发布的时候在验证一下，如果还访问不到，不行先采用小图或者网上搜一下看有没有大图

DiffMerge is an application to visually compare and merge files on Linux, Windows, and OS X.

Features include:

- Graphically shows the changes between two files. Includes intra-line highlighting and full support for editing
- Graphically shows the changes between 3 files. Allows automatic merging (when safe to do so) and full control over editing the resulting file
- Performs a side-by-side comparison of 2 folders, showing which files are only present in one file or the other, as well as file pairs which are identical, equivalent or different
- Rulesets and options provide for customized appearance and behavior
- Unicode-based application and can import files in a wide range of character encodings
- Cross-platform tool

- Website: [sourcegear.com/diffmerge][2]
- Developer: SourceGear LLC
- License: Licensed for use free of charge (not open source)
- Version Number: 4.2

----------

![](http://www.linuxlinks.com/portal/content2/png/xxdiff.png)

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-xxdiff.png)

xxdiff is an open source graphical file and directories comparator and merge tool.

xxdiff can be used for viewing the differences between two or three files, or two directories, and can be used to produce a merged version. The texts of the two or three files are presented side by side with their differences highlighted with colors for easy identification.

This program is an essential software development tool that can be used to visualize the differences between files or directories, merge files with differences, resolving conflicts and saving output to a new file or patch, and assist file changes reviewing and comment production (e.g. approving source code changes before they get merged into a source tree).

Features include:

- Compare two files, three files, or two directories (shallow and recursive)
- Horizontal diffs highlighting
- Files can be merged interactively and resulting output visualized and saved
- Features to assist in performing merge reviews/policing
- Unmerge CVS conflicts in automatically merged file and display them as two files, to help resolve conflicts
- Uses external diff program to compute differences: works with GNU diff, SGI diff and ClearCase's cleardiff, and any other diff whose output is similar to those
- Fully customizable with a resource file
- Look-and-feel similar to Rudy Wortel's/SGI xdiff, it is desktop agnostic
- Features and output that ease integration with scripts

- Website: [furius.ca/xxdiff][3]
- Developer: Martin Blais
- License: GNU GPL
- Version Number: 4.0

----------

![](http://www.linuxlinks.com/portal/content2/png/Diffuse.png)

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-Diffuse.png)

Diffuse is an open source graphical tool for merging and comparing text files. Diffuse is able to compare an arbitrary number of files side-by-side and offers the ability to manually adjust line-matching and directly edit files. Diffuse can also retrieve revisions of files from bazaar, CVS, darcs, git, mercurial, monotone, Subversion and GNU Revision Control System (RCS) repositories for comparison and merging.

Features include: 

- Compare and merge an arbitrary number of files side-by-side (n-way merges)
- Line matching can be manually corrected by the user
- Directly edit files
- Syntax highlighting
- Bazaar, CVS, Darcs, Git, Mercurial, Monotone, RCS, Subversion, and SVK support
- Unicode support
- Unlimited undo
- Easy keyboard navigation

- Website: [diffuse.sourceforge.net][]
- Developer: Derrick Moser
- License: GNU GPL v2
- Version Number: 0.4.7

----------

![](http://www.linuxlinks.com/portal/content2/png/Kompare.png)

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-Kompare.png)

Kompare is an open source GUI front-end program that enables differences between source files to be viewed and merged. Kompare can be used to compare differences on files or the contents of folders. Kompare supports a variety of diff formats and provide many options to customize the information level displayed.

Whether you are a developer comparing source code, or you just want to see the difference between that research paper draft and the final document, Kompare is a useful tool.

Kompare is part of the KDE desktop environment.

Features include: 

- Compare two text files
- Recursively compare directories
- View patches generated by diff
- Merge a patch into an existing directory
- Entertain you during that boring compile

- Website: [www.caffeinated.me.uk/kompare/][5]
- Developer: The Kompare Team
- License: GNU GPL
- Version Number: Part of KDE

--------------------------------------------------------------------------------

via: http://www.linuxlinks.com/article/2014062814400262/FileComparisons.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://meldmerge.org/
[2]:https://sourcegear.com/diffmerge/
[3]:http://furius.ca/xxdiff/
[4]:http://diffuse.sourceforge.net/
[5]:http://www.caffeinated.me.uk/kompare/
