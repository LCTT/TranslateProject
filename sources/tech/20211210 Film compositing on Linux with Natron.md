[#]: subject: "Film compositing on Linux with Natron"
[#]: via: "https://opensource.com/article/21/12/film-compositing-linux-natron"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Film compositing on Linux with Natron
======
Natron is an application that brings professional compositing to open
source software users.
![An old-fashioned video camera][1]

In film post-production, there's a phase called _compositing_, which puts the actual footage in a camera with footage generated purely by software. What that actually means to the compositing artist depends on the movie. Sometimes there are just a few overlays, other times there's some minor special effect like laser beams or explosions, sometimes it's a green screen, and still other times it's a little bit of everything. Most video editing applications can do basic compositing. Still, when your entire job is to bring different components together and make it look like they were in front of the camera _in real life_ at the time of the shooting, you need a dedicated application with some very specific tooling. Happily, the [film industry does a lot more with open source][2] and cross-studio collaboration than you might expect, and so some of the best tools to process digital images (including [OpenColorIO][3], [OpenEXR][4], [OpenFX][5], and more) have become ubiquitous. The compositing application [Natron][6] takes advantage of this open technology, plus the time-honored interface models of "noodles and nodes," to bring professional compositing to open source software users.

Compositing is a big and complex job, but this article introduces you to the basics of what you need to know about the interface of Natron and some basic principles of compositing. After reading this, you won't be a pro, but you'll know where to begin.

### Install Natron on Linux

Natron is available on most Linux distributions from your package manager. On Fedora, Mageia, and similar distributions:


```
`$ sudo dnf install natron`
```

On Elementary, Mint, and other Debian-based distributions:


```
`$ sudo apt install natron`
```

However, I use Natron as a [Flatpak][7].

### Compositor interface

Whether you're using Natron or a non-open compositor, the idea behind the compositing interface is generally the same:

  * You have a node graph area where you map out how the elements of your composition relate to one another. Each component of your composition is a _node_, and you connect them with flowchart-style arrows commonly called "noodles." By default, Natron includes a ready-to-use Viewer node in your initial node graph.
  * There's a Properties panel on the right for you to control the attributes of each node.
  * A viewer panel along the top of the window displays the current node in isolation by default.



![Natron interface][8]

(Seth Kenlon, [CC BY-SA 4.0][9])

### Importing and viewing components

To composite an image, you need the components of what will make your image. As a simple example, start with some video and some overlay text. Of course, making text appear over video is a task you can do in any video editor, but starting simple demonstrates the workflow.

First, right-click in the node graph panel, select the **Image** submenu and add a **Read** node. The read node reads a file from disk, so choose some video from your hard drive when prompted. After adding a video image to your project, you may notice that you can't actually _see_ your image except as a thumbnail in the node. You can't see your video because it is within the read node, and the read node isn't connected to a viewer yet. Connect your image to your viewer node by pulling the outgoing noodle from the read node and dropping it onto the viewer node. Click on the viewer node to make it active and your video image to appear in your viewer.

Adding and using viewer nodes is something you'll often do when compositing. Not only do you need a viewer node to see your work, but you can have more than one viewer node so you can peek in at your work at different stages of your composition. You can add new viewer nodes from your right-click menu's **Image** submenu.

![The viewer node in Natron][10]

(Seth Kenlon, [CC BY-SA 4.0][9])

### Properties panel

Each node in your node graph has an accompanying properties panel on the right of the Natron window. The read node's property panel lists the path of the file it's reading from the disk and displays the default settings of that footage (first frame, last frame, frame rate, colorspace, and so on.) All of these settings can be changed as needed.

### Adding an overlay

Next, right-click in the node graph panel, go to the **Draw** menu and select **Text**. This adds a text node to your graph, and it may or may not have connected it to anything.

Here's a subtlety of Natron that's good to know. When you add a node to your graph while nothing is selected, you add a floating node connected to nothing. When you add a node with another node selected, Natron adds the node and connects it to the selected node.

If your text node got connected between your image and viewer nodes, disconnect it. To disconnect nodes, grab the noodle connecting them (I find it easiest to grab the number or word in the middle of the noodle) and then "pull" it away by dragging your mouse swiftly to the right or left. It takes some practice to get used to the way noodles work, but you eventually get the hang of it.

Connect the text node to your viewer node as a secondary input. This obscures the video image but lets you see what you're doing in the text node. Then highlight the text node, and look for its properties panel on the right. Type some text in the text field, choose a font you like, and adjust the position of the text by dragging the target symbol in the viewer panel.

![Viewing a text node][11]

(Seth Kenlon, [CC BY-SA 4.0][9])

### Merging the components

You now have an image and some text, and you can see one but seemingly not both. The _compositing_ part of compositing largely happens through _merges_, which you do with literally a **Merge** node. Right-click the node graph panel, go to the **Merges** menu, and select **Merge**.

This adds a new merge node to your graph. Click and drag the **A** noodle from the merge node to the text node and the **B** noodle to the read node. Connect the noodle at the bottom of the merge node to the viewer node.

You've completed your very first composition.

![Composited][12]

(Seth Kenlon, [CC BY-SA 4.0][9])

What happens when you connect the text node to **B** and the read node to **A**?

### Adding more nodes

Now that you have your basic composite try some different nodes to see how they affect your images. The advantage of the noodle and node graph interface is that you have full control over the pipeline of effects. In a traditional video editor, effects are applied essentially as layers, and there are only two ways to stack layers—top down or bottom up, and both amount to the same thing. With a node graph, you have as many stacks as you need, and many nodes have more than just one or two inputs (and with merges, you always have as many inputs and outputs as you need.)

If you have green screen footage lying around, try adding a **Chromakeyer** node from the **Keyer** submenu. If you have effect footage, try overlaying it on footage and using a **ColorCorrect** node to integrate it with your footage.

There are many effects to experiment with within Natron, even without demo footage. Open source has pioneered much of the most advanced imaging software, and Natron benefits from this and takes full advantage of it. Not only does Natron offer the usual array of effects, like color balance, contrast, levels, threshold, saturation, and so on, but with the wildly popular [G'MIC][13] plugin, it offers hundreds of additional filters and effects.

![G'MIC effects in Natron][14]

(Seth Kenlon, [CC BY-SA 4.0][9])

As you add more and more nodes, you may find yourself running out of space in your node graph panel. There are a few conveniences to help with that:

  * With your mouse hovering over the node graph panel, press the **Spacebar** on your keyboard. This expands the current panel to take up the entire Natron window. This works for any panel.
  * Middle-click and drag the node graph panel to move around your graph.
  * Use the scroll wheel on your mouse to zoom in and out on your graph.



### Exporting your work

The default output for Natron is the industry standard EXR format, which produces a series of still images that, when put together flipbook-style, mimics motion. EXR is a great format with many options, including stereo imagery, huge colorspace, and important metadata, but it's a pretty hefty format for test footage. I tend to use PNG or even JPG while I work and then output to whatever format the next step in the pipeline requires.

To render your composite, add a **Write** node from the **Image** submenu, and connect it to your last node that isn't a viewer. In this example, that's the merge node.

![A Write node in Natron][15]

(Seth Kenlon, [CC BY-SA 4.0][9])

When you add a write node, Natron prompts you for a path to where you want to save files. Because the usual output format of Natron is an image sequence rather than a movie file, you probably want to create a new directory for your output. And because it's a sequence, you can't provide a single file name, but you must provide a file name pattern. The magic syntax to produce file names such as 0001.png, 0002.png, 0003.png, and so on, is `%04d.png`, where the `4d` determines the number of total digits in the file name. You must have enough digits to fit all of your frames: if your project is 360 frames long, then you can't just provide `%02d` because there are three places in 360, so you need at least `%03d` as your pattern.

Once you've determined where you will save your output files, and the pattern determines their names, click the **Save** button.

In the properties panel of the write node, ensure that your write node correctly guessed your settings. At the bottom of the properties panel, there's a button providing libpng info, which confirms that Natron is set to output PNG files. You can render your whole project or, if you're just performing a spot test, you can set **Frame Range** to **Manual** and enter just 24 or 48 frames. For complex renders, it's important to do spot checks before committing to hours and hours of render cycles.

![Write node properties panel][16]

(Seth Kenlon, [CC BY-SA 4.0][9])

Click the **Render** button at the bottom of the write node's properties panel when you're ready. You can view your image sequence in an image sequence viewer like [DJV][17], or import it into Kdenlive, or convert it to a movie file with ffmpeg:


```


$ ffmpeg -i %04d.png \
-c:v vp9 \
-an \
-r 24 \
out.webm

```

### Compositing complexity

Compositing means modifying motion pictures with filters and effects, integrating disparate assets into a cohesive image, masking out garbage, and combining pixels in new and interesting ways. It's a uniquely modern kind of art, and yet it has roots in the very beginnings of filmmaking (although it was done with light and chemicals, then.) Natron brings this kind of creativity and fun to open source users. Give it a try, and see what you can create.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/film-compositing-linux-natron

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LIFE_film.png?itok=aElrLLrw (An old-fashioned video camera)
[2]: http://vfxplatform.com/
[3]: https://opencolorio.org/
[4]: https://www.openexr.com/
[5]: http://openfx.org/
[6]: https://natron.fr/
[7]: https://opensource.com/article/21/11/install-flatpak-linux
[8]: https://opensource.com/sites/default/files/uploads/natron-ui-map.jpg (Natron interface)
[9]: https://creativecommons.org/licenses/by-sa/4.0/
[10]: https://opensource.com/sites/default/files/uploads/natron-viewer.jpg (The viewer node in Natron)
[11]: https://opensource.com/sites/default/files/uploads/natron-text.jpg (Viewing a text node)
[12]: https://opensource.com/sites/default/files/uploads/natron-composite.jpg (Composited)
[13]: https://gmic.eu
[14]: https://opensource.com/sites/default/files/uploads/natron-gmic.jpg (G'MIC effects in Natron)
[15]: https://opensource.com/sites/default/files/uploads/natron-node-write.jpg (A Write node in Natron)
[16]: https://opensource.com/sites/default/files/uploads/natron-write.jpg (Write node properties panel)
[17]: https://darbyjohnston.github.io/DJV/
