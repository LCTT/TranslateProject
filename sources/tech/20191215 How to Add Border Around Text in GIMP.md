[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Add Border Around Text in GIMP)
[#]: via: (https://itsfoss.com/gimp-text-outline/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Add Border Around Text in GIMP
======

This simple tutorial explains the steps to outline text in [GIMP][1]. The text outline helps you highlight text against background of other color.

![Outlined Text created in GIMP][2]

Let’s see how can you add a border around your text.

### Adding text outline in GIMP

The entire procedure can be described in these easy steps:

  * Create your text and copy its outlined path
  * Add a new transparent layer and add the outlined path to this layer
  * Change the size of the outline, add a different color to it



That’s all. Don’t worry, I am going to show each steps in detail with proper screenshots. By following this tutorial, you should be able to add outline to text even if you never used GIMP before.

Just make sure that you have [GIMP installed on Linux][3] or whatever operating system you are using.

This tutorial has been performed with GIMP 2.10 version.

#### Step 1: Create your primary text and copy its outline

Open GIMP and create a new file by going to the top menu-&gt;File-&gt;New. You can also use Ctrl+N keyboard shortcut.

![Create New File][4]

You can select the size of your canvas here. You may also choose if you want white background or a transparent background. It is under the Advanced Options-&gt;Color profile.

I have chosen the default white background. It can be changed later.

Now select the Text tool from the toolbox in the left sidebar.

![Adding text in GIMP][5]

Write the text you want. You can change the font, size and alignment of the text as per your choice. I have kept the default left alignment of the text for this article.

I have deliberately chose a light color for the text so that it is difficult to read. I’ll add a darker outline to this light text in this tutorial.

![Text added in GIMP][6]

When you are done writing your text, right click the text box and select **Path from Text**.

![Right click on the text box and select ‘Path from Text’][7]

#### Step 2: Add a transparent layer with the text outline

Now, go to the top menu, go to Layer and add a new layer.

![Use Shift+Ctrl+N to add a new layer][8]

Make sure to add the new layer as transparent. You can give it a suitable name like ‘outline for text’. Click OK to add this transparent layer.

![Add a transparent layer][9]

Go to the menu again and this time go to **Select** and click **From path**. You’ll see that your text has been highlighted.

![Go to Select and choose From Path][10]

Basically, you just created a transparent layer that has the same text (but transparent) as your original text. What you need to do now is to increase the size of the text on this layer.

#### Step 3: Adding the text outline by increasing its size and changing its color

To do that, go to Select in menu once again and this time choose Grow. This will allow you to grow the size of the text on the transparent layer.

![Grow the selection on the additional layer][11]

Grow it by 5 or 10 pixel or whatever you prefer.

![Grow it by 5 or 10 pixel][12]

What you need to do now is to fill this enlarged selection with a choice of your color. Since my original text is of light color, I am going to use back color for the outline here.

**Select your main image layer** if it’s not already selected. The layers are visible at the right sidebar. Then go to the toolbox and select the bucket fill tool. Select the desired color you want for the outline.

Now use the tool to fill black color to your selection. Mind that you fill the outer outline of the text, not the text itself.

![Fill the outline of the text with a different color][13]

You are pretty much done here. Use Ctrl+Shift+A to de-select your current selection.

![Outline added to the text][14]

So now you have successfully added outline to your text in GIMP. It is on white background and if you want a transparent background, just delete the background layer from the layer menu in the right sidebar.

![Remove the white background layer if you want a transparent background][15]

If you are happy with the result, save the file as PNG file (to keep transparent background) or whichever file format you prefer.

**Did you make it work?**

That’s it. That’s all you need to do to add a text outline in GIMP.

I hope you find this GIMP tutorial helpful. You may want to check out another [simple tutorial about adding a watermark in GIMP][16].

If you have questions or suggestions, please feel free to leave a comment below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/gimp-text-outline/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.gimp.org/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/outlined_text_GIMP.png?ssl=1
[3]: https://itsfoss.com/gimp-2-10-release/
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/12/create_outline_text_gimp_1.jpeg?ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/outline_text_gimp_2.jpg?ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/outline_text_gimp-3.jpg?ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/outline_text_gimp_4.jpg?ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/outline_text_gimp_5.jpg?ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/outline_text_gimp_6.jpg?ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/outline_text_gimp_7.jpg?ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/outline_text_gimp_8.jpg?ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/outline_text_gimp_9.jpg?ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/12/outline_text_gimp_10.jpg?ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/outline_text_gimp_11.jpg?ssl=1
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/outline_text_gimp_12.jpg?ssl=1
[16]: https://itsfoss.com/add-watermark-gimp-linux/
