Bossie Awards 2015: The best open source application development tools
================================================================================
InfoWorld's top picks among platforms, frameworks, databases, and all the other tools that programmers use 

![](http://images.techhive.com/images/article/2015/09/bossies-2015-app-dev-100613767-orig.jpg)

### The best open source development tools ###

There must be a better way, right? The developers are the ones who find it. This year's winning projects in the application development category include client-side frameworks, server-side frameworks, mobile frameworks, databases, languages, libraries, editors, and yeah, Docker. These are our top picks among all of the tools that make it faster and easier to build better applications.

![](http://core0.staticworld.net/images/article/2015/09/bossies-2015-docker-100613773-orig.jpg)

### Docker ###

The darling of container fans almost everywhere, [Docker][2] provides a low-overhead way to isolate an application or service’s environment, which serves its stated goal of being an open platform for building, shipping, and running distributed applications. Docker has been widely supported, even among those seeking to replace the Docker container format with an alternative, more secure runtime and format, specifically Rkt and AppC. Heck, Microsoft Visual Studio now supports deploying into a Docker container too.

Docker’s biggest impact has been on virtual machine environments. Since Docker containers run inside the operating system, many more Docker containers than virtual machines can run in a given amount of RAM. This is important because RAM is usually the scarcest and most expensive resource in a virtualized environment.

There are hundreds of thousands of runnable public images on Docker Hub, of which a few hundred are official, and the rest are from the community. You describe Docker images with a Dockerfile and build images locally from the Docker command line. You can add both public and private image repositories to Docker Hub.

-- Martin Heller

![](http://core0.staticworld.net/images/article/2015/09/bossies-2015-nodejs-iojs-100613778-orig.jpg)

### Node.js and io.js ###

[Node.js][2] -- and its recently reunited fork [io.js][3] -- is a platform built on [Google Chrome's V8 JavaScript runtime][4] for building fast, scalable, network applications. Node uses an event-driven, nonblocking I/O model without threads. In general, Node tends to take less memory and CPU resources than other runtime engines, such as Java and the .Net Framework. For example, a typical Node.js Web server can run well in a 512MB instance on Cloud Foundry or a 512MB Docker container.

The Node repository on GitHub has more than 35,000 stars and more than 8,000 forks. The project, sponsored primarily by Joyent, has more than 600 contributors. Some of the more famous Node applications are 37Signals, [Ancestry.com][5], Chomp, the Wall Street Journal online, FeedHenry, [GE.com][6], Mockingbird, [Pearson.com][7], Shutterstock, and Uber. The popular IoT back-end Node-RED is built on Node, as are many client apps, such as Brackets and Nuclide.

-- Martin Heller

![](rticle/2015/09/bossies-2015-angularjs-100613766-orig.jpg)

### AngularJS ###

[AngularJS][8] (or simply Angular, among friends) is a Model-View-Whatever (MVW) JavaScript AJAX framework that extends HTML with markup for dynamic views and data binding. Angular is especially good for developing single-page Web applications and linking HTML forms to models and JavaScript controllers.

The weird sounding Model-View-Whatever pattern is an attempt to include the Model-View-Controller, Model-View-ViewModel, and Model-View-Presenter patterns under one moniker. The differences among these three closely related patterns are the sorts of topics that programmers love to argue about fiercely; the Angular developers decided to opt out of the discussion.

Basically, Angular automatically synchronizes data from your UI (view) with your JavaScript objects (model) through two-way data binding. To help you structure your application better and make it easy to test, AngularJS teaches the browser how to do dependency injection and inversion of control.

Angular was created by Google and open-sourced under the MIT license; there are currently more than 1,200 contributors to the project on GitHub, and the repository has more than 40,000 stars and 18,000 forks. The Angular site lists [210 “neat things” built with Angular][9].

-- Martin Heller

![](http://images.techhive.com/images/article/2015/09/bossies-2015-react-100613782-orig.jpg)

### React ###

[React][10] is a JavaScript library for building a UI or view, typically for single-page applications. Note that React does not implement anything having to do with a model or controller. React pages can render on the server or the client; rendering on the server (with Node.js) is typically much faster. People often combine React with AngularJS to create complete applications.

React combines JavaScript and HTML in a single file, optionally a JSX component. React fans like the way JSX components combine views and their related functionality in one file, though that flies in the face of the last decade of Web development trends, which were all about separating the markup and the code. React fans also claim that you can’t understand it until you’ve tried it. Perhaps you should; the React repository on GitHub has 26,000 stars.

[React Native][11] implements React with native iOS controls; the React Native command line uses Node and Xcode. [ReactJS.Net][12] integrates React with [ASP.Net][13] and C#. React is available under a BSD license with a patent license grant from Facebook.

-- Martin Heller

![](http://images.techhive.com/images/article/2015/09/bossies-2015-atom-100613768-orig.jpg)

### Atom ###

[Atom][14] is an open source, hackable desktop editor from GitHub, based on Web technologies. It’s a full-featured tool with a fuzzy finder; fast projectwide search and replace; multiple cursors and selections; multiple panes, snippets, code folding; and the ability to import TextMate grammars and themes. Out of the box, Atom displayed proper syntax highlighting for every programming language on which I tried it, except for F# and C#; I fixed that easily by loading those packages from within Atom. Not surprising, Atom has tight integration with GitHub.

The skeleton of Atom has been separated from the guts and called the Electron shell, providing an open source way to build cross-platform desktop apps with Web technologies. Visual Studio Code is built on the Electron shell, as are a number of proprietary and open source apps, including Slack and Kitematic. Facebook Nuclide adds significant functionality to Atom, including remote development and support for Flow, Hack, and Mercurial.

On the downside, updating Atom packages can become painful, especially if you have many of them installed. The Nuclide packages seem to be the worst offenders -- they not only take a long time to update, they run CPU-intensive Node processes to do so.

-- Martin Heller

![](http://core0.staticworld.net/images/article/2015/09/bossies-2015-brackets-100613769-orig.jpg)

### Brackets ###

[Brackets][15] is a lightweight editor for Web design that Adobe developed and open-sourced, drawing heavily on other open source projects. The idea is to build better tooling for JavaScript, HTML, CSS, and related open Web technologies. Brackets itself is written in JavaScript, HTML, and CSS, and the developers use Brackets to build Brackets. The editor portion is based on another open source project, CodeMirror, and the Brackets native shell is based on Google’s Chromium Embedded Framework.

Brackets features a clean UI, with the ability to open a quick inline editor that displays all of the related CSS for some HTML, or all of the related JavaScript for some scripting, and a live preview for Web pages that you are editing. New in Brackets 1.4 is instant search in files, easier preferences editing, the ability to enable and disable extensions individually, improved text rendering on Macs, and Greek and Cyrillic character support. Last November, Adobe started shipping a preview version of Extract for Brackets, which can pull out design information from Photoshop files, as part of the default download for Brackets.

-- Martin Heller

![](http://core0.staticworld.net/images/article/2015/09/bossies-2015-typescript-100613786-orig.jpg)

### TypeScript ###

[TypeScript][16] is a portable, duck-typed superset of JavaScript that compiles to plain JavaScript. The goal of the project is to make JavaScript usable for large applications. In pursuit of that goal, TypeScript adds optional types, classes, and modules to JavaScript, and it supports tools for large-scale JavaScript applications. Typing gets rid of some of the nonsensical and potentially buggy default behavior in JavaScript, for example:

    > 1 + "1"
    '11'

“Duck” typing means that the type checking focuses on the shape of the data values; TypeScript describes basic types, interfaces, and classes. While the current version of JavaScript does not support traditional, class-based, object-oriented programming, the ECMAScript 6 specification does. TypeScript compiles ES6 classes into plain, compatible JavaScript, with prototype-based objects, unless you enable ES6 output using the `--target` compiler option.

Visual Studio includes TypeScript in the box, starting with Visual Studio 2013 Update 2. You can also edit TypeScript in Visual Studio Code, WebStorm, Atom, Sublime Text, and Eclipse.

When using an external JavaScript library, or new host API, you'll need to use a declaration file (.d.ts) to describe the shape of the library. You can often find declaration files in the [DefinitelyTyped][17] repository, either by browsing, using the [TSD definition manager][18], or using NuGet.

TypeScript’s GitHub repository has more than 6,000 stars.

-- Martin Heller

![](http://core0.staticworld.net/images/article/2015/09/bossies-2015-swagger-100613785-orig.jpg)

### Swagger ###

[Swagger][19] is a language-agnostic interface to RESTful APIs, with tooling that gives you interactive documentation, client SDK generation, and discoverability. It’s one of several recent attempts to codify the description of RESTful APIs, in the spirit of WSDL for XML Web Services (2000) and CORBA for distributed object interfaces (1991).

The tooling makes Swagger especially interesting. [Swagger-UI][20] automatically generates beautiful documentation and a live API sandbox from a Swagger-compliant API. The [Swagger codegen][21] project allows generation of client libraries automatically from a Swagger-compliant server.

[Swagger Editor][22] lets you edit Swagger API specifications in YAML inside your browser and preview documentations in real time. Valid Swagger JSON descriptions can then be generated and used with the full Swagger tooling.

The [Swagger JS][23] library is a fast way to enable a JavaScript client to communicate with a Swagger-enabled server. Additional clients exist for Clojure, Go, Java, .Net, Node.js, Perl, PHP, Python, Ruby, and Scala.

The [Amazon API Gateway][24] is a managed service for API management at scale. It can import Swagger specifications using an open source [Swagger Importer][25] tool.

Swagger and friends use the Apache 2.0 license.

-- Martin Heller

![](http://images.techhive.com/images/article/2015/09/bossies-2015-polymer-100613781-orig.jpg)

### Polymer ###

The [Polymer][26] library is a lightweight, “sugaring” layer on top of the Web components APIs to help in building your own Web components. It adds several features for greater ease in building complex elements, such as creating custom element registration, adding markup to your element, configuring properties on your element, setting the properties with attributes, data binding with mustache syntax, and internal styling of elements.

Polymer also includes libraries of prebuilt elements. The Iron library includes elements for working with layout, user input, selection, and scaffolding apps. The Paper elements implement Google's Material Design. The Gold library includes elements for credit card input fields for e-commerce, the Neon elements implement animations, the Platinum library implements push messages and offline caching, and the Google Web Components library is exactly what it says; it includes wrappers for YouTube, Firebase, Google Docs, Hangouts, Google Maps, and Google Charts.

Polymer Molecules are elements that wrap other JavaScript libraries. The only Molecule currently implemented is for marked, a Markdown library. The Polymer repository on GitHub currently has 12,000 stars. The software is distributed under a BSD-style license.

-- Martin Heller

![](http://core0.staticworld.net/images/article/2015/09/bossies-2015-ionic-100613775-orig.jpg)

### Ionic ###

The [Ionic][27] framework is a front-end SDK for building hybrid mobile apps, using Angular.js and Cordova, PhoneGap, or Trigger.io. Ionic was designed to be similar in spirit to the Android and iOS SDKs, and to do a minimum of DOM manipulation and use hardware-accelerated transitions to keep the rendering speed high. Ionic is focused mainly on the look and feel and UI interaction of your app.

In addition to the framework, Ionic encompasses an ecosystem of mobile development tools and resources. These include Chrome-based tools, Angular extensions for Cordova capabilities, back-end services, a development server, and a shell View App to enable testers to use your Ionic code on their devices without the need for you to distribute beta apps through the App Store or Google Play.

Appery.io integrated Ionic into its low-code builder in July 2015. Ionic’s GitHub repository has more than 18,000 stars and more than 3,000 forks. Ionic is distributed under an MIT license and currently runs in UIWebView for iOS 7 and later, and in Android 4.1 and up.

-- Martin Heller

![](http://core0.staticworld.net/images/article/2015/09/bossies-2015-cordova-100613771-orig.jpg)

### Cordova ###

[Apache Cordova][28] is the open source project spun off when Adobe acquired PhoneGap from Nitobi. Cordova is a set of device APIs, plus some tooling, that allows a mobile app developer to access native device functionality like the camera and accelerometer from JavaScript. When combined with a UI framework like Angular, it allows a smartphone app to be developed with only HTML, CSS, and JavaScript. By using Cordova plug-ins for multiple devices, you can generate hybrid apps that share a large portion of their code but also have access to a wide range of platform capabilities. The HTML5 markup and code runs in a WebView hosted by the Cordova shell.

Cordova is one of the cross-platform mobile app options supported by Visual Studio 2015. Several companies offer online builders for Cordova apps, similar to the Adobe PhoneGap Build service. Online builders save you from having to install and maintain most of the device SDKs on which Cordova relies.

-- Martin Heller

![](http://core0.staticworld.net/images/article/2015/09/bossies-2015-famous-100613774-orig.jpg)

### Famous Engine ###

The high-performance Famo.us JavaScript framework introduced last year has become the [Famous Engine][29] and [Famous Framework][30]. The Famous Engine runs in a mixed mode, with the DOM and WebGL under a single coordinate system. As before, Famous structures applications in a scene graph hierarchy, but now it produces very little garbage (reducing the garbage collector overhead) and sustains 60FPS animations.

The Famous Physics engine has been refactored to its own, fine-grained module so that you can load only the features you need. Other improvements since last year include streamlined eventing, improved sizing, decoupling the scene graph from the rendering pipeline by using a draw command buffer, and switching to a fully open MIT license.

The new Famous Framework is an alpha-stage developer preview built on the Famous Engine; its goal is creating reusable, composable, and interchangeable UI widgets and applications. Eventually, Famous hopes to replace the jQuery UI widgets with Famous Framework widgets, but while it's promising, the Famous Framework is nowhere near production-ready.

-- Martin Heller

![](http://images.techhive.com/images/article/2015/09/bossies-2015-mongodb-rev-100614248-orig.jpg)

### MongoDB ###

[MongoDB][31] is no stranger to the Bossies or to the ever-growing and ever-competitive NoSQL market. If you still aren't familiar with this very popular technology, here's a brief overview: MongoDB is a cross-platform document-oriented database, favoring JSON-like documents with dynamic schemas that make data integration easier and faster.

MongoDB has attractive features, including but not limited to ad hoc queries, flexible indexing, replication, high availability, automatic sharding, load balancing, and aggregation.

The big, bold move with [version 3.0 this year][32] was the new WiredTiger storage engine. We can now have document-level locking. This makes “normal” applications a whole lot more scalable and makes MongoDB available to more use cases.

MongoDB has a growing open source ecosystem with such offerings as the [TokuMX engine][33], from the famous MySQL bad boys Percona. The long list of MongoDB customers includes heavy hitters such as Craigslist, eBay, Facebook, Foursquare, Viacom, and the New York Times.

-- Andrew Oliver

![](http://images.techhive.com/images/article/2015/09/bossies-2015-couchbase-100614851-orig.jpg)

### Couchbase ###

[Couchbase][34] is another distributed, document-oriented database that has been making waves in the NoSQL world for quite some time now. Couchbase and MongoDB often compete, but they each have their sweet spots. Couchbase tends to outperform MongoDB when doing more in memory is possible.

Additionally, Couchbase’s mobile features allow you to disconnect and ship a database in compact format. This allows you to scale down as well as up. This is useful not just for mobile devices but also for specialized applications, like shipping medical records across radio waves in Africa.

This year Couchbase added N1QL, a SQL-based query language that did away with Couchbase’s biggest obstacle, requiring static views. The new release also introduced multidimensional scaling. This allows individual scaling of services such as querying, indexing, and data storage to improve performance, instead of adding an entire, duplicate node.

-- Andrew C. Oliver

![](http://images.techhive.com/images/article/2015/09/bossies-2015-cassandra-100614852-orig.jpg)

### Cassandra ###

[Cassandra][35] is the other white meat of column family databases. HBase might be included with your favorite Hadoop distribution, but Cassandra is the one people deliberately deploy for specialized applications. There are good reasons for this.

Cassandra was designed for high workloads of both writes and reads where millisecond consistency isn't as important as throughput. HBase is optimized for reads and greater write consistency. To a large degree, Cassandra tends to be used for operational systems and HBase more for data warehouse and batch-system-type use cases. 

While Cassandra has not received as much attention as other NoSQL databases and slipped into a quiet period a couple years back, it is widely used and deployed, and it's a great fit for time series, product catalog, recommendations, and other applications. If you want to keep a cluster up “no matter what” with multiple masters and multiple data centers, and you need to scale with lots of reads and lots of writes, Cassandra might just be your Huckleberry.

-- Andrew C. Oliver

![](http://core0.staticworld.net/images/article/2015/09/bossies-2015-orientdb-100613780-orig.jpg)

### OrientDB ###

[OrientDB][36] is an interesting hybrid in the NoSQL world, combining features from a document database, where individual documents can have multiple fields without necessarily defining a schema, and a graph database, which consists of a set of nodes and edges. At a basic level, OrientDB considers the document as a vertex, and relationships between fields as graph edges. Because the relationships between elements are part of the record, no costly joins are required when querying data.

Like most databases today, OrientDB offers linear scalability via a distributed architecture. Adding capacity is a matter of simply adding more nodes to the cluster. Queries are written in a variant of SQL that is extended to support graph concepts. It's not exactly SQL, but data analysts shouldn't have too much trouble adapting. Language bindings are available for most commonly used languages, such as R, Scala, .Net, and C, and those integrating OrientDB into their applications will find an active user community to get help from.

-- Steven Nunez

![](http://images.techhive.com/images/article/2015/09/bossies-2015-rethinkdb-100613783-orig.jpg)

### RethinkDB ###

[RethinkDB][37] is a scalable, real-time JSON database with the ability to continuously push updated query results to applications that subscribe to changes. There are official RethinkDB drivers for Ruby, Python, and JavaScript/Node.js, and community-supported drivers for more than a dozen other languages, including C#, Go, and PHP.

It’s temping to confuse RethinkDB with real-time sync APIs, such as Firebase and PubNub. RethinkDB can be run as a cloud service like Firebase and PubNub, but you can also install it on your own hardware or Docker containers. RethinkDB does more than synchronize: You can run arbitrary RethinkDB queries, including table joins, subqueries, geospatial queries, and aggregation. Finally, RethinkDB is designed to be accessed from an application server, not a browser.

Where MongoDB requires you to poll the database to see changes, RethinkDB lets you subscribe to a stream of changes to a query result. You can shard and scale RethinkDB easily, unlike MongoDB. Also unlike relational databases, RethinkDB does not give you full ACID support or strong schema enforcement, although it can perform joins.

The RethinkDB repository has 10,000 stars on GitHub, a remarkably high number for a database. It is licensed with the Affero GPL 3.0; the drivers are licensed with Apache 2.0.

-- Martin Heller

![](http://core0.staticworld.net/images/article/2015/09/bossies-2015-rust-100613784-orig.jpg)

### Rust ###

[Rust][38] is a syntactically C-like systems programming language from Mozilla Research that guarantees memory safety and offers painless concurrency (that is, no data races). It does not have a garbage collector and has minimal runtime overhead. Rust is strongly typed with type inference. This is all promising.

Rust was designed for performance. It doesn’t yet demonstrate great performance, however, so now the mantra seems to be that it runs as fast as C++ code that implements all the safety checks built into Rust. I’m not sure whether I believe that, as in many cases the strictest safety checks for C/C++ code are done by static and dynamic analysis and testing, which don’t add any runtime overhead. Perhaps Rust performance will come with time.

So far, the only tools for Rust are the Cargo package manager and the rustdoc documentation generator, plus a couple of simple Rust plug-ins for programming editors. As far as we have heard, there is no shipping software that was actually built with Rust. Now that Rust has reached the 1.0 milestone, we might expect that to change.

Rust is distributed with a dual Apache 2.0 and MIT license. With 13,000 stars on its GitHub repository, Rust is certainly attracting attention, but when and how it will deliver real benefits remains to be seen.

-- Martin Heller

![](http://core0.staticworld.net/images/article/2015/09/bossies-2015-opencv-100613779-orig.jpg)

### OpenCV ###

[OpenCV][39] (Open Source Computer Vision Library) is a computer vision and machine learning library that contains about 500 algorithms, such as face detection, moving object tracking, image stitching, red-eye removal, machine learning, and eye movement tracking. It runs on Windows, Mac OS X, Linux, Android, and iOS.

OpenCV has official C++, C, Python, Java, and MATLAB interfaces, and wrappers in other languages such as C#, Perl, and Ruby. CUDA and OpenCL interfaces are under active development. OpenCV was originally (1999) an Intel Research project in Russia; from there it moved to the robotics research lab Willow Garage (2008) and finally to [OpenCV.org][39] (2012) with a core team at Itseez, current source on GitHub, and stable snapshots on SourceForge.

Users of OpenCV include Google, Yahoo, Microsoft, Intel, IBM, Sony, Honda, and Toyota. There are currently more than 6,000 stars and 5,000 forks on the GitHub repository. The project uses a BSD license.

-- Martin Heller

![](http://core0.staticworld.net/images/article/2015/09/bossies-2015-llvm-100613777-orig.jpg)

### LLVM ###

The [LLVM Project][40] is a collection of modular and reusable compiler and tool chain technologies, which originated at the University of Illinois. LLVM has grown to include a number of subprojects, several of which are interesting in their own right. LLVM is distributed with Debian, Ubuntu, and Apple Xcode, among others, and it’s used in commercial products from the likes of Adobe (including After Effects), Apple (including Objective-C and Swift), Cray, Intel, NVIDIA, and Siemens. A few of the open source projects that depend on LLVM are PyPy, Mono, Rubinius, Pure, Emscripten, Rust, and Julia. Microsoft has recently contributed LLILC, a new LLVM-based compiler for .Net, to the .Net Foundation.

The main LLVM subprojects are the core libraries, which provide optimization and code generation; Clang, a C/C++/Objective-C compiler that’s about three times faster than GCC; LLDB, a much faster debugger than GDB; libc++, an implementation of the C++ 11 Standard Library; and OpenMP, for parallel programming.

-- Martin Heller

![](http://core0.staticworld.net/images/article/2015/09/bossies-2015-main-100613823-orig.jpg)

### Read about more open source winners ###

InfoWorld's Best of Open Source Awards for 2014 celebrate more than 100 open source projects, from the bottom of the stack to the top. Follow these links to more open source winners:

[Bossie Awards 2015: The best open source applications][41]

[Bossie Awards 2015: The best open source application development tools][42]

[Bossie Awards 2015: The best open source big data tools][43]

[Bossie Awards 2015: The best open source data center and cloud software][44]

[Bossie Awards 2015: The best open source desktop and mobile software][45]

[Bossie Awards 2015: The best open source networking and security software][46]

--------------------------------------------------------------------------------

via: http://www.infoworld.com/article/2982920/open-source-tools/bossie-awards-2015-the-best-open-source-application-development-tools.html

作者：[InfoWorld staff][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.infoworld.com/author/InfoWorld-staff/
[1]:https://www.docker.com/
[2]:https://nodejs.org/en/
[3]:https://iojs.org/en/
[4]:https://developers.google.com/v8/?hl=en
[5]:http://www.ancestry.com/
[6]:http://www.ge.com/
[7]:https://www.pearson.com/
[8]:https://angularjs.org/
[9]:https://builtwith.angularjs.org/
[10]:https://facebook.github.io/react/
[11]:https://facebook.github.io/react-native/
[12]:http://reactjs.net/
[13]:http://asp.net/
[14]:https://atom.io/
[15]:http://brackets.io/
[16]:http://www.typescriptlang.org/
[17]:http://definitelytyped.org/
[18]:http://definitelytyped.org/tsd/
[19]:http://swagger.io/
[20]:https://github.com/swagger-api/swagger-ui
[21]:https://github.com/swagger-api/swagger-codegen
[22]:https://github.com/swagger-api/swagger-editor
[23]:https://github.com/swagger-api/swagger-js
[24]:http://aws.amazon.com/cn/api-gateway/
[25]:https://github.com/awslabs/aws-apigateway-importer
[26]:https://www.polymer-project.org/
[27]:http://ionicframework.com/
[28]:https://cordova.apache.org/
[29]:http://famous.org/
[30]:http://famous.org/framework/
[31]:https://www.mongodb.org/
[32]:http://www.infoworld.com/article/2878738/nosql/first-look-mongodb-30-for-mature-audiences.html
[33]:http://www.infoworld.com/article/2929772/nosql/mongodb-crossroads-growth-or-openness.html
[34]:http://www.couchbase.com/nosql-databases/couchbase-server
[35]:https://cassandra.apache.org/
[36]:http://orientdb.com/
[37]:http://rethinkdb.com/
[38]:https://www.rust-lang.org/
[39]:http://opencv.org/
[40]:http://llvm.org/
[41]:http://www.infoworld.com/article/2982622/bossie-awards-2015-the-best-open-source-applications.html
[42]:http://www.infoworld.com/article/2982920/bossie-awards-2015-the-best-open-source-application-development-tools.html
[43]:http://www.infoworld.com/article/2982429/bossie-awards-2015-the-best-open-source-big-data-tools.html
[44]:http://www.infoworld.com/article/2982923/bossie-awards-2015-the-best-open-source-data-center-and-cloud-software.html
[45]:http://www.infoworld.com/article/2982630/bossie-awards-2015-the-best-open-source-desktop-and-mobile-software.html
[46]:http://www.infoworld.com/article/2982962/bossie-awards-2015-the-best-open-source-networking-and-security-software.html