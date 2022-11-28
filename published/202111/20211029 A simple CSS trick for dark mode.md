[#]: subject: "A simple CSS trick for dark mode"
[#]: via: "https://opensource.com/article/21/10/dark-themes-websites"
[#]: author: "Ayush Sharma https://opensource.com/users/ayushsharma"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13950-1.html"

一个深色模式的简单 CSS 技巧
======

> 让你的网站根据用户选择的主题进行调整的能力是一个很棒的辅助功能。

![](https://img.linux.net.cn/data/attachment/album/202111/04/101203a19wb2ptlcmwmmnl.jpg)

你可能已经熟悉<ruby>媒体查询<rt>media query</rt></ruby>了。它们被广泛地用于使网站具有响应性。`width` 和 `height` 属性包含视区的尺寸。然后，你可以使用 CSS 在不同的尺寸下呈现不同的布局。

[prefers-color-scheme 媒体查询][2] 的工作方式与此相同。用户可以将他们的操作系统配置为使用浅色或深色主题。`prefers-color-scheme` 包含这个值。该值是 `light` 或 `dark` ，尽管 W3C 规范指出它可能支持未来的值，如 `sepia`。我为这两种模式指定不同的 CSS 变量值，让用户的操作系统来决定。

### prefers-color-scheme 媒体查询

`prefers-color-scheme` 媒体查询的两种变化是:

```
/* Light mode */
@media (prefers-color-scheme: light) {
   :root {
       --body-bg: #FFFFFF;
       --body-color: #000000;
   }
}

/* Dark mode */
@media (prefers-color-scheme: dark) {
   :root {
       --body-bg: #000000;
       --body-color: #FFFFFF;
   }
}
```

在上面的 CSS 中，`--body-bg` 和 `--body-color` 是 [CSS 变量][3]。正如你所看到的，它们对两种模式都包含不同的值。在浅色主题中，我设置了一个白色背景和黑色文本。在深色主题中，我设置了黑色背景和白色文本。

因为[规范][2]说 W3C 可能会引入未来的值，所以把这个 CSS 转换为默认值是有意义的。

```
/* Light mode */
:root {
   --body-bg: #FFFFFF;
   --body-color: #000000;
}

/* Dark mode */
@media (prefers-color-scheme: dark) {
   :root {
       --body-bg: #000000;
       --body-color: #FFFFFF;
   }
}
```

在上面的代码中，我默认定义了一个浅色主题，如果媒体查询是 `dark`，则将其转换为深色主题。这样一来，以后任何添加到媒体查询的值都会默认设置为浅色主题。

### 使用 CSS 变量

现在我为不同的主题设置了不同的值，我需要实际使用它们来设计页面。

```
body {
   background: var(--body-bg);
   color: var(--body-color);
}
```

[var() 语法][3] 是 CSS 使用变量的方式。在上面的代码中，我是说把 `background` 设置为 `--body-bg` 的值，把 `color` 设置为 `--body-color` 的值。注意，这些变量的值来自媒体查询。这意味着背景和前景的颜色是根据操作系统的设置而改变的！

这就是媒体查询的真正能力。提供一个从操作系统到网页的一致的用户体验。

如果你进入 [findmymastodon.com][4]，并切换你的操作系统的主题，你会看到从一个主题到另一个主题的过渡。

[CSS 工作组][2] 网站也使用同样的媒体查询。改变你的操作系统主题，网站就会切换主题来进行调整。

### 结论

请注意，使用 `prefers-color-scheme` 与使用普通的编程语言没有什么不同。我定义了一些变量，这些变量的值根据一些逻辑而改变。而这些变量然后被用于进一步的操作。

让你的网站根据用户选择的主题进行调整的能力是一个很棒的辅助功能。而且，为了用户的利益，它进一步模糊了桌面和网络之间的界限。最新的浏览器版本 [支持 prefers-color-scheme][5]，所以你今天就可以开始实验了。

编码愉快。

这篇文章最初发表在 [作者的网站][6] 上，经许可后重新发表。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/dark-themes-websites

作者：[Ayush Sharma][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ayushsharma
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_blue_text_editor_web.png?itok=lcf-m6N7 (Text editor on a browser, in blue)
[2]: https://drafts.csswg.org/mediaqueries-5/#prefers-color-scheme
[3]: https://www.w3.org/TR/css-variables-1/
[4]: https://findmymastodon.com/
[5]: https://caniuse.com/prefers-color-scheme
[6]: https://ayushsharma.in/2021/10/creating-light-and-dark-themes-for-websites-correctly-using-prefers-color-scheme
