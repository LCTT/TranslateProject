Create animated, scalable vector graphic images with MacSVG
======

Open source SVG: The writing is on the wall

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/open_design_paper_plane_2_0.jpg?itok=xKdP-GWE)

The Neo-Babylonian regent [Belshazzar][1] did not heed [the writing on the wall][2] that magically appeared during his great feast. However, if he had had a laptop and a good internet connection in 539 BC, he might have staved off those pesky Persians by reading the SVG on the browser.

Animating text and objects on web pages is a great way to build user interest and engagement. There are several ways to achieve this, such as a video embed, an animated GIF, or a slideshow—but you can also use [scalable vector graphics][3] (SVG).

An SVG image is different from, say, a JPG, because it is scalable without losing its resolution. A vector image is created by points, not dots, so no matter how large it gets, it will not lose its resolution or pixelate. An example of a good use of scalable, static images would be logos on websites.

### Move it, move it

You can create SVG images with several drawing programs, including open source [Inkscape][4] and Adobe Illustrator. Getting your images to “do something” requires a bit more effort. Fortunately, there are open source solutions that would get even Belshazzar’s attention.

[MacSVG][5] is one tool that will get your images moving. You can find the source code on [GitHub][6].

Developed by Douglas Ward of Conway, Arkansas, MacSVG is an “open source Mac OS app for designing HTML5 SVG art and animation,” according to its [website][5].

I was interested in using MacSVG to create an animated signature. I admit that I found the process a bit confusing and failed at my first attempts to create an actual animated SVG image.

![](https://opensource.com/sites/default/files/uploads/macsvg-screen.png)

It is important to first learn what makes “the writing on the wall” actually write.

The attribute behind the animated writing is [stroke-dasharray][7]. Breaking the term into three words helps explain what is happening: Stroke refers to the line or stroke you would make with a pen, whether physical or digital. Dash means breaking the stroke down into a series of dashes. Array means producing the whole thing into an array. That’s a simple overview, but it helped me understand what was supposed to happen and why.

With MacSVG, you can import a graphic (.PNG) and use the pen tool to trace the path of the writing. I used a cursive representation of my first name. Then it was just a matter of applying the attributes to animate the writing, increase and decrease the thickness of the stroke, change its color, and so on. Once completed, the animated writing was exported as an .SVG file and was ready for use on the web. MacSVG can be used for many different types of SVG animation in addition to handwriting.

### The writing is on the WordPress

I was ready to upload and share my SVG example on my [WordPress][8] site, but I discovered that WordPress does not allow for SVG media imports. Fortunately, I found a handy plugin: Benbodhi’s [SVG Support][9] allowed a quick, easy import of my SVG the same way I would import a JPG to my Media Library. I was able to showcase my [writing on the wall][10] to Babylonians everywhere.

I opened the source code of my SVG in [Brackets][11], and here are the results:

```
<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cc="http://web.resource.org/cc/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd" xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape" height="360px" style="zoom: 1;" cursor="default" id="svg_document" width="480px" baseProfile="full" version="1.1" preserveAspectRatio="xMidYMid meet" viewBox="0 0 480 360"><title id="svg_document_title">Path animation with stroke-dasharray</title><desc id="desc1">This example demonstrates the use of a path element, an animate element, and the stroke-dasharray attribute to simulate drawing.</desc><defs id="svg_document_defs"></defs><g id="main_group"></g><path stroke="#004d40" id="path2" stroke-width="9px" d="M86,75 C86,75 75,72 72,61 C69,50 66,37 71,34 C76,31 86,21 92,35 C98,49 95,73 94,82 C93,91 87,105 83,110 C79,115 70,124 71,113 C72,102 67,105 75,97 C83,89 111,74 111,74 C111,74 119,64 119,63 C119,62 110,57 109,58 C108,59 102,65 102,66 C102,67 101,75 107,79 C113,83 118,85 122,81 C126,77 133,78 136,64 C139,50 147,45 146,33 C145,21 136,15 132,24 C128,33 123,40 123,49 C123,58 135,87 135,96 C135,105 139,117 133,120 C127,123 116,127 120,116 C124,105 144,82 144,81 C144,80 158,66 159,58 C160,50 159,48 161,43 C163,38 172,23 166,22 C160,21 155,12 153,23 C151,34 161,68 160,78 C159,88 164,108 163,113 C162,118 165,126 157,128 C149,130 152,109 152,109 C152,109 185,64 185,64 " fill="none" transform=""><animate values="0,1739;1739,0;" attributeType="XML" begin="0; animate1.end+5s" id="animateSig1" repeatCount="indefinite" attributeName="stroke-dasharray" fill="freeze" dur="2"></animate></path></svg>
```

What would you use MacSVG for?

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/macsvg-open-source-tool-animation

作者：[Jeff Macharyas][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rikki-endsley
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Belshazzar
[2]: https://en.wikipedia.org/wiki/Belshazzar%27s_feast
[3]: https://en.wikipedia.org/wiki/Scalable_Vector_Graphics
[4]: https://inkscape.org/
[5]: https://macsvg.org/
[6]: https://github.com/dsward2/macSVG
[7]: https://gist.github.com/mbostock/5649592
[8]: https://macharyas.com/
[9]: https://wordpress.org/plugins/svg-support/
[10]: https://macharyas.com/index.php/2018/10/14/open-source-svg/
[11]: http://brackets.io/
