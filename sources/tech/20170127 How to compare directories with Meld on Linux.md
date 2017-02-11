How to compare directories with Meld on Linux
============================================================

### On this page

1.  [Compare directories using Meld][1]
2.  [Conclusion][2]

We've [already covered][4] Meld from a beginner's point of view (including the tool's installation part), and we've also covered some tips/tricks that are primarily aimed at intermediate Meld users. If you remember, in the beginner's tutorial, we mentioned that Meld can be used to compare both files as well as directories. Now that we've already covered file comparison, it's time to discuss the tool's directory comparison feature.

_But before we do that it'd be worth sharing that all the instructions and examples presented in this tutorial have been tested on Ubuntu 14.04 and the Meld version we've used is 3.14.2._

### Compare directories using Meld

To compare two directories using Meld, launch the tool and select the _Directory comparison_ option.

[
 ![Compare directories using Meld](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/meld-dir-comp-1.png) 
][5]

Then select the directories that you want to compare:

[
 ![select the directories](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/meld-sel-dir-2.png) 
][6]

Once that is done, click the _Compare_ button, and you'll see that Meld will compare both directories side by side, like the tool does in case of files:

[
 ![Compare directories visually](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/meld-dircomp-begins-3.png) 
][7]

Of course, these being directories, they are displayed as side-by-side trees. And as you can see in the screenshot above, the differences - whether it's a new file or a changed file -  are highlighted in different colors.

According to Meld's official documentation, each file or folder that you see in the comparison area of the window has a state of its own. A state basically reveals how a particular file/folder is different from the corresponding entry in the other directory.

The following table - taken from the tool's website - explains in details the folder comparison states in Meld.

|**State** | **Appearance** | **Meaning** |
| --- | --- | --- |
| Same | Normal font | The file/folder is the same across all compared folders. |
| Same when filtered | Italics | These files are different across folders, but once text filters are applied, these files become identical. |
| Modified | Blue and bold | These files differ between the folders being compared. |
| New | Green and bold | This file/folder exists in this folder, but not in the others. |
| Missing | Greyed out text with a line through the middle | This file/folder doesn't exist in this folder, but does in one of the others. |
| Error | Bright red with a yellow background and bold | When comparing this file, an error occurred. The most common error causes are file permissions (i.e., Meld was not allowed to open the file) and filename encoding errors. |

By default, Meld shows all the contents of the folders being compared, even if they are same (meaning there's no difference between them). However, you can ask the tool to not display these files/directories by clicking the _Same_ button in the toolbar - the click should disable this button.

[
 ![same button](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/meld-same-button.png) 
][3]

[
 ![Meld compare buttons](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/meld-same-disabled.png) 
][8]

For example, here's our directory comparison when I clicked and disabled the _Same_ button:

[
 ![Directory Comparison without same files](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/meld-only-diff.png) 
][9]

So you can see that only the differences between the two directories (new and modified files) are shown now. Similarly, if you disable the _New_ button, only the modified files will be displayed. So basically, you can use these buttons to customize what kind of changes are displayed by Meld while comparing two directories.

Coming to the changes, you can hop from one change to another using the up and down arrow keys that sit above the display area in the tool's window, and to open two files for side-by-side comparison, you can either double click the name of any of the files, or click the _Compare_ button that sits beside the arrows.

[
 ![meld compare arrow keys](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/meld-compare-arrows.png) 
][10]

**Note 1**: If you observe closely, there are bars on the left and right-hand sides of the display area in Meld window. These bars basically provide "a simple coloured summary of the comparison results." For each differing file or folder, there's a small colored section in these bars. You can click any such section to directly jump to that place in the comparison area.

**Note 2**: While you can always open files side by side and merge changes the way you want, in case you want all the changes to be merged to the corresponding file/folder (meaning you want to make the corresponding file/folder exactly same) then you can use the _Copy Left_ and _Copy Right_ buttons:

[
 ![meld copy right part](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/meld-copy-right-left.png) 
][11]

For example, select a file or folder in the left pane and click the _Copy Right_ button to make the corresponding entry in the right pane exactly same.

Moving on, there's a _Filters_ drop-down menu that sits just next to the _Same_, _New_, and _Modified_ trio of buttons. Here you can select/deselect file types to tell Meld whether or not to show these kind of files/folders in the display area during a directory comparison. The official documentation explains the entries in this menu as "patterns of filenames that will not be looked at when performing a folder comparison."

The entries in the list include backups, OS-specific metadata, version control, binaries, and media.

[
 ![Meld filters](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/meld-filters.png) 
][12]

The aforementioned menu is also accessible by heading to _View->File Filters_. You can add new elements to this menu (as well as remove existing ones if you want) by going to _Edit->Preferences->File Filters_.

[
 ![Meld preferences](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/meld-edit-filters-menu.png) 
][13]

To create a new filter, you need to use shell glob patterns. Following is the list of shell glob characters that Meld recognises:

| **Wildcard** | **Matches** |
| --- | --- |
| * | anything (i.e., zero or more characters) |
| ? | exactly one character |
| [abc] | any one of the listed characters |
| [!abc] | anything except one of the listed characters |
| {cat,dog} | either "cat" or "dog" |

Finally, an important point worth knowing about Meld is that the case of a file's name plays an important part as comparison is case sensitive by default. This means that, for example, the files README, readme and ReadMe would all be treated by the tool as different files.

Thankfully, however, Meld also provides you a way to turn off this feature. All you have to do is to head to the _View_ menu and then select the _Ignore Filename Case_ option.

[
 ![Meld ignore filename case](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/meld-ignore-case.png) 
][14]

### Conclusion

As you'd agree, directory comparison using Meld isn't difficult - in fact I'd say it's pretty easy. The only area that might require time to learn is creating file filters, but that's not to say you should never learn it. Obviously, it all depends on what your requirement is. 

Oh, and yes, you can even compare three directories using Meld, a feature that you can access by _clicking the 3-way comparison_ box when you choose the directories that you want to compare. We didn't discuss the feature in this article, but definitely will in one of our future articles.

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-perform-directory-comparison-using-meld/

作者：[Ansh][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/how-to-perform-directory-comparison-using-meld/
[1]:https://www.howtoforge.com/tutorial/how-to-perform-directory-comparison-using-meld/#compare-directories-using-meld
[2]:https://www.howtoforge.com/tutorial/how-to-perform-directory-comparison-using-meld/#conclusion
[3]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/big/meld-same-button.png
[4]:https://www.howtoforge.com/tutorial/beginners-guide-to-visual-merge-tool-meld-on-linux/
[5]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/big/meld-dir-comp-1.png
[6]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/big/meld-sel-dir-2.png
[7]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/big/meld-dircomp-begins-3.png
[8]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/big/meld-same-disabled.png
[9]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/big/meld-only-diff.png
[10]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/big/meld-compare-arrows.png
[11]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/big/meld-copy-right-left.png
[12]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/big/meld-filters.png
[13]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/big/meld-edit-filters-menu.png
[14]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-3/big/meld-ignore-case.png
