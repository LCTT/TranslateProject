初识 HTTP/2（二） 
============================================================
 ![](https://static.viget.com/_284x284_crop_center-center/ben-t-http-blog-thumb-01_360.png?mtime=20160928234634) 

> HTTP/2 时代的开启为前端开发带来了最佳体验。 

如果你对 HTTP/2 有所了解，那你可能用过它，或者至少想过怎样能把它融入你的项目中。尽管有很多关于它如何改变工作流程，提高 Web 速度和效率等方面的猜想，但最佳使用方式还没有定下来。这里我想讲的就是我在之前的项目中所发现的 HTTP/2  的最佳实践。

如果你还不确定什么是 HTTP/2，或者为什么它能改进你的工作，可以先看看我[介绍背景方面的第一篇文章][4]。 

记住：开始之前，我要告诉你，尽管你的浏览器可能支持 HTTP/2，但你的服务器可能不支持。检查你的主机托管服务，看看他们是否提供 HTTP/2 的支持。否则你可能要建立你自己的服务器。这篇文章并不会涉及这方面该如何做，但你可以查看 [http2 github][5] 页面，找一找这方面的工具。 

### 🙏 [热身工作]

首先组织好你的文件。看一看下面的文件树结构，作为组织你的样式表的起点： 

```
/styles
|── /setup
|     /* 变量、混入（minin）和函数 */
|── /global
|     /* 能放在任何组件和部分中的可重用组件 */
|── /components
|     /* 特殊组件和部分 */
|── setup.scss // setup 样式索引
|── global.scss // 全局样式索引
```

这会把你的样式分到三个目录下面：`setup`、`global` 和 `componenets`。接下来我会说明这些目录对你的项目有什么用。 

### setup 目录

`setup` 目录保存所有的变量、函数、混入（minin）以及一些正常编译需要的其它文件的定义。要想让这个目录物尽其用，把这个目录下所有内容导入到 `setup.scss` 文件中是个很不错的主意，这样这个文件就会像下面所展示的一样：

```
/* setup.scss */

/* 变量 */
@import "setup/variables/colors";

/* 混入 */
@import "setup/mixins/color";

/* 函数 */
@import "setup/functions/color";

... 等等
```

现在我们能快速引用这个站点中的所有定义，应该确保在所有的样式文件顶部包含我们这里创建的这个文件。

### global 目录

接下来的目录，global 目录，应该包含可在当前站点的多个部分或者每一个页面中重复使用的组件。像按钮、文本、主要样式，以及你的浏览器默认设置应该放在这里。我不建议把页面的头部或底部样式放在这儿，因为某些项目中没有头部，或者不同页面头部不同。而且，底部永远是页面的最后一个元素，所以在用户加载完当前站点的其它东西前，不必过分优先考虑加载底部样式。

记住，如果没有那些定义在 setup 目录下的东西，你的 global 样式就可能没有作用，你的 global 文件看起来应该像这样：

```
/* global.scss */

/* 应用定义 */
@import "setup";

/* 全局样式 */
@import "global/reset";
@import "global/buttons";
@import "global/typography";
@import "global/grid";

... 等等
```

注意，首先要做的就是导入 setup 样式。这样的话，之后的文件都可以引用这个样式里的定义。

由于站点内的每个页面都需要 global 样式，我们可以用典型的方式，在 `<head>` 标签内用一个 `<link>` 标签来加载它们。你所看到的将是一个十分小巧的 css 文件，或者说理论上小巧的，这取决于你需要多少全局样式。

### 最后，你的组件

注意，我没有在上述目录树中的 components 目录里包含索引文件。这是 HTTP/2 所带来的效用。直到现在，我们已经按照标准步骤构建了一个典型的站点，保持相当简单的结构，仅选择全局化那些最重要的样式。组件充当它们自己的索引文件。

大多数开发者有独特的组织组件的方式，因此我并不想影响你的策略。但是，你所有的组件看起来应该像这样：

```
/* header.scss */

/* 应用定义 */
@import "../setup";

header {
  // 样式
}

... 等等
```

同样的，你要把 setup 样式包含进来，确保所有东西在编译时都定义过。除了编译这些文件，以及可能要把他们放到 `/assets` 目录，以便很容易找到模版，对这些文件你不必 <ruby>拼接<rt>concatenate</rt></ruby>、<ruby>压缩<rt>minify</rt></ruby> 它们或者改变什么。

现在样式表已经差不多了，构建站点应该很简单。

### 构建组件

或许对于模板语言你有自己的选择，这取决于你的项目，有可能是 Twig、Rails、Jade 或者 Handlebars。我认为考虑组件最好的方式是它是否有自己的模版文件，它该有个与名字相应的样式。这样你的项目中，模版和样式的比例就会是个不错的 1:1 的比例，而且你知道哪个文件有哪些东西，哪里有哪个文件，因为它们的命名是有规律的。

现在它正步入正轨，用好 HTTP/2 的多种功能十分简单，让我们做一个模版：

```
{# header.html #}

{# compiled header styles #}
<link href="assets/components/header.css" rel="stylesheet" media="all">

<header>
  <h1>This Awesome HTTP/2 Site</h1>
  ... 等等
```

非常好！在模版里你可能有更简单的方式链接到资源，但这里显示你所要做的仅是在开始构建时，在模版文件中链接一个小小的头部样式。这将允许你的站点仅仅加载特定资源到任意给定页面的组件中，而且，能够设定页面从头到脚的组件的优先级。

### 结合在一起

现在所有的组件都有结构，浏览器将会类似以下方式来渲染它们：

```
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" media="all" href="/assets/global.css">
  </head>
  <body>

    <link rel="stylesheet" media="all" href="/assets/components/header.css">
    <header>
      ... etc
    </header>

    <link rel="stylesheet" media="all" href="/assets/components/title.css">
    <section class="title">
      ... etc
    </section>

    <link rel="stylesheet" media="all" href="/assets/components/image-component.css">
    <section class="image-component">
      ... etc
    </section>

    <link rel="stylesheet" media="all" href="/assets/components/text-component.css">
    <section class="text-component">
      ... etc
    </section>

    <link rel="stylesheet" media="all" href="/assets/components/footer.css">
    <footer>
      ... etc
    </footer>

  </body>
</html>
```

这是一个高级别方法，但你的项目中可能有调整的更细致的组件。例如，在头部的 `<nav>` 组件可能要加载自己的样式表。尽你所能地自由发挥，让组件更有作用 - HTTP/2 不会因这些需求而阻碍你！

### 结论

这只是一个关于如何在前端用 HTTP/2 构建项目的基本介绍，仅是皮毛而已。你可能注意到我上面所用的方法有的还有改进的空间。请不吝赐教！正如我在第一篇文章中所说的，HTTP/2 可能颠覆自 HTTP/1 以来我们所熟知的某些标准，所以要慎重思考和实践，以便高效使用 HTTP/2 的开发环境。

--------------------------------------------------------------------------------

via: https://www.viget.com/articles/getting-started-with-http-2-part-2

作者：[Ben][a]
译者：[GitFuture](https://github.com/GitFuture)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.viget.com/about/team/btinsley
[1]:https://twitter.com/home?status=Firmly%20planting%20a%20flag%20in%20the%20sand%20for%20HTTP%2F2%20best%20practices%20for%20front%20end%20development.%20https%3A%2F%2Fwww.viget.com%2Farticles%2Fgetting-started-with-http-2-part-2
[2]:https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fwww.viget.com%2Farticles%2Fgetting-started-with-http-2-part-2
[3]:http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.viget.com%2Farticles%2Fgetting-started-with-http-2-part-2
[4]:https://linux.cn/article-8111-1.html
[5]:https://github.com/http2/http2-spec/wiki/Tools
