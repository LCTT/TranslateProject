零配置部署 React
========================

你想使用 [React][1] 来构建应用吗？“[入门][2]”是很容易的，可是接下来呢？

React 是一个构建用户界面的库，而它只是组成一个应用的一部分。应用还有其他的部分——风格、路由器、npm 模块、ES6 代码、捆绑和更多——这就是为什么使用它们的开发者不断流失的原因。这被称为 [JavaScript 疲劳][3]。尽管存在这种复杂性，但是使用 React 的用户依旧继续增长。

社区应对这一挑战的方法是共享[模版文件][4]。这些模版文件展示出开发者们架构选择的多样性。官方的“开始入门”似乎离一个实际可用的应用程序相去甚远。

### 新的，零配置体验

受开发者来自 [Ember.js][5] 和 [Elm][6] 的经验启发，Facebook 的人们想要提供一个简单、直接的方式。他们发明了一个[新的开发 React 应用的方法][10] ：`create-react-app`。在初始的公开版发布的三个星期以来，它已经受到了极大的社区关注（超过 8000 个 GitHub 粉丝）和支持（许多的拉取请求）。

`create-react-app` 是不同于许多过去使用模板和开发启动工具包的尝试。它的目标是零配置的[惯例-优于-配置][7]，使开发者关注于他们的应用的不同之处。

零配置一个强大的附带影响是这个工具可以在后台逐步成型。零配置奠定了工具生态系统的基础，创造的自动化和喜悦的开发远远超越 React 本身。

### 将零配置部署到 Heroku 上

多亏了 create-react-app 中打下的零配置基础，零配置的目标看起来快要达到了。因为这些新的应用都使用一个公共的、默认的架构，构建的过程可以被自动化，同时可以使用智能的默认项来配置。因此，[我们创造这个社区构建包来体验在 Heroku 零配置的过程][8]。

#### 在两分钟内创造和发布 React 应用

你可以免费在 Heroku 上开始构建 React 应用。
```
npm install -g create-react-app
create-react-app my-app
cd my-app
git init
heroku create -b https://github.com/mars/create-react-app-buildpack.git
git add .
git commit -m "react-create-app on Heroku"
git push heroku master
heroku open
```
[使用构建包文档][9]亲自试试吧。

### 从零配置出发

create-react-app 非常的新（目前版本是 0.2），同时因为它的目标是简洁的开发者体验，更多高级的使用情景并不支持（或者肯定不会支持）。例如，它不支持服务端渲染或者自定义捆绑。

为了支持更好的控制，create-react-app 包括了 npm run eject 命令。Eject 将所有的工具（配置文件和 package.json 依赖库）解压到应用所在的路径，因此你可以按照你心中的想法定做。一旦被弹出，你做的改变或许有必要选择一个特定的用 Node.js 或静态的构建包来布署。总是通过一个分支/拉取请求来使类似的工程改变生效，因此这些改变可以轻易撤销。Heroku 的预览应用对测试发布的改变是完美的。

我们将会追踪 create-react-app 的进度，当它们可用时，同时适配构建包来支持更多的高级使用情况。发布万岁！

--------------------------------------------------------------------------------

via: https://blog.heroku.com/deploying-react-with-zero-configuration

作者：[Mars Hall][a]
译者：[zky001](https://github.com/zky001)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://blog.heroku.com/deploying-react-with-zero-configuration
[1]: https://facebook.github.io/react/
[2]: https://facebook.github.io/react/docs/getting-started.html
[3]: https://medium.com/@ericclemmons/javascript-fatigue-48d4011b6fc4
[4]: https://github.com/search?q=react+boilerplate
[5]: http://emberjs.com/
[6]: http://elm-lang.org/
[7]: http://rubyonrails.org/doctrine/#convention-over-configuration
[8]: https://github.com/mars/create-react-app-buildpack
[9]: https://github.com/mars/create-react-app-buildpack#usage
[10]: https://github.com/facebookincubator/create-react-app
