[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to crop images in GIMP [Quick Tip])
[#]: via: (https://itsfoss.com/crop-images-gimp/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

How to crop images in GIMP [Quick Tip]
======

There are many reasons you may want to crop an image in [GIMP][1]. You may want to remove useless borders or information to improve your image, or you may want the focus of the final image to be a specific detail for example.

In this tutorial, I will demonstrate how to cut out an image in GIMP quickly and without compromising the precision. Let’s see.

### How to crop images in GIMP

![][2]

#### Method 1

Cropping is just an operation to trim the image down to a smaller region than the original one. The procedure to crop an image is straightforward.

You can get to the Crop Tool through the Tools palette like this:

![Use Crop Tool for cropping images in GIMP][3]

You can also access the crop tool through the menus:

**Tools → Transform Tools → Crop**

Once the tool is activated, you’ll notice that your mouse cursor on the canvas will change to indicate the Crop Tool is being used.

Now you can Left-Click anywhere on your image canvas, and drag the mouse to a location to create the cropping boundaries. You don’t have to worry about the precision at this point, as you will be able to modify the final selection before actually cropping.

![Crop Selection][4]

At this point hovering your mouse cursor over any of the four corners of the selection will change the mouse cursor, and highlight that region. This allows you to now fine-tune the selection for cropping. You can click and drag any side or corner to move that portion of the selection.

Once the region is good enough to be cropped, you can just press the “**Enter**” key on your keyboard to crop.

If at any time you’d like to start over or decide not to crop at all, you can press the “**Esc**” key on your keyboard.

#### Method 2

Another way to crop an image is to make a selection first, using the **Rectangle Select Tool**.

**Tools → Selection Tools → Rectangle Select**

![][5]

You can then highlight a selection the same way as the **Crop Tool**, and adjust the selection as well. Once you have a selection you like, you can crop the image to fit that selection through

**Image → Crop to Selection**

![][6]

#### Conclusion

Cropping precisely an image can be considered a fundamental asset for a GIMP user. You may choose which method fits better to your needs and explore its potential.

If you have any questions about the procedure, please let me know in the comments below. If you are “craving” more [GIMP tutorials][7], make sure to subscribe on your favorite social media platforms!

--------------------------------------------------------------------------------

via: https://itsfoss.com/crop-images-gimp/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: https://www.gimp.org/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/Crop-images-in-GIMP.png?ssl=1
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/Crop-tool.png?ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/Crop-selection.jpg?ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/select-1.gif?ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/crop.gif?ssl=1
[7]: https://itsfoss.com/tag/gimp-tips/
