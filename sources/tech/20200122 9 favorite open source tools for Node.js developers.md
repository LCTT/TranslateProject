[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (9 favorite open source tools for Node.js developers)
[#]: via: (https://opensource.com/article/20/1/open-source-tools-nodejs)
[#]: author: (Hiren Dhadhuk https://opensource.com/users/hirendhadhuk)

9 favorite open source tools for Node.js developers
======
Of the wide range of tools available to simplify Node.js development,
here are the 10 best.
![Tools illustration][1]

I recently read a survey on [StackOverflow][2] that said more than 49% of developers use Node.js for their projects. This came as no surprise to me.

As an avid user of technology, I think it's safe to say that the introduction of Node.js led to a new era of software development. It is now one of the most preferred technologies for software development, right next to JavaScript.

### What is Node.js, and why is it so popular?

Node.js is a cross-platform, open source runtime environment for executing JavaScript code outside of the browser. It is also a preferred runtime environment built on Chrome's JavaScript runtime and is mainly used for building fast, scalable, and efficient network applications.

I remember when we used to sit for hours and hours coordinating between front-end and back-end developers who were writing different scripts for each side. All of this changed as soon as Node.js came into the picture. I believe that the one thing that drives developers towards this technology is its two-way efficiency.

With Node.js, you can run your code simultaneously on both the client and the server side, speeding up the whole process of development. Node.js bridges the gap between front-end and back-end development and makes the development process much more efficient.

### A wave of Node.js tools

For 49% of all developers (including me), Node.js is at the top of the pyramid when it comes to front-end and back-end development. There are tons of [Node.js use cases][3] that have helped me and my team deliver complex projects within our deadlines. Fortunately, Node.js' rising popularity has also produced a wave of open source projects and tools to help developers working with the environment.

Recently, there has been a sudden increase in demand for projects built with Node.js. Sometimes, I find it quite challenging to manage these projects and keep up the pace while delivering high-quality results. So I decided to automate certain aspects of development using some of the most efficient of the many open source tools available for Node.js developers.

In my extensive experience with Node.js, I've worked with a wide range of tools that have helped me with the overall development process—from streamlining the coding process to monitoring to content management.

To help my fellow Node.js developers, I compiled this list of 9 of my favorite open source tools for simplifying Node.js development.

### Webpack

[Webpack][4] is a handy JavaScript module bundler used to simplify front-end development. It detects modules with dependencies and transforms them into static assets that represent the modules.

You can install the tool through either the npm or Yarn package manager.

With npm:


```
`npm install --save-dev webpack`
```

With Yarn:


```
`yarn add webpack --dev`
```

Webpack creates single bundles or multiple chains of assets that can be loaded asynchronously at runtime. Each asset does not have to be loaded individually. Bundling and serving assets becomes quick and efficient with the Webpack tool, making the overall user experience better and reducing the developer's hassle in managing load time.

### Strapi

[Strapi][5] is an open source headless content management system (CMS). A headless CMS is basically software that lets you manage your content devoid of a prebuilt frontend. It is a backend-only system that functions using RESTful APIs.

You can install Strapi through Yarn or npx packages.

With Yarn:


```
`yarn create strapi-app my-project --quickstart`
```

With npx:


```
`npx create-strapi-app my-project --quickstart`
```

Strapi's goal is to fetch and deliver your content in a structured manner across any device. The CMS makes it easy to manage your applications' content and make sure they are dynamic and accessible across any device.

It provides a lot of features, including file upload, a built-in email system, JSON Web Token (JWT) authentication, and auto-generated documentation. I find it very convenient, as it simplifies the overall CMS and gives me full autonomy in editing, creating, or deleting all types of contents.

In addition, the content structure built through Strapi is extremely flexible because you can create and reuse groups of content and customizable APIs.

### Broccoli

[Broccoli][6] is a powerful build tool that runs on an [ES6][7] module. Build tools are software that let you assemble all the different assets within your application or website, e.g., images, CSS, JavaScript, etc., into one distributable format. Broccoli brands itself as the "asset pipeline for ambitious applications."

You need a project directory to work with Broccoli. Once you have the project directory in place, you can install Broccoli with npm using:


```
npm install --save-dev broccoli
npm install --global broccoli-cli
```

You can also use Yarn for installation. 

The current version of Node.js would be the best version for the tool as it provides long-time support. This helps you avoid the hassle of updating and reinstalling as you go. Once the installation process is completed, you can include the build specification in your Brocfile.js.

In Broccoli, the unit of abstraction is a tree, which stores files and subdirectories within specific subdirectories. Therefore, before you build, you must have a specific idea of what you want your build to look like.

The best part about Broccoli is that it comes with a built-in server for development that lets you host your assets on a local HTTP server. Broccoli is great for streamlined rebuilds, as its concise architecture and flexible ecosystem boost rebuild and compilation speeds. Broccoli lets you get organized to save time and maximize productivity during development.

### Danger

[Danger][8] is a very handy open source tool for streamlining your pull request (PR) checks. As Danger's library description says, the tool helps you "formalize" your code review system by managing PR checks. Danger integrates with your CI and helps you speed up the review process.

Integrating Danger with your project is an easy step-by-step process—you just need to include the Danger module and create a Danger file for each project. However, it's more convenient to create a Danger account (easy to do through GitHub or Bitbucket), then set up access tokens for your open source software projects.

Danger can be installed via NPM or Yarn. To use Yarn, add danger -D to add it to your package.JSON.

After you add Danger to your CI, you can:

  * Highlight build artifacts of importance
  * Manage sprints by enforcing links to tools like Trello and Jira
  * Enforce changelogs
  * Utilize descriptive labels
  * And much more



For example, you can design a system that defines the team culture and sets out specific rules for code review and PR checks. Common issues can be solved based on the metadata Danger provides along with its extensive plugin ecosystem.

### Snyk

Cybersecurity is a major concern for developers. [Snyk][9] is one of the most well-known tools to fix vulnerabilities in open source components. It started as a project to fix vulnerabilities in Node.js projects and has evolved to detect and fix vulnerabilities in Ruby, Java, Python, and Scala apps as well. Snyk mainly runs in four stages:

  * Finding vulnerability dependencies
  * Fixing specific vulnerabilities
  * Preventing security risks by PR checks
  * Monitoring apps continuously



Snyk can be integrated with your project at any stage, including coding, CI/CD, and reporting. I find it extremely helpful for testing Node.js projects to test out npm packages for security risks or at build-time. You can also run PR checks for your applications in GitHub to make your projects more secure. Synx also provides a range of integrations that you can use to monitor dependencies and fix specific problems.

To run Snyk on your machine locally, you can install it through NPM:


```
`npm install -g snyk`
```

### Migrat

[Migrat][10] is an extremely easy to use data-migration tool that uses plain text. It works across a diverse range of stacks and processes that make it even more convenient. You can install Migrat with a simple line of code:


```
`$ npm install -g migrat`
```

Migrat is not specific to a particular database engine. It supports multi-node environments, as migrations can run on one node globally or once per server. What makes Migrat convenient is the facilitation of passing context to each migration.

You can define what each migration is for (e.g.,. database sets, connections, logging interfaces, etc.). Moreover, to avoid haphazard migrations, where multiple servers are running migrations globally, Migrat facilitates global lockdown while the process is running so that it can run only once globally. It also comes with a range of plug-ins for SQL databases, Slack, HipChat, and the Datadog dashboard. You can send live migrations to any of these platforms.

### Clinic.js

[Clinic.js][11] is an open source monitoring tool for Node.js projects. It combines three different tools—Doctor, Bubbleprof, and Flame—that help you monitor, detect, and solve performance issues with Node.js.

You can install Clinic.js from npm by running this command:


```
`$ npm install clinic`
```

You can choose which of the three tools that comprise Clinic.js you want to use based on which aspect of your project you want to monitor and the report you want to generate:

  * Doctor provides detailed metrics by injecting probes and provides recommendations on the overall health of your project.
  * Bubbleprof is great for profiling and generates metrics using async_hooks.
  * Flame is great for uncovering hot paths and bottlenecks in your code.



### PM2

Monitoring is one of the most important aspects of any backend development process. [PM2][12] is a process management tool for Node.js that helps developers monitor multiple aspects of their projects such as logs, delays, and speed. The tool is compatible with Linux, MacOS, and Windows and supports all Node.js versions starting from Node.js 8.X.

You can install PM2 with npm using:


```
`$ npm install pm2 --g`
```

If you do not already have Node.js installed, you can use:


```
`wget -qO- https://getpm2.com/install.sh | bash`
```

Once it's installed, start the application with:


```
`$ pm2 start app.js`
```

The best part about PM2 is that it lets you run your apps in cluster mode. You can spawn a process for multiple CPU cores at a time. This makes it easy to enhance application performance and maximize reliability. PM2 is also great for updates, as you can update your apps and reload them with zero downtime using the "hot reload" option. Overall, it's a great tool to simplify process management for Node.js applications.

### Electrode

[Electrode][13] is an open source application platform from Walmart Labs. The platform helps you build large-scale, universal React/Node.js applications in a structured manner.

The Electrode app generator lets you build a flexible core focused on the code, provides some great modules to add complex features to the app, and comes with a wide range of tools to optimize your app's Node.js bundle.

Electrode can be installed using npm. Once the installation is finished, you can start the app using Ignite and dive right in with the Electrode app generator.

You can install Electrode using NPM:


```
`npm install -g electrode-ignite xclap-cli`
```

### Which are your favorite?

These are just a few of the always-growing list of open source tools that can come in handy at different stages when working with Node.js. Which are your go-to open source Node.js tools? Please share your recommendations in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/open-source-tools-nodejs

作者：[Hiren Dhadhuk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hirendhadhuk
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tools_hardware_purple.png?itok=3NdVoYhl (Tools illustration)
[2]: https://insights.stackoverflow.com/survey/2019#technology-_-other-frameworks-libraries-and-tools
[3]: https://www.simform.com/nodejs-use-case/
[4]: https://webpack.js.org/
[5]: https://strapi.io/
[6]: https://broccoli.build/
[7]: https://en.wikipedia.org/wiki/ECMAScript#6th_Edition_-_ECMAScript_2015
[8]: https://danger.systems/
[9]: https://snyk.io/
[10]: https://github.com/naturalatlas/migrat
[11]: https://clinicjs.org/
[12]: https://pm2.keymetrics.io/
[13]: https://www.electrode.io/
