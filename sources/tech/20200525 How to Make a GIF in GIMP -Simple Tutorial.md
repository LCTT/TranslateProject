[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Make a GIF in GIMP [Simple Tutorial])
[#]: via: (https://itsfoss.com/make-gif-in-gimp/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

How to Make a GIF in GIMP [Simple Tutorial]
======

Making a GIF can be fun and many users would like to know how to make one. You can create a GIF very easily with [GIMP][1], the powerful open-source image editing software.

In this GIMP tutorial, I’ll show you how to create a simple GIF in GIMP.

### Making a GIF in GIMP

![][2]

Using GIMP as an animation tool requires you to think of every layer as of an animation frame. In this tutorial, I will create a simple web banner based on It’s FOSS logo. I will use 2 images as my layers but feel free to add more when you make your own.

The method that I use here is called “the **combine** method”, in which the new frame is added to the previous frame. My idea is to make a “flashing” web banner, to draw the attention at something important.

I presume that you have [already installed GIMP in Ubuntu][3] or whichever operating system you are using. Let’s start making the GIF.

#### Step 1

From the File menu, click on **Open as Layers** and select all the images you want to include in the GIF. Then click **Open**.

![][4]

You can order your images in the layers tab. The GIF sequence will start with your bottom layer and run through each layer bottom to top.

![Change the order of layers][5]

From the main menu select **Filters**, then **Animation** and finally click **Optimise (for GIF)**.

![][6]

What “Optimise” does?

Optimise examines each layer, and reuses information from previous frames if they haven’t changed at the following frame. It only stores new values for pixels that change, and purges any duplicate parts.

If a frame is exactly the same as the previous one, it removes that frame completely and the previous frame just stays on the screen for longer.

To view GIF, from main menu click on **Filter** then **Animation** and **Playback**.

![][7]

Press the **Playback** button to start GIF. To save GIF on the File Menu select **File**, click on **Export as**.

![][8]

Name your GIF and choose the folder you want to save it in. On “**Select File Type**“, choose GIF Image.

![Save As Gif][9]

When prompted select ‘As Animation’, ‘Loop Forever’, set the desired delay value and to take effect click on “Use delay entered above for all frames”.

The most important option is to set the frame disposal action as “**Cumulative layers (combine)**” to get the “**flashing**” effect for our banner. Click Export as a final step.

![Gif Export Options][10]

**Your GIF is ready!**

![][11]

This was an easy-to-follow, simple example, although GIMP has a much greater depth in animation creating and requires a good amount of study and practice to master it.

If you are interested in more GIMP tutorials, you may read how to outline text in GIMP. Stay tuned at It’s FOSS for more such useful tips in the future. [Subscribing to the weekly newsletter][12] is the best way to stay updated. Enjoy!

--------------------------------------------------------------------------------

via: https://itsfoss.com/make-gif-in-gimp/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: https://www.gimp.org/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/create-gif-in-gimp.jpg?ssl=1
[3]: https://itsfoss.com/gimp-2-10-release/
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/1.-open-as-layers.jpeg?ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/layers-order.jpg?ssl=1
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/2.-optimize-for-gif-1.png?fit=800%2C647&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/3.-playback.png?fit=800%2C692&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/4.-export-as.png?ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/5.-save-as-gif.png?fit=800%2C677&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/6.-export-options-1.png?ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/its-foss-logo.gif?fit=800%2C417&ssl=1
[12]: https://itsfoss.com/subscribe-to-newsletter/
