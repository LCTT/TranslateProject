[#]: subject: "My favorite MyPaint features for digital painting"
[#]: via: "https://opensource.com/article/21/12/mypaint"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

My favorite MyPaint features for digital painting
======
Whether you are a casual doodler or serious illustrator, this open
source digital painting tool is loaded with useful brushes, colors, and
other artistic features.
![Painting art on a computer screen][1]

I don't practice drawing, so I don't expect to be able to draw well, but I do sometimes enjoy drawing, regardless of skill. One application I use when attempting to get some imagery out onto a canvas is [MyPaint][2], a digital paint application focusing on a clean interface, appealing brushes and materials, and ease of use. The ease of use part is important for artists and chronic doodlers like myself. When you sit down to do something, you generally want to do the thing, not spend hours learning new software or configuring a complex application. MyPaint manages to make it more comfortable to be in front of a blank canvas and empowering to produce something beautiful.

### Install MyPaint on Linux

MyPaint is [available for Linux, Windows, and macOS][3].

On Fedora, Mageia, and similar distributions, you can install it with your package manager:


```
`$ sudo dnf install mypaint`
```

On Elementary, Mint, and other Debian-based distributions:


```
`$ sudo apt install mypaint`
```

I use MyPaint as a [Flatpak][4].

### MyPaint interface

The MyPaint window got designed for sparsity. Most of the application window is a blank canvas, and that's good because that's where the art happens. There's a toolbar along the top for tool selection, a properties panel on the right for configuration, and that's mostly everything you need to know to get started.

![Mypaint UI][5]

(Seth Kenlon, [CC BY-SA 4.0][6])

### Paintbrushes

The star of any digital paint program are the paintbrushes themselves. Without a good brush engine, a paint application is just [pixel art][7] at a very high resolution. MyPaint's brush engine happens to be very good. In fact, it's too good for just one application, and so it's been borrowed and integrated into the photo editor [GIMP][8].

To see the brushes available to you in MyPaint, click the brush stroke icon in the bottom right corner of the window.

![Mypaint brush stroke icon][9]

(Seth Kenlon, [CC BY-SA 4.0][6])

This opens a pop-up window containing the Classic set of MyPaint brushes. Each of these provides a unique look for the paint strokes you make on the canvas. But that's not all of the brushes MyPaint has available. Click the arrow to the right of the **Classic** heading to scroll through other sets of brushes, and try not to be overwhelmed by the embarrassment of wealth you've just discovered.

![Brushes][10]

(Seth Kenlon, [CC BY-SA 4.0][6])

Try a few brushes to see how they feel and what kind of strokes they render. You can change the size of the brush tip, the sharpness of the line, the smoothness of your control, pressure, and many other attributes in the **Freehand Drawing** tab of the **Tool Options** panel on the right.

![Freehand properties panel][11]

(Seth Kenlon, [CC BY-SA 4.0][6])

Don't worry about experimentation. You can restore each brush's native settings at any time using the **Reset** button.

### Painting with all the colors of the wind

All the brushes in the world aren't of much use without paint. In digital painting, your media is color combined with a compositing effect imposed by the brush you're using. The same blue color swatch might produce several shades of blue as your brush strokes ramp up from a little paint to a lot of paint or as you paint over regions you've already covered, depending on your brush selection.

The same blue color selection is responsible for both of these amorphous splotches:

![Paint effects][12]

(Seth Kenlon, [CC BY-SA 4.0][6])

The left region is a spray brush, and the right region is a watercolor brush tip with a little sponging around the edges to soften the spikes.

Choosing the "right" color can be difficult, and in digital painting, the _method_ you're given to make your choice affects how easy it is to choose. Each artist has their own favorite color picker, and MyPaint has lots to choose from.

![Color pickers][13]

(Seth Kenlon, [CC BY-SA 4.0][6])

Your choices include the common additive color wheel with separate saturation control, a color wheel with separate chroma control, color swatches, an HSV square, a very fun liquid wash palette, and many more.

![HCY][14]

(Seth Kenlon, [CC BY-SA 4.0][6])

Take a look at them all, choose your favorite, and add the tab to the right panel.

### Framing and exporting

MyPaint's canvas is endless. There are no boundaries, and it's near-infinite blank space upon which you can paint. I love this because it encourages doodling and experimentation. It promotes happy little accidents as you mix colors and try out brush strokes. You never have to erase. You don't feel compelled to start a new document when you don't feel like it. You just draw. Of course, the result can be pretty chaotic, with scratches of ink and blobs of digital ink surrounding your latest Bob Ross-inspired masterpiece. Fortunately, MyPaint has an easy solution: The frame.

![Frame button][15]

(Seth Kenlon, [CC BY-SA 4.0][6])

A frame in MyPaint provides dynamic boundaries so you can export parts of your MyPaint document. When you first click the **Frame** button, a frame gets drawn around the parts of your document that's got paint on it. To draw a new frame, click the **Trash Bin** icon that appears on the canvas, and then draw a new frame around the part of your document you want to export. With the frame active, go to the **File** menu and select **Export**.

![Set the frame][16]

(Seth Kenlon, [CC BY-SA 4.0][6])

### Find your creativity

MyPaint is one of my favorite applications for exploration. There are lots of great features and tools that I haven't covered in this article, and while those are fun to explore, it's even more fun to explore your own creativity. If you sit down for a few hours and just doodle and sketch, you never know what you might stumble onto. You may or may not end up with a great work of art, but then again, you might make something you really like. And if you're a skilled illustrator, then you're sure to welcome MyPaint, and you should share your art with other users over on the [MyPaint community Discourse server][17].

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/mypaint

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/painting_computer_screen_art_design_creative.png?itok=LVAeQx3_ (Painting art on a computer screen)
[2]: http://mypaint.org/
[3]: http://mypaint.org/downloads/
[4]: https://opensource.com/article/21/11/install-flatpak-linux
[5]: https://opensource.com/sites/default/files/uploads/mypaint-ui.jpg (Mypaint UI)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://opensource.com/article/17/2/mtpaint-pixel-art-animated-gifs
[8]: https://opensource.com/tags/gimp
[9]: https://opensource.com/sites/default/files/uploads/mypaint-button-brush.jpg (Mypaint brush stroke icon)
[10]: https://opensource.com/sites/default/files/uploads/mypaint-window-brush.jpg (Brushes)
[11]: https://opensource.com/sites/default/files/uploads/mypaint-panel-freehand.jpg (Freehand properties panel)
[12]: https://opensource.com/sites/default/files/uploads/mypaint-paint-effects.jpg (Paint effects)
[13]: https://opensource.com/sites/default/files/uploads/mypaint-button-colour.jpg (Color pickers)
[14]: https://opensource.com/sites/default/files/uploads/mypaint-colour-hsy.jpg (HCY)
[15]: https://opensource.com/sites/default/files/uploads/mypaint-button-frame.jpg (Frame button)
[16]: https://opensource.com/sites/default/files/uploads/mypaint-frame-set.jpg (Set the frame)
[17]: https://community.mypaint.org/
