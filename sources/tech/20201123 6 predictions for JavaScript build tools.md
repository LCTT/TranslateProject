[#]: collector: (lujun9972)
[#]: translator: (ywxgod)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (6 predictions for JavaScript build tools)
[#]: via: (https://opensource.com/article/20/11/javascript-build-tools)
[#]: author: (Shedrack Akintayo https://opensource.com/users/shedrack-akintayo)

Javascript构建工具的6个预测
======
Javascript前端工具的生态系统充满着变数和竞争，且只有最好的工具才会存活下来。
![Magnifying glass on code][1]

生产中的代码与开发中的有所不同. 在生产中，我们需要构建一些能运行得够快，能管理各种依赖关系，能自动执行任务，能加载外部模块等功能的包。而那些将开发中的代码转为生产代码的[javascript][2]工具我们就称之为 _构建工具。_

我们可以通过各个构建步骤以及其重要性来解释前端代码需要被“构建”的原因。

### 前端代码构建步骤

前端代码的构建涉及下面的四个步骤:

#### 1\. 转译

通过转译，开发者可以使用到语言最新，最热门的更新和扩展，以及浏览器兼容性的维护等。 这是使用[Babel][3]的一个例子:


```
// arrow function syntax in array map
const double = [1, 2, 3].map((num) =&gt; num * 2);
// after being transpiled
const double = [1, 2, 3].map(function(num) {
  return num * 2;
});
```

#### 2\. 分包

分包是处理所有"import"与"require"语句的过程; 找到相匹配的JS代码片段，包和库; 将它们添加到适当的域中; 然后将它们打包到一个JS文件中. 常用的分包器包括 Browserify, Webpack, and Parcel.

#### 3\. 压缩

压缩是通过删除空白和代码注释来减少最终的文件大小。在压缩过程中，我们还可以更进一步添加代码混淆，混淆会更改变量名和方法名，使代码变得晦涩难懂，因此一旦代码交付到客户端，它就不是那么容易能让人读懂。下面是一个使用Grunt的例子:


```
// before minifying
const double = [1, 2, 3].map(function(num) {
  return num * 2;
});
// after minifying
const double = [1, 2, 3].map(function(num) {
  return num * 2;
});
```

#### 4\. 打包

完成上面的所有步骤之后, 我们需要将这些具有兼容性，且经过分包，压缩/混淆过的文件放置到某个地方。打包正是这样一个过程，它将上述步骤所产生的结果放置到开发者指定的某个位置上。这通常是通过分包器完成的.

### 前端构建工具

前端工具及构建工具可以分为以下几类:

  * 包管理: NPM, Yarn
  * 转移器: Babel, etc.
  * 打包器: Webpack, Parcel, Browserify
  * 压缩混淆: UglifyJS, Packer, Minify, etc.



Javascript生态系统中有各种各样的构建工具可以使用，包括下面的这些：

#### Grunt and Bower

[Grunt][4] 作为一个命令行工具被引入，它仅提供一个脚本来指定和配置相关构建任务。[Bower][5] 作为包管理器，提供一种客户端包的管理方法而紧追其后。这两者，再加上NPM，它们经常被使用在一起，它们似乎可以满足大多数的自动化需求。Grunt的问题在于它无法提供给开发者配置更复杂任务的自由，而Bower使开发者管理的程序包是平常的两倍，因为它将前端包后后台包分开了 (例如，Bower components vs. Node modules)。

**Grunt与Bower的未来:** Grunt与Bower即将退出javascript工具生态，但是还有一些替代品。

#### Gulp and Browserify

[Gulp][6]是在Grunt发布后的一年半才发布的。然而Gulp让大家感觉很自然、舒服。用javascript来写构建脚本与用JSON来写相比更自由。你可以Gulp的构建脚本中编写函数，即时创建变量，在任何地方使用条件语句--但就这些，并不能说让我们的脚本变得特别自然和强大，只能说有这个可能。[Browserify][7]和Gulp可以配合使用。Browserify允许NPM包(用于后端Node服务器)被直接带入到前端，这直接让Bower废了。而这种用一个包管理器来处理前端后后台包的方式让人感到更好和更自然。

**Gulp的未来:** Gulp可能会被改进，以匹配当前流行的构建工具，但这完全取决于创作者的意愿。Gulp还在使用中，只是没有以前那么流行了。

#### Webpack and NPM/Yarn scripts

[Webpack][8]是现代前端开发工具中最热门的宠儿。Webpack是一个开源的javascript模块打包器. 它主要是为处理javascript而创作的，但如果包含相应的loaders，它也可以转换HTML、CSS和图片等前端资源。通过Webpack，你也可以像Gulp一样编写构建脚本，并通过[NPM/Yarn][9]来执行这些脚本.

**Webpack的未来:** Webpack是目前Javascript工具生态系统中最热门的工具，最近几乎所有的JS库都在使用React和Webpack. Webpack目前处于第四个版本，不会很快消失。（译者注：webpack目前已经发布了第五个版本了，且还在火热更新中）

#### Parcel

[Parcel][10]是一个web应用打包器，于2018年推出，因其开发者不同的体验而与众不同。Parcel能利用多核功能提供极快的性能，且还零配置。Parcel还是一个新星，其采用率并不高，特别是对于一些大型应用。与Webpack相比，开发人员更喜欢使用Webpack，因为Webpack有更广泛的支持和可定制性。

**The future of Parcel:** Parcel is very easy to use, it is faster than Webpack if you measure bundle and build time, and it also offers a better developer experience. The reason Parcel hasn't been adopted much might be because it's still relatively new. Parcel has a very bright future in the frontend build tools ecosystem, and it will be around for a while.

#### Rollup

[Rollup][11] is a module bundler for JavaScript that compiles small pieces of code into something larger and more complex, such as a library or an application. It is advisable to use Rollup when building a library with minimal third-party imports.

**The future of Rollup:** Rollup is super-cool and is being adopted rapidly. It has great features and will be part of the frontend tooling ecosystem for a long time.

### Learn more

The JavaScript tooling ecosystem is dynamic and competitive, and only the best tools survive. In the future, we will see tools that require less (or no) configuration, better customizability, more extensibility, and higher speed.

The tools you use for an application's frontend are a personal call that you need to make based on your project's requirements. Choose what works best for you, and most of the time, there are tradeoffs.

For more information, see:

  * [JavaScript tooling: The evolution and future of JS/frontend build tools][12]
  * [Tools and modern workflow for frontend developers][13]
  * [Modern frontend: The tools and build process explained][14]
  * [Best build tools in frontend development][15]



* * *

_This article originally appeared on [Shedrack Akintayo's blog][16] and is republished with his permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/javascript-build-tools

作者：[Shedrack Akintayo][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
