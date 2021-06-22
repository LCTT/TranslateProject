[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A beginner's guide to developing with React)
[#]: via: (https://opensource.com/article/20/11/reactjs-tutorial)
[#]: author: (Shedrack Akintayo https://opensource.com/users/shedrack-akintayo)

A beginner's guide to developing with React
======
A step-by-step guide to using React in your web and mobile user
interfaces.
![Gears connecting][1]

[React][2] is a JavaScript user interface (UI) library that was built and is maintained by Facebook. React helps JavaScript developers think logically and functionally about how they want to build a UI.

With React, you can build:

  1. Single-page applications
  2. Applications that are easy to understand
  3. Scalable applications
  4. Cross-platform applications



React allows developers to build applications declaratively and offers a unidirectional flow of data.

### React's advantages

The following features explain why React is one of the [most popular][3] web frameworks.

  * **It is declarative:** React makes it extremely painless to build interactive user interfaces, design basic views for your application based on various states, and update and render new views when the data in your application changes.
  * **It is component-based:** React gives you the ability to build encapsulated components that can manage their own state, then puts them together to build complex UIs. The logic of these components is written in JavaScript instead of templates, so you easily pass actual data and keep state out of the [document object model][4] (DOM).
  * **You can learn once, write anywhere:** React gives you the ability to build for both mobile (React Native) and the web. There's no need to rewrite your existing codebase; you can just integrate React with your existing code.
  * **The virtual DOM:** React introduced a wrapper around the regular DOM called the virtual DOM (VDOM). This allows React to render elements and update its state faster than the regular DOM.
  * **Performance:** React has great performance benefits due to the VDOM and one-way flow of data.



### The virtual DOM

React's VDOM is like a virtual copy of the original DOM. It offers one-way data binding, which makes manipulating and updating the VDOM quicker than updating the original DOM. The VDOM can handle multiple operations in milliseconds without affecting the general page performance.

This VDOM supports React's declarative API: You basically tell React what state you want the UI to be in, and it ensures that the DOM matches that state.

### Prerequisites for learning React

Learning React requires basic knowledge of JavaScript, HTML, and CSS. To use React's power effectively, it helps to be familiar with [ECMAScript 6][5] (ES6) and functional and object-oriented programming.

You also need the following things installed on your computer:

  * [NodeJS][6]
  * [npm][7] (comes bundled with NodeJS)
  * [Yarn][8] (an alternative to NPM)



### Basic React concepts

It also helps to have an understanding of React's concepts.

#### Components

Components are standalone, reusable pieces of code. They have the same purpose as JavaScript functions but work alone and return HTML via a built-in render function. They are two main types of components:

  * **Class components** offer more control in the form of lifecycle hooks, managing and handling state, and API calls. For example: [code] class MyComponent extends React.Component {
  render() {
    return &lt;div&gt;This is a class component&lt;/div&gt;;
  }
} 
```
  * **Functional components** were used for rendering just views without any form of state management or data request until [React Hooks][9] was introduced. For example: [code] Function myComponent() {
  return (
      &lt;div&gt;A functional Component&lt;/div&gt;
  )
 }
```



#### Props

React props are like function arguments in JavaScript and attributes in HTML. They are read-only. For example:


```
function Welcome(props) {
  return &lt;h1&gt;Hello, {props.name}&lt;/h1&gt;;
}
```

#### State

React components have a built-in object called _state_, which is where you store property values that belong to a particular component. If a component's state changes at any point in time, the component re-renders. For example:


```
class Car extends React.Component {
  constructor(props) {
    super(props);
    this.state = { brand: 'Ford' };
  }
  render() {
    return (
      &lt;div&gt;
        &lt;h1&gt;My Car&lt;/h1&gt;
      &lt;/div&gt;
    );
  }
}
```

#### JSX

JSX is a syntax extension to JavaScript. It is similar to a template language but has the full power of JavaScript. JSX is compiled to `React.createElement()` calls, which return plain JavaScript objects called _React elements_. For example:


```
return (
  &lt;div&gt;
    &lt;h1&gt;My Car&lt;/h1&gt;
  &lt;/div&gt;
);
```

The code between the return method that looks like HTML is JSX.

### How to use React

Ready to get started? I'll go step-by-step through two options for using React in your app:

  * Adding its content delivery network (CDN) to your HTML file
  * Starting a blank React app with Create React App



#### Add its CDN to your HTML file

You can quickly use React in your HTML page by adding its CDN directly to your HTML file using the following steps:

**Step 1:** In the HTML page you want to add React to, add an empty `<div>` tag to create a container where you want to render something with React. For example:


```
&lt;!-- ... old HTML ... --&gt;

&lt;[div][10] id="button_container"&gt;&lt;/[div][10]&gt;

&lt;!-- ... old HTML ... --&gt;
```

**Step 2:** Add three `<script>` tags to the HTML page just before the closing `</body>` tag. For example:


```
&lt;!-- ... Some other HTML ... --&gt;
  &lt;!-- Initiate React. --&gt;
  &lt;!-- Note: when deploying, replace "development.js" with "production.min.js". --&gt;

 &lt;[script][11] src="<https://unpkg.com/react@16/umd/react.development.js>" crossorigin&gt;&lt;/[script][11]&gt;
 &lt;[script][11] src="<https://unpkg.com/react-dom@16/umd/react-dom.development.js>" crossorigin&gt;&lt;/[script][11]&gt;

  &lt;!-- Load our React component. --&gt;

 &lt;[script][11] src="button.js"&gt;&lt;/[script][11]&gt;

&lt;/[body][12]&gt;
```

The first two script tags load React, and the last one loads your React component code.

**Step 3:** Create a file called `button.js` in the same folder as your HTML page to hold the code for your React component. Paste the following code inside your `button.js` file:


```
'use strict';
const e = React.createElement;
class Button extends React.Component {
  constructor(props) {
    super(props);
    this.state = { clicked: false };
  }
  render() {
    if (this.state.clicked) {
      return 'You clicked this button.';
    }
    return e(
      'button',
      { onClick: () =&gt; this.setState({ clicked: true }) },
      'Click Me'
    );
  }
}
```

This code creates a button component that returns a message when the button is clicked.

**Step 4:** To use this component in your HTML page, add the code snippet below at the end of your `button.js` file:


```
const domContainer = document.querySelector('#button_container');
ReactDOM.render(e(Button), domContainer);
```

The code snippet above targets the `<div>` you added to your HTML in the first step and render your React button component inside it.

#### Start a blank React app with Create React App

If you want to start with a blank React app, use [Create React App][13]. This is the recommended way to quickly create single-page React applications, as it provides a modern build setup without any configuration.

To generate a new React app using Create React App, enter one of the following commands in your terminal. This will create a new React app called `my-app:`

  * [npx][14] (this is the recommended way to use create-react-app): [code]`npx create-react-app my-app`
```
* npm: [code]`npm i -g create-react-app && npm create-react-app my-app`
```
  * Yarn: [code]`yarn add create-react-app && yarn create-react-app my-app`[/code] ` `



To run your newly created app, navigate into the app folder (by typing `cd my-app` into your terminal) and enter one of the following commands:

  * npm:

```
npm start
```


```
* Yarn:
```
     yarn start
    
```

```




These will run the app you just created in development mode. You can open `http://localhost:3000` to view it in the browser.

When you navigate to `http://localhost:3000`, you should see a page like the one below. Any change you make in the React code will automatically render here.

![React gif][15]

I hope this guide to getting started with React has been helpful. There are many more things to discover in the world of JavaScript, so please explore on your own and share what you learn.

* * *

_This article originally appeared on [Shedrack Akintayo's blog][16] and is republished with his permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/reactjs-tutorial

作者：[Shedrack Akintayo][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/shedrack-akintayo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/gears_wheels.png?itok=KRvpBttl (Gears connecting)
[2]: https://reactjs.org/
[3]: https://insights.stackoverflow.com/survey/2020#technology-web-frameworks
[4]: https://en.wikipedia.org/wiki/Document_Object_Model
[5]: https://en.wikipedia.org/wiki/ECMAScript
[6]: https://nodejs.org/
[7]: https://www.npmjs.com/
[8]: https://yarnpkg.com/
[9]: https://reactjs.org/docs/hooks-intro.html
[10]: http://december.com/html/4/element/div.html
[11]: http://december.com/html/4/element/script.html
[12]: http://december.com/html/4/element/body.html
[13]: https://create-react-app.dev/docs/getting-started/
[14]: https://medium.com/@maybekatz/introducing-npx-an-npm-package-runner-55f7d4bd282b
[15]: https://opensource.com/sites/default/files/uploads/react.gif (React gif)
[16]: https://www.sheddy.xyz/posts/react-js-the-first-time
