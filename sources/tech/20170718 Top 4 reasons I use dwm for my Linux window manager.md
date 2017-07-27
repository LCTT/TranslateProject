【haoqixu 翻译中】Top 4 reasons I use dwm for my Linux window manager
============================================================

### A window manager handles the sizing and arrangement of the windows you open, among other things.


![Top 4 reasons I use dwm for my Linux window manager](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/car-penguin-drive-linux-yellow.png?itok=ueZE5mph "Top 4 reasons I use dwm for my Linux window manager")
Image by : 

Internet Archive [Book][4] [Images][5]. Modified by Opensource.com. CC BY-SA 4.0

I like minimalistic views. If I could run everything in a terminal I would. It's free from shiny stuff that hogs my resources and distracts my feeble mind. I also grow tired of resizing and moving windows, never getting them to align perfectly.

On my quest for minimalism, I grew fond of [Xfce][6] and used it as my main [desktop environment][7] for years on my Linux computers. Then, one day I came across a video of [Bryan Lunduke][8] talking about the awesome [window manager][9] he used called [Awesome][10]. It neatly arranges all of your windows for you, and so, sounded like just what I wanted. I tried it out but didn't get the hang of the configuration needed to tweak it into my liking. So, I moved on and discovered [xmonad][11], but I had a similar result. It worked fine but I couldn't get around the Haskell part to really turn it into my perfect desktop.

Years passed and by accident, I found my way to [suckless.org][12] and their version of a window manager called [dwm][13].

In short, a desktop environment such as KDE, Gnome, or Xfce includes many things, of which a window manager is one, but also with select applications. A window manager alone handles (among other window related things) the sizing and arrangement of the windows you open. Different desktop environments use different window managers. KDE has KWin, Gnome 2 has Metacity, Gnome 3 has Mutter, and Xfce has Xfwm. Conveniently, for all of these, you can change the default window manager to something else, which is what I've been doing for a while. I've been switching mine to dwm, and here's why I love it.

### Dynamic window management

The killer feature for dwm, as with Awesome and xmonad, is the part where the tool automatically arranges the windows for you, filling the entire space of your screen. Sure, for most desktop environments today it's possible to create keyboard shortcuts to arrange windows to the left, right, top, bottom or full screen, but with dwm it's just one less thing to think about.

Dwm divides the screen into a master and a stack area. There are three layouts to choose from: tile, monocle, and floating. When using tile mode, which is what I use the most, it puts the window which requires the most attention in the master area while the others are tiled in the stack area. In the monocle layout, all windows are maximized and you toggle between them. The floating layout allows you resize the windows as you want (as the most window managers do), which is handy if you're using Gimp or a similar application where custom size windows makes more sense.

Usually, in your desktop environment, you can use different workspaces to sort your windows and gather similar applications in designated workspaces. At work, I use one workspace for ongoing work and one for internet browsing. Dwm has a similar function called tags. You can group windows by tags and by selecting a tag, you display all the windows with that tag.

### Efficiency

Dwm is efficient if you want to save as much power as you can on your computer. Xfce and other lightweight environments are great on older or weaker machines, but dwm uses (in my case) about 1/3 of resources compared to Xfce after login. When I was using an eee pc with 1 GB RAM it made quite a difference if the memory was occupied to 660 MB or 230 MB. That left me with more room for the editors and browsers I wanted to use.

### Minimalistic

I typically set up my applications beside each other: the terminal as the master window (usually running Vim as an editor), a browser for email, and another browser window open for research or [Trello][14]. For casual internet browsing, I fire up a Chromium window in another workspace or a  _tag_  as I mentioned earlier.

### [dwm.png][1]

![](https://opensource.com/sites/default/files/dwm.png)

Screenshot by author.

With standard desktop environments, you often have at least one or two panels, top and bottom or on the side, taking up space. I have tried out the autohide panel function that most of them have, but I was annoyed every time I accidently put the mouse pointer too close to the edge and the panel popped out at the most inconvenient time. You can make them smaller as well but I still enjoy the minimalistic status bar on top of the screen available in dwm.

### Speed

When evaluating speed, I count both how quickly dwm is loaded when I log in and how quickly the applications launch when I start them. When using newer, faster computers you might not care about this detail yet, but for me, there is a noticable difference between various desktop environments and window managers. I don't want to actually wait for my computer to perform such easy tasks, it should just pop up. Also, using keyboard shortcuts to launch everything is faster than using a mouse or a touchpad, and my hands don't have to leave the keyboard.

### Conclusion

That said, I would not recommend dwm to the novice user. It takes some time to read up on how to configure it to your liking (unless you are satisfied with the setup provided by your Linux distribution). I have found some of the patches you might want to include can be tricky to get working and the support community is small (the IRC channel states "No patch-handholding"). So, it might take a bit of effort to get exactly what you want. However, once you do, it's well worth that bit investment.

And hey, it looks as awesome as Awesome.

--------------------------------------------------------------------------------

作者简介：

Jimmy Sjölund - Jimmy Sjölund is a senior IT service manager and innovation coach at Telia Company, focusing on organisation development, exploring agile and lean workflows and is a visualisation enthusiast. He's also an open source evangelist, previously engaged in Ubuntu Studio and Plume Creator.

-----------------

via: https://opensource.com/article/17/7/top-4-reasons-i-use-dwm-linux-window-manager

作者：[ Jimmy Sjölund Feed ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jimmysjolund
[1]:https://opensource.com/file/363336
[2]:https://opensource.com/article/17/7/top-4-reasons-i-use-dwm-linux-window-manager?rate=T8qhopZLfd1eum_NMLOSGckUh2nIjfeRpkERGjGhu7w
[3]:https://opensource.com/user/56551/feed
[4]:https://www.flickr.com/photos/internetarchivebookimages/14746482994/in/photolist-ot6zCN-odgbDq-orm48o-otifuv-otdyWa-ouDjnZ-otGT2L-odYVqY-otmff7-otGamG-otnmSg-rxnhoq-orTmKf-otUn6k-otBg1e-Gm6FEf-x4Fh64-otUcGR-wcXsxg-tLTN9R-otrWYV-otnyUE-iaaBKz-ovcPPi-ovokCg-ov4pwM-x8Tdf1-hT5mYr-otb75b-8Zk6XR-vtefQ7-vtehjQ-xhhN9r-vdXhWm-xFBgtQ-vdXdJU-vvTH6R-uyG5rH-vuZChC-xhhGii-vvU5Uv-vvTNpB-vvxqsV-xyN2Ai-vdXcFw-vdXuNC-wBMhes-xxYmxu-vdXxwS-vvU8Zt
[5]:https://www.flickr.com/photos/internetarchivebookimages/14774719031/in/photolist-ovAie2-otPK99-xtDX7p-tmxqWf-ow3i43-odd68o-xUPaxW-yHCtWi-wZVsrD-DExW5g-BrzB7b-CmMpC9-oy4hyF-x3UDWA-ow1m4A-x1ij7w-tBdz9a-tQMoRm-wn3tdw-oegTJz-owgrs2-rtpeX1-vNN6g9-owemNT-x3o3pX-wiJyEs-CGCC4W-owg22q-oeT71w-w6PRMn-Ds8gyR-x2Aodm-owoJQm-owtGp9-qVxppC-xM3Gw7-owgV5J-ou9WEs-wihHtF-CRmosE-uk9vB3-wiKdW6-oeGKq3-oeFS4f-x5AZtd-w6PNuv-xgkofr-wZx1gJ-EaYPED-oxCbFP
[6]:https://xfce.org/
[7]:https://en.wikipedia.org/wiki/Desktop_environment
[8]:http://lunduke.com/
[9]:https://en.wikipedia.org/wiki/Window_manager
[10]:https://awesomewm.org/
[11]:http://xmonad.org/
[12]:http://suckless.org/
[13]:http://dwm.suckless.org/
[14]:https://opensource.com/node/22546
[15]:https://opensource.com/users/jimmysjolund
[16]:https://opensource.com/users/jimmysjolund
[17]:https://opensource.com/article/17/7/top-4-reasons-i-use-dwm-linux-window-manager#comments
