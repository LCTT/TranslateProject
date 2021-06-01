[#]: collector: (lujun9972)
[#]: translator: (ywxgod)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13423-1.html)
[#]: subject: (6 predictions for JavaScript build tools)
[#]: via: (https://opensource.com/article/20/11/javascript-build-tools)
[#]: author: (Shedrack Akintayo https://opensource.com/users/shedrack-akintayo)

对 JavaScript 构建工具的 6 个预测
======

> JavaScript 前端工具的生态系统充满着变数和竞争，且只有最好的工具才会存活下来。
 
![](https://img.linux.net.cn/data/attachment/album/202105/25/112116d5z1lrywl6k25mur.jpg)

生产中使用的代码与开发中的有所不同. 在生产中，我们需要构建一些能运行得够快、能管理各种依赖关系、能自动执行任务、能加载外部模块等功能的包。而那些将开发中的代码转为生产代码的 [JavaScript][2] 工具我们就称之为 _构建工具。_

我们可以通过各个构建步骤以及其重要性来解释前端代码需要被“构建”的原因。

### 前端代码构建步骤

前端代码的构建涉及下面的四个步骤:

#### 1、转译

通过<ruby>转译<rt>Transpiling</rt></ruby>，开发者可以使用到语言最新、最热门的更新和扩展，并保持浏览器的兼容性等。下面是使用 [Babel][3] 的一个例子:

```
// 数组映射中的箭头函数语法
const double = [1, 2, 3].map((num) => num * 2);
// 转译后
const double = [1, 2, 3].map(function(num) {
  return num * 2;
});
```

#### 2、分包

<ruby>分包<rt>Bundling</rt></ruby>是处理所有 `import` 与`require` 语句的过程；找到相匹配的 JavaScript 代码片段、包和库；将它们添加到适当的域中；然后将它们打包到一个大的 JavaScript 文件中。常用的分包器包括 Browserify、Webpack 与 Parcel。

#### 3、压缩

<ruby>压缩<rt>Minifing</rt></ruby>是通过删除空白和代码注释来减少最终的文件大小。在压缩过程中，我们还可以更进一步添加代码混淆步骤，混淆会更改变量名和方法名，使代码变得晦涩难懂，因此一旦代码交付到客户端，它就不是那么容易能让人读懂。下面是一个使用 Grunt 的例子:

```
// 压缩前
const double = [1, 2, 3].map(function(num) {
  return num * 2;
});
// 压缩后
const double=[1,2,3].map(function(num){return num*2;});
```

#### 4、打包

完成上面的所有步骤之后, 我们需要将这些具有兼容性、且经过分包、压缩/混淆过的文件放置到某个地方。<ruby>打包<rt>Packaging</rt></ruby>正是这样一个过程，它将上述步骤所产生的结果放置到开发者指定的某个位置上，这通常是通过打包器完成的。

### 前端构建工具

前端工具及构建工具可以分为以下几类:

  * 包管理: NPM、Yarn
  * 转译器: Babel 等
  * 打包器: Webpack、Parcel、Browserify
  * 压缩混淆: UglifyJS、Packer、Minify 等

JavaScript 生态系统中有各种各样的构建工具可以使用，包括下面的这些：

#### Grunt 和 Bower

[Grunt][4] 是作为命令行工具引入的，它仅提供一个脚本来指定和配置相关构建任务。[Bower][5] 作为包管理器，提供了一种客户端包的管理方法而紧追其后。这两者，再加上 NPM，它们经常在一起使用，它们看上去似乎可以满足大多数的自动化需求，但 Grunt 的问题在于它无法提供给开发者配置更复杂任务的自由，而 Bower 使开发者管理的程序包是平常的两倍，因为它将前端包、后台包分开了（例如，Bower 组件与 Node 模块）。

**Grunt 与 Bower 的未来：** Grunt 与 Bower 正在退出 JavaScript 工具生态，但是还有一些替代品。

#### Gulp 和 Browserify

[Gulp][6] 是在 Grunt 发布一年半之后才发布的。但 Gulp 却让大家感到很自然、舒服。用 JavaScript 来写构建脚本与用 JSON 来写相比更自由。你可以在 Gulp 的构建脚本中编写函数、即时创建变量、在任何地方使用条件语句 —— 但就这些，并不能说让我们的感觉变得特别自然和舒适，只能说这只是其中的一个可能的原因。[Browserify][7] 和 Gulp 可以配合使用，Browserify 允许 NPM 包（用于后端 Node 服务器）被直接带入到前端，就这一点已经直接让 Bower 废了。而正是这种用一个包管理器来处理前后端包的方式让人感到更自然和更好。

**Gulp 的未来：** Gulp 可能会被改进，以便匹配当前流行的构建工具，但这完全取决于创造者的意愿。Gulp 仍在使用中，只是不再像以前那么流行了。

#### Webpack 和 NPM/Yarn 脚本

[Webpack][8] 是现代前端开发工具中最热门的宠儿，它是一个开源的 JavaScript 模块打包器。Webpack 主要是为处理 JavaScript 而创造的，但如果包含相应的加载器，它也可以转换 HTML、CSS 和图片等前端资源。通过 Webpack，你也可以像 Gulp 一样编写构建脚本，并通过 [NPM/Yarn][9] 来执行它们。

**Webpack 的未来：** Webpack 是目前 JavaScript 工具生态系统中最热门的工具，最近几乎所有的 JavaScript 库都在使用 React 和 Webpack。Webpack 目前处于第四个版本，不会很快消失。（LCTT 译注：Webpack 目前已经发布了第五个版本了，且还在火热更新中）

#### Parcel

[Parcel][10] 是一个 Web 应用打包器，于 2018 年推出，因其开发者体验而与众不同。Parcel 能利用处理器多核功能提供极快的打包性能，且还零配置。但 Parcel 还是一个新星，对于一些大型应用，其采用率并不高。相比之下，开发人员更喜欢使用 Webpack，因为 Webpack 有更广泛的支持和可定制性。

**Parcel 的未来：** Parcel 非常容易使用，如果你统计打包和构建时间，它会比 Webpack 更快，而且它还提供了更好的开发者体验。Parcel 没有被大量采用的原因可能是它仍然比较新。在前端构建工具的生态系统中，Parcel 的前景会非常光明，它将会存在一段时间。

#### Rollup

[Rollup][11] 是 JavaScript 的一个模块分包器，它可将一小段代码编译为更大更复杂的库或应用。Rollup 一般建议用来构建 JavaScript 库，特别是那种导入和依赖的第三方库较少的那种库。

**Rollup 的未来：** Rollup 很酷，且正在被迅速采用。它有很多强大的功能，将在很长一段时间内作为前端工具生态系统的一个组成部分而存在。

### 了解更多

JavaScript 前端工具的生态系统充满着变数和竞争，且只有最好的工具才能存活下来。在不久的将来，我们的构建工具将具有更少（或没有）的配置，更方便的定制化，更好的扩展性的和更好的构建速度。

该用什么样的构建工具用于你的前端项目，你需要根据具体的项目需求来做出决定。至于选择什么样的工具，才是最合适自己的，大多数时候，需要我们自己作出取舍。

更多信息, 请看:

  * [JavaScript tooling: The evolution and future of JS/frontend build tools][12]
  * [Tools and modern workflow for frontend developers][13]
  * [Modern frontend: The tools and build process explained][14]
  * [Best build tools in frontend development][15]

* * *

_这篇文章最初发表在 [Shedrack Akintayo 的博客][16] 上，经许可后重新发表。_

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/javascript-build-tools

作者：[Shedrack Akintayo][a]
选题：[lujun9972][b]
译者：[ywxgod](https://github.com/ywxgod)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/shedrack-akintayo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/find-file-linux-code_magnifying_glass_zero.png?itok=E2HoPDg0 (Magnifying glass on code)
[2]: https://www.javascript.com/
[3]: https://babeljs.io/
[4]: https://gruntjs.com/
[5]: https://bower.io/
[6]: https://gulpjs.com/
[7]: http://browserify.org/
[8]: https://webpack.js.org/
[9]: https://github.com/yarnpkg/yarn
[10]: https://parceljs.org/
[11]: https://rollupjs.org/guide/en/
[12]: https://qmo.io/blog/javascript-tooling-the-evolution-and-future-of-js-front-end-build-tools/
[13]: https://blog.logrocket.com/tools-and-modern-workflow-for-front-end-developers-505c7227e917/
[14]: https://medium.com/@trevorpoppen/modern-front-end-the-tools-and-build-process-explained-36641b5c1a53
[15]: https://www.developerdrive.com/best-build-tools-frontend-development/
[16]: https://www.sheddy.xyz/posts/javascript-build-tools-past-and-beyond
