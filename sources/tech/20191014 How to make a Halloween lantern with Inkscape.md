[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to make a Halloween lantern with Inkscape)
[#]: via: (https://opensource.com/article/19/10/how-make-halloween-lantern-inkscape)
[#]: author: (Jess Weichler https://opensource.com/users/cyanide-cupcake)

How to make a Halloween lantern with Inkscape
======
Use open source tools to make a spooky and fun decoration for your
favorite Halloween haunt.
![Halloween - backlit bat flying][1]

The spooky season is almost here! This year, decorate your haunt with a unique Halloween lantern made with open source!

Typically, a portion of a lantern's structure is opaque to block the light from within. What makes a lantern a lantern are the parts that are missing: windows cut from the structure so that light can escape. While it's impractical for lighting, a lantern with windows in spooky shapes and lurking silhouettes can be atmospheric and a lot of fun to create.

This article demonstrates how to create your own lantern using [Inkscape][2]. If you don't have Inkscape, you can install it from your software repository on Linux or download it from the [Inkscape website][3] on MacOS and Windows.

### Supplies

  * Template ([A4][4] or [Letter][5] size)
  * Cardstock (black is traditional)
  * Tracing paper (optional)
  * Craft knife, ruler, and cutting mat (a craft cutting machine/laser cutter can be used instead)
  * Craft glue
  * LED tea-light "candle"
_Safety note:_ Only use battery-operated candles for this project.



### Understanding the template

To begin, download the correct template for your region (A4 or Letter) from the links above and open it in Inkscape.

* * *

* * *

* * *

**![Lantern template screen][6]**

The gray-and-white checkerboard background is see-through (in technical terms, it's an _alpha channel_.)

The black base forms the lantern. Right now, there are no windows for light to shine through; the lantern is a solid black base. You will use the **Union** and **Difference** options in Inkscape to design the windows digitally.

The dotted blue lines represent fold scorelines. The solid orange lines represent guides. Windows for light should not be placed outside the orange boxes.

To the left of the template are a few pre-made objects you can use in your design.

### To create a window or shape

  1. Create an object that looks like the window style you want. Objects can be created using any of the shape tools in Inkscape's left toolbar. Alternately, you can download Creative Commons- or Public Domain-licensed clipart and import the PNG file into your project.
  2. When you are happy with the shape of the object, turn it into a **Path** (rather than a **Shape**, which Inkscape sees as two different kinds of objects) by selecting **Object &gt; Object to Path** in the top menu.



![Object to path menu][7]

  3. Place the object on top of the base shape.
  4. Select both the object and the black base by clicking one, pressing and holding the Shift key, then selecting the other.
  5. Select **Object &gt; Difference** from the top menu to remove the shape of the object from the base. This creates what will become a window in your lantern.



![Object > Difference menu][8]

### To add an object to a window

After making a window, you can add objects to it to create a scene.

**Tips:**

  * All objects, including text, must be connected to the base of the lantern. If not, they will fall out after cutting and leave a blank space.
  * Avoid small, intricate details. These are difficult to cut, even when using a machine like a laser cutter or a craft plotter.


  1. Create or import an object.
  2. Place the object inside the window so that it is touching at least two sides of the base.
  3. With the object selected, choose **Object &gt; Object to Path** from the top menu.



![Object to path menu][9]

  4. Select the object and the black base by clicking on each one while holding the Shift key).
  5. Select **Object &gt; Union** to join the object and the base.



### Add text

Text can either be cut out from the base to create a window (as I did with the stars) or added to a window (which blocks the light from within the lantern). If you're creating a window, only follow steps 1 and 2 below, then use **Difference** to remove the text from the base layer.

  1. Select the Text tool from the left sidebar to create text. Thick, bold fonts work best.

![Text tool][10]

  2. Select your text, then choose **Path &gt; Object to Path** from the top menu. This converts the text object to a path. Note that this step means you can no longer edit the text, so perform this step _only after_ you're sure you have the word or words you want.

  3. After you have converted the text, you can press **F2** on your keyboard to activate the **Node Editor** tool to clearly show the nodes of the text when it is selected with this tool.




![Text selected with Node editor][11]

  4. Ungroup the text.
  5. Adjust each letter so that it slightly overlaps its neighboring letter or the base.



![Overlapping the text][12]

  6. To connect all of the letters to one another and to the base, re-select all the text and the base, then select **Path &gt; Union**.

![Connecting letters and base with Path > Union][13]




### Prepare for printing

The following instructions are for hand-cutting your lantern. If you're using a laser cutter or craft plotter, follow the techniques required by your hardware to prepare your files.

  1. In the **Layer** panel, click the **Eye** icon beside the **Safety** layer to hide the safety lines. If you don't see the Layer panel, reveal it by selecting **Layer &gt; Layers** from the top menu.
  2. Select the black base. In the **Fill and Stroke** panel, set the fill to **X** (meaning _no fill_) and the **Stroke** to solid black (that's #000000ff to fans of hexes).



![Setting fill and stroke][14]

  3. Print your pattern with **File &gt; Print**.

  4. Using a craft knife and ruler, carefully cut around each black line. Lightly score the dotted blue lines, then fold.

![Cutting out the lantern][15]

  5. To finish off the windows, cut tracing paper to the size of each window and glue it to the inside of the lantern.

![Adding tracing paper][16]

  6. Glue the lantern together at the tabs.

  7. Turn on a battery-powered LED candle and place it inside your lantern.




![Completed lantern][17]

Now your lantern is complete and ready to light up your haunt. Happy Halloween!

How to make Halloween bottle labels with Inkscape, GIMP, and items around the house.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/how-make-halloween-lantern-inkscape

作者：[Jess Weichler][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cyanide-cupcake
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/halloween_bag_bat_diy.jpg?itok=24M0lX25 (Halloween - backlit bat flying)
[2]: https://opensource.com/article/18/1/inkscape-absolute-beginners
[3]: http://inkscape.org
[4]: https://www.dropbox.com/s/75qzjilg5ak2oj1/papercraft_lantern_A4_template.svg?dl=0
[5]: https://www.dropbox.com/s/8fswdge49jwx91n/papercraft_lantern_letter_template%20.svg?dl=0
[6]: https://opensource.com/sites/default/files/uploads/lanterntemplate_screen.png (Lantern template screen)
[7]: https://opensource.com/sites/default/files/uploads/lantern1.png (Object to path menu)
[8]: https://opensource.com/sites/default/files/uploads/lantern2.png (Object > Difference menu)
[9]: https://opensource.com/sites/default/files/uploads/lantern3.png (Object to path menu)
[10]: https://opensource.com/sites/default/files/uploads/lantern4.png (Text tool)
[11]: https://opensource.com/sites/default/files/uploads/lantern5.png (Text selected with Node editor)
[12]: https://opensource.com/sites/default/files/uploads/lantern6.png (Overlapping the text)
[13]: https://opensource.com/sites/default/files/uploads/lantern7.png (Connecting letters and base with Path > Union)
[14]: https://opensource.com/sites/default/files/uploads/lantern8.png (Setting fill and stroke)
[15]: https://opensource.com/sites/default/files/uploads/lantern9.jpg (Cutting out the lantern)
[16]: https://opensource.com/sites/default/files/uploads/lantern10.jpg (Adding tracing paper)
[17]: https://opensource.com/sites/default/files/uploads/lantern11.jpg (Completed lantern)
