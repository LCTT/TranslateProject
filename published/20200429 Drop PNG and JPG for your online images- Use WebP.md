[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12193-1.html)
[#]: subject: (Drop PNG and JPG for your online images: Use WebP)
[#]: via: (https://opensource.com/article/20/4/webp-image-compression)
[#]: author: (Jeff Macharyas https://opensource.com/users/jeffmacharyas)

线上图片请抛弃 PNG 和 JPG：使用 WebP
======

> 了解一下这个开源的图片编辑工具来节省时间和空间。

![](https://img.linux.net.cn/data/attachment/album/202005/07/143932l22hot7ebhbbqjmm.jpg)

WebP 是 2010 年 Google 开发的一种图片格式，它为网页上的图片提供了卓越的无损和有损压缩。网站开发者们可以使用 WebP 来创建尺寸更小、细节更丰富的图片，以此来提高网站的速度。更快的加载速度对于网站的用户体验和网站的营销效果是至关重要的。

为了在所有设备和用户中达到最佳加载效果，你网站上的图片文件大小不应该超过 500 KB。

与 PNG 图片相比，WebP 无损图片通常至少要比 PNG 图片小 25%。在同等的 SSIM（<ruby>结构相似度<rt>structural similarity</rt></ruby>）质量指标下，WebP 有损图片通常比 JPEG 图片小 25% 到 34%。

无损 WebP 也支持透明度。而在可接受有损 RGB 压缩的情况下，有损 WebP 也支持透明度，通常其大小比 PNG 文件小三倍。

Google 报告称，把动画 GIF 文件转换为有损 WebP 后文件大小减少了 64%，转换为无损 WebP 后文件大小减少了 19%。

WebP 文件格式是一种基于 RIFF（<ruby>资源互换文件格式<rt>resource interchange file format</rt></ruby>）的文档格式。你可以用 [hexdump][2] 看到文件的签名是 `52 49 46 46`（RIFF）：


```
$ hexdump --canonical pixel.webp
00000000  52 49 46 46 26 00 00 00  [...]  |RIFF&amp;...WEBPVP8 |
00000010  1a 00 00 00 30 01 00 9d  [...]  |....0....*......|
00000020  0e 25 a4 00 03 70 00 fe  [...]  |.%...p...`....|
0000002e
```

独立的 libwebp 库作为 WebP 技术规范的参考实现，可以从 Google 的 [Git 仓库][3] 或 tar 包中获得。

全球在用的 80% 的 web 浏览器兼容 WebP 格式。本文撰写时，Apple 的 Safari 浏览器还不兼容。解决这个问题的方法是将 JPG/PNG 图片与 WebP 图片一起提供，有一些方法和 Wordpress 插件可以做到这一点。

### 为什么要这样做？

我的部分工作是设计和维护我们组织的网站。由于网站是个营销工具，而网站的速度是衡量用户体验的重要指标，我一直致力于提高网站速度，通过把图片转换为 WebP 来减少图片大小是一个很好的解决方案。

我使用了 web.dev 来检测其中一个网页，该工具是由 Lighthouse 提供服务的，遵循 Apache 2.0 许可证，可以在 <https://github.com/GoogleChrome/lighthouse> 找到。

据其官方描述，“LIghthouse 是一个开源的，旨在提升网页质量的自动化工具。你可以在任何公共的或需要鉴权的网页上运行它。它有性能、可用性、渐进式 web 应用、SEO 等方面的审计。你可以在 Chrome 浏览器的开发工具中运行 Lighthouse，也可以通过命令行或作为 Node 模块运行。你输入一个 URL 给 Lighthouse，它会对这个网页进行一系列的审计，然后生成这个网页的审计结果报告。从报告的失败审计条目中可以知道应该怎么优化网页。每条审计都有对应的文档解释为什么该项目是重要的，以及如何修复它。”

### 创建更小的 WebP 图片

我测试的页面返回了三张图片。在它生成的报告中，它提供了推荐和目标。我选择了它报告有 650 KB 的 `app-graphic` 图片。通过把它转换为 WebP 格式，预计可以把图片大小降到 61 KB，节省 589 KB。我在 Photoshop 中把它转换了，用默认的 WebP 设置参数保存它，它的文件大小为 44.9 KB。比预期的还要好！从下面的 Photoshop 截图中可以看出，两张图在视觉质量上完全一样。

![WebP vs JPG comparison][4]

*左图：650 KB（实际大小）。右图： 44.9 KB（转换之后的目标大小）。*

当然，也可以用开源图片编辑工具 [GIMP][5] 把图片导出为 WebP。它提供了几个质量和压缩的参数：

![GIMP dialog for exporting webp, as a webp][6]

另一张图放大后：

![WebP vs PNG comparison][7]

PNG（左图）和 WebP（右图），都是从 JPG 转换而来，两图对比可以看出 WebP 不仅在文件大小更小，在视觉质量上也更优秀。

### 把图片转换为 WebP

你也可以用 Linux 的命令行工具把图片从 JPG/PNG 转换为 WebP：

在命令行使用 `cwebp` 把 PNG 或 JPG 图片文件转换为 WebP 格式。你可以用下面的命令把 PNG 图片文件转换为质量参数为 80 的 WebP 图片。

```
cwebp -q 80 image.png -o image.webp
```

你还可以用 [Image Magick][8]，这个工具可能在你的发行版本软件仓库中可以找到。转换的子命令是 `convert`，它需要的所有参数就是输入和输出文件：

```
convert pixel.png pixel.webp
```

### 使用编辑器把图片转换为 WebP

要在图片编辑器中来把图片转换为 WebP，可以使用 [GIMP][9]。从 2.10 版本开始，它原生地支持 WebP。

如果你是 Photoshop 用户，由于 Photoshop 默认不包含 WebP 支持，因此你需要一个转换插件。遵循 Apache License 2.0 许可证发布的 WebPShop 0.2.1 是一个用于打开和保存包括动画图在内的 WebP 图片的 Photoshop 模块，在 <https://github.com/webmproject/WebPShop> 可以找到。

为了能正常使用它，你需要把它放进 Photoshop 插件目录下的 `bin` 文件夹：

Windows x64 ：`C:\Program Files\Adobe\Adobe Photoshop\Plug-ins\WebPShop.8bi`

Mac：`Applications/Adobe Photoshop/Plug-ins/WebPShop.plugin`

### Wordpress 上的 WebP

很多网站是用 Wordpress 搭建的（我的网站就是）。因此，Wordpress 怎么上传 WebP 图片？本文撰写时，它还不支持。但是，当然已经有插件来满足这种需求，因此你可以在你的网站上同时准备 WebP 和 PNG/JPG 图片（为 Apple 用户）。

在 [Marius Hosting][11] 有下面的[说明][10]：

“直接向 Wordpress 上传 WebP 图片会怎样？这很简单。向你的主题 `functions.php` 文件添加几行内容就可以了。Wordpress 默认不支持展示和上传 WebP 文件，但是我会向你介绍一下怎么通过几个简单的步骤来让它支持。登录进你的 Wordpress 管理员界面，进入‘外观/主题编辑器’找到 `functions.php`。复制下面的代码粘贴到该文件最后并保存：

```
//** *Enable upload for webp image files.*/
function webp_upload_mimes($existing_mimes) {
    $existing_mimes['webp'] = 'image/webp';
    return $existing_mimes;
}
add_filter('mime_types', 'webp_upload_mimes');
```

如果你想在‘媒体/媒体库’时看到缩略图预览，那么你需要把下面的代码也添加到 `functions.php` 文件。为了找到 `functions.php` 文件，进入‘外观/主题编辑器’并搜索 `functions.php`，然后复制下面的代码粘贴到文件最后并保存：

```
//** * Enable preview / thumbnail for webp image files.*/
function webp_is_displayable($result, $path) {
    if ($result === false) {
        $displayable_image_types = array( IMAGETYPE_WEBP );
        $info = @getimagesize( $path );

        if (empty($info)) {
            $result = false;
        } elseif (!in_array($info[2], $displayable_image_types)) {
            $result = false;
        } else {
            $result = true;
        }
    }

    return $result;
}
add_filter('file_is_displayable_image', 'webp_is_displayable', 10, 2);
```

”

### WebP 和未来

WebP 是一个健壮而优化的格式。它看起来更好，压缩率更高，并具有其他大部分常见图片格式的所有特性。不必再等了，现在就使用它吧。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/webp-image-compression

作者：[Jeff Macharyas][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jeffmacharyas
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/painting_computer_screen_art_design_creative.png?itok=LVAeQx3_ (Painting art on a computer screen)
[2]: https://opensource.com/article/19/8/dig-binary-files-hexdump
[3]: https://storage.googleapis.com/downloads.webmproject.org/releases/webp/index.html
[4]: https://opensource.com/sites/default/files/uploads/webp-vs-jpg-app-graphic.png (WebP vs JPG comparison)
[5]: http://gimp.org
[6]: https://img.linux.net.cn/data/attachment/album/202005/07/143538plu797s4wmhy9b1p.jpg (GIMP dialog for exporting webp, as a webp)
[7]: https://opensource.com/sites/default/files/uploads/xcompare-png-left-webp-right.png (WebP vs PNG comparison)
[8]: https://imagemagick.org
[9]: https://en.wikipedia.org/wiki/GIMP
[10]: https://mariushosting.com/how-to-upload-webp-files-on-wordpress/
[11]: https://mariushosting.com/
