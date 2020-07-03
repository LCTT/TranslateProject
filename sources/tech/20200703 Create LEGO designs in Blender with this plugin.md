[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Create LEGO designs in Blender with this plugin)
[#]: via: (https://opensource.com/article/20/7/lego-blender-bricker)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Create LEGO designs in Blender with this plugin
======
Convert your 3D digital models into LEGO designs with Bricker
![Open Lego CAD][1]

I use [LEGO CAD][2] to document some of my own creations (or "MOCs," as custom sets are called in some digital LEGO communities). The advantage of computer-aided design (CAD) is precision. When you use CAD to build something in virtual space, you can reasonably expect that it can be built in the real world. While the LEGO CAD applications I use don't have simulated physics to verify the structural integrity of my designs, I do lay every brick in the software to mimic a model I've made in real life.

LEGO bricks aren't just raw materials for design, though. They're also an aesthetic, as evident from LEGO-themed video games and movies. If you're less concerned with precision, but you still want the look of LEGO bricks, there's a great plugin for Blender called [Bricker][3] that can convert your 3D models into LEGO models with the click of a button.

### Install Bricker

You can buy Bricker for $65 USD from [BlenderMarket][4], and it's licensed under the GPLv3. Paying for it helps fund development and support.

To install Bricker, launch Blender, click the **Edit** menu, and select **Preferences**. In the Preferences pane, click the **Add-ons** tab on the left. 

![Installing an add-on in Blender][5]

(Seth Kenlon, [CC BY-SA 4.0][6])

Start typing "Bricker" in the search box in the upper-right of the **Add-ons** pane, click the **Install** button, and select the Bricker ZIP file when prompted.

### Convert a 3D model to LEGO bricks

Whether you have the universal starting point of a plain, gray cube, an elaborate model of your own creation, or something you've downloaded from a Blender model hub, you can give Bricker a try right after installation.

First, click on the model you want to convert into a LEGO model. With your model selected, press the **N** key on your keyboard to open the **Properties** panel. Click the **Bricker** properties tab, and click the **New Brick Model** button.

![Bricker properties][7]

(Seth Kenlon, [CC BY-SA 4.0][6])

Now that you've added the model to Bricker, click the new **Brickify Object** button in the Bricker panel.

The default settings render a pretty blocky model, with mostly 2x10 bricks, no plates, and not much detail.

![Blocks in Bricker][8]

(Seth Kenlon, [CC BY-SA 4.0][6])

But there are plenty of options in the Bricker plugin for you to customize, and they show up in the Bricker **Properties** panel once you brickify a model.

![Bricker settings][9]

(Seth Kenlon, [CC BY-SA 4.0][6])

The most important settings in the **Model Settings** panel are:

  * **Brick height** sets the height of each brick in the model. A larger setting produces a less detailed model because fewer bricks are used for the sculpt.
  * **Split model** makes every rendered brick an object you can move in Blender. Without this enabled, your model looks like lots of bricks but acts as if they are all glued together.
  * **Brick types** controls whether your sculpture is made of bricks, plates, both bricks and plates, tiles, and so on.
  * **Max size** sets the maximum size for bricks and plates in your sculpture.
  * **Legal bricks only** ensures that all the bricks are based on real ones. For instance, enabling this prevents it from generating a 3x7 brick or a 2x11 plate because there are no such pieces in the LEGO catalog (or at least not in the [LDraw Parts][10] library).



In the **Detailing** panel, you can control whether the undersides of the bricks are flat (which isn't very realistic, but "cheaper" to render) or detailed to mimic the underside of an actual LEGO piece.

After changing a setting, you must click the **Update Model** button, near the top of the Bricker property panel, to re-render your sculpture.

![Red dragon model in Bricker][11]

(Seth Kenlon, [CC BY-SA 4.0][6])

### Brickify your designs

Bricker is a fun stylistic plugin for Blender. While it probably won't be your go-to tool for designing real LEGO sets, it's a great way to sculpt, draw, and animate with virtual LEGO. If you've been putting off your LEGO stop-motion movie magnum opus, now's the time to get started in the virtual world.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/lego-blender-bricker

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/open-lego.tiff_.png?itok=mQglOhW_ (Open Lego CAD)
[2]: https://opensource.com/article/20/6/open-source-virtual-lego
[3]: https://github.com/bblanimation/bricker
[4]: https://www.blendermarket.com/products/bricker/docs
[5]: https://opensource.com/sites/default/files/uploads/bricker-install.jpg (Installing an add-on in Blender)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://opensource.com/sites/default/files/uploads/bricker-properties.jpg (Bricker properties)
[8]: https://opensource.com/sites/default/files/uploads/bricker-blocky.jpg (Blocks in Bricker)
[9]: https://opensource.com/sites/default/files/uploads/bricker-adjust.jpg (Bricker settings)
[10]: https://www.ldraw.org/parts/official-parts.html
[11]: https://opensource.com/sites/default/files/uploads/red-dragon-bricker.jpg (Red dragon model in Bricker)
