translating---geekpi

Learn Python programming the easy way with EduBlocks
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/blocks_building.png?itok=eMOT-ire)

If you are you looking for a way to move your students (or yourself) from programming in [Scratch][1] to learning [Python][2], I recommend you look into [EduBlocks][3]. It brings a familiar drag-and-drop graphical user interface (GUI) to Python 3 programming.

One of the barriers when transitioning from Scratch to Python is the absence of the drag-and-drop GUI that has made Scratch the go-to application in K-12 schools. EduBlocks' drag-and-drop version of Python 3 changes that paradigm. It aims to "help teachers to introduce text-based programming languages, like Python, to children at an earlier age."

The hardware requirements for EduBlocks are quite modest—a Raspberry Pi and an internet connection—and should be available in many classrooms.

EduBlocks was developed by Joshua Lowe, a 14-year-old Python developer from the United Kingdom. I saw Joshua demonstrate his project at [PyCon 2018][4] in May 2018.

### Getting started

It's easy to install EduBlocks. The website provides clear installation instructions, and you can find detailed screenshots in the project's [GitHub][5] repository.

Install EduBlocks from the Raspberry Pi command line by issuing the following command:
```
curl -sSL get.edublocks.org | bash

```

### Programming EduBlocks

Once the installation is complete, launch EduBlocks from either the desktop shortcut or the Programming menu on the Raspberry Pi.

![](https://opensource.com/sites/default/files/uploads/edublocks_programming-menu.png)

Once you launch the application, you can start creating Python 3 code with EduBlocks' drag-and-drop interface. Its menus are clearly labeled. You can start with sample code by clicking the **Samples** menu button. You can also choose a different color scheme for your programming palette by clicking **Theme**. With the **Save** menu, you can save your code as you work, then **Download** your Python code. Click **Run** to execute and test your code.

You can see your code by clicking the **Blockly** button at the far right. It allows you to toggle between the  "Blockly" interface and the normal Python code view (as you would see in any other Python editor).

![](https://opensource.com/sites/default/files/uploads/edublocks_blockly.png)

EduBlocks comes with a range of code libraries, including [EduPython][6], [Minecraft][7], [Sonic Pi][8], [GPIO Zero][9], and [Sense Hat][10].

### Learning and support

The project maintains a [learning portal][11] with tutorials and other resources for easily [hacking][12] the version of Minecraft that comes with Raspberry Pi, programming the GPIOZero and Sonic Pi, and controlling LEDs with the Micro:bit code editor. Support for EduBlocks is available on Twitter [@edu_blocks][13] and [@all_about_code][14] and through [email][15].

For a deeper dive, you can access EduBlocks' source code on [GitHub][16]; the application is [licensed][17] under GNU Affero General Public License v3.0. EduBlocks' creators (project lead [Joshua Lowe][18] and fellow developers [Chris Dell][19] and [Les Pounder][20]) want it to be a community project and invite people to open issues, provide feedback, and submit pull requests to add features or fixes to the project.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/edublocks

作者：[Don Watkins][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/don-watkins
[1]:https://scratch.mit.edu/
[2]:https://www.python.org/
[3]:https://edublocks.org/
[4]:https://us.pycon.org/2018/about/
[5]:https://github.com/AllAboutCode/EduBlocks
[6]:https://edupython.tuxfamily.org/
[7]:https://minecraft.net/en-us/edition/pi/
[8]:https://sonic-pi.net/
[9]:https://gpiozero.readthedocs.io/en/stable/
[10]:https://www.raspberrypi.org/products/sense-hat/
[11]:https://edublocks.org/learn.html
[12]:https://edublocks.org/resources/1.pdf
[13]:https://twitter.com/edu_blocks?lang=en
[14]:https://twitter.com/all_about_code
[15]:mailto:support@edublocks.org
[16]:https://github.com/allaboutcode/edublocks
[17]:https://github.com/AllAboutCode/EduBlocks/blob/tarball-install/LICENSE
[18]:https://github.com/JoshuaLowe1002
[19]:https://twitter.com/cjdell?lang=en
[20]:https://twitter.com/biglesp?lang=en
