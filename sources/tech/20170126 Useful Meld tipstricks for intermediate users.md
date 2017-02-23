Useful Meld tips/tricks for intermediate users
============================================================

### On this page

1.  [1\. Navigation][1]
2.  [2\. Things you can do with changes][2]
3.  [4\. Filtering text][3]

*   [Conclusion][4]

Meld is a feature-rich visual comparison and merging tool available for Linux. If you're new to the tool, you can head to our [beginner's guide][5] to get a quick know-how of how the utility works. However, if you've already read that, or are already using Meld for basic comparison/merging tasks, you'll be glad to know that in this tutorial, we will be discussing some really useful tips/tricks that will make your experience with the tool even better.

_But before we jump onto the installation and explanation part, it'd be worth sharing that all the instructions and examples presented in this tutorial have been tested on Ubuntu 14.04 and the Meld version we've used is 3.14.2_.

### Meld tips/tricks for intermediate users

### 1\. Navigation

As you might already know (and we've also mentioned this in our beginner's guide), standard scrolling is not the only way to navigate between changes while using Meld - you can easily switch from one change to another using the up and down arrow keys located in the pane that sits above the edit area:

[
 ![Navigating in Meld](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/meld-go-next-prev-9.png) 
][6]

However, this requires you to move your mouse pointer to these arrows and then click one of them (depending on where you want to go - up or down) repeatedly. You'll be glad to know that there exists an even easier way to jump between changes: just use your mouse's scroll wheel to perform scrolling when mouse pointer is on the central change bar.

[
 ![The change bar](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/meld-center-area-scrolling.png) 
][7]

This way, you can navigate between changes without taking your eyes off them, or getting distracted.

### 2\. Things you can do with changes

Just look at the last screenshot in the previous section. You know what those black arrows do, right? By default, they let you perform the merge/change operation - merge when there's no confliction, and change when there's a conflict in the same line.

But do you know you can delete individual changes if you want. Yes, that's possible. For this, all you have to do is to press the Shift key when dealing with changes. You'll observe that arrows get converted into crosses. 

[
 ![Things you can do with changes](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/meld-delete-changes.png) 
][8]

Just click any of them, and the corresponding change will get deleted.

Not only delete, you can also make sure that conflicting changes do not change the lines when merged. For example, here's an example of a conflicting change:

[
 ![Delete changes in Meld](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/meld-conflicting-change.png) 
][9] 

Now, if you click any the two black arrows, the line where the arrow points will get changed, and will become similar to the corresponding line of other file. That's fine as long as you want this to happen. But what if you don't want any of the lines to get changed? Instead, the aim is to insert the changed line above or below the corresponding line in other file.

What I am trying to say is that, for example, in the screenshot above, the need is to add 'test 2' above or below 'test23', rather than changing 'test23' to 'test2'. You'll be glad to know that even that's possible with Meld. Just like you press the Shift key to delete comments, in this case, you'll have to press the Ctrl key. 

And you'll observe that the current action will be changed to insert - the dual arrow icons will confirm this.

[
 ![Change actions](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/meld-ctrl-insert.png) 
][10]

As clear from the direction of arrows, this action helps users to insert the current change above or below (as selected) the corresponding change in other file.

### 3\. Customize the way files are displayed in Meld's editor area

There might be times when you would want the text size in Meld's editor area to be a bit large (for better  or more comfortable viewing), or you would want the text lines to wrap instead of going out of visual area (meaning you don't want to use the horizontal scroll bar at the bottom).

Meld provides some display- and font-related customization options in its _Preferences_ menu under the _Editor_ tab (_Edit->Preferences->Editor_) where you'll be able to make these kind of tweaks:

[
 ![Meld preferences](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/meld-editor-tab.png) 
][11]

So here you can see that, by default, Meld uses the system defined font width. Just uncheck that box under the _Font_ category, and you'll have a plethora of font type and size options to select from.

Then in the _Display_ section, you'll see all the customization options we were talking about: you can set Tab width, tell the tool whether or not to insert spaces instead of tabs, enable/disable text wrapping, make Meld show line numbers and whitespaces (very useful in some cases) as well as use syntax highlighting.

### 4\. Filtering text

There are times when not all the changes that Meld shows are important to you. For example, while comparing two C programming files, you may not want changes in comments to be shown by Meld as you only want to focus on code-related changes. So, in that case, you can tell Meld to filter (or ignore) comment-related changes.

For example, here's a Meld comparison where comment-related changes are highlighted by the tool:

[
 ![Filter Text in Meld](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/meld-changes-with-comments.png) 
][12]

And here's the case where Meld has ignored the same changes, focusing only on the code-related changes:

[
 ![Ignore Changes in Meld](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/meld-changes-without-comments.png) 
][13]

Cool, isn't it? So, how did that happen? Well, for this, what I did was, I enabled the 'C comments' text filter in _Edit->Preferences->Text Filters_ tab:

[
 ![C-Comments in Meld](https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/meld-text-filters.png) 
][14]

As you can see, aside from 'C comments', you can also filter out C++ comments, Script comments, leading or all whitespaces, and more. What more, you can also define custom text filters for any specific case you are dealing with. For example, if you are dealing with log-files and don't want changes in lines that begin with a particular pattern to be highlighted by Meld, then you can define a custom text filter for that case.

However, keep in mind that in order to define a new text filter, you need to know Python language as well as how to create regular expressions in that language.

### Conclusion

All the four tips/tricks discussed here aren't very difficult to understand and use (except, of course, if you want to create custom text filters right away), and once you start using them, you'll agree that they are really beneficial.  The key here is to keep practicing, otherwise any tip/trick you learn will slip out of your mind in no time.

Do you know or use any other intermediate level Meld tip or trick? If yes, then you are welcome to share that in comments below.

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/

作者：[Ansh ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/
[1]:https://www.howtoforge.com/tutorial/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/#-navigation
[2]:https://www.howtoforge.com/tutorial/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/#-things-you-can-do-with-changes
[3]:https://www.howtoforge.com/tutorial/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/#-filtering-text
[4]:https://www.howtoforge.com/tutorial/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/#conclusion
[5]:https://www.howtoforge.com/tutorial/beginners-guide-to-visual-merge-tool-meld-on-linux/
[6]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/big/meld-go-next-prev-9.png
[7]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/big/meld-center-area-scrolling.png
[8]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/big/meld-delete-changes.png
[9]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/big/meld-conflicting-change.png
[10]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/big/meld-ctrl-insert.png
[11]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/big/meld-editor-tab.png
[12]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/big/meld-changes-with-comments.png
[13]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/big/meld-changes-without-comments.png
[14]:https://www.howtoforge.com/images/beginners-guide-to-visual-merge-tool-meld-on-linux-part-2/big/meld-text-filters.png
