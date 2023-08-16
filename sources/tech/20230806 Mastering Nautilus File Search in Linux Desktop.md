[#]: subject: "Mastering Nautilus File Search in Linux Desktop"
[#]: via: "https://itsfoss.com/nautilus-file-search/"
[#]: author: "Sreenath https://itsfoss.com/author/sreenath/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Mastering Nautilus File Search in Linux Desktop
======

GNOME's Nautilus file manager is quite versatile.

Don't believe me? Check out this article to see how you can [tweak Nautilus to its full capability][1].

One of the overlooked Nautilus features is the file search. Not many Linux users utilize its full potential.

And that's why I created this tutorial to share some tips on using the file search option in the Nautilus file manager.

I know that a seasoned Linux user can achieve the same with the [find command][2] in the terminal but using the GUI is preferable by many desktop users.

Let's begin with the simplest of the search options.

### Search for files by name

Open Nautilus and click on the magnifying glass on the top bar. This will open a search bar, where you can enter the query string.

As you type, the results will get refined and will match upon typing the full file name.

![Searching in Nautilus][3]

💡

Search is performed in the current directory and its subdirectories. You can enable the [hidden file view][4] to include hidden files in the search result.

### Search files based on time

With Nautilus, you can filter your search according to the time the file was created, modified or last accessed.

For this, click on the search button and start typing. As you start typing, you will notice a drop-down menu near the search button. Click on it. This will give you a menu with options to filter your search.

![Click on the Dropdown menu][5]

Click on the “Select Dates” button on the drop-down menu. Also, select the option “ **File Name** ” to match by file name.

![Setting for search by date][6]

This will give you an expanded menu where you can select the date since which the file is created, modified or last accessed.

![Set the criteria][7]

Here, if you want to set a custom date, click on the calendar icon as shown in the screenshot below:

![Click on Calendar Icon][8]

Now, you will get a small calendar and can select the date accordingly.

![Select the Date][9]

Once you set a date of your choice from the list, you can see the criteria applied on the search bar and files based on that condition are showed to you.

![Date criteria applied][10]

### Search files based on file type

You can also filter your search based on file type. Let's say you are looking for a PDF file.

As in the previous step, click on the search icon and start typing the name of the file. Now, from the drop-down menu, click on “Anything” option with “File Name” selected.

![Search based on File type][11]

Select the type of file you want to search from the expanded view. Here, I have selected "PDF/Postscript" option.

![Set File type required][12]

Once you have selected your required file type, you can see the criteria applied on the search bar. You'll also see the result accordingly.

![File Type Criteria applied][13]

Didn't find the desired file type in the search option? Scroll down to the bottom and click on “other types”.

![Get More File Types][14]

This will give you more file types.

![More file types listed][15]

### Search into file content, not names

By default, the file search is performed on the name of the files. If you want to know if there are files that contain certain word, Nautilus allows you to do that as well.

First, click on the search icon and start typing. Now, as in the previous sections, go to the dropdown menu.

In the dropdown menu, instead of selecting “[ **File Name**][2]”, select “ **Full Text** ”.

Now, you can search for a particular string and filter that search either based on a particular date or file type. The method for filtering is the same as mentioned in the previous sections.

![Select "Full Text" option][16]

Here, I have used a string “text to be” and you can see that several files with that particular string are listed. Also, you can see, that part is also highlighted.

### Search only files or only folders

By default, Nautilus searches for both files and folders. You can refine your search to either files or folders.

To do this, on the drop-down menu, select “File Name” and then from the type list select either files or folders as shown below.

![Search among only files or folders][17]

This will filter out the results according to your choice.

### Apply multiple filters

You can combine the date filter and type filter together to get a more refined search. For this, select each criteria from their respective dropdown list.

You can see, in the below screenshot, that I have searched for a file that contains the string “to be search”. The criteria I have applied is, a PDF file, created since1 day.

![Apply multiple filters][18]

### More Nautilus tips and tweaks

Nautilus is sufficient for most search scenarios. If you need more, there are dedicated GUI tools too that allow you to perform a desktop-wide, custom search.

![][19]

Want more such Nautilus tips? How about [opening files as root][20]?

![][19]

Or combining the power of terminal with the file manager?

![][19]

There are many more such tips in the article here. Feel free to check it out.

![][19]

I hope you like these tips and they help improve your desktop Linux experience slightly better.

Do you know any other such cool tips? Do share it in the comments.

--------------------------------------------------------------------------------

via: https://itsfoss.com/nautilus-file-search/

作者：[Sreenath][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sreenath/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/nautilus-tips-tweaks/
[2]: https://linuxhandbook.com/find-command-examples/?ref=itsfoss.com
[3]: https://itsfoss.com/content/images/2023/08/Click-on-the-search-button-and-start-typing.png
[4]: https://itsfoss.com/show-hidden-files-linux/
[5]: https://itsfoss.com/content/images/2023/08/Access-more-search-options.png
[6]: https://itsfoss.com/content/images/2023/08/click-on-time-option-to-get-expanded-list.png
[7]: https://itsfoss.com/content/images/2023/08/Search-according-to-date-and-time.png
[8]: https://itsfoss.com/content/images/2023/08/click-on-calendar-icon.png
[9]: https://itsfoss.com/content/images/2023/08/select-date-from-calendar.png
[10]: https://itsfoss.com/content/images/2023/08/Showing-search-criterea-date-on-search-result.png
[11]: https://itsfoss.com/content/images/2023/08/click-on-type-option-to-get-expanded.png
[12]: https://itsfoss.com/content/images/2023/08/Search-based-on-file-type-like-pdf.png
[13]: https://itsfoss.com/content/images/2023/08/showing-search-criteria-type-on-search-result.png
[14]: https://itsfoss.com/content/images/2023/08/click-on-other-type.png
[15]: https://itsfoss.com/content/images/2023/08/complete-list-of-types.png
[16]: https://itsfoss.com/content/images/2023/08/Search-inside-the-file.png
[17]: https://itsfoss.com/content/images/2023/08/search-for-only-folders-or-only-files.png
[18]: https://itsfoss.com/content/images/2023/08/applied-multiple-criteria.png
[19]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[20]: https://itsfoss.com/open-nautilus-as-administrator/
