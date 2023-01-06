[#]: subject: "My favorite Linux commands for optimizing web images"
[#]: via: "https://opensource.com/article/21/12/optimize-web-images-linux"
[#]: author: "Ayush Sharma https://opensource.com/users/ayushsharma"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14096-1.html"

用 Linux 命令优化网页图片
======

> 为网页上的缩略图和横幅图片生成经过调整和优化的图片。

![](https://img.linux.net.cn/data/attachment/album/202112/19/100432i8qzjr6t22g68uoi.jpg)

以前我在处理网页工作时，我对图像敬而远之。处理和优化图像既不精确又费时。

后来我发现了一些命令，改变了我的想法。为了创建网页，我使用 Jekyll，所以我在说明中包括了它。然而，这些命令也可以用于其他静态网站生成器。

### Linux 上的图像命令

对我来说有用的命令是 `optipng`、`jpegoptim`，当然还有古老的 `imagemagick`。它们一起使处理图像变得容易管理，甚至可以自动化。

下面是我如何使用这些命令实现我的解决方案的概述。我把文章图片放在我的 `static/images` 文件夹中。在那里，我生成了所有 PNG 和 JPG 图片的两个副本：

  1. 一个裁剪过的缩略图版本，尺寸为 422×316
  2. 一个更大的横幅版本，尺寸为 1024×768

然后，我把每个副本（缩略图和横幅）放入自己的文件夹，并利用 Jekyll 的自定义变量来确定文件夹路径。下面我将更详细地介绍这些步骤中的每一步。

#### 安装

要跟上我的解决方案，请确保你已经安装了所有的命令。在 Linux 上，你可以使用软件包管理器安装 `optipng`、`jpegoptim` 和 `imagemagick`。

在 Fedora、CentOS、Mageia 和类似系统上：

```
$ sudo dnf install optipng jpegoptim imagemagick
```

在 Debian、Elementary、Mint 和类似系统上：

```
$ sudo apt install optipng jpegoptim imagemagick
```

在 macOS 上，使用 [MacPorts][2] 或 [Homebrew][3]：

```
brew install optipng jpegoptim imagemagick
```

在 Windows 上，使用 [Chocolatey][4]。

### 为缩略图和横幅创建文件夹

安装完这些命令后，我在 `static/images` 下创建了新的文件夹。生成的缩略图放在 `img-thumbs`，横幅放在 `img-normal`。

```
$ cd static/images
$ mkdir -p img-thumbs img-normal
```

创建了文件夹后，我把所有的 GIF、SVG、JPG 和 PNG 文件复制到这两个文件夹。我把 GIF 和 SVG 原封不动地用于缩略图和横幅图片。

```
$ cp content/*.gif img-thumbs/; cp content/*.gif img-normal/
$ cp content/*.svg img-thumbs/; cp content/*.svg img-normal/
$ cp content/*.jpg img-thumbs/; cp content/*.jpg img-normal/
$ cp content/*.png img-thumbs/; cp content/*.png img-normal/
```

### 处理缩略图

为了调整和优化缩略图的大小，我使用了三个命令。

我使用 `ImageMagick` 的 `mogrify` 命令来调整 JPG 和 PNG 的大小。因为我希望缩略图是 422×316，所以命令看起来像这样:

```
$ cd img-thumbs
$ mogrify -resize 422x316 *.png
$ mogrify -format jpg -resize 422x316 *.jpg
```

现在我用 `optipng` 优化 PNG，用 `jpegoptim` 优化 JPG：

```
$ for i in *.png; do optipng -o5 -quiet "$i"; done
$ jpegoptim -sq *.jpg
```

在上述命令中：

  * 对于 `optipng`，`-o5` 开关设置了优化的级别，0 是最低的。
  * 对于`jpegoptim`，`-s` 剥离所有图像元数据，`-q` 设置安静模式。

### 处理横幅

我处理横幅图片的方法与处理缩略图的方法基本相同，除了尺寸外，横幅图片的尺寸为 1024×768。

```
$ cd ..
$ cd img-normal
$ mogrify -resize 1024x768 *.png
$ mogrify -format jpg -resize 1024x768 *.jpg
$ for i in *.png; do optipng -o5 -quiet "$i"; done
$ jpegoptim -sq *.jpg
```

### 配置 Jekyll 中的路径

`img-thumbs` 目录现在包含我的缩略图，`img-normal` 包含横幅。为了更轻松一些，我在Jekyll的 `_config.yml` 中把它们都设置为自定义变量。

```
content-images-path: /static/images/img-normal/
content-thumbs-images-path: /static/images/img-thumbs/
```

使用这些变量很简单。当我想显示缩略图时，我把 `content-thumbs-images-path` 加到图片上。当我想显示完整的横幅时，我在前面添加 `content-images-path`。

```
{% if page.banner_img %}
 <img src="{{ page.banner_img | prepend: site.content-images-path | \
prepend: site.baseurl | prepend: site.url }}" alt="Banner image for \
{{ page.title }}" />
{% endif %}
```

### 总结

我可以对我的优化命令做几个改进。

使用 `rsync` 只复制改变过的文件到 `img-thumbs` 和 `img-normal` 是一个明显的改进。这样一来，我就不会一次又一次地重新处理文件。将这些命令添加到 [Git 提交前钩子][5] 或 CI 流水线中是另一个有用的步骤。

调整和优化图像以减少其大小，对用户和整个网页来说都是一种胜利。也许我减少图片尺寸的下一步将是 [webp][6]。

更少的字节通过电线传输意味着更低的碳足迹，但这是另一篇文章。目前，用户体验的胜利已经足够好了。

本文原载于[作者的博客][7]，已获授权转载。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/optimize-web-images-linux

作者：[Ayush Sharma][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

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
