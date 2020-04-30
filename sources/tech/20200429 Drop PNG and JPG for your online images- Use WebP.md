[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Drop PNG and JPG for your online images: Use WebP)
[#]: via: (https://opensource.com/article/20/4/webp-image-compression)
[#]: author: (Jeff Macharyas https://opensource.com/users/jeffmacharyas)

Drop PNG and JPG for your online images: Use WebP
======
Get started with this open source image editing tool to save time and
space.
![Painting art on a computer screen][1]

WebP is an image format developed by Google in 2010 that provides superior lossless and lossy compression for images on the web. Using WebP, web developers can create smaller, richer images that improve site speed. A faster loading website is critical to the user experience and for the website's marketing effectiveness.

For optimal loading across all devices and users, images on your site should not be larger than 500 KB in file size.

WebP lossless images are often at least 25% smaller in size compared to PNGs. WebP lossy images are often anywhere from 25-34% smaller than comparable JPEG images at equivalent SSIM (structural similarity) quality index.

Lossless WebP supports transparency, as well. For cases when lossy RGB compression is acceptable, lossy WebP also supports transparency, typically providing three times smaller file sizes compared to PNG.

Google reports a 64% reduction in file size for images converted from animated GIFs to lossy WebP, and a 19% reduction when converted to lossless WebP.

The WebP file format is based on the RIFF (resource interchange file format) document format. The file signature is **52 49 46 46** (RIFF), as you can see with [hexdump][2]:


```
$ hexdump --canonical pixel.webp
00000000  52 49 46 46 26 00 00 00  [...]  |RIFF&amp;...WEBPVP8 |
00000010  1a 00 00 00 30 01 00 9d  [...]  |....0....*......|
00000020  0e 25 a4 00 03 70 00 fe  [...]  |.%...p...`....|
0000002e
```

The standalone libwebp library serves as a reference implementation for the WebP specification and is available from Google's [Git repository][3] or as a tarball.

The WebP format is compatible with 80% of the web browsers in use worldwide. At the time of this writing, it is not compatible with Apple's Safari browser. The workaround for this is to serve up a JPG/PNG alongside a WebP, and there are methods and Wordpress plugins to do that.

### Why does this matter?

Part of my job is to design and maintain our organization's website. Since the website is a marketing tool and site speed is a critical aspect of the user experience, I have been working to improve the speed, and reducing image sizes by converting them to WebP has been a good solution.

To test the speed of one of the pages, I turned to **web.dev**, which is powered by Lighthouse, released under the Apache 2.0 license, and can be found at <https://github.com/GoogleChrome/lighthouse>.

According to its official description, "Lighthouse is an open source, automated tool for improving the quality of web pages. You can run it against any web page—public or requiring authentication. It has audits for performance, accessibility, progressive web apps, SEO, and more. You can run Lighthouse in Chrome DevTools, from the command line, or as a Node module. You give Lighthouse a URL to audit, it runs a series of audits against the page, and then it generates a report on how well the page did. From there, use the failing audits as indicators on how to improve the page. Each audit has a reference doc explaining why the audit is important, as well as how to fix it."

### Creating a smaller WebP image

The page I tested returned three images. In the report it generates, it provides recommendations and targets. I chose the "app-graphic" image, which, it reported, is 650 KB. By converting it to WebP, I should save 589 KB, reducing the image to 61 KB. I converted the image in Photoshop and saved it with the default WebP settings, and it returned a file size of 44.9 KB. Better than expected! As the screenshot from Photoshop shows, the images look identical in visual quality.

![WebP vs JPG comparison][4]

On the left: 650 KB (actual size). On the right: 589 KB (target size after conversion).

Of course, the open source image editor [GIMP][5] also supports WebP as an export format. It offers several options for quality and compression profile:

![GIMP dialog for exporting webp, as a webp][6]

A zoomed-in look of another image:

![WebP vs PNG comparison][7]

PNG (left) and WebP (right), both converted from a JPG, shows the WebP, although smaller in size, is superior in visual quality.

### Convert to an image to WebP

To convert images on Linux from JPG/PNG to WebP, you can also use the command-line:

Use **cwebp** on the command line to convert PNG or JPG image files to WebP format. You can convert a PNG image file to a WebP image with a quality range of 80 with the command:


```
`cwebp -q 80 image.png -o image.webp`
```

Alternatively, you can also use [Image Magick][8], which is probably available in your distribution's software repository. The subcommand for conversion is **convert**, and all that's needed is an input and output file:


```
`convert pixel.png pixel.webp`
```

### Convert an image to WebP with an editor

To convert images to WebP with a photo editor, use [GIMP][9]. From version 2.10 on, it supports WebP natively.

If you're a Photoshop user, you need a plugin to convert the files, as Photoshop does not include it natively. WebPShop 0.2.1, released under the Apache License 2.0 license, is a Photoshop module for opening and saving WebP images, including animations, and can be found at: <https://github.com/webmproject/WebPShop>.

To use the plugin, put the file found in the **bin** folder inside your Photoshop plugin directory:

Windows x64—C:\Program Files\Adobe\Adobe Photoshop\Plug-ins\WebPShop.8bi

Mac—Applications/Adobe Photoshop/Plug-ins/WebPShop.plugin

### WebP on Wordpress

Many websites are built using Wordpress (that's what I use). So, how does Wordpress handle uploading WebP images? At the time of this writing, it doesn't. But, there are, of course, plugins to enable it so you can serve up both WebP alongside PNG/JPG images (for the Apple crowd).

Or there are these [instructions][10] from [Marius Hosting][11]:

"How about directly uploading WebP images to Wordpress? This is easy. Just add some text line on your theme functions.php file. Wordpress does not natively support viewing and uploading WebP files, but I will explain to you how you can make it work in a few simple steps. Log in to your Wordpress admin area and go to Appearance/Theme Editor and find functions.php. Copy and paste the code below at the end of the file and save it. 


```
`//** *Enable upload for webp image files.*/ function webp_upload_mimes($existing_mimes) { $existing_mimes['webp'] = 'image/webp'; return $existing_mimes; } add_filter('mime_types', 'webp_upload_mimes');`
```

If you want to see the thumbnail image preview when you go to Media/Library, you have to add the code below in the same functions.php file. To find the functions.php file, go to Appearance/Theme Editor and find functions.php, then copy and paste the code below at the end of the file and save it."


```
`//** * Enable preview / thumbnail for webp image files.*/ function webp_is_displayable($result, $path) { if ($result === false) { $displayable_image_types = array( IMAGETYPE_WEBP ); $info = @getimagesize( $path ); if (empty($info)) { $result = false; } elseif (!in_array($info[2], $displayable_image_types)) { $result = false; } else { $result = true; } } return $result; } add_filter('file_is_displayable_image', 'webp_is_displayable', 10, 2);`
```

### WebP and the future

WebP is a robust and optimized format. It looks better, it has better compression ratio, and it has all the features of most other common image formats. There's no need to wait—start using it now.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/webp-image-compression

作者：[Jeff Macharyas][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jeffmacharyas
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/painting_computer_screen_art_design_creative.png?itok=LVAeQx3_ (Painting art on a computer screen)
[2]: https://opensource.com/article/19/8/dig-binary-files-hexdump
[3]: https://storage.googleapis.com/downloads.webmproject.org/releases/webp/index.html
[4]: https://opensource.com/sites/default/files/uploads/webp-vs-jpg-app-graphic.png (WebP vs JPG comparison)
[5]: http://gimp.org
[6]: https://opensource.com/sites/default/files/webp-gimp.webp (GIMP dialog for exporting webp, as a webp)
[7]: https://opensource.com/sites/default/files/uploads/xcompare-png-left-webp-right.png (WebP vs PNG comparison)
[8]: https://imagemagick.org
[9]: https://en.wikipedia.org/wiki/GIMP
[10]: https://mariushosting.com/how-to-upload-webp-files-on-wordpress/
[11]: https://mariushosting.com/
