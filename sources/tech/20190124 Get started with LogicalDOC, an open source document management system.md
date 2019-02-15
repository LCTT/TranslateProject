[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Get started with LogicalDOC, an open source document management system)
[#]: via: (https://opensource.com/article/19/1/productivity-tool-logicaldoc)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

Get started with LogicalDOC, an open source document management system
======
Keep better track of document versions with LogicalDOC, the 12th in our series on open source tools that will make you more productive in 2019.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/document_free_access_cut_security.png?itok=ocvCv8G2)

There seems to be a mad rush at the beginning of every year to find ways to be more productive. New Year's resolutions, the itch to start the year off right, and of course, an "out with the old, in with the new" attitude all contribute to this. And the usual round of recommendations is heavily biased towards closed source and proprietary software. It doesn't have to be that way.

Here's the 12th of my picks for 19 new (or new-to-you) open source tools to help you be more productive in 2019.

### LogicalDOC

Part of being productive is being able to find what you need when you need it. We've all seen directories full of similar files with similar names, a result of renaming them every time a document changes to keep track of all the versions. For example, my wife is a writer, and she often saves document revisions with new names before she sends them to reviewers.

![](https://opensource.com/sites/default/files/uploads/logicaldoc-1.png)

A coder's natural solution to this problem—Git or another version control tool—won't work for document creators because the systems used for code often don't play nice with the formats used by commercial text editors. And before someone says, "just change formats," [that isn't an option for everyone][1]. Also, many version control tools are not very friendly for the less technically inclined. In large organizations, there are tools to solve this problem, but they also require the resources of a large organization to run, manage, and support them.

![](https://opensource.com/sites/default/files/uploads/logicaldoc-2.png)

[LogicalDOC CE][2] is an open source document management system built to solve this problem. It allows users to check in, check out, version, search, and lock document files and keeps a history of versions, similar to the version control tools used by coders.

LogicalDOC can be [installed][3] on Linux, MacOS, and Windows using a Java-based installer. During installation, you'll be prompted for details on the database where its data will be stored and have an option for a local-only file store. You'll get the URL and a default username and password to access the server as well as an option to save a script to automate future installations.

After you log in, LogicalDOC's default screen lists the documents you have tagged, checked out, and any recent notes on them. Switching to the Documents tab will show the files you have access to. You can upload documents by selecting a file through the interface or using drag and drop. If you upload a ZIP file, LogicalDOC will expand it and add its individual files to the repository.

![](https://opensource.com/sites/default/files/uploads/logicaldoc-3.png)

Right-clicking on a file will bring up a menu of options to check out files, lock files against changes, and do a whole host of other things. Checking out a file downloads it to your local machine where it can be edited. A checked-out file cannot be modified by anyone else until it's checked back in. When the file is checked back in (using the same menu), the user can add tags to the version and is required to comment on what was done to it.

![](https://opensource.com/sites/default/files/uploads/logicaldoc-4.png)

Going back and looking at earlier versions is as easy as downloading them from the Versions page. There are also import and export options for some third-party services, with [Dropbox][4] support built-in.

Document management is not just for big companies that can afford expensive solutions. LogicalDOC helps you keep track of the documents you're using with a revision history and a safe repository for documents that are otherwise difficult to manage.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/productivity-tool-logicaldoc

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney (Kevin Sonney)
[b]: https://github.com/lujun9972
[1]: http://www.antipope.org/charlie/blog-static/2013/10/why-microsoft-word-must-die.html
[2]: https://www.logicaldoc.com/download-logicaldoc-community
[3]: https://docs.logicaldoc.com/en/installation
[4]: https://dropbox.com
