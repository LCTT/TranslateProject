[#]: subject: "Open source 3D pixel art with Goxel"
[#]: via: "https://opensource.com/article/21/12/3d-pixel-art-goxel"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Open source 3D pixel art with Goxel
======
Building models with Goxel is a lot of fun, like the best part of Lego
without the sharp edges and like Minecraft without the Creepers.
![Pixel art in 3D with Goxel][1]

I make it no secret that I love Lego, but I've moved far away from my Lego collection, and shipping a closet full of classic Lego sets all the way around the world is currently a problematic proposal. I've done a lot of virtualization to solve this problem, from [building models in Lego CAD][2] to [styling models with a Lego texture in Blender][3]. Recently I discovered [Goxel][4]. This shockingly easy 3D modeling application makes no conceit of being Lego-based or even Lego-adjacent. Yet, the sensation of building models with 3D pixels is surprisingly similar to the satisfaction of building with Lego bricks. You can think of Goxel as a pixel paint program, but in 3D. 

Goxel takes a unique approach to 3D modeling, and it's geared specifically to _low polygon_ modeling. This isn't the application to use if you're looking to sculpt life-like models. But if you like the aesthetic of Minecraft and other low poly art, then you need to try Goxel.

### Install Goxel on Linux

You can install Goxel as a [Flatpak][5] on Linux from [Flathub][6].

For Android, Windows macOS, and iOS, go to the [Goxel website][4] to download an installer.

Goxel is open source, released under the GPLv3 license.

### Painting with voxels

When you first launch Goxel, you get an empty "room" or container in the middle of the Goxel window. This is your canvas.

![The Goxel canvas][7]

(Seth Kenlon, [CC BY-SA 4.0][8])

It's in this container and only within it that you'll build your models. In most 3D modeling applications, depth perception is an acquired skill, so Goxel constrains the space you have to work in to prevent you from ending up with models and model parts miles away from each other. Goxel also restricts your movements in a strict grid. You can move up and down along a Y-axis, right and left along an X-axis, and "near" and "far" along a Z-axis, but only in segments of one 3D pixel (or _voxel_, as they're called). For all intents and purposes, the voxels of Goxel are the virtual Lego bricks you use to build your model.

There aren't many tools in Goxel, and that's a real feature for a 3D modeling application. By default, you've already got the pencil tool active, so you can start building right away by clicking your mouse any place within the voxel container.

![Hello from Goxel][9]

(Seth Kenlon, [CC BY-SA 4.0][8])

Try clicking around the container to see where a voxel gets added. Goxel makes it relatively easy to see where your pencil is about to add a voxel, and it treats voxels like bricks by assuming that when you're near an existing voxel, you want to connect your next voxel to it. Even so, 3D on a 2D screen is difficult. Sometimes voxels get added in a spot you didn't realize you were pointing at. The best way to ensure your voxels get added where you mean for them to get added is to rotate the container often. You can rotate the container using the arrow keys on your keyboard, or you can click and drag the middle-mouse button. A right-click and drag moves the container within the Goxel workspace, and the scroll-wheel of your mouse zooms in and out.

### Planar markers

There's another trick to aligning voxels that Goxel provides, and that's a guide in the form of a translucent and temporary plane. When you add a plane to your container, it creates a kind of force field through which your pencil cannot pass.

![Goxel planar guide][10]

(Seth Kenlon, [CC BY-SA 4.0][8])

The result is that you can safely paint along only two axes but not along the third. You can nudge the plane along the grid so that you're adding voxels in slices, much as a 3D printer adds to a physical model.

Disable the **Visible** option in the plane controls to remove a plane.

![Plane controls][11]

(Seth Kenlon, [CC BY-SA 4.0][8])

### Goxel toolbar

The top toolbar contains seven buttons. From left to right:

  * Undo
  * Redo 
  * Delete _everything without confirmation_
  * Add a voxel
  * Subtract (remove) a voxel
  * Paint a voxel
  * Set the paint color



You can paint in single voxels or use the shape tool to the left of the pencil to add regions of voxels all at once.

In addition to removing voxels with the pencil, you can also use the laser tool to zap voxels as they appear on the 2D screen that is your computer monitor. The Laser tool, to the right of the shape tool, turns your cursor into a crosshair. Point it at a voxel you see and click on it to erase.

### The tranquility of minimalism

Goxel is intentionally simple, not just in what it produces but also in how it produces. I've only discussed the drawing tools of Goxel in this article. While there are other features, like the ability to control the pitch and yaw of the sun, the intensity of shadows, and the position of virtual cameras, the application strives to keep things simple and underwhelming in the best of ways. Building models with Goxel is a lot of fun, like the best part of Lego without the sharp edges and like Minecraft without the Creepers. Go get Goxel, and build some models!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/3d-pixel-art-goxel

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/header-image.jpg?itok=3MWdhreV (Pixel art in 3D with Goxel)
[2]: https://opensource.com/article/20/6/open-source-virtual-lego
[3]: https://opensource.com/article/20/7/lego-blender-bricker
[4]: https://goxel.xyz/
[5]: https://opensource.com/article/21/11/install-flatpak-linux
[6]: https://flathub.org/apps/details/io.github.guillaumechereau.Goxel
[7]: https://opensource.com/sites/default/files/uploads/goxel-canvas.jpg (The Goxel canvas)
[8]: https://creativecommons.org/licenses/by-sa/4.0/
[9]: https://opensource.com/sites/default/files/uploads/goxel-hello.jpg (Hello from Goxel)
[10]: https://opensource.com/sites/default/files/uploads/goxel-plane-guide.jpg (Goxel planar guide)
[11]: https://opensource.com/sites/default/files/uploads/goxel-plane-controls.jpg (Plane controls)
