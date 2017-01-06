初识 HTTP/2（第二部分） 
============================================================
 ![](https://static.viget.com/_284x284_crop_center-center/ben-t-http-blog-thumb-01_360.png?mtime=20160928234634) 

首先制定一个坚定的 HTTP/2 前端开发目标。 

如果你对 HTTP/2 有所了解，那你可能用过它，或者至少想过怎样能把它融入你的项目中。尽管有很多关于它如何改变你的工作流程，提高网络的速度和效率等方面的猜想，但最好的使用方式还没有定下来。这里我想讲的就是我在之前的项目中所发现的 HTTP /2 的优点。
 
如果你还不确定什么是 HTTP/2，或者为什么它能帮助你工作，[看看我介绍背景方面的第一篇文章][4]。 

记住：开始之前，我要告诉你，尽管你的浏览器可能支持 HTTP/2，但你的服务器可能不支持。检查你的主机服务，看看他们是否提供 HTTP/2 的支持。否则你可能玩坏你的服务器。这篇文章并不会讲怎么做，但你可以查看 [http2 github][5] 页面，找一找这方面的工具。 

### 🙏 [Rubs Hands Together]

首先组织好你的文件。看一看下面的文件树结构作为组织样式表的起点： 

```
`/styles
|── /setup
|     /* variables, mixins and functions */
|── /global
|     /* reusable components that could be within any component or section */
|── /components
|     /* specific components and sections */
|── setup.scss // index for setup styles
|── global.scss // index for global styles`
```

这会把你的样式分到三个目录下面：Setup，Global 和 Componenets。接下来我会说明这些目录对你的项目有什么用。 

### Setting Up 目录

Setup 目录保存所有的变量，函数，混合<!-- mixins -->以及其它文件需要编译的任意定义。要想让这个它物尽其用，把这个目录下所有内容导入到 `setup.scss`文件中是个很不错的主意，这样这个文件就会像下面所展示的一样：

```
`/* setup.scss */

/* variables */
@import "setup/variables/colors";

/* mixins */
@import "setup/mixins/color";

/* functions */
@import "setup/functions/color";

... etc`
```

现在我们能快速引用这个站点中的所有定义，应该确保在所有的样式文件顶部包含我们这里创建的这个文件。

### Global 目录

接下来的目录，Global，应该包含可在当前站点的多个部分或者每一个页面中重复使用的容器。像按钮、文本、主要样式以及你的浏览器默认设置应该放在这里。我不建议把顶部或底部样式放在这儿，因为某些项目中没有顶部或者不同页面顶部不同。而且，底部永远是页面的最后一个元素，所以在用户加载完当前站点的其它东西前，不必过分优先考虑加载底部样式。

记住，如果没有那些定义在 Setup 目录下的东西，你的全局样式就可能没有作用，你的全局文件看起来应该像这样：

```
`/* global.scss */

/* application definitions */
@import "setup";

/* global styles */
@import "global/reset";
@import "global/buttons";
@import "global/typography";
@import "global/grid";

... etc`
```

注意，首先要做的就是导入 Setup 样式。这样的话，这个样式里定义的所有文件都能够获得引用。

由于全局样式需要存在于每个页面中，我们可以用默认的方法加载它们，在 `<head>` 标签内用一个 `<link>` 标签。你所看到的将是一个十分小巧的 css 文件，或者说理论上小巧的，这取决于你需要多少全局样式。

### 最后，你的容器

注意我没有在上述文件树中的容器目录里包含索引文件。这是 HTTP/2 所带来的效用。直到现在，我们已经按照标准步骤构建了一个典型的站点，包含相当高效的结构<!-- fairly lean infrastructure -->，选择仅仅全局化那些最重要的样式。容器表现的就像他们有单独的索引文件。

大多数开发者有独特的组织容器的方式，因此我并不想影响你的策略。但是，你所有的容器看起来应该像这样：

```
`/* header.scss */

/* application definitions */
@import "../setup";

header {
  // styles
}

... etc`
```

同样的，你要把 Setup 样式包含进来，确保所有东西在编译时都有定义。你不必链接、压缩<!-- concatenate minify --> 或者改变什么文件，除了编译他们和可能要把他们放到 /assets 目录，很容易就找出个模版。

现在样式表已经差不多了，构建页面应该很简单。

### 构建容器

或许对于标准语言你有自己的选择，这取决于你的项目，有可能是 Twig, Rails, Jade 或者 Handlebars。我认为考虑容器最好的方式是它是否有自己的模版文件，它该有个与名字相应的样式。这样你的项目中，模版和样式的比例就会是个不错的 1:1 的比例，而且你知道哪个文件有哪些东西，哪里有哪个文件，因为它们的命名是有规律的。

现在它正步入正轨，用好 HTTP/2 的多种功能十分简单，让我们做一个模版：

```
`{# header.html #}

{# compiled header styles #}
<link href="assets/components/header.css" rel="stylesheet" media="all">

<header>
  <h1>This Awesome HTTP/2 Site</h1>
  ... etc`
```

非常好！你就能在模版里用更简单的方式链接资源，但这也显示出你所要做的仅是在开始构建时，在模版文件中链接一个小小的头部样式。这将允许你的站点仅仅加载特定资源到任意给定页面的容器中，而且，能够设定页面从头到脚的优先级。

### 结合在一起

现在所有的容器都有结构，浏览器将会渲染类似以下的内容：

```
`<!DOCTYPE html>
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
</html>`
```

这是一个高级方法，但你的项目中可能有调整的更好<!-- finer-tuned -->的容器，你可以用 `<nav>` 容器包含顶部，它会加载自己的样式表。尽你所能地自由发挥，让容器更有作用 - HTTP/2 不会因这些需求而阻碍<!-- penalize -->你。

### 结论

这只是一个简单的方法，如何用前端思想和 HTTP/2 构建项目，但这仅是皮毛而已。你可能注意到我上面的所用的方法还有改进的空间。请不吝赐教！正如我在第一篇文章中所说的，HTTP/2 可能颠覆自 HTTP/1 以来我们所熟知的某些标准，所以要慎重思考和实践，以便高效使用 HTTP/2 的开发环境。

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
[4]:https://www.viget.com/articles/getting-started-with-http-2-part-1
[5]:https://github.com/http2/http2-spec/wiki/Tools
