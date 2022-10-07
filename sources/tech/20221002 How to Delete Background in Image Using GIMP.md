[#]: subject: "How to Delete Background in Image Using GIMP"
[#]: via: "https://www.debugpoint.com/remove-image-background-gimp/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Delete Background in Image Using GIMP
======
Removing the background of an image is super easy if you know how to do it. Here in this tutorial, we will explain five different ways you can use to remove background in Image Using GIMP.

![Remove Background Image in GIMP][1]

There are many ways you can delete any part of an image. That can be the background of the main subject of your image or some sections of it. That includes making the image background transparent and associated steps.

[GIMP][2] is the free and open-source closest Photoshop Alternative application which is used by millions every day. And if you are a beginner in GIMP or learning image processing, then there is no harm in learning these steps to make any sections of a complex image transparent, including the background.

The steps outlined here use basic tools similar to other photo editing software. Hence, what you’re learning in this tutorial can easily be applied to alternative software.

### 5 Ways to Remove Background in Image Using GIMP

#### Method 1 – Fuzzy Select 

The Fuzzy Select tool allows you to select all pixels that are similar to a set of sample pixels within a local area of an image. This works for the images with a colour distinction between foreground and background image foreground.

So, if your image background and prominent subject/foreground are of identical colour (like this image below), then this method may not help. Try other methods explained below. But still, you can go ahead and try out all methods if you have spare time.

1. Open your image in GIMP.
2. Right-click on the layer and add Alpha channel. This ensures that you can easily delete your layer with transparency. You can verify whether the Alpha channel is already added to your image or not by right-clicking the layer and see if the add Alpha channel is greyed out.
3. Select the Fuzzy Select tool from the toolbox and make sure Anti Aliasing, Feather Edges and Draw Mask are checked. The Draw Mask option will help you visualise the background you want to delete.
4. Now click on the section of the image of the background which you want to delete and hold down your click, then drag the mouse to your image to see a mask drawn on your image.
5. The colour selection shows the selection that you are choosing. Dragging the mouse below will increase the threshold of your selection, and towards up, it will reduce the threshold of your selection.
6. Once you are satisfied with your selection, release the mouse and press delete from your keyboard to delete the selection.

You can repeat this process as much as you want to eliminate the background of your image entirely.

![Method 1 - Fuzzy Select][3]

![After Method 1 is applied][4]

#### Method 2 – Select by colour

In the next method, we will use the select by colour tool, which selects the entire background having the same colour pixels. This method works better for vector images, which typically have uniform colour distribution. This method might not work well for real-world images with too many colour gradients or sharp edges.

1. Select the “select by colour” tool from the toolbox. Make sure Anti Aliasing and Draw Mask are enabled from the option.
2. Ensure to enable the Feather Edges option if you are working with a complex vector image.
3. Now, click on the background section of your image having the same colour and drag the mouse down or up to increase or decrease the threshold.
4. Once you are happy with the selection, let go of the mouse hold. Press delete from your keyboard.

Likewise, you can repeat the steps multiple times to eliminate the background entirely.

![Method 2 - Select by Color][5]

#### Method 3 – Paths

Another way of removing the background of an image is using the **Paths** tool. This is more of a **manual** way of deleting the background of an image.

This method gives you the **most accurate results** among all the methods described here. But it takes a bit of time and patience to do it.

1. Select the Path tool from the toolbox.
2. Begin clicking around the image’s main subject to place individual points outlining the subject.
3. You can curve the line by dragging down the middle of the line and moving the left and right handle towards the centre of the line.
4. To continue drawing, make sure you click on the most recent point and continue.
5. Once done, you can close the outline by holding CTRL and clicking on the first point placed.
6. Press Enter to create a selection using the outline.
7. From the menu, Select Invert. This will select the background of the image.
8. And press delete to delete the background.

![Method 3 Path Tool][6]

#### Method 4 – Layer Mask

A more **advanced** way to delete the background is to use a layer mask. This is useful for those photographs where you have fine details such as hairs, furs, grass etc. Those fine details are difficult to aele6 manually using the above methods.

But there is a catch. This method only works best where there is a high level of contrast of colour present between the main subject of the image and its background.

1. Right-click on the layer and create a duplicate layer.
2. While the duplicate Layer is selected, Go to Color > Saturation. Change the scale to all the way to zero. Click ok.
3. Go to Color > Curves and manually adjust the top and bottom nodes so that your main subject of the image fills with more black and the background is white.
4. From the menu, select Colors > invert. Then select Edit > Copy Visible.
5. Hide the duplicate layer by clicking on the little eye icon on the right toolbox.
6. Right-click on the original layer and click Add Layer Mask. Click Add.
7. Paste the copied visible image using Edit > Paste.
8. Click on green icon at the bottom of the layers window to merge the pasted layer to the layer mask.
9. At this stage, you should notice that the black area remains visible, and the white area is transparent.

To fine-tune the sections, you can use a white colour brush tool and fill those sections which are part of your main subject but become transparent in the process.

And there you have it.

![Method 4 - Curves][7]

![Method 4 - Layer Mask][8]

#### Method 5 – Foreground Select

The final method we are going to explain is the foreground select method. This method is also a good choice as well for complex images having hairs, grass etc.

* To get started, select the Foreground Select tool from the toolbox and do a simple outline of the subject. It need not be perfect, like below. It’s more like an outline covering the entire subject.
* Once you are done, join the select point to the first point and press enter to select the subject.
* This will create a dark blue area over the background and a light blue area in the foreground.
* Now select the white foreground colour and manually brush the subject without going too much towards the edges.
* Once you are done, select the preview to see how it looks. Based on the colour profile of your image, this preview step might take a couple of seconds to process.
* If you are happy with the preview, click select. And then press enter to make this a selection.
* Invert the selection using Select > Invert.
* Press delete from the keyboard.
* And you have your image ready without the background portion.

![Method 5 - Foreground select tool to delete background of image in GIMP][9]

### Final Notes

So, that’s about it with the five methods which we just explained to remove background from image(s) and photographs using the free and open-source tool GIMP. Let me know if this tutorial helped you understand the steps and get the desired result.

*[Used Photo in this article is by Maryia Plashchynskaya from Pexels][10]*

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/remove-image-background-gimp/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2021/11/Remove-Background-Image-in-GIMP-1024x576.jpg
[2]: https://www.gimp.org/
[3]: https://www.debugpoint.com/wp-content/uploads/2021/11/Method-1-Fuzzy-Select-1024x641.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2021/11/After-Method-1-is-applied.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2021/11/Method-2-Select-by-Color-1024x656.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2021/11/Method-3-Path-Tool-1024x726.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2021/11/Method-4-Curves-1024x649.jpg
[8]: https://www.debugpoint.com/wp-content/uploads/2021/11/Method-4-Layer-Mask-1024x652.jpg
[9]: https://www.debugpoint.com/wp-content/uploads/2021/11/Method-5-Foreground-select-tool-1024x590.jpg
[10]: https://www.pexels.com/@maryiaplashchynskaya?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels
