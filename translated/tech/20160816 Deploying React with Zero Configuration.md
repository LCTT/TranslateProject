使用Zero配置开发React
========================

你想使用[React][1]来构建应用吗?"[入门][2]"是很容易的，可是接下来呢？

React是一个构建用户界面的库，用户界面是组成一个应用的一部分。取决于所有其他的部分－风格，路由器，npm模块，ES6代码，捆绑和更多－然后指出如何使用它们对开发者来说是很浪费的。

这被称为[JavaScript疲劳][3]。尽管存在这种复杂性，但是使用React的用户依旧继续增长。

社区应对这一挑战的方法是共享样板文件。这些[样板文件][4]展示出架构师必须在缤纷的选项中做出选择。
官方的“开始入门”似乎是离现实的一个可操作的应用程序如此远。


### 新的，Zero-configuration体验

由[Ember.js][5]和[Elm][6]有凝聚力的开发经验的启发,Facebook的人们想要提供一个简单，直接的方式。他们发明了一个新的开发React应用的方法，`create-react-app`。在初始的公开版发布的三个星期以来，它已经收到了极大的社区关注(超过8,000个GitHub梦想家)和支持(许多的拉请求)。

`create-react-app`是不同意许多过去使用模板和开发启动工具包的尝试。它的目标是零配置[[惯例-优于-配置]][7]，使开发者关注于他们的应用的不同之处。

zero configuration一个强大的附带影响是这个工具可以在后台逐步成型。零配置奠定了工具生态系统的基础，创造的自动化和喜悦的开发远远超越React本身。

### 将Zero-configuration部署到Heroku上

多亏了create-react-app的zero-config功能，zero-config的点子看起来才快要达到了。因为这些新的应用都使用一个公共的，默认的架构，构建的过程可以被自动化同时可以使用智能的默认项来配置。因此，[我们创造这个社区构建包来体验在Heroku零配置的过程][8]。


#### 在两分钟内创造和发布React应用

你可以在Heroku上免费开始构建React应用。
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


create-react-app是非常的新(目前版本是0.2)同时因为它的目标是简洁的开发者体验，更多高级的使用情景并不支持(或者许多从来不被支持)。例如，它不支持服务端渲染或者自定义捆绑。

为了支持更好的控制，create-react-app包括了npm run eject命令。Eject将所有的工具(配置文件和package.json依赖库)解压到应用所在的路径，因此你可以按照你心中的想法定做。一旦被弹出，你做的改变或许有必要选择一个特定的用Node.js和／或静态的构建包来布署。总通过一个分支/拉请求来使类似的工程改变生效,因此这些改变可以轻易撤销。Heroku的预览应用对测试发布的改变是完美的。

我们将会追踪create-react-app的进度同时适配构建包来支持更多的高级使用情况当这些是可得到之时。发布万岁！



--------------------------------------------------------------------------------

via: https://blog.heroku.com/deploying-react-with-zero-configuration?c=7013A000000NnBFQA0&utm_campaign=Display%20-%20Endemic%20-Cooper%20-Node%20-%20Blog%20-%20Zero-Configuration&utm_medium=display&utm_source=cooperpress&utm_content=blog&utm_term=node

作者：[Mars Hall][a]
译者：[译者ID](https://github.com/zky001)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://blog.heroku.com/deploying-react-with-zero-configuration?c=7013A000000NnBFQA0&utm_campaign=Display%20-%20Endemic%20-Cooper%20-Node%20-%20Blog%20-%20Zero-Configuration&utm_medium=display&utm_source=cooperpress&utm_content=blog&utm_term=node
[1]: https://facebook.github.io/react/
[2]: https://facebook.github.io/react/docs/getting-started.html
[3]: https://medium.com/@ericclemmons/javascript-fatigue-48d4011b6fc4
[4]: https://github.com/search?q=react+boilerplate
[5]: http://emberjs.com/
[6]: http://elm-lang.org/
[7]: http://rubyonrails.org/doctrine/#convention-over-configuration
[8]: https://github.com/mars/create-react-app-buildpack
[9]: https://github.com/mars/create-react-app-buildpack#usage

