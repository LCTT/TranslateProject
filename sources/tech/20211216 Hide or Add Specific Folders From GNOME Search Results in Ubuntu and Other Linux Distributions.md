[#]: subject: "Hide or Add Specific Folders From GNOME Search Results in Ubuntu and Other Linux Distributions"
[#]: via: "https://itsfoss.com/control-gnome-file-search/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Hide or Add Specific Folders From GNOME Search Results in Ubuntu and Other Linux Distributions
======

You might have already noticed that when you search for something in the GNOME menu/activities area, it also shows the files with names matching the searched term along with installed applications.

![Search in GNOME activities shows installed applications and matching files][1]

That’s a handy feature. If you remember the file name or even part of it, you can easily search for it and open it just by pressing the Super key (Windows key) and typing the name.

But there are a few nit bits around this search feature that you might not know about or never cared for.

In this article, I’ll share how you can control the GNOME search feature, add or hide folders from the search option and disable it completely.

_**Note: This is exclusively for distributions using GNOME. Please [verify which desktop environment you are using][2] and ensure it is GNOME.**_

### Default locations for file search

The GNOME search feature utilizes a utility called [Tracker Miner FS][3]. Please do not get alarmed by the terms like _tracker_ and _miner_. It’s not spying on you or mining crypto on your system. It basically functions as a search engine and a database to provide you instant search results.

By default, the file indexing takes place in the meta folders like Documents, Music, Pictures and Videos directories and their sub-directories. Files in the Home and Downloads folders are also indexed but not the ones in their sub-directories.

![Default locations for file search][4]

If you have created some new directories in your home folder, those files will not be indexed.

However, the recently accessed files are also indexed automatically. If you have opened a file recently, it is added to the ‘recent files’ and will appear in the search results irrespective of its location.

In case you didn’t know already, you can see your recently accessed files in the file manager:

![Accessing recent files in GNOME file manager][5]

### Adding a folder content to search results

Suppose you have created a folder for coding projects in your home directory. These files won’t be indexed and won’t appear in search results (unless you have opened a file by double clicking and it is added to the recent files).

To add the files from a custom folder in the search result, you can add the folder to the search locations.

Open the Settings application by searching for it in the menu/activity area:

![Search for settings application][6]

Go to the **Search** option from the left sidebar and click on the **Search Locations** option at the top. In the pop-up window, go to the **Other** tab and click on the **\+ symbol**. It will add the file browser and you can add your desired folder.

![Adding a custom folder content to search][7]

If you test by searching a filename in the just added folder, you should see it in the search results now. It should be instant but if it is not, try logging out or rebooting the system.

### Hide a folder from search results

If you don’t want files from a specific folder to appear in the search result, you can hide it.

If you don’t want the content of the meta folders like Pictures, Documents, Videos in search, you disable it from the Search Location settings.

![Disable meta folders from the search][8]

If you want the contents of only a certain folder under Documents to NOT appear in the search result, you just have to create a new file named **.nomedia** in that folder. You may also name the file .git, .trackerignore or .hg.

![Hide specific folder from search results by creating file named .nomedia or .hg or .git][9]

If you don’t see the option to create new file in right mouse lick, you’ll have to do some tweaking to add the [create new document option in the right click context menu][10]. Also note that any files starting with a . in its name is hidden from normal view. To [toggle hidden files][11], press Ctrl+H keys.

This hiding might not work immediately because the file is probably already indexed. You may have to log out or reboot to see the effect.

If you access a file manually, it will be added to the recent files and will appear in the search result despite the ignore file in the folder.

You can delete the recent files history or disable it altogether (if you want) from **Settings-&gt; Privacy-&gt; File History &amp; Trash**. I don’t see the need of it, though, so make your own decision here.

![Clear or disable file access history in GNOME][12]

### Disable search results for all files

If you do not want any files to appear in the search results, you can disable search for Files altogether from the search settings.

![Disable search results for all files][13]

You should disable the search functionality altogether by clicking the Search toggle button at the top as it may interfere with the normal functionality of the GNOME desktop environment.

More details on it can be found on the [project’s homepage][14].

### Conclusion

The _**discussion here is about file search**_. GNOME desktop also searches in Calendar, Characters and some other utilities. You can disable or enable the available search options but let’s not focus on that.

I hope you find this quick tip helpful in [customizing your GNOME experience][15]. If you know some other neat trick that you want others to know, please share it with us in the comments.

--------------------------------------------------------------------------------

via: https://itsfoss.com/control-gnome-file-search/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/gnome-file-search-result.png?resize=800%2C355&ssl=1
[2]: https://itsfoss.com/find-desktop-environment/
[3]: https://wiki.gnome.org/Projects/Tracker/Documentation/GettingStarted
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/gnome-default-search-location.png?resize=800%2C533&ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/access-recent-files-gnome-linux.png?resize=735%2C414&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/settings-search-ubuntu-20-04.jpg?resize=800%2C230&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/gnome-add-search-location.png?resize=800%2C525&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/disable-folders-from-search.png?resize=800%2C533&ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/hide-specific-folder-from-search-results.png?resize=751%2C382&ssl=1
[10]: https://itsfoss.com/add-new-document-option/
[11]: https://itsfoss.com/hide-folders-and-show-hidden-files-in-ubuntu-beginner-trick/
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/clear-or-disable-file-history-gnome-linux.png?resize=800%2C389&ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/disable-search-for-files-gnome.png?resize=800%2C475&ssl=1
[14]: https://gnome.pages.gitlab.gnome.org/tracker/
[15]: https://itsfoss.com/gnome-tricks-ubuntu/
