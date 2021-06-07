[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (9 open source JavaScript frameworks for front-end web development)
[#]: via: (https://opensource.com/article/20/5/open-source-javascript-frameworks)
[#]: author: (Bryant Son https://opensource.com/users/brson)

9 open source JavaScript frameworks for front-end web development
======
A breakdown of many JavaScript options for frameworks—their strengths
and key features.
![Computer screen with files or windows open][1]

About a decade ago, the JavaScript developer community began to witness fierce battles emerging among JavaScript frameworks. In this article, I will introduce some of the most well-known of these frameworks. And it's important to note that these are all open source JavaScript projects, meaning that you can freely utilize them under an [open source license][2] and even contribute to the source code and communities.

If you prefer to follow along as I explore these frameworks, you can watch my video.

Before getting started, though, it will be useful to learn some of the terminology JavaScript developers commonly use when discussing frameworks.

Term | What It Is
---|---
[Document Object Model (DOM)][3] | A tree-structure representation of a website where each node is an object representing part of the webpage. The World Wide Web Consortium (W3C), the international standards organization for the World Wide Web, maintains the definition of the DOM.
[Virtual DOM][4] | A "virtual" or "ideal" representation of a user interface (UI) is kept in memory and synced with the "real" DOM by a library such as [ReactDOM][5]. To explore further, please read ReactJS's virtual DOM and internals documentation.
[Data Binding][6] | A programming concept to provide a consistent interface for accessing data on websites. Web elements are associated with a property or attribute of an element maintained by the DOM. For example, when you need to fill out a password in a webpage form, the data binding mechanism can check with the password validation logic to ensure that the password is in a valid format.

Now that we are clear about common terms, let's explore what open source JavaScript frameworks are out there.

Framework | About | License | Release Date
---|---|---|---
[ReactJS][7] | Created by Facebook, currently the most popular JavaScript framework | MIT License | May 24, 2013
[Angular][8] | Popular JavaScript framework created by Google | MIT License | Jan 5, 2010
[VueJS][9] | Rapidly growing JavaScript framework | MIT License | Jul 28, 2013
[MeteorJS][10] | Powerful framework that is more than a JavaScript framework | MIT License | Jan 18, 2012
[KnockoutJS][11] | Open source Model-View-ViewModel (MVVM) framework | MIT License | Jul 5, 2010
[EmberJS][12] | Another open source Model-View-ViewModel framework | MIT License | Dec 8, 2011
[BackboneJS][13] | JavaScript framework with RESTful JSON and Model-View-Presenter pattern | MIT License | Sep 30, 2010
[Svelte][14] | Open source JavaScript framework not using virtual DOM | MIT License | Nov 20, 2016
[AureliaJS][15] | A collection of Modern JavaScript modules | MIT License | Feb 14, 2018

For context, here is the publicly available data on popularity based on NPM package downloads per framework, thanks to [npm trends][16].

![Framework downloads graph][17]

### ReactJS

![React page][18]

[ReactJS][19] was invented by Facebook, and it is the clear leader among JavaScript frameworks today, though it was invented well after Angular. React introduces a concept called a virtual DOM, an abstract copy where developers can utilize only the ReactJS features that they want, without having to rewrite the entire project to work within the framework. In addition, the active open source community with the React project has definitely been the workhorse behind the growth. Here are some of React's key strengths:

  * Reasonable learning curve—React developers can easily create the React components without rewriting the entire code in JavaScript. See the benefits of ReactJS and how it makes it the programming easier on ReactJS's [front page][20].
  * Highly optimized for performance—React's virtual DOM implementation and other features boost app rendering performance. See ReactJS's [description][21] of how its performance can be benchmarked and measured in terms of how the app performs.
  * Excellent supporting tools—[Redux][22], [Thunk][23], and [Reselect][24] are some of the best tools for building well-structured, debuggable code.
  * One way data binding—The model used in Reach flows from owner to child only making it simpler to trace cause and effect in code. Read more about it on ReactJS's [page on data binding][25].



Who is using ReactJS? Since Facebook invented it, the company itself heavily uses React for its frontpage, and [Instagram][26] is said to be completely based on the ReactJS library. You might be surprised to know that other well-known companies like [New York Times][27], [Netflix][28], and [Khan Academy][29] also implement ReactJS in their technology stacks.

What may be even more surprising is the availability of jobs for ReactJS developers, as you can see below from research done by Stackoverflow. Hey, you can work on an open source project and get paid to do it. That is pretty cool!

![React jobs page][30]

Stackoverflow shows the huge demand for ReactJS developers—[Source: Developer Hiring Trends in 2017—Stackoverflow Blog][31]

 

[ReactJS's GitHub][7] currently shows over 13K commits and 1,377 contributors to the open source project. And it is an open source project under MIT License.

![React GitHub page][32]

### Angular

![Angular homepage][33]

React may now be the leading JavaScript framework in terms of the number of developers, but [Angular][34] is close behind. In fact, while React is the more popular choice among open source developers and startup companies, larger corporations tend to prefer Angular (a few are listed below). The main reason is that, while Angular might be more complicated, its uniformity and consistency works well for larger projects. For example, I have worked on both Angular and React throughout my career, and I observed that the larger companies generally consider Angular's strict structure a strength. Here are some other key strengths of Angular:

  * Well-designed Command Line Interface: Angular has an excellent Command Line Interface (CLI) tool to easily bootstrap and to develop with Angular. ReactJS also offers the Command Line Interface as well as other tools, but Angular has extensive support and excellent documentation, as you can see on [this page][35].
  * One way data binding—Similarly to React, the one-way data binding model makes the framework less susceptible to unwanted side effects.
  * Great support for TypeScript—Angular has excellent alignment with [TypeScript][36], which is effectively JavaScript more type enforcement. It also transcompiling to JavaScript, making it a great option to enforce types for less buggy code.



Well-known websites like YouTube, [Netflix][37], [IBM][38], and [Walmart][39] all have implemented Angular into their applications. I personally started front-end JavaScript development with Angular by educating myself on the subject. I have worked on quite a few personal and professional projects involving Angular, but that was Angular 1.x, which was called by AngularJS at the time. When Google decided to upgrade the version to 2.0, they completely revamped the framework, and then it became Angular. The new Angular was a complete transformation of the previous AngularJS, which drove off some existing developers while bringing new developers.

[Angular's][8] [GitHub][8] page shows 17,781 commits and 1,133 contributors at the time of this writing. It is also an open source project with an MIT License, so you can feel free to use it for your project or to contribute.

 

![Angular GitHub page][40]

### VueJS

![Vue JS page][41]

[VueJS][42] is a very interesting framework. It is a newcomer to the JavaScript framework scene, but its popularity has increased significantly over the course of a few years. VueJS was created by [Evan Yu][43], a former Google engineer who had worked on the Angular project. The framework got so popular that many front-end engineers now prefer VueJS over other JavaScript frameworks. The chart below depicts how fast the framework gained traction over time.

![Vue JS popularity graph][44]

Here are some of the key strengths of VueJS:

  * Easier learning curve—Even compared to Angular or React, many front-end developers feel that VueJS has the lowest learning curve.
  * Small size—VueJS is relatively lightweight compared to Angular or React. In its [official documentation][45], its size is stated to be only about 30 KB, while the project generated by Angular, for example, is over 65 KB.
  * Concise documentation—Vue has thorough but concise and clear documentation. See [its official documentation][46] for yourself.



[VueJS's GitHub][9] shows 3,099 commits and 239 contributors.

![Vue JS GitHub page][47]

### MeteorJS

![Meteor page][48]

[MeteorJS][49] is a free and open source [isomorphic framework][50], which means, just like NodeJS, it runs both client and server-side JavaScript. Meteor can be used in conjunction with any other popular front-end framework like Angular, React, Vue, Svelte, etc.

Meteor is used by several corporations such as Qualcomm, Mazda, and Ikea, and many applications like Dispatch and Rocket.Chat. [See the case studies on its official website.][51]

![Meteor case study][52]

Some of the key features of Meteor include:

  * Data on the wire—The server sends the data, not HTML, and the client renders it. Data on the wire refers mostly to the way that Meteor forms a WebSocket connection to the server on page load, and then transfers the data needed over that connection.
  * Develop everything in JavaScript—Client-side, application server, webpage, and mobile interface can be all designed with JavaScript.
  * Supports most major frameworks—Angular, React, and Vue can be all combined and used in conjunction with Meteor. Thus, you can still use your favorite framework, like React or Angular, but still leverage some of the great features that Meteor offers.



As of now, [Meteor's][10] [GitHub][10] shows 22,804 commits and 428 contributors. That is quite a lot for open source activities!

![Meteor GitHub page][53]

### EmberJS

![EmberJS page][54]

[EmberJS][55] is an open source JavaScript framework based on the [Model-view-viewModel(MVVM)][56] pattern. If you've never heard about EmberJS, you'll definitely be surprised how many companies are using it. Apple Music, Square, Discourse, Groupon, LinkedIn, Twitch, Nordstorm, and Chipotle all leverage EmberJS as one of their technology stacks. Check [EmberJS's official page][57] to discover all applications and customers that use EmberJS.

Although Ember has similar benefits to the other frameworks we've discussed, here are some of its unique differentiators:

  * Convention over configuration—Ember standardizes naming conventions and automatically generates the result code. This approach has a little more of a learning curve but ensures that programmers follow best-recommended practices.
  * Fully-fledged templating mechanism—Ember relies on straight text manipulation, building the HTML document dynamically while knowing nothing about DOM.



As one might expect from a framework used by many applications, [Ember's GitHub][58] page shows 19,808 commits and 785 contributors. That is huge!

![EmberJS GitHub page][59]

### KnockoutJS

![KnockoutJS page][60]

[KnockoutJS][61] is a standalone open source JavaScript framework adopting a [Model-View-ViewModel (MVVM)][56] pattern with templates. Although fewer people may have heard about this framework compared to Angular, React, or Vue, the project is still quite active among the development community and leverages features such as:

  * Declarative binding—Knockout's declarative binding system provides a concise and powerful way to link data to the UI. It's generally easy to bind to simple data properties or to use a single binding. Read more about it [here at KnockoutJS's official documentation page][62].
  * Automatic UI refresh
  * Dependency tracking templating



[Knockout's GitHub][11] page shows about 1,766 commits and 81 contributors. Those numbers are not as significant compared to the other frameworks, but the project is still actively maintained.

![Knockout GitHub page][63]

### BackboneJS

![BackboneJS page][64]

[BackboneJS][65] is a lightweight JavaScript framework with a RESTful JSON interface and is based on Model-View-Presenter (MVP) design paradigm.

The framework is said to be used by [Airbnb][66], Hulu, SoundCloud, and Trello. You can find all of these case studies on [Backbone's page][67].

The [BackboneJS GitHub][13] page shows 3,386 commits and 289 contributors.

![BackboneJS GitHub page][68]

### Svelte

![Svelte page][69]

[Svelte][70] is an open source JavaScript framework that generates the code to manipulate DOM instead of including framework references. This process of converting an app into JavaScript at build time rather than run time might offer a slight boost in performance in some scenarios.

[Svelte's][14] [GitHub][14] page shows 5,729 commits and 296 contributors as of this writing.

![Svelte GitHub page][71]

### AureliaJS

![Aurelia page][72]

Last on the list is [Aurelia][73]. Aurelia is a front-end JavaScript framework that is a collection of modern JavaScript modules. Aurelia has the following interesting features:

  * Fast rendering—Aurelia claims that its framework can render faster than any other framework today.
  * Uni-directional data flow—Aurelia uses an observable-based binding system that pushes the data from the model to the view.
  * Build with vanilla JavaScript—You can build all of the website's components with plain JavaScript.



[Aurelia's][15] [GitHub][15] page shows 788 commits and 96 contributors as of this writing.

![Aurelia GitHub page][74]

So that is what I found when looking at what is new in the JavaScript framework world. Did I miss any interesting frameworks? Feel free to share your ideas in the comment section!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/open-source-javascript-frameworks

作者：[Bryant Son][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
