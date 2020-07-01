[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (10 ReactJS tools to boost your web development skills)
[#]: via: (https://opensource.com/article/20/6/reactjs-tools)
[#]: author: (Prayaag Kasundra https://opensource.com/users/prayaag-kasundra)

10 ReactJS tools to boost your web development skills
======
Increase your value to employers by learning these top tools for
developing web apps in React.
![Woman sitting in front of her computer][1]

Did you know most résumés submitted for jobs get rejected with just a single glance? That's a daunting fact if you are trying to get started in web development, but there are ways to improve what you have to offer prospective employers and clients. For application developers, now is a great time to increase your skills, and open source is the best avenue for professional development. You don't need to attend university to learn new open source skills; all you need is a sense of direction and self-discipline.

ReactJS is one of many skills you would be wise to learn on your way to becoming a successful web developer. If you're already comfortable with JavaScript and HTML, it is a natural next technology to learn. If you're not familiar with them yet, then you'll find ReactJS a great place to start as a programmer.

In this article, I'll share my top 10 tools and libraries that will help you qualify for a job (or be a serious hobbyist, if you prefer) as a JavaScript developer.

### What is React, and why should you learn it?

React is a JavaScript library for user interface (UI) development that Facebook introduced in May 2013 (and still maintains). It uses JavaScript for development and simple state machine components that render dynamic content with ease.

Because ReactJS is one of the most powerful frontend JavaScript libraries available, you should learn how to use it if you want to build amazing applications. It's a driving force behind the interfaces of Amazon, PayPal, BBC, CNN, and many other tech giants. Furthermore, the flexible library suits any need and can be plugged into your favorite tech stack to build lightweight apps. You can [use React][2] to build anything scalable—data dashboards, messaging apps, social networking applications, single-page applications, and even personal blog sites.

One of the most effective ways to get the hang of React is by using its tools to build web apps for real-world projects. Not only will it help you learn the framework and tools, but it also gives you something to show off to prospective employers.

### 1\. npm

If you want to get started with JavaScript (including the React library), you need to install Node package manager ([npm][3]). Like the package manager that ships with your Linux distribution (or [Chocolatey][4] on Windows or [Homebrew][5] on macOS), npm provides a command to query a software repository and install what you need. This includes important libraries, like ReactJS components.

You can probably install Node.js (and npm along with it) from your Linux distribution's repository. On Fedora or Red Hat Enterprise Linux:


```
`$ sudo dnf install nodejs`
```

On Ubuntu or Debian:


```
`$ sudo apt install nodejs npm`
```

If your distribution doesn't offer npm in its repo, visit [Nodejs.org][6] to find out how to install Node.js and npm.

### 2\. Create React App

[Create React App][7] is a boilerplate project for getting started with React. Before Facebook released Create React App, setting up a working project in React was a tedious task. But with this tool, you can set up a frontend build pipeline, project structure, developer environment, and app optimization for production in seconds with zero configuration. You can achieve all this with a single command. What's more, if you need a more advanced configuration, you can "eject" from Create React App and edit its config files directly.

Create React App is open source under the MIT License, and you can access its [source code][8] in its GitHub repo.

Install it with:


```
npm start
npm init react-app my-app
```

If you don't want to use Create React App, other boilerplate options are [React Boilerplate][9] and [React Slingshot][10]. Both are well-maintained and open source under the MIT License.

### 3\. React Sight

[React Sight][11] is a commonly used visualization tool that provides a live component hierarchy tree (like a flowchart) of your entire app. It can be added directly as a Chrome extension and needs React dev tools for reading information about your app. With its rich interface, you can even add filters to focus on the components you need to interact with the most. By hovering on the nodes, you can display the current state and props. React Sight is very helpful for debugging a large and complex project.

React Sight is open source under the MIT License, and you can access its [source code][12] in its GitHub repo. Install React Sight from the [Chrome web store][13].

### 4\. React Belle

[React Belle][14] is a configurable React component library containing reusable components like Toggle, Rating, DatePicker, Button, Card, Select, and others to provide a smooth user experience. The components are customizable and support [ARIA][15] accessibility standards. It offers different themes, like the popular Belle and Bootstrap.

Belle is open source under the MIT License, and you can access its [source code][16] in its GitHub repo.

Install it with:


```
`npm install belle`
```

### 5\. Evergreen

Built on top of the React UI primitive, [Evergreen][17] is a UI framework that contains highly polished components that you can use to build your project. One thing that developers like about this tool is its hassle-free import of components.

Evergreen is open source under the MIT License, and you can access its [source code][18] in its GitHub repo.

Install it with:


```
`npm install --save evergreen-ui`
```

### 6\. Bit

[Bit][19] offers an online platform and command-line tool for publishing and sharing React apps. It is one of the best options if you are creating and sharing components. Its marketplace is a store where people can publish their React apps and other people can search for the components they need, so they don't have to reinvent the wheel every time they need a new React app. Bit's core features include:

  * Allows code reuse
  * Increases design and development efficiency
  * Retains UI and UX consistency
  * Increases a project's stability



Bit is open source under the Apache 2.0 License, and you can access its [source code][20] in its GitHub repo.

Install it with:


```
`$ npm install bit-bin --global`
```

### 7\. Storybook

[Storybook][21] lets you set up a live development server that supports hot reloading, so you can create components in isolation from your whole project. It helps with component reuse, testability, and development speed. It also offers an online UI editor that allows you to develop, inspect, and eventually showcase your creations interactively.

What's more, Storybook's API offers myriad features and facilitates configuration like no other. It is used in production by companies like Coursera, Squarespace, and Lonely Planet.

Storybook is open source under the MIT License, and you can access its [source code][22] in its GitHub repo.

First, install Storybook using the following commands (note that one uses an npx command, which is related to npm but unique): 


```
`$ cd my-react-app`[/code] [code]`$ npx -p @storybook/cli sb init`
```

Next, run it with:


```
`$ npm run storybook`
```

### 8\. Formik

[Formik][23] helps in creating and validating forms for debugging, testing, and reasoning in React. It allows you to generate dynamic forms, so you don't have to manually change or update the state and props of form components. It is a step towards a faster and more pleasant development experience.

Formik is open source under the MIT License, and you can access its [source code][24] in its GitHub repo.

Install it with:


```
`$ npm install formik --save`
```

### 9\. Immer

[Immer][25] is a JavaScript library that enables you to modify nested objects without fear of mutating them. Its purpose is to make immutability in your code simple.

Here are some of Immer's top features:

  * **Immer is strongly typed**: It is useful when your state object has a type.
  * **Immer reduces boilerplate code**: Most state management tools require you to write a lot of boilerplate code. Immer is different. It lets you write less (and more concise) code.
  * **Immer allows you to use JS data structures:** You can produce immutable states in Immer by using basic JS data structures.



Immer is open source under the MIT License, and you can access its [source code][26] in its GitHub repo.

Install it with:


```
`$ npm install immer`
```

### 10\. React Proto

[React Proto][27] is an application prototyping tool for developers and designers. It helps you layout your project structure to make decisions in advance, so you don't waste time making changes later in development. This tool specifically helps people who prefer design over coding; for example, you can drag and drop elements instead of writing them. The tool helps you mark all potential components and give them names, properties, and a hierarchy for prototyping.

React Proto is open source under the MIT License, and you can access its [source code][28] in its GitHub repo.

To install it, first, fork the [repository][28]. Next, install dependencies with:


```
`$ npm install`
```

Run the application with:


```
`$ npm start`
```

To start a development environment, run:


```
`$ npm run dev`
```

### Boost your career with ReactJS tools

There's no shortage of resources for JavaScript. To learn more about the frameworks I've mentioned in this article, plus many more, check out the [Awesome React][29] repository on GitHub, a list of awesome things related to React.

By learning these 10 must-have tools, you'll boost your productivity and your résumé, and more importantly, you'll have a good grasp on JavaScript-based web development.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/reactjs-tools

作者：[Prayaag Kasundra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/prayaag-kasundra
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_women_computing_3.png?itok=qw2A18BM (Woman sitting in front of her computer)
[2]: https://www.simform.com/why-use-react/
[3]: https://www.npmjs.com/
[4]: https://opensource.com/article/20/3/chocolatey
[5]: https://opensource.com/article/20/6/homebrew-mac
[6]: https://nodejs.org/en/download/package-manager/
[7]: https://facebook.github.io/create-react-app/
[8]: https://github.com/facebook/create-react-app
[9]: http://www.reactboilerplate.com/
[10]: https://github.com/coryhouse/react-slingshot
[11]: http://www.reactsight.com/
[12]: https://github.com/React-Sight/React-Sight
[13]: https://chrome.google.com/webstore/detail/react-sight/aalppolilappfakpmdfdkpppdnhpgifn
[14]: http://nikgraf.github.io/belle/
[15]: https://en.wikipedia.org/wiki/WAI-ARIA
[16]: https://github.com/nikgraf/belle
[17]: https://evergreen.segment.com/
[18]: https://github.com/segmentio/evergreen
[19]: https://github.com/teambit/bit
[20]: https://github.com/teambit/bit/blob/master/LICENSE
[21]: https://storybook.js.org/
[22]: https://github.com/storybookjs/storybook
[23]: https://jaredpalmer.com/formik/
[24]: https://github.com/jaredpalmer/formik
[25]: https://immerjs.github.io/immer/docs/introduction
[26]: https://github.com/immerjs/immer
[27]: https://react-proto.github.io/react-proto/
[28]: https://github.com/React-Proto/react-proto
[29]: https://github.com/enaqx/awesome-react
