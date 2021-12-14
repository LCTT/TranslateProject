[#]: subject: "My favorite Linux commands for optimizing web images"
[#]: via: "https://opensource.com/article/21/12/optimize-web-images-linux"
[#]: author: "Ayush Sharma https://opensource.com/users/ayushsharma"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

My favorite Linux commands for optimizing web images
======
Generate resized and optimized images for thumbnails and banner images
for the web.
![Digital creative of a browser on the internet][1]

I used to stay away from images when working online. Handling and optimizing images can be both imprecise and time-consuming.

Then I found some commands that changed my mind. To create web pages, I use Jekyll, so I've included that in the directions. However, these commands will also work with other static site generators. 

### Image commands on Linux

The commands that made all the difference for me are `optipng`, `jpegoptim`, and, of course, the venerable `imagemagick`. Together, they make handling images easy to manage or even automate.

Here’s an overview of how I implemented my solution using these commands. I placed article images in my `static/images` folder. From there, I generated two copies of all PNG and JPG images:

  1. A cropped thumbnail version measuring 422 by 316
  2. A larger banner version, measuring 1024 by 768



Then I placed each copy (the thumbnail and the banner) into its own folder, and I leveraged Jekyll's custom variables for the folder paths. I outline each of these steps in greater detail below.

#### Installation

To follow along with my solution, be sure you have all the commands installed. On Linux, you can install `optipng`, `jpegoptim`, and `imagemagick` using your package manager.

On Fedora, CentOS, Mageia, and similar:


```
$ sudo dnf install optipng jpegoptim imagemagick
```

On Debian, Elementary, Mint, and similar:


```
$ sudo apt install optipng jpegoptim imagemagick
```

On macOS, use [MacPorts][2] or [Homebrew][3].


```
brew install optipng jpegoptim imagemagick
```

On Windows, use [Chocolatey][4].

### Creating folders for thumbnails and banners

After installing the commands, I created new folders under `static/images`. Generated thumbnails get placed into `img-thumbs`, and banners go in `img-normal`.


```


$ cd static/images
$ mkdir -p img-thumbs img-normal

```

With the folders created, I copied all GIF, SVG, JPG, and PNG files to both folders. I use the GIFs and SVGs as-is for thumbnails and banner images.


```


$ cp content/*.gif img-thumbs/; cp content/*.gif img-normal/
$ cp content/*.svg img-thumbs/; cp content/*.svg img-normal/
$ cp content/*.jpg img-thumbs/; cp content/*.jpg img-normal/
$ cp content/*.png img-thumbs/; cp content/*.png img-normal/

```

### Processing thumbnails

To resize and optimize the thumbnails, I use my three commands.

I use the `mogrify` command from `ImageMagick` to resize the JPGs and PNGs. Since I want the thumbnails to be 422 by 316, the command looks like this:


```


$ cd img-thumbs
$ mogrify -resize 422x316 *.png
$ mogrify -format jpg -resize 422x316 *.jpg

```

Now I optimize the PNGs using `optipng` and the JPGs using `jpegoptim`:


```


$ for i in *.png; do optipng -o5 -quiet "$i"; done
$ jpegoptim -sq *.jpg

```

In the above command:

  * For `optipng`, `-o5` switch sets the level of optimization, with 0 being the lowest.
  * For `jpegoptim`, `-s` strips all image metadata, and `-q` sets quiet mode.



### Processing banners

I process the banner images in essentially the same way I process the thumbnails, aside from the dimensions, which are 1024 by 768 for banners.


```


$ cd ..
$ cd img-normal
$ mogrify -resize 1024x768 *.png
$ mogrify -format jpg -resize 1024x768 *.jpg
$ for i in *.png; do optipng -o5 -quiet "$i"; done
$ jpegoptim -sq *.jpg

```

### Configuring the paths in Jekyll

The `img-thumbs` directory now contains my thumbnails. and `img-normal` contains the banners. To make my life easier, I set both of them to custom variables in my Jekyll `_config.yml`.


```


content-images-path: /static/images/img-normal/
content-thumbs-images-path: /static/images/img-thumbs/

```

Using the variables is simple. When I want to display the thumbnail, I prepend `content-thumbs-images-path` to the image. When I want to display the full banner, I prepend `content-images-path`.


```


{% if page.banner_img %}
 &lt;img src="{{ page.banner_img | prepend: site.content-images-path | \
prepend: site.baseurl | prepend: site.url }}" alt="Banner image for \
{{ page.title }}" /&gt;
{% endif %}

```

### Conclusion

There are several improvements I could make to my optimization commands.

Using `rsync` to copy only changed files to `img-thumbs` and `img-normal` is one obvious improvement. That way, I'm not reprocessing files over and over again. Adding those commands to [Git pre-commit hooks][5] or a CI pipeline is another useful step.

Resizing and optimizing images to reduce their size is a win for the user and the web as a whole. Maybe my next step for reducing image sizes will be [webp][6].

Fewer bytes transmitted over the wire means a lower carbon footprint, but that's another article. The UX victory is good enough for now.

* * *

_This article was originally posted on the [author's blog][7] and has been republished with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/optimize-web-images-linux

作者：[Ayush Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ayushsharma
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_web_internet_website.png?itok=g5B_Bw62 (Digital creative of a browser on the internet)
[2]: https://opensource.com/article/20/11/macports
[3]: https://opensource.com/article/20/6/homebrew-mac
[4]: https://opensource.com/article/20/3/chocolatey
[5]: https://opensource.com/life/16/8/how-construct-your-own-git-server-part-6
[6]: https://opensource.com/article/20/4/webp-image-compression
[7]: https://www.ayushsharma.in/2021/11/optimising-jpg-and-png-images-for-a-jekyll-blog
