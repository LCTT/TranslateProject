翻译中 by zionfuo

How to take screenshots on Linux using Scrot
============================================================

### On this page

1.  [About Scrot][12]
2.  [Scrot Installation][13]
3.  [Scrot Usage/Features][14]
    1.  [Get the application version][1]
    2.  [Capturing current window][2]
    3.  [Selecting a window][3]
    4.  [Include window border in screenshots][4]
    5.  [Delay in taking screenshots][5]
    6.  [Countdown before screenshot][6]
    7.  [Image quality][7]
    8.  [Generating thumbnails][8]
    9.  [Join multiple displays shots][9]
    10.  [Executing operations on saved images][10]
    11.  [Special strings][11]
4.  [Conclusion][15]

Recently, we discussed about the [gnome-screenshot][17] utility, which is a good screen grabbing tool. But if you are looking for an even better command line utility for taking screenshots, then you must give Scrot a try. This tool has some extra features that are currently not available in gnome-screenshot. In this tutorial, we will explain Scrot using easy to understand examples.

Please note that all the examples mentioned in this tutorial have been tested on Ubuntu 16.04 LTS, and the scrot version we have used is 0.8.

### About Scrot

[Scrot][18] (**SCR**eensh**OT**) is a screenshot capturing utility that uses the imlib2 library to acquire and save images. Developed by Tom Gilbert, it's written in C programming language and is licensed under the BSD License.

### Scrot Installation

The scrot tool may be pre-installed on your Ubuntu system, but if that's not the case, then you can install it using the following command:

sudo apt-get install scrot

Once the tool is installed, you can launch it by using the following command:

scrot [options] [filename]

**Note**: The parameters in [] are optional.

### Scrot Usage/Features

In this section, we will discuss how the Scrot tool can be used and what all features it provides.

When the tool is run without any command line options, it captures the whole screen.

[
 ![Using Scrot](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/scrot.png) 
][19]

By default, the captured file is saved with a date-stamped filename in the current directory, although you can also explicitly specify the name of the captured image when the command is run. For example:

scrot [image-name].png

### Get the application version

If you want, you can check the version of scrot using the -v command line option.

scrot -v

Here is an example:

[
 ![Get scrot version](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/version.png) 
][20]

### Capturing current window

Using the utility, you can limit the screenshot to the currently focused window. This feature can be accessed using the -u command line option.

scrot -u

For example, here's my desktop when I executed the above command on the command line:

[
 ![capture window in scrot](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/desktop.png) 
][21]

And here's the screenshot captured by scrot: 

[
 ![Screenshot captured by scrot](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/active.png) 
][22]

### Selecting a window

The utility allows you to capture any window by clicking on it using the mouse. This feature can be accessed using the -s option.

scrot -s

For example, as you can see in the screenshot below, I have a screen with two terminal windows overlapping each other. On the top window, I run the aforementioned command.

[
 ![select window](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/select1.png) 
][23]

Now suppose, I want to capture the bottom terminal window. For that, I will just click on that window once the command is executed - the command execution won't complete until you click somewhere on the screen.

Here's the screenshot captured after clicking on that terminal:

[
 ![window screenshot captured](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/select2.png) 
][24]

**Note**: As you can see in the above snapshot, whatever area the bottom window is covering has been captured, even if that includes an overlapping portion of the top window.

### Include window border in screenshots

The -u command line option we discussed earlier doesn't include the window border in screenshots. However, you can include the border of the window if you want. This feature can be accessed using the -b option (in conjunction with the -u option of course).

scrot -ub

Here is an example screenshot:

[
 ![include window border in screenshot](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/border-new.png) 
][25]

**Note**: Including window border also adds some of the background area to the screenshot.

### Delay in taking screenshots

You can introduce a time delay while taking screenshots. For this, you have to assign a numeric value to the --delay or -d command line option.

scrot --delay [NUM]

scrot --delay 5

Here is an example:

[
 ![delay taking screenshot](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/delay.png) 
][26]

In this case, scrot will wait for 5 seconds and then take the screenshot.

### Countdown before screenshot

The tool also allows you to display countdown while using delay option. This feature can be accessed using the -c command line option.

scrot –delay [NUM] -c

scrot -d 5 -c

Here is an example screenshot:

[
 ![example delayed screenshot](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/countdown.png) 
][27]

### Image quality

Using the tool, you can adjust the quality of the screenshot image at the scale of 1-100\. High value means high size and low compression. Default value is 75, although effect differs depending on the file format chosen.

This feature can be accessed using --quality or -q option, but you have to assign a numeric value to this option ranging from 1-100.

scrot –quality [NUM]

scrot –quality 10

Here is an example snapshot:

[
 ![snapshot quality](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/img-quality.jpg) 
][28]

So you can see that the quality of the image degrades a lot as the -q option is assigned value closer to 1.

### Generating thumbnails

The scrot utility also allows you to generate thumbnail of the screenshot. This feature can be accessed using the --thumb option. This option requires a NUM value, which is basically the percentage of the original screenshot size.

scrot --thumb NUM

scrot --thumb 50

**Note**: The --thumb option makes sure that the screenshot is captured and saved in original size as well.

For example, here is the original screenshot captured in my case:

[
 ![Original screenshot](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/orig.png) 
][29]

And following is the thumbnail saved:

[
 ![thumbnail of the screenshot](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/thmb.png) 
][30]

### Join multiple displays shots

In case your machine has multiple displays attached to it, scrot allows you to grab and join screenshots of these displays. This feature can be accessed using the -m command line option. 

scrot -m

Here is an example snapshot:

[
 ![Join screenshots](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/multiple.png) 
][31]

### Executing operations on saved images

Using the tool, we can execute various operations on saved images - for example, open the screenshot in an image editor like gThumb. This feature can be accessed using the -e command line option. Here's an example:

scrot abc.png -e ‘gthumb abc.png’

Here, gthumb is an image editor which will automatically launch after we run the command.

Following is the snapshot of the command:

[
 ![Execute commands on screenshots](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/exec1.png) 
][32]

And here is the output of the above command:

[
 ![esample screenshot](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/exec2.png) 
][33]

So you can see that the scrot command grabbed the screenshot and then launched the gThumb image editor with the captured image as argument.

If you don’t specify a filename to your screenshot, then the snapshot will be saved with a date-stamped filename in your current directory - this, as we've already mentioned in the beginning, is the default behaviour of scrot.

Here's an -e command line option example where scrot uses the default name for the screenshot: 

scrot -e ‘gthumb $n’

[
 ![scrot running gthumb](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/exec3.png) 
][34]

It's worth mentioning that $n is a special string, which provides access to the screenshot name. For more details on special strings, head to the next section.

### Special strings

The -e (or the --exec ) and filename parameters can take format specifiers when used with scrot. There are two types of format specifiers. First type is characters preceded by ‘%’ that are used for date and time formats, while the second type is internal to scrot and are prefixed by ‘$’

Several specifiers which are recognised by the --exec and filename parameters are discussed below.

**$f** – provides access to screenshot path (including filename).

For example,

scrot ashu.jpg -e ‘mv $f ~/Pictures/Scrot/ashish/’

Here is an example snapshot:

[
 ![example](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/f.png) 
][35]

If you will not specify a filename, then scrot will by-default save the snapshot in a date stamped file format. This is the by-default date-stamped file format used in scrot : %yy-%mm-%dd-%hhmmss_$wx$h_scrot.png.

**$n** – provides snapshot name. Here is an example snapshot:

[
 ![scrot $n variable](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/n.png) 
][36]

**$s** – gives access to the size of screenshot. This feature, for example, can be accessed in the following way.

scrot abc.jpg -e ‘echo $s’

Here is an example snapshot

[
 ![scrot $s variable](https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/s.png) 
][37]

Similarly, you can use the other special strings **$p**, **$w**, **$h**, **$t**, **$$** and **\n** that provide access to image pixel size, image width, image height, image format, $ symbol, and give access to new line respectively. You can, for example, use these strings in the way similar to the **$s** example we have discussed above.

### Conclusion

The utility is easy to install on Ubuntu systems, which is good for beginners. Scrot also provides some advanced features such as special strings that can be used in scripting by professionals. Needless to say, there is a slight learning curve associated in case you want to use them.

 ![](https://www.howtoforge.com/images/pdficon_small.png) 
 [vie][16]

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/

作者：[Himanshu Arora][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/
[1]:https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/#get-the-applicationnbspversion
[2]:https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/#capturing-current-window
[3]:https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/#selecting-a-window
[4]:https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/#includenbspwindow-border-in-screenshots
[5]:https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/#delay-in-taking-screenshots
[6]:https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/#countdown-before-screenshot
[7]:https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/#image-quality
[8]:https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/#generating-thumbnails
[9]:https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/#join-multiple-displays-shots
[10]:https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/#executing-operations-on-saved-images
[11]:https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/#special-strings
[12]:https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/#about-scrot
[13]:https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/#scrot-installation
[14]:https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/#scrot-usagefeatures
[15]:https://www.howtoforge.com/tutorial/how-to-take-screenshots-in-linux-with-scrot/#conclusion
[16]:https://www.howtoforge.com/subscription/
[17]:https://www.howtoforge.com/tutorial/taking-screenshots-in-linux-using-gnome-screenshot/
[18]:https://en.wikipedia.org/wiki/Scrot
[19]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/scrot.png
[20]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/version.png
[21]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/desktop.png
[22]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/active.png
[23]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/select1.png
[24]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/select2.png
[25]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/border-new.png
[26]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/delay.png
[27]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/countdown.png
[28]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/img-quality.jpg
[29]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/orig.png
[30]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/thmb.png
[31]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/multiple.png
[32]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/exec1.png
[33]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/exec2.png
[34]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/exec3.png
[35]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/f.png
[36]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/n.png
[37]:https://www.howtoforge.com/images/how-to-take-screenshots-in-linux-with-scrot/big/s.png
