Design faster web pages, part 2: Image replacement
======
![](https://fedoramagazine.org/wp-content/uploads/2018/03/fasterwebsites2-816x345.jpg)

Welcome back to this series on building faster web pages. The last [article][1] talked about what you can achieve just through image compression. The example started with 1.2MB of browser fat, and reduced down to a weight of 488.9KB. That’s still not fast enough! This article continues the browser diet to lose more fat. You might think that partway through this process things are a bit crazy, but once finished, you’ll understand why.

### Preparation

Once again this article starts with an analysis of the web pages. Use the built-in screenshot function of Firefox to make a screenshot of the entire page. You’ll also want to install Inkscape [using sudo][2]:

```
$ sudo dnf install inkscape
```

If you want to know how to use Inkscape, there are already several [articles][3] in Fedora Magazine. This article will only explain some basic tasks for optimizing an SVG for web use.

### Analysis

Once again, this example uses the [getfedora.org][4] web page.

![Getfedora page with graphics marked][5]

This analysis is better done graphically, which is why it starts with a screenshot. The screenshot above marks all graphical elements of the page. In two cases or better in four cases, the Fedora websites team already used measures to replace images. The icons for social media are glyphs from a font and the language selector is an SVG.

There are several options for replacing:


+ CSS3
+ Fonts
+ SVG
+ HTML5 Canvas


#### HTML5 Canvas

Briefly, HTML5 Canvas is an HTML element that allows you to draw with the help of scripts, mostly JavaScript, although it’s not widely used yet. As you draw with the help of scripts, the element can also be animated. Some examples of what you can achieve with HTML Canvas include this [triangle pattern,][6] [animated wave][7], and [text animation][8]. In this case, though, it seems not to be the right choice.

#### CSS3

With Cascading Style Sheets you can draw shapes and even animate them. CSS is often used for drawing elements like buttons. However, more complicated graphics via CSS are usually only seen in technical demonstration pages. This is because graphics are still better done visually as with coding.

#### Fonts

The usage of fonts for styling web pages is another way, and [Fontawesome][9] is quiet popular. For instance, you could replace the Flavor and the Spin icons with a font in this example. There is a negative side to using this method, which will be covered in the next part of this series, but it can be done easily.

#### SVG

This graphics format has existed for a long time and was always supposed to be used in the browser. For a long time not all browsers supported it, but that’s history. So the best way to replace pictures in this example is with SVG.

### Optimizing SVG for the web

To optimize an SVG for internet use requires several steps.

SVG is an XML dialect. Components like circle, rectangle, or text paths are described with nodes. Each node is an XML element. To keep the code clean, an SVG should use as few nodes as possible.

The SVG example is a circular icon with a coffee mug on it. You have 3 options to describe it with SVG.

#### Circle element with the mug on top

```
<circle
style="opacity:1;fill:#717d82;fill-opacity:1;stroke:none;stroke-width:9.51950836;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;paint-order:markers fill stroke"
id="path36"
cx="68.414307"
cy="130.71523"
r="3.7620001" />
```

#### Circular path with the mug on top

```
<path
style="opacity:1;fill:#717d82;fill-opacity:1;stroke:none;stroke-width:1.60968435;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;paint-order:markers fill stroke"
d="m 68.414044,126.95318 a 3.7618673,3.7618673 0 0 0 -3.76153,3.76204 3.7618673,3.7618673 0 0 0 3.76153,3.76205 3.7618673,3.7618673 0 0 0 3.76206,-3.76205 3.7618673,3.7618673 0 0 0 -3.76206,-3.76204 z"
id="path20" />
```

#### single path

```
<path
style="opacity:1;fill:#717d82;fill-opacity:1;stroke:none;stroke-width:1.60968435;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;paint-order:markers fill stroke"
d="m 68.414044,126.95318 a 3.7618673,3.7618673 0 0 0 -3.76153,3.76204 3.7618673,3.7618673 0 0 0 3.76153,3.76205 3.7618673,3.7618673 0 0 0 3.76206,-3.76205 3.7618673,3.7618673 0 0 0 -3.76206,-3.76204 z m -1.21542,0.92656 h 2.40554 c 0.0913,0.21025 0.18256,0.42071 0.27387,0.63097 h 0.47284 v 0.60099 h -0.17984 l -0.1664,1.05989 h 0.24961 l -0.34779,1.96267 -0.21238,-0.003 -0.22326,1.41955 h -2.12492 l -0.22429,-1.41955 -0.22479,0.003 -0.34829,-1.96267 h 0.26304 l -0.16692,-1.05989 h -0.1669 v -0.60099 h 0.44752 c 0.0913,-0.21026 0.18206,-0.42072 0.27336,-0.63097 z m 0.12608,0.19068 c -0.0614,0.14155 -0.12351,0.28323 -0.185,0.42478 h 2.52336 c -0.0614,-0.14155 -0.12248,-0.28323 -0.18397,-0.42478 z m -0.65524,0.63097 v 0.21911 l 0.0594,5.2e-4 h 3.35844 l 0.0724,-5.2e-4 v -0.21911 z m 0.16846,0.41083 0.1669,1.05937 h 2.80603 l 0.16693,-1.05937 -1.57046,0.008 z m -0.061,1.25057 0.27956,1.5782 1.34411,-0.0145 1.34567,0.0145 0.28059,-1.5782 z m 1.62367,1.75441 -1.08519,0.0124 0.19325,1.2299 h 1.79835 l 0.19328,-1.2299 z"
id="path2714"
inkscape:connector-curvature="0" />
```

You probably can see the code becomes more complex and needs more characters to describe it. More characters in a file result, of course, in a larger size.

#### Node cleaning

If you open an example SVG in Inkscape and press F2, that activates the Node tool. You should see something like this:

![Inkscape - Node tool activated][10]

There are 5 nodes that aren’t necessary in this example — the ones in the middle of the lines. To remove them, select them one by one with the activated Node tool and press the **Del** key. After this, select the nodes which define this lines and make them corners again using the toolbar tool.

![Inkscape - Node tool make node a corner][11]

Without fixing the corners, handles are used that define the curve, which gets saved and will increase file size. You have to do this node cleaning by hand, as it can’t be effectively automated. Now you’re ready for the next stage.

Use the Save as function and choose Optimized svg. A dialogue window opens where you can select what to remove or keep.

![Inkscape - Dialog window for save as optimized SVG][12]

Even the little SVG in this example got down from 3.2 KB to 920 bytes, less than a third of its original size.

Back to the getfedora page: The grey voronoi pattern used in the background of the main section, after our optimization from Part 1 of this series, is down to 164.1 KB versus the original 211.12 KB size.

The original SVG it was exported from is 1.9 MB in size. After these SVG optimization steps, it’s only 500.4KB. Too big? Well, the current blue background is 564.98 KB in size. But there’s only a small difference between the SVG and the PNG.

#### Compressed files

```
$ ls -lh
insgesamt 928K
-rw-r--r--. 1 user user 161K 19. Feb 19:44 grey-pattern.png
-rw-rw-r--. 1 user user 160K 18. Feb 12:23 grey-pattern.png.gz
-rw-r--r--. 1 user user 489K 19. Feb 19:43 greyscale-pattern-opti.svg
-rw-rw-r--. 1 user user 112K 19. Feb 19:05 greyscale-pattern-opti.svg.gz
```

This is the output of a small test I did to visualize this topic. You should probably see that the raster graphic — the PNG — is already compressed and can’t be anymore. The opposite is the SVG, an XML file. This is just text and can compressed, to less then a fourth of its size. As a result it is now around 50 KB smaller in size than the PNG.

Modern browsers can handle compressed files natively. Therefore, a lot of web servers have switched on mod_deflate (Apache) and gzip (nginx). That’s how we save space during delivery. Check out if it’s enabled at your server [here][13].

### Tooling for production

First of all, nobody wants to always optimize SVG in Inkscape. You can run Inkscape without a GUI in batch mode, but there’s no option to convert from Inkscape SVG to optimized SVG. You can only export raster graphics this way. But there are alternatives:

  * SVGO (which seems not actively developed)
  * Scour



This example will use scour for optimization. To install it:

```
$ sudo dnf install scour
```

To automatically optimize an SVG file, run scour similarly to this:

```
[user@localhost ]$ scour INPUT.svg OUTPUT.svg -p 3 --create-groups --renderer-workaround --strip-xml-prolog --remove-descriptive-elements --enable-comment-stripping --disable-embed-rasters --no-line-breaks --enable-id-stripping --shorten-ids
```

This is the end of part two, in which you learned how to replace raster images with SVG and how to optimize it for usage. Stay tuned to the Fedora Magazine for part three, coming soon.


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/design-faster-web-pages-part-2-image-replacement/

作者：[Sirko Kemter][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/gnokii/
[b]: https://github.com/lujun9972
[1]: https://wp.me/p3XX0v-5fJ
[2]: https://fedoramagazine.org/howto-use-sudo/
[3]: https://fedoramagazine.org/?s=Inkscape
[4]: https://getfedora.org
[5]: https://fedoramagazine.org/wp-content/uploads/2018/02/getfedora_mag.png
[6]: https://codepen.io/Cthulahoop/pen/umcvo
[7]: https://codepen.io/jackrugile/pen/BvLHg
[8]: https://codepen.io/tholman/pen/lDLhk
[9]: https://fontawesome.com/
[10]: https://fedoramagazine.org/wp-content/uploads/2018/02/svg-optimization-nodes.png
[11]: https://fedoramagazine.org/wp-content/uploads/2018/02/node_cleaning.png
[12]: https://fedoramagazine.org/wp-content/uploads/2018/02/svg-optimizing-dialog.png
[13]: https://checkgzipcompression.com/?url=http%3A%2F%2Fgetfedora.org
