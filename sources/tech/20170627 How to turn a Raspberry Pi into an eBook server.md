How to turn a Raspberry Pi into an eBook server
============================================================

### The Calibre eBook management software makes it easy to set up an eBook server on a Raspberry Pi 3, even in low-connectivity areas.

 
![How to turn a Raspberry Pi into an eBook server](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/idea_innovation_mobile_phone.png?itok=Ep49JfKU "How to turn a Raspberry Pi into an eBook server")
Image by : 

opensource.com

Recently [Calibre 3.0 was released][12] which enables users to read books in the browser! Note that Raspbian's repositories have not yet been updated yet (as of this writing).

eBooks are a great way for teachers, librarians, and others to share books, classroom materials, or other documents with students—provided you have ready and reliable access to broadband. But even if you have low or no connectivity, there's an easy solution: Create an eBook server with the open source Calibre eBook management software running on a Raspberry Pi 3\. Here's how I did it—and you can, too.

First I downloaded the latest [Raspbian Pixel image][13] and installed it on a new 8GB microSD card. Then I inserted the microSD; connected a keyboard, mouse, and an old LCD TV with an HDMI cable; and booted the Pi. After [adjusting the resolution][14] of the Pixel environment on my monitor and connecting to the local network, I was ready to begin. I opened a terminal and entered **sudo apt-get update** to get the latest updates for the operating system.

### [1updateos.png][1]

![Updating Raspbian Pixel](https://opensource.com/sites/default/files/u128651/1updateos.png "Updating Raspbian Pixel")

Next, I installed the [Calibre][15] software by entering **sudo apt-get install calibre** in a terminal.

### [2install_calibre.png][2]

![Installing Calibre](https://opensource.com/sites/default/files/u128651/2install_calibre.png "Installing Calibre")

I launched Calibre from the command line (note that it can be launched from the GUI also). The Calibre interface is very intuitive. The first time you launch, you see the **Welcome to Calibre** wizard. I changed the default Calibre Library to **CalibreLibrary** (one word), because it's easier when launching the content server.

After choosing the location for my Calibre content, I was ready to begin downloading books.

### [3calibre-interface.png][3]

![Calibre's interface](https://opensource.com/sites/default/files/u128651/3calibre-interface.png "Calibre's interface")

I selected the **Get Books** option from the menu, and it was very easy to enter my search terms and select the eBook provider I was interested in. I was looking for [non-DRM][16] material, so I chose [Project Gutenberg][17] as my source. (Calibre's disclaimer notes that eBook transactions are between you and the individual content providers.) I entered "Mark Twain" in the author field and got 10 results.

### [4books.png][4]

![Searching for e-books](https://opensource.com/sites/default/files/u128651/4books.png "Searching for e-books")

I selected  _Adventures of Huckleberry Finn_ . On the next screen, I could choose between the **MOBI** and **EPUB** eBook formats. I chose EPUB, and the book downloaded very quickly.

### [5ebook-formats.png][5]

![Choosing the e-book format](https://opensource.com/sites/default/files/u128651/5ebook-formats.png "Choosing the e-book format")

You can also add books to the library from other content providers, not in Calibre's list. For example, a teacher could share open educational resources in eBook format with students through this content server.  To load the content, use the "Add Books" menu option at the far left of the interface

Depending on the size of your library, you may also need to increase the size of your microSD card.

![start_the_server.png](https://opensource.com/sites/default/files/images/life-uploads/start_the_server.png)

After you have added content to your eBook server, you are ready to share it with the rest of your network. Get the IP address of your Raspberry Pi by entering **ifconfig** into the terminal. I was using the wireless network, so I used the result for **wlan0** in the example below. Navigate to the far right of the interface and expand the menu. Then, navigate to "Connect and Share" and start the server.

### [6ipconfig.png][6]

![Identifying the IP address with ipconfig](https://opensource.com/sites/default/files/u128651/6ipconfig.png "Identifying the IP address with ipconfig")

My next step was connecting my client computer to the Raspberry Pi to access the eBooks I'd added. I opened a browser on my client device and navigated to the Raspberry Pi's IP address with the port **:8080** appended. In my case, that was **[http://192.168.1.10:8080][10]** (adapt that format to your Pi's IP address).

You'll see this home page in your browser:

### [7calibre-home.png][7]

![Calibre's client homepage](https://opensource.com/sites/default/files/u128651/7calibre-home.png "Calibre's client homepage")

I tested and easily connected to the server with an iPhone and Linux and MacOS computers.

You can explore the options on this home page, or click on **All Books** to display all the content on your eBook server.

### [8browsing-books.png][8]

![Browsing e-books](https://opensource.com/sites/default/files/u128651/8browsing-books.png "Browsing e-books")

From here, you can download the books to your device and read them offline.

Have you ever set up an eBook server? Or are you thinking about setting up one yourself? Share your advice or questions in the comments.

--------------------------------------------------------------------------------

作者简介：

Don Watkins - Educator, education technology specialist,  entrepreneur, open source advocate. M.A. in Educational Psychology, MSED in Educational Leadership, Linux system administrator, CCNA, virtualization using Virtual Box. Follow me at @Don_Watkins .

-----------------

via: https://opensource.com/article/17/6/raspberrypi-ebook-server

作者：[Don Watkins  ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/don-watkins
[1]:https://opensource.com/file/356446
[2]:https://opensource.com/file/356451
[3]:https://opensource.com/file/356456
[4]:https://opensource.com/file/356461
[5]:https://opensource.com/file/356466
[6]:https://opensource.com/file/356471
[7]:https://opensource.com/file/356476
[8]:https://opensource.com/file/356481
[9]:https://opensource.com/article/17/6/raspberrypi-ebook-server?rate=60Tv_hObNU1MQs2f3G6kNoT4qLyxJ03S1q75p2UEOYg
[10]:http://192.168.1.10:8080/
[11]:https://opensource.com/user/15542/feed
[12]:https://the-digital-reader.com/2017/06/19/calibre-3-0-released/
[13]:https://www.raspberrypi.org/downloads/raspbian/
[14]:https://www.raspberrypi.org/forums/viewtopic.php?t=5851
[15]:https://calibre-ebook.com/
[16]:https://en.wikipedia.org/wiki/Digital_rights_management
[17]:https://www.gutenberg.org/
[18]:https://opensource.com/users/don-watkins
[19]:https://opensource.com/article/17/6/raspberrypi-ebook-server#comments
