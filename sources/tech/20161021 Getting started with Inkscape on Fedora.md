translating---geekpi

### [Getting started with Inkscape on Fedora][2]

 ![inkscape-gettingstarted](https://cdn.fedoramagazine.org/wp-content/uploads/2016/10/inkscape-gettingstarted-945x400.png) 

Inkscape is a popular, full-featured, free and open source vector [graphics editor][3] available in the official Fedora repositories. It’s specifically tailored for creating vector graphics in the [SVG format][4]. Inkscape is great for creating and manipulating pictures and illustrations. It’s also good for creating diagrams, and user interface mockups.

[
 ![cyberscoty-landscape-800px](https://cdn.fedoramagazine.org/wp-content/uploads/2016/10/cyberscoty-landscape-800px.png) 
][5]

[Windmill Landscape][1]illustration created using inkscape

The [screenshots page on the official website][6] has some great examples of what can be done with Inkscape. The majority of the featured images here on the Fedora Magazine are also created using Inkscape, including this recent featured image:

[
 ![communty](https://cdn.fedoramagazine.org/wp-content/uploads/2016/09/communty.png) 
][7]

A recent featured image here on the Fedora Magazine that was created with Inkscape

### Installing Inkscape on Fedora

Inkscape is [available in the official Fedora repositories][8], so it’s super easy to install using the Software app in Fedora Workstation**:**

[
 ![inkscape-gnome-software](https://cdn.fedoramagazine.org/wp-content/uploads/2016/10/inkscape-gnome-software.png) 
][9]

Alternatively, if you are comfortable with the command line, you can install using the following `dnf` command:

```
sudo dnf install inkscape
```

### Dive into Inkscape (getting started)

When opening the app for the first time, you are greeted with a blank page, and a bunch of different toolbars. For beginners, the three most important of these toolbars are the Toolbar, the Tools Control Bar, and the Colour Palette:

[
 ![inkscape_window](https://cdn.fedoramagazine.org/wp-content/uploads/2016/10/inkscape_window.png) 
][10]

The **Toolbar** provides all the basic tools for creating drawings, including tools such as:

*   The rectangle tool, for drawing rectangles and squares
*   The star / polygon (shapes) tool
*   The circle tool, for drawing ellipses and circles
*   The text tool, for adding labels and other text
*   The path tool, for creating or editing more complex or customized shapes
*   The select tool for selecting objects in your drawing

The **Colour Palette** provides a quick way to set the colour of the currently selected object. The **Tools Control Bar** provides all the settings for the currently selected tool in the Toolbar. Each time you select a new tool, the Tools Control Bar will update with the settings for that tool:

[
 ![](https://cdn.fedoramagazine.org/wp-content/uploads/2016/10/inkscape-toolscontrolbar.gif) 
][11]

### Drawing shapes

Next, let’s draw a star with Inkscape. First, choose the star tool from the **Toolbar, **and click and drag on the main drawing area**.**

You’ll probably notice your star looks a lot like a triangle. To change this, play with the Corners option in the **Tools Control Bar**, and add a few more points. Finally, when you’re done, with the star still selected choose a colour from the **Palette** to change the colour of your star:

[
 ![inkscape-drawastar](https://cdn.fedoramagazine.org/wp-content/uploads/2016/10/inkscape-drawastar.gif) 
][12]

Next, experiment with some of the other shapes tools in the Toolbar, such as the rectangle tool, the spiral tool and the circle tool. Also play around with some of the settings for each tool to create a bunch of unique shapes.

### Selecting and moving objects in your drawing

Now you have a bunch of shapes, and can use the Select tool to move them around. To use the select tool, first select it from the toolbar, and then click on the shape you want to manipulate. Then click and drag the shape to where you want it to be.

When a shape is selected, you can also use the resize handles to scale the shape. Additionally, if you click on a shape that is selected, the resize handles change to rotate mode, allowing you to spin your shape:

[
 ![inkscape-movingshapes](https://cdn.fedoramagazine.org/wp-content/uploads/2016/10/inkscape-movingshapes.gif) 
][13]

* * *

Inkscape is an awesome piece of software that is packed with many more tools and features. In the next articles in this series, we will cover more of the features and options you can use to create awesome illustrations and documents.

-----------------------

作者简介：Ryan is a designer that works on stuff for Fedora. He uses Fedora Workstation as his primary desktop, along with the best tools from the Libre Graphics world, notably, the vector graphics editor, Inkscape.


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/getting-started-inkscape-fedora/

作者：[Ryan Lerch][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ryanlerch.id.fedoraproject.org/
[1]:https://openclipart.org/detail/185885/windmill-in-landscape
[2]:https://fedoramagazine.org/getting-started-inkscape-fedora/
[3]:https://inkscape.org/
[4]:https://en.wikipedia.org/wiki/Scalable_Vector_Graphics
[5]:https://cdn.fedoramagazine.org/wp-content/uploads/2016/10/cyberscoty-landscape-800px.png
[6]:https://inkscape.org/en/about/screenshots/
[7]:https://cdn.fedoramagazine.org/wp-content/uploads/2016/09/communty.png
[8]:https://apps.fedoraproject.org/packages/inkscape
[9]:https://cdn.fedoramagazine.org/wp-content/uploads/2016/10/inkscape-gnome-software.png
[10]:https://cdn.fedoramagazine.org/wp-content/uploads/2016/10/inkscape_window.png
[11]:https://cdn.fedoramagazine.org/wp-content/uploads/2016/10/inkscape-toolscontrolbar.gif
[12]:https://cdn.fedoramagazine.org/wp-content/uploads/2016/10/inkscape-drawastar.gif
[13]:https://cdn.fedoramagazine.org/wp-content/uploads/2016/10/inkscape-movingshapes.gif
