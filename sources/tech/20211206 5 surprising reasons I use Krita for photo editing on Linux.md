[#]: subject: "5 surprising reasons I use Krita for photo editing on Linux"
[#]: via: "https://opensource.com/article/21/12/open-source-photo-editing-krita"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

5 surprising reasons I use Krita for photo editing on Linux
======
The tools provided by Krita for editing digital paint work just as well
for pixels representing a photograph.
![Old camera blue][1]

Krita is best known as a digital painting application, but in my experience, it's kind of a digital imaging powerhouse. Recently, a fork of GIMP called GLIMPSE had to pause its development, and because I like alternatives, it occurred to me that Krita could be a reasonable photo editor for at least some use cases. It isn't easy to measure the suitability of an application for a group of tasks because different people require or prefer different things. What's very common and indispensable to one person is an edge case for someone else. However, photo editing applications are broadly known for a primarily universal set of functions, so I decided to look at those likely to be in a top 5 must-have list and test Krita against each one.

### 1\. Layers

Photo editors have layers. That was one of the first game-changing features of digital photo editors, and it remains one of the most basic requirements. Krita, of course, has layers, and in fact, so many paint and photo applications do these days that I probably could have glossed over it. There's a reason I mention this as a requirement, though. Krita doesn't just have layers. It's got twelve different kinds of layers. Of course, _more_ doesn't always mean _better_. What matters is what Krita does with all those layers.

  1. **Paint:** The default kind of layer containing raster data.
  2. **Vector:** It's no Inkscape, but Krita does support vector and has several good vector drawing tools. This layer stores vector data, including text.
  3. **Group:** A folder for layers.
  4. **Filter:** A layer containing nothing but an effect, which gets applied to all layers below it, as if you were looking at your image through a special lens. Combined with a group layer, you can apply this lens to only the layers you want.
  5. **Filter mask:** Like a filter layer, a filter mask is a layer that gets attached to just one other layer. Because it is a layer and not just a jumble of settings, it's easy to duplicate on other layers as needed, and it can stack with other filters.
  6. **Colorize mask:** Colorize regions of a picture with just one stroke of a paintbrush. This is very much an illustrator's tool, and I've found little to no use for this tool in photography. It could have interesting results for some photos, though.
  7. **Clone:** An effect layer that updates based on its "parent." It's a little like an alias or symlink for layers and can be helpful when you need one layer to be in more than one place. For example, you can group an effect layer and a clone layer to isolate a special effect without actually moving your source layer from its group.
  8. **Fill:** A layer containing a fill, which can be anything from a solid color to gradient to patterns or noise. Combined with compositing modes, there are great effects you can achieve with this, and because it's a layer type, it's easy to modify and change on a whim.
  9. **File:** Dynamically loads a file as a layer. When the file changes, so does the layer. Never open a dozen files to change a company logo, watermark, or iconography again.
  10. **Selection:** Store selections as layers attached to a paint layer, so you only have to select an important region once.
  11. **Transparency:** Have you ever wanted to paint with Alpha? Now you can. Black paint produces 100% transparency, white paint produces 0%, and all shades of gray are available in between.
  12. **Transform:** Apply transformation to a layer. Because it's a layer type, it's easy to modify and change on a whim.



If the capabilities of these layers somehow haven't convinced you to use Krita as your photo editor, don't worry: Krita has much more to offer.

### 2\. Selections

Photo editing applications need the ability to select sometimes complex and uneven parts of a photograph. Sometimes you want to remove an element from the frame. Other times you want to emphasize it, or duplicate it, or adjust it in some way. Krita has all the usual selection tools: rectangle, elliptical, freehand (also sometimes known as a "lasso"), polygonal, and contiguous color.

It also has a _similar color_ selection tool, which is essentially a contiguous color selection for the entire image, contiguous or not.

![Similar color selection in Krita][2]

(Seth Kenlon, [CC BY-SA 4.0][3])

There's also a bezier selection tool and a magnetic selection tool that finds edges as you draw your selection. It's sort of an assisted freehand tool.

![Magnetic selection in Krita][4]

(Seth Kenlon, [CC BY-SA 4.0][3])

This is a great assortment of selection tools, and I do find myself using them for quick and easy selections. However, once I'd discovered Selection Layers and the Global Mask layer, it was hard to use anything else.

To activate the global mask layer, go to the **Select** menu and choose **Show Global Selection Mask**. A (temporary) red overlay gets added to your image. Using an assortment of paintbrushes (and Krita has no shortage of variety in that department), you can poke through the mask with white paint or add to the mask with black paint.

Everything you paint white becomes a selection when you click back onto your image layer.

![Selection mask][5]

(Seth Kenlon, [CC BY-SA 4.0][3])

It's a very precise and endlessly editable selection method, and its only fault is that it's so powerful. It's easy to lose hours of your time in pursuit of that mythical perfect mask, so pace yourself.

### 3\. Filters

The industry moves in cycles. Once upon a time, drop shadows were the sign of advanced digital artistry, then 3D bevels, glows, gloss, reflection, and of course, lens flare. It's true that filters get over-used sometimes, but when used judiciously, they really are one of the primary reasons photo editors are so useful. Commonplace tasks like color balance, dodging and burning used to be impossible outside of a darkroom.

![Color balance in Krita][6]

(Seth Kenlon, [CC BY-SA 4.0][3])

Open source has pioneered much of the most advanced imaging software (did you know that content-aware selection was created for GIMP?), and that includes effects. Krita benefits from this and takes full advantage of it. Not only does Krita offer the usual array of effects, like color balance, contrast, levels, threshold, saturation, and so on, but with the wildly popular [G'MIC][7] plugin, it offers hundreds of additional filters and effects.

![G'MIC plugin for Krita][8]

(Seth Kenlon, [CC BY-SA 4.0][3])

The only things I noticed Krita lacking were spot dodge and burn tools. I rarely use these tools in a photo editor, and you can emulate them with a mask and a filter layer, so it's probably not an issue.

### 4\. CMYK and ICC profiles

I've had plenty of work professionally printed, and I've never had any issue with it, but some people need the CMYK colorspace for their workflow. Krita has both the RGB and CMYK mode and full support for ICC colorspaces, so you can match modes and profiles to other applications in your pipeline. 

### 5\. Retouching

If you need to smooth over wrinkles, color in grays, redden lips, brighten eyes, remove a rubbish bin from the background, or otherwise retouch a photo, you're in luck. Digital painting is exactly what Krita was _actually_ built to do. This is what Krita does best, and there are plenty of composite modes to help you integrate your paint with your photo.

![Smart patching with Krita][9]

(Seth Kenlon, [CC BY-SA 4.0][3])

### Krita isn't just for painting anymore

The Krita development team makes no claims about Krita being a photo editor. Still, after years of enjoying it for digital paint and materials emulation, I've found that Krita's development has, probably accidentally, converged with what a photographer needs. The tools provided by Krita for editing digital paint work just as well for pixels representing a photograph. I've enjoyed opening photos in Krita, and I've been pleased with the workflow and the results. Make no mistake: Krita is its own application, so you do have to re-train your muscles and sometimes approach a task from a different angle, but once you get familiar with the tools Krita offers, you may not want to give them up.

Krita is [available for Linux, Windows, and macOS][10].

On Fedora, Mageia, and similar distributions, you can install it with your package manager:


```
`$ sudo dnf install krita`
```

On Elementary, Mint, and other Debian-based distributions:


```
`$ sudo apt install krita`
```

I use Krita as a [Flatpak][11].

If you want to support the continued development of Krita, you can also buy Krita for Linux and Windows on Steam.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/open-source-photo-editing-krita

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc-photo-camera-blue.png?itok=AsIMZ9ga (Old camera blue)
[2]: https://opensource.com/sites/default/files/uploads/krita-similar-colour-selection.jpg (Similar color selection in Krita)
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://opensource.com/sites/default/files/uploads/krita-magnetic-selection.jpg (Magnetic selection in Krita)
[5]: https://opensource.com/sites/default/files/uploads/krita-mask-selection.jpg (Selection mask)
[6]: https://opensource.com/sites/default/files/uploads/krita-color-balance.jpg (Color balance in Krita)
[7]: https://gmic.eu
[8]: https://opensource.com/sites/default/files/uploads/krita-gmic.jpg (G'MIC plugin for Krita)
[9]: https://opensource.com/sites/default/files/uploads/krita-smart-patch.jpg (Smart patching with Krita)
[10]: https://krita.org/en/download/krita-desktop/
[11]: https://opensource.com/article/21/11/install-flatpak-linux
