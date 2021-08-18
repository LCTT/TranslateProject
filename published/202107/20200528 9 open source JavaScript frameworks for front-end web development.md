[#]: collector: (lujun9972)
[#]: translator: (stevending1st)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13594-1.html)
[#]: subject: (9 open source JavaScript frameworks for front-end web development)
[#]: via: (https://opensource.com/article/20/5/open-source-javascript-frameworks)
[#]: author: (Bryant Son https://opensource.com/users/brson)

用于 Web 前端开发的 9 个 JavaScript 开源框架
======

> 根据 JavaScript 框架的优点和主要特点对许多 JavaScript 框架进行细分。

![](https://img.linux.net.cn/data/attachment/album/202107/18/205233kz0sqwdwwvrwp2ss.jpg)

大约十年前，JavaScript 社区开始见证一场 JavaScript 框架的激战。在本文中，我将介绍其中最著名的一些框架。值得注意的是，这些都是开源的 JavaScript 项目，这意味着你可以在 [开源许可证][2] 下自由地使用它们，甚至为它们的源代码和社区做出贡献。 

不过，在开始之前，了解一些 JavaScript 开发者谈论框架时常用的术语，将对后续的内容大有裨益。

术语 | 释义
---|---
[文档对象模型（DOM）][3] | 网站的树形结构表示，每一个节点都是代表网页一部分的对象。万维网联盟（W3C），是万维网的国际标准组织，维护着 DOM 的定义。
[虚拟 DOM][4] | 用户界面（UI）以“虚拟”或“理想”的方式保存在内存中，并通过 [ReactDOM][5] 等一些库与“真实” DOM 同步。要进一步探索，请阅读 ReactJS 的虚拟 DOM 和内部文档。
[数据绑定][6] | 一个编程概念，为访问网站上的数据提供一致的接口。Web 元素与 DOM 维护的元素的<ruby>属性<rt>property</rt></ruby> 或 <ruby>特性<rt>attribute</rt></ruby> 相关联（LCTT 译注：根据 MDN 的解释，Javascript 的<ruby>属性<rt>property</rt></ruby>是对象的特征，通常描述与数据结构相关的特征；<ruby>特性<rt>attribute</rt></ruby> 是指元素所有属性节点的一个实时集合）。例如，当需要在网页表单中填写密码时，数据绑定机制可以用密码验证逻辑检验，确保密码格式有效。

我们已经清楚了常用的术语，下面我们来探索一下开源的 JavaScript 框架有哪些。

框架 | 简介 | 许可证 | 发布日期
---|---|---|---
[ReactJS][7] | 目前最流行的 JavaScript 框架，由 Facebook 创建 | MIT 许可证 | 2013-5-24
[Angular][8] | Google 创建的流行的 JavaScript 框架 | MIT 许可证 | 2010-1-5
[VueJS][9] | 快速增长的 JavaScript 框架 | MIT 许可证 | 2013-7-28
[MeteorJS][10] | 超乎于 JavaScript 框架的强大框架 | MIT 许可证 | 2012-1-18
[KnockoutJS][11] | 开源的 MVVM（<ruby>模型-视图-视图模型<rt>Model-View-ViewModel</rt></ruby>） 框架 | MIT 许可证 | 2010-7-5
[EmberJS][12] | 另一个开源的 MVVM 框架 | MIT 许可证 | 2011-12-8
[BackboneJS][13] | 带有 RESTful JSON 和<ruby>模型-视图-主持人<rt>Model-View-Presenter</rt></ruby>模式的 JavaScript 框架 | MIT 许可证 | 2010-9-30
[Svelte][14] | 不使用虚拟 DOM 的 JavaScript 开源框架 | MIT 许可证 | 2016-11-20
[AureliaJS][15] | 现代 JavaScript 模块的集合 | MIT 许可证 | 2018-2-14

为了说明情况，下面是每个框架的 NPM 包下载量的公开数据，感谢 [npm trends][16]。

![Framework downloads graph][17]

### ReactJS

![React page][18]

[ReactJS][19] 是由 Facebook 研发的，它虽然在 Angular 之后发布，但明显是当今 JavaScript 框架的领导者。React 引入了一个虚拟 DOM 的概念，这是一个抽象副本，开发者能在框架内仅使用他们想要的 ReactJS 功能，而无需重写整个项目。此外，React 项目活跃的开源社区无疑成为增长背后的主力军。下面是一些 React 的主要优势：

  * 合理的学习曲线 —— React 开发者可以轻松地创建 React 组件，而不需要重写整个 JavaScript 的代码。在 ReactJS 的 [首页][20] 查看它的优点以及它如何使编程更容易。
  * 高度优化的性能 —— React 的虚拟 DOM 的实现和其他功能提升了应用程序的渲染性能。请查看 ReactJS 的关于如何对其性能进行基准测试，并对应用性能进行衡量的相关 [描述][21]。
  * 优秀的支持工具 —— [Redux][22]、[Thunk][23] 和 [Reselect][24] 是构建良好、可调式代码的最佳工具。
  * 单向数据绑定 —— 模型使用 Reach 流，只从所有者流向子模块，这使得在代码中追踪因果关系更加简单。请在 ReactJS 的 [数据绑定页][25] 阅读更多相关资料。

谁在使用 ReactJS？Facebook 自从发明它，就大量使用 React 构建公司首页，据说 [Instagram][26] 完全基于 ReactJS 库。你可能会惊讶地发现，其他知名公司如 [纽约时报][27]、[Netflix][28] 和 [可汗学院][29] 也在他们的技术栈中使用了 ReactJS。

更令人惊讶的是 ReactJS 开发者的工作机会，正如在下面 Stackoverflow 所做的研究中看到的，嘿，你可以从事开源项目并获得报酬。这很酷！

![React jobs page][30]

*Stackoverflow 的研究显示了对 ReactJS 开发者的巨大需求——[来源：2017 年开发者招聘趋势——Stackoverflow 博客][31]*

[ReactJS 的 GitHub][7] 目前显示超过 13,000 次提交和 1,377 位贡献者。它是一个在 MIT 许可证下的开源项目。

![React GitHub page][32]

### Angular

![Angular homepage][33]

就开发者数量来说，也许 React 是现在最领先的 JavaScript 框架，但是 [Angular][34] 紧随其后。事实上，开源开发者和初创公司更乐于选择 React，而较大的公司往往更喜欢 Angular（下面列出了一些例子）。主要原因是，虽然 Angular 可能更复杂，但它的统一性和一致性适用于大型项目。例如，在我整个职业生涯中一直研究 Angular 和 React，我观察到大公司通常认为 Angular 严格的结构是一种优势。下面是 Angular 的另外一些关键优势：

  * 精心设计的命令行工具 —— Angular 有一个优秀的命令行工具（CLI），可以轻松起步和使用 Angular 进行开发。ReactJS 提供命令行工具和其他工具，同时 Angular 有广泛的支持和出色的文档，你可以参见 [这个页面][35]。
  * 单向数据绑定 —— 和 React 类似，单向数据绑定模型使框架受更少的不必要的副作用的影响。
  * 更好的 TypeScript 支持 —— Angular 与 [TypeScript][36] 有很好的一致性，它其实是 JavaScript 强制类型的拓展。它还可以转译为 JavaScript，强制类型是减少错误代码的绝佳选择。

像 YouTube、[Netflix][37]、[IBM][38] 和 [Walmart][39] 等知名网站，都已在其应用程序中采用了 Angular。我通过自学使用 Angular 来开始学习前端 JavaScript 开发。我参与了许多涉及 Angular 的个人和专业项目，但那是当时被称为 AngularJS 的 Angular 1.x。当 Google 决定将版本升级到 2.0 时，他们对框架进行了彻底的改造，然后变成了 Angular。新的 Angular 是对之前的 AngularJS 的彻底改造，这一举动带来了一部分新开发者也驱逐了一部分原有的开发者。

截止到撰写本文，[Angular 的 GitHub][8] 页面显示 17,781 次提交和 1,133 位贡献者。它也是一个遵循 MIT 许可证的开源项目，因此你可以自由地在你的项目或贡献中使用。

![Angular GitHub page][40]

### VueJS

![Vue JS page][41]

[VueJS][42] 是一个非常有趣的框架。它是 JavaScript 框架领域的新来者，但是在过去几年里它的受欢迎程度显著增加。VueJS 由 [尤雨溪][43] 创建，他是曾参与过 Angular 项目的谷歌工程师。该框架现在变得如此受欢迎，以至于许多前端工程师更喜欢 VueJS 而不是其他 JavaScript 框架。下图描述了该框架随着时间的推移获得关注的速度。

![Vue JS popularity graph][44]

这里有一些 VueJS 的主要优点：

  * 更容易地学习曲线 —— 与 Angular 或 React 相比，许多前端开发者都认为 VueJS 有更平滑的学习曲线。
  * 小体积 —— 与 Angular 或 React 相比，VueJS 相对轻巧。在 [官方文档][45] 中，它的大小据说只有约 30 KB；而 Angular 生成的项目超过 65 KB。
  * 简明的文档 —— VueJS 有全面清晰的文档。请自行查看它的 [官方文档][46]。

[VueJS 的 GitHub][9] 显示该项目有 3,099 次提交和 239 位贡献者。

![Vue JS GitHub page][47]

### MeteorJS

![Meteor page][48]

[MeteorJS][49] 是一个自由开源的 [同构框架][50]，这意味着它和 NodeJS 一样，同时运行客户端和服务器的 JavaScript。Meteor 能够和任何其他流行的前端框架一起使用，如 Angular、React、Vue、Svelte 等。

Meteor 被高通、马自达和宜家等多家公司以及如 Dispatch 和 Rocket.Chat 等多个应用程序使用。[您可以其在官方网站上查看更多案例][51]。

![Meteor case study][52]

Meteor 的一些主要功能包括：

  * 在线数据 —— 服务器发送数据而不是 HTML，并由客户端渲染。在线数据主要是指 Meteor 在页面加载时通过一个 WebSocket 连接服务器，然后通过该链接传输所需要的数据。
  * 用 JavaScript 开发一切 —— 客户端、应用服务、网页和移动界面都可以用 JavaScript 设计。
  * 支持大多数主流框架 —— Angular、React 和 Vue 都可以与 Meteor 结合。因此，你仍然可以使用最喜欢的框架如 React 或 Angular，这并不防碍 Meteor 为你提供一些优秀的功能。

截止到目前，[Meteor 的 GitHub][10] 显示 22，804 次提交和 428 位贡献者。这对于开源项目来说相当多了。

![Meteor GitHub page][53]

### EmberJS

![EmberJS page][54]

[EmberJS][55] 是一个基于 [模型-视图-视图模型（MVVM）][56] 模式的开源 JavaScript 框架。如果你从来没有听说过 EmberJS，你肯定会惊讶于有多少公司在使用它。Apple Music、Square、Discourse、Groupon、LinkedIn、Twitch、Nordstorm 和 Chipotle 都将 EmberJS 作为公司的技术栈之一。你可以通过查询 [EmberJS 的官方页面][57] 来发掘所有使用 EmberJS 的应用和客户。

Ember 虽然和我们讨论过的其他框架有类似的好处，但这里有些独特的区别：

  * 约定优于配置 —— Ember 将命名约定标准化并自动生成结果代码。这种方法学习曲线有些陡峭，但可以确保程序员遵循最佳实践。
  * 成熟的模板机制 —— Ember 依赖于直接文本操作，直接构建 HTML 文档，而并不关心 DOM。

正如所期待的那样，作为一个被许多应用程序使用的框架，[Ember 的 GitHub][58] 页面显示该项目拥有 19,808 次提交和 785 位贡献者。这是一个巨大的数字！

![EmberJS GitHub page][59]

### KnockoutJS

![KnockoutJS page][60]

[KnockoutJS][61] 是一个独立开源的 JavaScript 框架，采用 [模板-视图-视图模型（MVVM）][56] 模式与模板。尽管与 Angular、React 或 Vue 相比，听说过这个框架的人可能比较少，这个项目在开发者社区仍然相当活跃，并且有以下功能：

  * 声明式绑定 —— Knockout 的声明式绑定系统提供了一种简洁而强大的方式来将数据链接到 UI。绑定简单的数据属性或使用单向绑定很简单。请在 [KnockoutJS 的官方文档页面][62] 阅读更多相关信息。
  * 自动 UI 刷新。
  * 依赖跟踪模板。

[Knockout 的 GitHub][11] 页面显示约有 1,766 次提交和 81 位贡献者。与其他框架相比，这些数据并不重要，但是该项目仍然在积极维护中。

![Knockout GitHub page][63]

### BackboneJS

![BackboneJS page][64]

[BackboneJS][65] 是一个具有 RESTful JSON 接口，基于<ruby>模型-视图-主持人<rt>Model-View-Presenter</rt></ruby>（MVP）设计范式的轻量级 JavaScript 框架。

这个框架据说已经被 [Airbnb][66]、Hulu、SoundCloud 和 Trello 使用。你可以在 [Backbone 的页面][67] 找到上面所有这些案例来研究。

[BackboneJS 的 GitHub][13] 页面显示有 3,386 次提交和 289 位贡献者。

![BackboneJS GitHub page][68]

### Svelte

![Svelte page][69]

[Svelte][70] 是一个开源的 JavaScript 框架，它生成操作 DOM 的代码，而不是包含框架引用。在构建时而非运行时将应用程序转换为 JavaScript 的过程，在某些情况下可能会带来轻微的性能提升。

[Svelte 的 GitHub][14] 页面显示，截止到本文撰写为止，该项目有 5,729 次提交和 296 位贡献者。

![Svelte GitHub page][71]

### AureliaJS

![Aurelia page][72]

最后我们介绍一下 [Aurelia][73]。Aurelia 是一个前端 JavaScript 框架，是一个现代 JavaScript 模块的集合。Aurelia 有以下有趣的功能：

  * 快速渲染 —— Aurelia 宣称比当今其他任何框架的渲染速度都快。
  * 单向数据流 —— Aurelia 使用一个基于观察的绑定系统，将数据从模型推送到视图。
  * 使用原生 JavaScript 架构 —— 可以用原生 JavaScript 构建网站的所有组件。

[Aurelia 的 GitHub][15] 页面显示，截止到撰写本文为止该项目有 788 次提交和 96 位贡献者。

![Aurelia GitHub page][74]

这就是我在查看 JavaScript 框架世界时发现的新内容。我错过了其他有趣的框架吗？欢迎在评论区分享你的想法。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/open-source-javascript-frameworks

作者：[Bryant Son][a]
选题：[lujun9972][b]
译者：[stevending1st](https://github.com/stevending1st)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/brson
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_screen_windows_files.png?itok=kLTeQUbY (Computer screen with files or windows open)
[2]: https://opensource.com/article/17/9/open-source-licensing
[3]: https://www.w3schools.com/js/js_htmldom.asp
[4]: https://reactjs.org/docs/faq-internals.html
[5]: https://reactjs.org/docs/react-dom.html
[6]: https://en.wikipedia.org/wiki/Data_binding
[7]: https://github.com/facebook/react
[8]: https://github.com/angular/angular
[9]: https://github.com/vuejs/vue
[10]: https://github.com/meteor/meteor
[11]: https://github.com/knockout/knockout
[12]: https://github.com/emberjs/ember.js
[13]: https://github.com/jashkenas/backbone
[14]: https://github.com/sveltejs/svelte
[15]: https://github.com/aurelia/framework
[16]: https://www.npmtrends.com/angular-vs-react-vs-vue-vs-meteor-vs-backbone
[17]: https://opensource.com/sites/default/files/uploads/open-source-javascript-framework-downloads-opensourcedotcom_0.png (Framework downloads graph)
[18]: https://opensource.com/sites/default/files/uploads/3_react.jpg (React page)
[19]: https://reactjs.org
[20]: https://reactjs.org/
[21]: https://reactjs.org/docs/perf.html
[22]: https://redux.js.org/
[23]: https://github.com/reduxjs/redux-thunk
[24]: https://github.com/reduxjs/reselect
[25]: https://reactjs.org/docs/two-way-binding-helpers.html
[26]: https://instagram-engineering.com/react-native-at-instagram-dd828a9a90c7
[27]: https://open.nytimes.com/introducing-react-tracking-declarative-tracking-for-react-apps-2c76706bb79a
[28]: https://medium.com/dev-channel/a-netflix-web-performance-case-study-c0bcde26a9d9
[29]: https://khan.github.io/react-components/
[30]: https://opensource.com/sites/default/files/uploads/4_reactjobs_0.jpg (React jobs page)
[31]: https://stackoverflow.blog/2017/03/09/developer-hiring-trends-2017
[32]: https://opensource.com/sites/default/files/uploads/5_reactgithub.jpg (React GitHub page)
[33]: https://opensource.com/sites/default/files/uploads/6_angular.jpg (Angular homepage)
[34]: https://angular.io
[35]: https://cli.angular.io/
[36]: https://www.typescriptlang.org/
[37]: https://netflixtechblog.com/netflix-likes-react-509675426db
[38]: https://developer.ibm.com/technologies/javascript/tutorials/wa-react-intro/
[39]: https://medium.com/walmartlabs/tagged/react
[40]: https://opensource.com/sites/default/files/uploads/7_angulargithub.jpg (Angular GitHub page)
[41]: https://opensource.com/sites/default/files/uploads/8_vuejs.jpg (Vue JS page)
[42]: https://vuejs.org
[43]: https://www.freecodecamp.org/news/between-the-wires-an-interview-with-vue-js-creator-evan-you-e383cbf57cc4/
[44]: https://opensource.com/sites/default/files/uploads/9_vuejspopularity.jpg (Vue JS popularity graph)
[45]: https://vuejs.org/v2/guide/comparison.html#Size
[46]: https://vuejs.org/v2/guide/
[47]: https://opensource.com/sites/default/files/uploads/10_vuejsgithub.jpg (Vue JS GitHub page)
[48]: https://opensource.com/sites/default/files/uploads/11_meteor_0.jpg (Meteor Page)
[49]: https://www.meteor.com
[50]: https://en.wikipedia.org/wiki/Isomorphic_JavaScript
[51]: https://www.meteor.com/showcase
[52]: https://opensource.com/sites/default/files/uploads/casestudy1_meteor.jpg (Meteor case study)
[53]: https://opensource.com/sites/default/files/uploads/12_meteorgithub.jpg (Meteor GitHub page)
[54]: https://opensource.com/sites/default/files/uploads/13_emberjs.jpg (EmberJS page)
[55]: https://emberjs.com
[56]: https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel
[57]: https://emberjs.com/ember-users
[58]: https://github.com/emberjs
[59]: https://opensource.com/sites/default/files/uploads/14_embergithub.jpg (EmberJS GitHub page)
[60]: https://opensource.com/sites/default/files/uploads/15_knockoutjs.jpg (KnockoutJS page)
[61]: https://knockoutjs.com
[62]: https://knockoutjs.com/documentation/binding-syntax.html
[63]: https://opensource.com/sites/default/files/uploads/16_knockoutgithub.jpg (Knockout GitHub page)
[64]: https://opensource.com/sites/default/files/uploads/17_backbonejs.jpg (BackboneJS page)
[65]: https://backbonejs.org
[66]: https://medium.com/airbnb-engineering/our-first-node-js-app-backbone-on-the-client-and-server-c659abb0e2b4
[67]: https://sites.google.com/site/backbonejsja/examples
[68]: https://opensource.com/sites/default/files/uploads/18_backbonejsgithub.jpg (BackboneJS GitHub page)
[69]: https://opensource.com/sites/default/files/uploads/19_svelte.jpg (Svelte page)
[70]: https://svelte.dev
[71]: https://opensource.com/sites/default/files/uploads/20_svletegithub.jpg (Svelte GitHub page)
[72]: https://opensource.com/sites/default/files/uploads/21_aurelia.jpg (Aurelia page)
[73]: https://aurelia.io
[74]: https://opensource.com/sites/default/files/uploads/22_aureliagithub.jpg (Aurelia GitHub page)
