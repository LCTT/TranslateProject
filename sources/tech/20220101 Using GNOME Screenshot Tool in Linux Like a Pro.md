[#]: subject: "Using GNOME Screenshot Tool in Linux Like a Pro"
[#]: via: "https://itsfoss.com/using-gnome-screenshot-tool/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Using GNOME Screenshot Tool in Linux Like a Pro
======

There are [several screenshot tools available for Linux][1]. I prefer [using Flameshot for screenshots][2] and Shutter for editing the existing screenshots.

But Flameshot doesn’t work with 4K screens, unfortunately. And hence I had to resort back to the default GNOME screenshot tool which works perfectly on my Dell XPS with Ultra HD screen.

![GNOME screenshot tool][3]

This ‘forced move’ made me realize that the [GNOME screenshot][4] is not a bad utility if you know how to use it properly.

From that, I meant using it with the keyboard shortcuts because that saves a lot of time.

Let me show how to use the GNOME Screenshot application like an expert with all those handy keyboard shortcuts.

I presume that you have not changed the default keyboard shortcuts for screenshot here.

### Take screenshot of entire screen(s): Use Prt Scr key

This is the simplest of the action. Locate the Prt Sc or Prt Scr or Prt Scn key on your keyboard and press it. It will take the screenshot of the entire screen and save it to the Pictures folder under your home directory.

![Screenshot of entire screen saved as PNG file][5]

In some distributions (or versions), you may get the options to whether you want to save the screenshot or not but mostly, it will save the screenshot automatically.

Another thing to note here is that if you have multiple screens attached to the system, it takes screenshot of all the screens together. This means, you get an ultra wide image.

But what if you want to take the screenshot of only a certain application, not the entire screen?

### Take screenshot of an application windows: Use Alt+Prt Scr key

To take the screenshot of a running graphical application, here’s what you need to do:

Click on the running application so that it in focus. Now, press and hold the Alt key and press Prt Scr key.

It will take the screenshot of the application window and save to the Pictures directory.

![Screenshot of an application window in GNOME][6]

The screenshots thus taken also has a shadow effect applied to them which looks good.

This is good but what if you want to take the screenshot of only a particular area, not the entire screen? There is a trick for that as well.

### Take screenshot of selected area of the screen: Use Shift+Prt Scr key

Press the Shift key and hold it. Now press the Prt Scr key. You’ll see a selector appear on the screen. Move around the mouse to the desired region and start dragging the cursor. It will highlight the region and take a screenshot as soon as you release the mouse.

![Taking screenshot of an area in GNOME][7]

### Copy the screenshots to clipboard instead of saving them

This is very useful when you are chatting someone and have to share a screenshot with the other person.

![Screenshot copied to the clipboard can be used in various applications][8]

Taking the screenshot first and then attach the saved screenshot file to the messaging tool is unnecessary. Instead, you could just copy the screenshot to the clipboard and then use the Ctrl+V shortcut to paste the image (from the clipboard) into the messaging tool.

This way, your system won’t have unnecessary screenshots and you also save a few mouse clicks.

To save the screenshots to your clipboard so that you can paste them in a messaging tool, drawing tool or a document, you have to use the Ctrl key together with the other screenshots shortcuts you saw in previous sections.

  * Ctrl+Prt Scr: Copies the screenshot of the entire screen(s) to the clipboard
  * Ctrl+Alt+Prt Scr: Copies the screenshot of the application windows to the clipboard
  * Ctrl+Shift+Prt Scr: Copies the screenshot of the selected region to the clipboard



I must add that [using a tool like Flameshot][2] is even better in such case because it allows you to annotate the screenshots before saving them to clipboard. This way, you can easily highlight the important part of your screen.

### Add delay to screenshot to take screenshots of dropdown menu

So far everything is good. You just press a couple of keys and take the screenshots as you like.

The problem comes when you have to take the screenshot of a dropdown menu or right click context action etc. As soon as you press the screenshot keys, the intended item may disappear.

To handle the situation, you can take the screenshot of the region or entire screen but with a delay.

![Taking screenshot with delay][9]

In the GNOME Screenshot tool, you get the option to add this delay. Say, you add 6 seconds of delay. You hit the take screenshot button and get 6 seconds to do/show what you intend here. After 6 seconds, it automatically takes the screenshot.

### Any tricks up your sleeve?

That’s all the tips I had on GNOME Screenshot tool. If you haven’t used it extensively, you should find it helpful. If you are already a pro, perhaps you know something that can be added to this article? Share it with the rest of us in the comment section, please.

--------------------------------------------------------------------------------

via: https://itsfoss.com/using-gnome-screenshot-tool/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/take-screenshot-linux/
[2]: https://itsfoss.com/flameshot/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/gnome-screenshot-tool.jpg?resize=800%2C413&ssl=1
[4]: https://apps.gnome.org/app/org.gnome.Screenshot/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/screenshot-of-entire-screen-gnome.jpg?resize=800%2C532&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/screenshot-of-an-application-windows-gnome.png?resize=800%2C437&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/take-screenshot-of-region-gnome.webp?resize=800%2C430&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/saving-screenshot-to-clipboard-and-using-it.webp?resize=800%2C476&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/taking-screenshot-with-delay-gnome.webp?resize=800%2C428&ssl=1
