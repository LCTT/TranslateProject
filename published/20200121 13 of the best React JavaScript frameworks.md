[#]: collector: (lujun9972)
[#]: translator: (zpl1025)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13796-1.html)
[#]: subject: (13 of the best React JavaScript frameworks)
[#]: via: (https://opensource.com/article/20/1/react-javascript-frameworks)
[#]: author: (Amit Dua https://opensource.com/users/amitdua)

13 个最好的 React JavaScript 框架
======

> 如果你正在用 React.js 或 React Native 来开发用户界面的话，试试这些框架。

![](https://img.linux.net.cn/data/attachment/album/202109/18/095748k48eskmjpzuhyzuj.jpg)

React.js 和 React Native 都是用来开发用户界面（UI）的很受欢迎的开源平台。在 StackOverflow 2019 年度开发者调查里，两个框架的可取性和使用情况都排名靠前。React.js 是 Facebook 在 2011 年开发的一个 JavaScript 库，来实现跨平台，动态以及高性能的 UI 设计需求；而 React Native 则是 Facebook 在 2015 年发布的框架，目的是使用 JavaScript 构建原生应用。

下面介绍 13 个最好的 React JavaScript 框架，都是开源项目。前 11 个（和 React 一样）都使用 MIT 许可证授权，后面两个使用 Apache 2.0 许可证。

### 1、Create React App

这个 Facebook 开发的命令行工具是 React Native 项目一定要用的。因为 [Create React App][2] 使用很简单，还可以避免你自己手动设定和配置应用，因此能节省大量的时间和精力。仅仅使用给一个简单的命令，就可以为你准备好创建 React 原生项目所需的一切。你可以用它来创建分类和文件，而且该框架还自带了工具用来构建，测试和启动应用。

```
# 安装软件包
$ npm install -g create-react-native-web-app
 
# 运行 create-react-native-web-app <项目目录>
$ create-react-native-web-app myApp
 
# 切换到创建的 <项目目录>
$ cd myApp
 
# 运行 Web/Ios/Android 调试
# Web
$ npm run web
 
# IOS（模拟）
$ npm run ios
 
# Android（实际连接的设备）
$ npm run android
```

#### 为什么选择 Create React App

  1. 使用配置包、转码器，以及测试运行器进行开发的一流工具
  2. 在应用架构里不需要配置以及没有额外文件
  3. 确定的开发栈
  4. 高效快速的开发工具

### 2、Material Kit React

[Material Kit React][3] 是受谷歌的 Material Design 系统启发开发的，很适合用来创建 React UI 组件。这个库最大的优点是提供了大量的组件，可以互相搭配做出非常好的效果。有超过一千个完全编码的组件，每一个都有用文件夹组织起来的独立层。这样你就可以有上千个选项可以选择。它同时也包含一些示例页面，方便你从中寻找灵感，或者向别人分享你的点子或创意。

#### 安装 Material Kit

```
$ npm install @material-ui/core
```

#### 使用

```
import React from 'react';
import Button from '@material-ui/core/Button';

const App = () => (
  <Button variant="contained" color="primary">
    Hello World
  </Button>
);
```

Material-UI 组件不需要其他额外设置，也不会干扰全局变量空间。

#### 优点

这个 React 组件支持简易快速的网页开发。你可以用它创建自己的设计系统，或者直接开始 Material Design。

### 3、Shards React

这个现代的 React UI 工具为了追求高效率，是从最底层开始构建的。它拥有现代的设计系统，可以让你按自己的想法任意定制。你甚至可以下载源文件，然后从代码级别定制。另外，它用来设计样式的 SCSS 语法提高了开发体验。

[Shards React][4] 基于 Shards，使用了 React Datepicker、React Popper（一个定位引擎）和 noUISlider。还带有非常优秀的 Material Design 图标。还有很多设计好的版本，可以帮你寻找灵感或上手。

#### 用 Yarn 或 NPM 安装 Shards

```
# Yarn
yarn add shards-react

# NPM
npm i shards-react
```

#### 优点

  1. Shards 是一个轻量级的脚本，压缩后大概 13kb
  2. Shards 默认支持响应式，图层可以适配任意大小屏幕
  3. Shards 有完整的文档，可以快速开始构建漂亮的界面

### 4、Styled Components

这个高效的 CSS 工具可以用来为应用的可视界面创建小型可重用的组件。使用传统的 CSS，你可能会不小心覆盖掉网站其他位置的选择器，但 [Styled Components][5] 通过使用直接内嵌到组件里的 CSS 语法，可以完全避免这个问题。

#### 安装

```
npm install --save styled-components
```

#### 使用

```
const Button = styled.button`
  background: background_type;
  border-radius: radius_value;
  border: abc;
  color: name_of_color;
  Margin: margin_value;
  padding: value`;
```

#### 优点

  1. 让组件有更好的可读性
  2. 组件样式依赖 JavaScript
  3. 创建定制 CSS 组件
  4. 内嵌样式
  5. 简单地调用 `styled()` 可以将组件甚至是自定义组件转换成样式组件

### 5、Redux

[Redux][6] 是一个为 JavaScript 应用提供状态管理的方案。常用于 React.js，也可以用在其他类 React 框架里。

#### 安装

```
sudo npm install redux
sudo npm install react-redux
```

#### 使用

```
import { createStore } from "redux";
import rotateReducer from "reducers/rotateReducer";

function configureStore(state = { rotating: value}) {
  return createStore(rotateReducer,state);
}

export default configureStore;
```

#### 优点

  1. 可预计的状态更新有助于定义应用里的数据流
  2. 逻辑上测试更简单，使用 reducer 函数进行时间旅行调试也更容易
  3. 统一管理状态

### 6、React Virtualized

这个 React Native JavaScript 框架帮助渲染 large-list 和 tabular-data。使用 [React Virtualized][7]，你可以限制请求和文档对象模型（DOM）元素的数量，从而提高 React 应用的性能。

#### 安装

```
npm install react-virtualized
```

#### 使用

```
import 'react-virtualized/styles.css'
import { Column, Table } from 'react-virtualized'
import AutoSizer from 'react-virtualized/dist/commonjs/AutoSizer'
import List from 'react-virtualized/dist/commonjs/List'
{
  alias: {
    'react-virtualized/List': 'react-virtualized/dist/es/List',
  },
  ...等等
}
```

#### 优点

  1. 高效展示大量数据
  2. 渲染超大数据集
  3. 使用一系列组件实现虚拟渲染

### 7、React DnD

[React DnD][8] 用来创建复杂的拖放界面。拖放控件库有很多，选用 React DnD 是因为它是基于 HTML5 的拖放 API 的，创建界面更简单。

#### 安装

```
npm install react-dnd-preview
```

#### 使用

```
import Preview from 'react-dnd-preview';
 
const generatePreview = ({itemType, item, style}) => {
  return <div class="item-list" style={style}>{itemType}</div>;
};

class App extends React.Component {
 ...
  render() {
    return (
      <DndProvider backend={MyBackend}>
        <ItemList />
        <Preview generator={generatePreview} />
        // or
        <Preview>{generatePreview}</Preview>
      </DndProvider>
    );
  }
}
```

#### 优点

  1. 漂亮自然的控件移动
  2. 强大的键盘和屏幕阅读支持
  3. 极限性能
  4. 强大整洁的接口
  5. 标准浏览器支持非常好
  6. 中性样式
  7. 没有额外创建 DOM 节点

### 8、React Bootstrap

这个 UI 库将 Bootstrap 的 JavaScript 替换成了 React，可以更好地控制每个组件的功能。每个组件都构建成能轻易访问，因此 [React Bootstrap][9] 有利于构建前端框架。有上千种 bootstrap 主题可以选择。

#### 安装

```
npm install react-bootstrap bootstrap
```

#### 使用

```
import 'bootstrap/dist/css/bootstrap.min.css';
import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import registerServiceWorker from './registerServiceWorker';

ReactDOM.render(<App />, document.getElementById('root'));
registerServiceWorker();
```

#### 优点

  1. 可以简单导入所需的代码/组件
  2. 通过压缩 Bootstrap 节省了输入和问题
  3. 通过压缩 Bootstrap 减少了输入工作和冲突
  4. 使用简单
  5. 使用元素封装

### 9、React Suite

[React Suite][10] 是另一个高效的 React.js 框架，包含了大量组件库，方便开发企业级产品。支持所有主流浏览器和平台，适用于任何系统。还支持服务器端渲染。

#### 安装

```
npm i rsuite --save
```

#### 使用

```
import { Button } from 'rsuite';
import 'rsuite/styles/less/index.less';
ReactDOM.render(<Button>Button</Button>, mountNode);
```

#### 优点

  1. 通过全局访问特性轻松管理应用
  2. 使用 Redux 库集中管理系统状态
  3. Redux 库有灵活的 UI 层，以及广泛的生态
  4. Redux 库减少系统复杂度，并提供了全局访问特性

### 10、PrimeReact

[PrimeReact][11] 最值得推荐的是它提供了几乎覆盖所有基本 UI 需求的组件，比如输入选项，菜单，数据展示，消息，等等。这个框架还优化了移动体验，帮助你设计触摸优化的元素。

#### 安装

```
npm install primereact --save
npm install primeicons --save
```

#### 使用

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

#### 优点

  1. 简单而高效
  2. 容易使用
  3. Spring 应用
  4. 创建复杂用户界面
  5. 好用而简单

### 11、React Router

[React Router][12] 在 React Native 开发社区很受欢迎，因为它上手很容易。只需要你在电脑上安装 Git 和 npm 包管理工具，有 React 的基础知识，以及好学的意愿。没什么特别难的地方。

#### 安装

```
$ npm install --save react-router
```

#### 使用

```
import { Router, Route, Switch } from "react-router";
 
// 使用 CommonJS 模块
var Router = require("react-router").Router;
var Route = require("react-router").Route;
var Switch = require("react-router").Switch;
```

#### 优点

  1. 动态路由匹配
  2. 在导航时支持不同页面的 CSS 切换
  3. 统一的应用结构和行为

### 12、Grommet

[Grommet][13] 常用于开发响应式、可访问的移动网页应用。这个用 Apache 2.0 许可证授权的 JavaScript 框架最大的优点是用很小的包提供了可访问性、模块化、响应式以及主题功能。这可能是它被一些公司广泛使用的主要原因，比如奈飞、通用电气、优步以及波音。

#### 安装 for yarn and npm

```
$ npm install grommet styled-components --save
```

#### 使用

```
"grommet-controls/chartjs": {
          "transform": "grommet-controls/es6/chartjs/${member}",
          "preventFullImport": true,
          "skipDefaultConversion": true
```

#### 优点

  1. 创建一个工具包来打包
  2. 把开放政策发挥到极致
  3. 重构有助于影响已成立的组织

### 13、Onsen UI

[Onsen UI][14] 另一个使用 HTML5 和 JavaScript 的手机应用开发框架，集成了 Angular、Vue 和 React，使用 Apache 2.0 许可证授权。

Onsen 提供了标签、侧边栏、堆栈导航以及其他组件。这个框架最好的地方是，它所有的组件都支持 iOS 和安卓 Material Design 自动适配，会根据不同的平台切换应用的外观。

#### 安装

```
npm install onsenui
```

#### 使用

```
(function() {
    'use strict';
    var module = angular.module('app', ['onsen']);

    module.controller('AppController', function($scope) {
      // more to come here
    });

})();
```

#### 优点

  1. Onsen UI 基于自由而开源代码
  2. 不强制基于它开发的应用使用任何形式的 DRM
  3. 内置了 JavaScript 和 HTML5 代码
  4. 给最终用户带来原生体验

* * *

你最喜欢哪个 React JavaScript 框架？请在评论区分享。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/react-javascript-frameworks

作者：[Amit Dua][a]
选题：[lujun9972][b]
译者：[zpl1025](https://github.com/zpl1025)
校对：[wxy](https://github.com/wxy)

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
