Translating by ZTinoZ
Install Inkscape - Open Source Vector Graphic Editor
================================================================================
Inkscape is an open source vector graphic editing tool which uses Scalable Vector Graphics (SVG) and that makes it different from its competitors like Xara X, Corel Draw and Adobe Illustrator etc. SVG is a widely-deployed royalty-free graphics format developed and maintained by the W3C SVG Working Group. It is a cross platform tool which runs fine on Linux, Windows and Mac OS.

Inkscape development was started in 2003, Inkscape's bug tracking system was hosted on Sourceforge initially but it was migrated to Launchpad afterwards. Its current latest stable version is 0.91. It is under continuous development and bug fixes and we will be reviewing its prominent features and installing process in the article.

### Salient Features ###

Lets review the outstanding features of this application categorically.

#### Creating Objects ####

- Drawing different colored sized and shaped freehand lines through pencil tool, straight lines and curves through Bezier (pen) tool, applying freehand calligraphic strokes through calligraphic tool etc
- Creating, selecting, editing and formatting text through text tool. Manipulating text in plain text boxes, on paths or in shapes
- Helps draw various shapes like rectangles, ellipses, circles, arcs, polygons, stars, spirals etc and then resize, rotate and modify (turn sharp edges round) them
- Create and embed bitmaps with simple commands

#### Object manipulation ####

- Skewing, moving, scaling, rotating objects through interactive manipulations and pacifying the numeric values
- Performing raising and lowering Z-order operations
- Grouping and ungrouping objects to create a virtual scope for editing or manipulation
- Layers form a hierarchal tree and can be locked or rearranged for various manipulations
- Distribution and alignment commands

#### Fill and Stroke ####

- Copy/paste styles
- Pick Color tool
- Selecting colors on a continuous plot based on vectors of RGB, HSL, CMS, CMYK and color wheel
- Gradient editor helps creating and managing multi-stop gradients
- Define an image or selection and use it to pattern fill
- Dashed Strokes can be used with few predefined dashed patterns
- Beginning, middle and ending marks through path markers

#### Operation on Paths ####

- Node Editing: Moving nodes and Bezier handles, node alignment and distribution etc
- Boolean operations like yes or no conditions
- Simplifying paths with variable levels or thresholds
- Path insetting and outsetting along with link and offset objects
- Converting bitmap images into paths (color and monochrome paths) through path tracing

#### Text manipulation ####

- All installed outlined fonts can be used even for right to left align objects
- Formatting text, letter spacing, line spacing or kerning
- Text on path and on shapes where both text and path or shapes can be edited or modified

#### Rendering ####

- Inkscape fully support anti-aliased display which is a technique that reduces or eliminates aliasing by shading the pixels along the border.
- Support for alpha transparency display and PNG export

### Install Inkscape on Ubuntu 14.04 and 14.10 ###

In order to install Inkscape on Ubuntu, we will need to first [add its stable Personal Package Archive][1] (PPA) to Advanced Package Tool (APT) repository. Launch the terminal and run following command to add its PPA.

     sudo add-apt-repository ppa:inkscape.dev/stable

![PPA Inkscape](http://blog.linoxide.com/wp-content/uploads/2015/03/PPA-Inkscape.png)

Once the PPA has been added to the APT repository we need to update it using following command.

     sudo apt-get update

![Update APT](http://blog.linoxide.com/wp-content/uploads/2015/03/Update-APT2.png)

After updating the repository we are ready to install inkscape which is accomplished using the following command.

     sudo apt-get install inkscape

![Install Inkscape](http://blog.linoxide.com/wp-content/uploads/2015/03/Install-Inkscape.png)

Congratulation, Inkscape has been installed now and all set for image editing and making full use of feature rich application.

![Inkscape Main](http://blog.linoxide.com/wp-content/uploads/2015/03/Inkscape-Main1.png)

### Conclusion ###

Inkscape is a feature rich graphic editing tool which empowers its user with state of the art capabilities. It is an open source application which is freely available for installation and customizations and supports wide range of file formats including but not limited to JPEG, PNG, GIF and PDF. Visit its [official website][2] for more news and updates regarding this application.

--------------------------------------------------------------------------------

via: http://linoxide.com/tools/install-inkscape-open-source-vector-graphic-editor/

作者：[Aun Raza][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunrz/
[1]:https://launchpad.net/~inkscape.dev/+archive/ubuntu/stable
[2]:https://inkscape.org/en/
