[#]: subject: "Explore 3D scans with this open source tool"
[#]: via: "https://opensource.com/article/21/12/3d-scans-meshlab"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Explore 3D scans with this open source tool
======
Anyone can play with the potential of LiDAR with MeshLab, an open source
LiDAR point cloud viewer and editor.
![woman on laptop sitting at the window][1]

Light detection and ranging, better known as LiDAR, is a method of taking photographs of 3D space using lasers and GPS. That sounds like science fiction—I can think of a few scenes in some movies that probably reimagined this technology without realizing it—but it's a technology that's existed for over 50 years.

LiDAR is useful for topographical surveying and archaeological recordkeeping, and it's useful for obtaining sources for 3D printing. I was introduced to it while working on a movie that needed to integrate an imaginary (or was it?) dragon with a real-world forest and foresting town.

For all of these things to appear seamlessly in the same movie, digital artists were tasked with recreating, with 3D models, a tree or building that actually existed. To get the real-world objects exactly right in the 3D-modeling application, the artists needed to essentially trace the real-world object, just as you might trace a photograph to produce an accurate drawing on tracing paper. Instead of photographs, the 3D-modeling artists used LiDAR scans, which allowed them to "trace" an object in all dimensions.

Anyone can play with the potential of LiDAR with MeshLab, an open source LiDAR point cloud viewer and editor.

### Install MeshLab on Linux

MeshLab is available on most Linux distributions from your package manager.

On Fedora, Mageia, and similar distributions:

`$ sudo dnf install meshlab`

On Debian-based distributions:

`$ sudo apt install meshlab`

I use MeshLab as a [Flatpak][2], and there's a convenient AppImage available on [MeshLab.net][3].

### Getting a LiDAR scan

LiDAR equipment isn't easy to obtain, so unless you're working on a project using LiDAR scan, you probably don't have a LiDAR scan just lying around.

However, the [OpenHeritage][4] project is dedicated to archiving scans of significant scientific and public interest. The project has scans of ancient ruins at Tikal; cathedrals in France, Spain, and Italy; palaces in Syria and Jordan; and more, published under the terms of [Creative Commons][5] licenses.

LiDAR scans contain millions of points that define an object, so they're very taxing on system resources. To work on a LiDAR scan comfortably, anticipate requiring a good graphics card and plenty of RAM. If you just want to browse through a scan, the [Pantheon (10.26301/t9sj-mf53)][6] dataset is surprisingly clean and is only 89 MB with just 6 million vertices.

The Pantheon scan is attributed to Gerd Graßhoff, Michael Heinzelmann, Markus Wäfler, Christian Berndt, Jon Albers, Oskar Kaelin, Bernd Kulawik, Ralph Rosenbauer, Nikolaos Theocharis, Michael Lustenberger, Bernhard Fritsch in 2021, and is distributed by Open Heritage 3D under the CC BY-NC-SA license.

After downloading the mesh file, unzip it to uncompress the .e57 file.

For this article, the terms _mesh_, _point cloud_, _data set_ refer to the same thing: the collection of vertices produced by a LiDAR scan.

### MeshLab interface

When you launch MeshLab, there's usually no LiDAR scan loaded. To import one, go to the File menu and select Import Mesh or press **Ctrl+I** on your keyboard.

Select your mesh.

![A scan of the Pantheon monument within the the MeshLab interface][7]

(Seth Kenlon, [CC BY-SA 4.0][8])

You can adjust your view of a point cloud by clicking and dragging on one of the axis handles (the _trackball,_ in MeshLab terminology) appearing around the origin point of the mesh.

Use your scroll wheel to zoom in and out on the point cloud. Scroll down to zoom in and scroll up to zoom out. Don't confuse this with scaling. The trackball doesn't change with your mesh, so the point cloud only appears to be scaling up or down, but the panel at the bottom of the window reveals that your points haven't changed.

![Mesh information][9]

(Seth Kenlon, CC BY-SA 4.0)

The top toolbar of the MeshLab window displays your primary editing tools. The first batch of tools are file operations used to load and save and export meshes. The second batch are display options you can use to change how you're viewing the dataset: you can view just the bounding box around the point cloud, the points within the cloud, just a wireframe, a gridded background layer, axis labels, and so on. The rest of the toolbar contains tools for editing meshes.

When no editing tool is selected, you're in viewing mode.

### Transforming a point cloud

MeshLab is not a 3D-modeling application, even though there are many similarities in the general interface. However, MeshLab does edit meshes, so there are some tools that can transform a point cloud. The most basic edits are Rotate, Scale, and Translate.

To transform a mesh, click the Manipulators tool icon in the top toolbar.

![A screenshot showing the location of the MeshLab Manipulators tool icon in the tool bar][10]

(Seth Kenlon, [CC BY-SA 4.0][8])

With the Manipulators tool active, you can press **T** to translate your mesh's position, **R** to rotate your mesh, or **S** to scale your mesh. Controls appear for each operation, and, as with Blender, you can press extra keys to further constrain what you're doing. For example, press **X** in translation mode to constrain your translation just along the X-axis. Instructions like these are provided in the top left corner of the MeshLab window.

![Sample on-screen instructions for using the Translate function of the Manipulators tool][11]

(Seth Kenlon, [CC BY-SA 4.0][8])

When you're finished with a tool, you must click its icon again to deactivate it. Clicking on a new tool does _not_ deactivate your current tool.

Pressing **Escape** on your keyboard switches you to view mode, and pressing it again returns you to your previous tool. This way, you can adjust and edit and adjust quickly with no added mouse clicks.

### Selecting points

A common task in a mesh editor is cleaning up a LiDAR scan by removing extraneous points. The LiDAR scan of the Pantheon is pretty clean as it is, but not all are, and it can save a lot of processing power and hard drive space to eliminate vertices you don't need.

You can select points using the Select vertex clusters, Select vertices on a plane, and Select faces/vertices inside polygonal area tools. The concept is similar to selection in any graphic application, although it's a little more complex in MeshLab because you're interacting with 3D space.

My favorite selection method is with the Select faces/vertices inside polygonal area tool:

  1. Draw a polygonal selection area encompassing the points you want to select.
  2. Once you've got a selection area, press **Q** on your keyboard to activate the selection on the points within your polygon. Selected points turn red.
  3. Press **Escape** on your keyboard to switch to view mode and rotate or reposition your point cloud to see it from a different angle.
  4. Add to your polygon selection and press **Q** to add the new points.



Repeat that process until you have everything you need in your selection.

You can refine your selection by pressing **C** to clear your polygon and start a new one. Pressing **C** doesn't clear your selection, just the selection area, so you can draw a new polygon and either add more points with **Q** or remove points you didn't mean to select with **W**.

![Screenshot of MeshLab in which a section of the 3D image has been selected and highlighted in red, with instructions on which keystrokes to use to manipulate the highlighted area][12]

(Seth Kenlon, [CC BY-SA 4.0][8])

Once you've got a selection, click on the Filters menu and browse through the Selection submenu to perform whatever action you need on your point cloud.

### Exploring LiDAR

MeshLab is packed with features, and this article has only covered the basics.

There are lots of filters and lots of ways to read data in from reference sources, point cloud simplification, Z-painting, model aligning, and much more.

Whether you're diving into LiDAR to clean up scans for your 3D printer, adjusting origin points for a carefully orchestrated tracking shot in the next blockbuster, or recording the states of historical sites over the years, MeshLab is an invaluable and unique open source tool.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/3d-scans-meshlab

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-window-focus.png?itok=g0xPm2kD (young woman working on a laptop)
[2]: https://opensource.com/article/21/11/install-flatpak-linux
[3]: https://www.meshlab.net/#support
[4]: https://openheritage3d.org/
[5]: https://opensource.com/article/20/1/what-creative-commons
[6]: https://doi.org/10.26301/t9sj-mf53
[7]: https://opensource.com/sites/default/files/uploads/meshlab-import.jpeg (Pantheon)
[8]: https://creativecommons.org/licenses/by-sa/4.0/
[9]: https://opensource.com/sites/default/files/meshlab-info.jpg (Mesh information)
[10]: https://opensource.com/sites/default/files/uploads/meshlab-manipulators.jpeg (Manipulators tool icon)
[11]: https://opensource.com/sites/default/files/uploads/meshlab-help.jpeg (Instructions)
[12]: https://opensource.com/sites/default/files/uploads/meshlab-select-polygon.jpeg (Selection from area)
