A beginner's guide to comparing files using visual diff/merge tool Meld on Linux
============================================================

### On this page

1.  [About Meld][1]
2.  [Meld Installation][2]
3.  [Meld Usage][3]
4.  [Conclusion][4]

Now that we've [covered][5] [some][6] command line-based diff/merge tools in Linux, it'd be logical to explain some visual diff/merge tools available for the OS as well. Reason being, not everybody is used-to the command line, and/or command-line based comparison tools could be more difficult to learn and understand for some.

So, we'll kick off this new series with a GUI-based tool dubbed **Meld**.

But before we jump onto the installation and explanation part, it'd be worth sharing that all the instructions and examples presented in this tutorial have been tested on Ubuntu 14.04 and the Meld version we've used is 3.14.2.

### About Meld

[Meld][7] is basically a visual comparison and merging tool that's primarily aimed at developers (however, rest assured that we'll be explaining the tool keeping in mind end-users). The tool supports both two- and three-way comparisons, and not only lets you compare files, but directories and version controlled projects as well.

"Meld helps you review code changes and understand patches," the official website says. "It might even help you to figure out what is going on in that merge you keep avoiding." The tool is licensed under GPL v2.

### Meld Installation

If you are using Ubuntu or any-other Debian-based Linux distro, you can download and install Meld using the following command:

sudo apt-get install meld

Alternatively, you can also use your system's package manager to download the tool. For example, on Ubuntu, you can use the Ubuntu Software Center, or [Ubuntu Software][8], which has replaced the former starting version 16.04 of the OS.

However, it may be possible that the version of Meld in Ubuntu's official repositories is old. So, in that case if you want to use a more recent version, you can download the package from [here][9].  If you choose this method, then all you have to do is to extract the downloaded package, and then run the 'meld' binary present under the 'bin' folder:

~/Downloads/meld-3.14.2/bin$ **./meld** 

FYI, following are the packages that Meld requires:

*   Python 2.7 (Python 3.3 in development)
*   GTK+ 3.14
*   GLib 2.36
*   PyGObject 3.14
*   GtkSourceView 3.14
*   pycairo

### Meld Usage

When the tool is launched, you'll see a screen similar to the following:

[
 ![Meld started](https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/meld-launch-screen-1.png) 
][10]

So you have three options: File comparison, Directory comparison, and Version control view.

Click the 'File comparison' option, and you'll be asked to select the files to compare:

[
 ![Meld file comparison](https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/meld-file-comparison-2.png) 
][11]

As clear from the screenshot above, Meld also lets you perform 3-way comparisons, but - in this first part of this article series - we'll stick to two-way comparisons that are more common.

Moving on, select the files that you want to compare and then click the 'Compare' button. You'll see that the tool opens both files side by side and also highlights the differing lines (as well as differences).

[
 ![Compare files in Meld](https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/meld-diff-in-action-3.png) 
][12]

So the difference is in the second line of both files, and the actual difference is the extra '3' in the second line of file2\. Those black arrows that you see are there to perform the merge/change operation. The right arrow, in this case, will change the second line in 'file2' with the corresponding line from 'file1'. The left arrow will do vice-versa.

After making changes, you can do a Ctrl+s to save them.

So that was a simple example to let you know how Meld works on a basic level. Let's take a look at a slightly more complicated comparison:

[
 ![Meld advanced file comparison](https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/meld-multiple-changes-4.png) 
][13]

Before discussing the changes, it's worth mentioning here that there are areas in Meld GUI that give you visual overview of the changes between the files. Specifically, what we're trying to bring into your notice here are vertical bars at the left and right-hand sides of the window. For example, see the following screenshot:

[
 ![Visual Comparison](https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/meld-multiple-colors-5.png) 
][14]

If you observe closely, the bar in the screenshot above contains some coloured blocks. These blocks are designed to give you an overview of all of the differences between the two files. "Each coloured block represents a section that is inserted, deleted, changed or in conflict between your files, depending on the block's colour used," the official documentation explains.

Now, let's come back to the example we were discussing. The following screenshots show how easy is to understand file changes (as well as merge them) when using Meld:

[
 ![File changes visualized in Meld](https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/meld-makes-it-easy-6.png) 
][15]

[
 ![Meld Example 2](https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/meld-makes-it-easy-7.png) 
][16]

[
 ![Meld Example 3](https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/meld-makes-it-easy-8.png) 
][17]

Moving on, so far, we jumped from one change to another by scrolling the files. However, there may be times when the files being compared are very large, making it difficult to scroll every time you want to jump to a change. For this, you can use the orange-colored arrows in the toolbar which itself sits above the editing area:

[
 ![Go to next change in Meld](https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/meld-go-next-prev-9.png) 
][18]

Here's how you do some of the common things while using Meld: You can use the standard Ctrl+f key-combination to find something in the editor area, press F11 key to make the tool go in full screen mode, and Ctrl+r to refresh (usually used when the any or both of files being compared have changed).

Following are some of the key features that the official Meld website advertises:

*   Two- and three-way comparison of files and directories
*   File comparisons update as you type
*   Auto-merge mode and actions on change blocks help make merges easier
*   Visualisations make it easier to compare your files
*   Supports Git, Bazaar, Mercurial, Subversion, etc.

Note that the list above is not exhaustive. The website contains a dedicated [Features page][19] that contains an exhaustive list of features that Meld offers. All the features listed there are divided in sections based on whether the tool is being used for file comparison, directory comparison, version control, or in the merge mode.

Like any other software tool, there are certain things that Meld can't do. The official website lists at-least one of them: "When Meld shows differences between files, it shows both files as they would appear in a normal text editor. It does not insert additional lines so that the left and right sides of a particular change are the same size. There is no option to do this.".

### Conclusion

We've just scratched the surface here, as Meld is capable of doing a lot more. But it's ok for now, given that it's the first part of the tutorial series. Just to give you an idea about Meld's capabilities, you can configure the tool to ignore certain type of changes, ask it to move, copy or delete individual differences between files, as well as launch it from the command line. We'll discuss all these key functionalities in upcoming parts of this tutorial series.

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/beginners-guide-to-visual-merge-tool-meld-on-linux/

作者：[Ansh][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/beginners-guide-to-visual-merge-tool-meld-on-linux/
[1]:https://www.howtoforge.com/tutorial/beginners-guide-to-visual-merge-tool-meld-on-linux/#about-meld
[2]:https://www.howtoforge.com/tutorial/beginners-guide-to-visual-merge-tool-meld-on-linux/#meld-installation
[3]:https://www.howtoforge.com/tutorial/beginners-guide-to-visual-merge-tool-meld-on-linux/#meld-usage
[4]:https://www.howtoforge.com/tutorial/beginners-guide-to-visual-merge-tool-meld-on-linux/#conclusion
[5]:https://www.howtoforge.com/tutorial/linux-diff-command-file-comparison/
[6]:https://www.howtoforge.com/tutorial/how-to-compare-three-files-in-linux-using-diff3-tool/
[7]:http://meldmerge.org/
[8]:https://www.howtoforge.com/tutorial/ubuntu-16-04-lts-overview/
[9]:https://git.gnome.org/browse/meld/refs/tags
[10]:https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/big/meld-launch-screen-1.png
[11]:https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/big/meld-file-comparison-2.png
[12]:https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/big/meld-diff-in-action-3.png
[13]:https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/big/meld-multiple-changes-4.png
[14]:https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/big/meld-multiple-colors-5.png
[15]:https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/big/meld-makes-it-easy-6.png
[16]:https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/big/meld-makes-it-easy-7.png
[17]:https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/big/meld-makes-it-easy-8.png
[18]:https://www.howtoforge.com/images/how-to-use-visual-diff-and-merge-tools-in-linux-meld-and-kdiff/big/meld-go-next-prev-9.png
[19]:http://meldmerge.org/features.html
