[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (13 of the best React JavaScript frameworks)
[#]: via: (https://opensource.com/article/20/1/react-javascript-frameworks)
[#]: author: (Amit Dua https://opensource.com/users/amitdua)

13 of the best React JavaScript frameworks
======
If you're using React.js or React Native to create user interfaces, try
these frameworks.
![Javascript code close-up with neon graphic overlay][1]

React.js and React Native are popular open source platforms for developing user interfaces (UIs); both rank well for desirability and use in StackOverflow's 2019 Developer Survey. React.js was developed by Facebook in 2011 as a JavaScript library to address the need for cross-platform, dynamic, and high-performing UIs, while React Native, which Facebook released in 2015, is used for building native applications using JavaScript.

The following are 13 of the best React JavaScript frameworks; all are open source—the first 11 (like React) are licensed under the MIT license and the latter two are licensed under Apache 2.0.

### 1\. Create React App

This command-line interface from Facebook developers is a must-have for every React Native project. The reason is that the [Create React App][2] is easy to use and prevents you from having to manually set up and configure your app, thereby saving you a lot of time and effort. With just a simple command, everything will be ready for you to create a React native project easily. You can use it to build a catalog and files, and the framework also includes tools to build, test, and launch your application.


```
# Install package
$ npm install -g create-react-native-web-app
 
# Run create-react-native-web-app &lt;project-directory&gt;
$ create-react-native-web-app myApp
 
# cd into your &lt;project-directory&gt;
$ cd myApp
 
# Run Web/Ios/Android development
# Web
$ npm run web
 
# IOS (simulator)
$ npm run ios
 
# Android (connected device)
$ npm run android
```

#### Why opt for Create React App

  1. Top-notch tool developed with a configure bundle, transpiler, and test runner
  2. No configuration and no extra files at the app structure
  3. Fixed Development stack
  4. Effective Fast developing tool



### 2\. Material Kit React

Inspired by Google's Material Design system, [Material Kit React][3] can be an excellent choice for building React UI components. The best thing about this library is that it offers a lot of components that are built to fit together and look incredible. There are over 1,000 fully coded components, and each one comes with separate layers organized in folders. This means you have thousands of options to choose from. There are several example pages as well, in case you want to get inspiration or share an idea or concept with someone.

#### Installing the Material Kit


```
`  $ npm install @material-ui/core`
```

#### Implementation


```
import React from 'react';
import Button from '@material-ui/core/Button';

const App = () =&gt; (
  &lt;Button variant="contained" color="primary"&gt;
    Hello World
  &lt;/Button&gt;
);
```

The Material-UI component work without any additional setup, and do not pollute the global scope.

#### Advantage

The React component supports easier and faster web development. With it, you can build your own design system, or start with Material Design.

### 3\. Shards React

This modern React UI kit has been built from scratch to achieve fast performance. It has a modern design system that lets you customize things the way you want. You can even download the source files to customize things at the code level. Also, the SCSS syntax used for styling enhances the development experience.

[Shards React][4] is based on Shards and uses React Datepicker, React Popper (a positioning engine), and noUISlider. It also supports incredible Material Design icons. There are some pre-made versions to help you gain some inspiration and get started.

#### Installation Shards with Yarn or NPM


```
# Yarn
yarn add shards-react

# NPM
npm i shards-react
```

#### Advantages

  1. Shards is lightweight having a small footprint and weighting ~13kb minified and gzipped
  2. Shards is responsive by default being able to adapt and reflow its layout to any screen size
  3. Shards is well documented so you can start building beautiful interfaces as soon as possible



### 4\. Styled Components

This efficient CSS tool helps build small, reusable components that are responsible for an app's visual interface. With traditional CSS, you can accidentally overwrite the selectors used in other places on the website, but [Styled Components][5] can help you completely avoid this problem by using a CSS syntax directly inside your components.

#### Installation


```
`npm install --save styled-components`
```

#### Implementation


```
const Button = styled.button`
  background: background_type;
  border-radius: radius_value;
  border: abc;
  color: name_of_color;
  Margin: margin_value;
  padding: value;
```

#### Advantage

  1. Make components more readable
  2. Components rely on JavaScript for their style
  3. Build custom components with CSS
  4. Inline styling
  5. Convert component even the custom component to a styled component by simply invoking styled()



### 5\. Redux

[Redux][6] is a state-management solution for JavaScript applications. While it is mostly used for React.js, you can also use it for other React-like frameworks.

#### Installation


```
sudo npm install redux
sudo npm install react-redux
```

#### Implementation


```
import { createStore } from "redux";
import rotateReducer from "reducers/rotateReducer";

function configureStore(state = { rotating: value}) {
  return createStore(rotateReducer,state);
}

export default configureStore;
```

#### Advantage

  1. Predictable state update helps in defining the data flow of the application
  2. Logic easier to test and time-travel debugging with reducer functions
  3. Centralizing the state



### 6\. React Virtualized

This React Native JavaScript framework helps in large-list and tabular-data rendering. Using [React Virtualized][7], you can restrict the number of requests and Document Object Model (DOM) elements, thus enhancing the performance of React apps.

#### Installation


```
`npm install react-virtualized`
```

#### Implementation


```
import 'react-virtualized/styles.css'
import { Column, Table } from 'react-virtualized'
import AutoSizer from 'react-virtualized/dist/commonjs/AutoSizer'
import List from 'react-virtualized/dist/commonjs/List'
{
  alias: {
    'react-virtualized/List': 'react-virtualized/dist/es/List',
  },
  ...rest
}
```

#### Advantages

  1. Display a large amount of data efficiently
  2. Rendering a huge data set
  3. Implements virtual rendering with a set of components



### 7\. React DnD

[ReactDnD][8] is responsible for the creation of complex drag-and-drop interfaces. There are dozens of drag-and-drop libraries, but React DnD stands out because it is built on top of modern HTML5's drag-and-drop API, making the process of creating interfaces easy.

#### Installation


```
`npm install react-dnd-preview`
```

#### Implementation


```
 import Preview from 'react-dnd-preview';
 
  const generatePreview = ({itemType, item, style}) =&gt; {
    return &lt;div class="item-list" style={style}&gt;{itemType}&lt;/div&gt;;
  };
 
  class App extends React.Component {
    ...
 
    render() {
      return (
        &lt;DndProvider backend={MyBackend}&gt;
          &lt;ItemList /&gt;
          &lt;Preview generator={generatePreview} /&gt;
          // or
          &lt;Preview&gt;{generatePreview}&lt;/Preview&gt;
        &lt;/DndProvider&gt;
      );
    }
  }
```

#### Advantages

  1. Beautiful and natural movement of items bouquet
  2. Powerful keyboard and screen reader support wheelchair
  3. Extremely performant
  4. Clean and powerful api
  5. Plays extremely well with standard browser interactions
  6. Unopinionated styling
  7. No creation of additional wrapper dom nodes



### 8\. React Bootstrap

This UI Kit library replaces Bootstrap's JavaScript with React, giving you more control over the functions of each component. Because each component is built to be easily accessible, [React Bootstrap][9] can be beneficial for frontend framework building. There are thousands of bootstrap themes to choose from.

#### Installation


```
`npm install react-bootstrap bootstrap`
```

#### Implementation


```
import 'bootstrap/dist/css/bootstrap.min.css';
import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import registerServiceWorker from './registerServiceWorker';

ReactDOM.render(&lt;App /&gt;, document.getElementById('root'));
registerServiceWorker();
```

#### Advantages

  1. Can easily import required code/component
  2. Saves typing and bugs by compressing the Bootstrap
  3. Reduces typing efforts and conflicts by compressing the Bootstrap
  4. It is easy to use
  5. It encapsulates in elements



### 9\. React Suite

[React Suite][10] is another efficient React.js framework that contains a wide range of component libraries for enterprise system products. It supports all major browsers and platforms, making it suitable for just about any system. It also supports server-side rendering.

#### Installation


```
`npm i rsuite --save`
```

#### Implementation


```
import { Button } from 'rsuite';
import 'rsuite/styles/less/index.less';
ReactDOM.render(&lt;Button&gt;Button&lt;/Button&gt;, mountNode);
```

#### Advantages

  1. Easily manage the application easily by the help of global accessing features
  2. Redux library centralizes the state management
  3. Redux is flexible with all the UI layers and has a large ecosystem
  4. Redux reduces this complexity and provides global accessibility



### 10\. PrimeReact

The best thing about [PrimeReact][11] is that it provides components that cover almost all of a UI's basic requirements, such as input options, menus, data presentations, messages, etc. The framework also pays close attention to the mobile experience, thus helping you design touch-optimized elements.

#### Installation


```
npm install primereact --save
npm install primeicons --save
```

#### Implementation


```
import {Dialog} from 'primereact/dialog';
import {Accordion,AccordionTab} from 'primereact/accordion';
dependencies: {
    "react": "^16.0.0",
    "react-dom": "^16.0.0",
    "react-transition-group": "^2.2.1",
    "classnames": "^2.2.5",
    "primeicons": "^2.0.0"
}
```

#### Advantages

  1. Simplicity and Performance
  2. Ease of Use
  3. Spring Applications
  4. Create rich user interfaces
  5. Usability and simplicity



### 11\. React Router

[React Router][12] is quite popular in the React Native developer community because it is very easy to start working with. All you need is Git and the npm package manager installed on your PC, a basic knowledge of React, and a willingness to learn. There is nothing too complicated.

#### Installation


```
`$ npm install --save react-router`
```

#### Implementation


```
import { Router, Route, Switch } from "react-router";
 
// using CommonJS modules
var Router = require("react-router").Router;
var Route = require("react-router").Route;
var Switch = require("react-router").Switch;
```

#### Advantages

  1. Dynamic route matching
  2. CSS transitions on views when navigating
  3. Standardized app structure and behavior



### 12\. Grommet

[Grommet][13] is used for creating responsive and accessible mobile-first web apps. The best thing about this Apache 2.0-licensed JavaScript framework is that it offers accessibility, modularity, responsiveness, and theming in one small package. Perhaps this is one of the major reasons it is widely used by companies like Netflix, GE, Uber, and Boeing.

#### Installation for yarn and npm


```
` $ npm install grommet styled-components --save`
```

#### Implementation


```
"grommet-controls/chartjs": {
          "transform": "grommet-controls/es6/chartjs/${member}",
          "preventFullImport": true,
          "skipDefaultConversion": true
```

#### Advantages

  1. Create one toolkit as a packaged deal
  2. Take the open-door policy to the extreme
  3. Restructuring can help influence an established org



### 13\. Onsen UI

[Onsen UI][14] is another mobile app development framework that uses HTML5 and JavaScript and offers integration with Angular, Vue, and React. It is licensed under Apache 2.0.

Onsen offers tabs, a side menu, stack navigation, and other components. The best thing about the framework is that all of its components have iOS and Android Material Design support along with automatic styling, which changes the app's appearance depending on the platform.

#### Installation


```
`npm install onsenui`
```

#### Implementation


```
(function() {
    'use strict';
    var module = angular.module('app', ['onsen']);

    module.controller('AppController', function($scope) {
      // more to come here
    });

})();
```

#### Advantages

  1. Onsen UI is built on free and open-source code
  2. Doesn't force any type of DRM on apps developed with it
  3. Compiles JavaScript and HTML5 code
  4. Offers end users the native experience



* * *

What are your favorite React JavaScript frameworks? Please share them in the comments.

Learn more about React Native, a framework for building native apps using React and JavaScript.

Whether you are new to JavaScript or an experienced JavaScript developer, using libraries and...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/react-javascript-frameworks

作者：[Amit Dua][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/amitdua
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_javascript.jpg?itok=60evKmGl (Javascript code close-up with neon graphic overlay)
[2]: https://github.com/facebook/create-react-app
[3]: https://github.com/creativetimofficial/material-kit-react
[4]: https://github.com/DesignRevision/shards-react
[5]: https://github.com/styled-components/styled-components
[6]: https://github.com/reduxjs/redux
[7]: https://github.com/bvaughn/react-virtualized
[8]: https://github.com/react-dnd/react-dnd/
[9]: https://github.com/react-bootstrap/react-bootstrap
[10]: https://github.com/rsuite/rsuite
[11]: https://github.com/primefaces/primereact
[12]: https://github.com/ReactTraining/react-router
[13]: https://github.com/grommet/grommet
[14]: https://github.com/OnsenUI/OnsenUI
