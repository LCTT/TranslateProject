坚实的 React 基础：初学者指南
============

![](https://cdn-images-1.medium.com/max/1000/1*wj5ujzj5wPQIKb0mIWLgNQ.png)

*React.js crash course*

在过去的几个月里，我一直在使用 React 和 React-Native。我已经发布了两个作为产品的应用， [Kiven Aa][1]（React）和 [Pollen Chat][2]（React Native）。当我开始学习 React 时，我找了一些不仅仅是教我如何用 React 写应用的东西（一个博客，一个视频，一个课程，等等），我也想让它帮我做好面试准备。

我发现的大部分资料都集中在某一单一方面上。所以，这篇文章针对的是那些希望理论与实践完美结合的观众。我会告诉你一些理论，以便你了解幕后发生的事情，然后我会向你展示如何编写一些 React.js 代码。

如果你更喜欢视频形式，我在 [YouTube][https://youtu.be/WJ6PgzI16I4] 上传了整个课程，请去看看。

让我们开始......

> React.js 是一个用于构建用户界面的 JavaScript 库

你可以构建各种单页应用程序。例如，你希望在用户界面上实时显示变化的聊天软件和电子商务门户。

### 一切都是组件

React 应用由组件组成，数量繁多且互相嵌套。你或许会问：”可什么是组件呢？“

组件是可重用的代码段，它定义了某些功能在 UI 上的外观和行为。 比如，按钮就是一个组件。

让我们看看下面的计算器，当你尝试计算 2 + 2 = 4 -1 = 3（简单的数学题）时，你会在 Google 上看到这个计算器。

![](https://cdn-images-1.medium.com/max/1000/1*NS9DykYDyYG7__UXJdysTA.png)

*红色标记表示组件*

如上图所示，这个计算器有很多区域，比如展示窗口和数字键盘。所有这些都可以是许多单独的组件或一个巨大的组件。这取决于在 React 中分解和抽象出事物的程度。你为所有这些组件分别编写代码，然后合并这些组件到一个容器中，而这个容器又是一个 React 组件。这样你就可以创建可重用的组件，最终的应用将是一组协同工作的单独组件。

以下是一个你践行了以上原则并可以用 React 编写计算器的方法。

```
<Calculator>
  <DisplayWindow />
  <NumPad>
    <Key number={1}/>
    <Key number={2}/>
    .
    .
    .
    <Key number={9}/>
  </NumPad>
</Calculator>
```

没错！它看起来像HTML代码，然而并不是。我们将在后面的部分中详细探讨它。

### 设置我们的 Playground

这篇教程专注于 React 的基础部分。它没有偏向 Web 或 React Native（开发移动应用）。所以，我们会用一个在线编辑器，这样可以在学习 React 能做什么之前避免 web 或 native 的具体配置。

我已经为读者在 [codepen.io][4] 设置好了开发环境。只需点开[该链接][4]并且阅读 HTML 和 JavaScript 中的所有注释。

### 控制组件

我们已经了解到 React 应用是各种组件的集合，结构为嵌套树。因此，我们需要某种机制来将数据从一个组件传递到另一个组件。

#### 进入 “props”

我们可以使用 `props` 对象将任意数据传递给我们的组件。 React 中的每个组件都会获取 `props` 对象。在学习如何使用 `props` 之前，让我们学习函数式组件。 

#### a) 函数式组件

在 React 中，一个函数式组件通过 `props` 对象使用你传递给它的任意数据。它返回一个对象，该对象描述了 React 应渲染的 UI。函数式组件也称为无状态组件。

让我们编写第一个函数式组件。

```
function Hello(props) {
  return <div>{props.name}</div>
}
```

就这么简单。我们只是将 `props` 作为参数传递给了一个普通的 JavaScript 函数并且有返回值。嗯？返回了什么？那个 `<div>{props.name}</div>`。它是 JSX（JavaScript Extended）。我们将在后面的部分中详细了解它。

上面这个函数将在浏览器中渲染出以下 HTML。

```
<!-- If the "props" object is: {name: 'rajat'} -->
<div>
  rajat
</div>
```


> 阅读以下有关 JSX 的部分，这一部分解释了如何从我们的 JSX 代码中得到这段 HTML 。

如何在 React 应用中使用这个函数式组件？ 很高兴你问了！ 它就像下面这么简单。

```
<Hello name='rajat' age={26}/>
```

属性 `name` 在上面的代码中变成了 `Hello` 组件里的 `props.name` ，属性 `age` 变成了 `props.age` 。

> 记住！ 你可以将一个 React 组件嵌套在其他 React 组件中。

让我们在 codepen playground 使用 `Hello` 组件。用我们的 `Hello` 组件替换 `ReactDOM.render()` 中的 `div`，并在底部窗口中查看更改。

```
function Hello(props) {
  return <div>{props.name}</div>
}

ReactDOM.render(<Hello name="rajat"/>, document.getElementById('root'));
```


> 但是如果你的组件有一些内部状态怎么办？例如，像下面的计数器组件一样，它有一个内部计数变量，它在 `+` 和 `-` 键按下时发生变化。

![](https://media.giphy.com/media/3ohs4xEtqjJIs4FJ9C/giphy.gif)

*具有内部状态的 React 组件*

#### b) 基于类的组件

基于类的组件有一个额外属性 `state` ，你可以用它存放组件的私有数据。我们可以用 `class` 表示法重写我们的 `Hello` 。由于这些组件具有状态，因此这些组件也称为有状态组件。

```
class Counter extends React.Component {
  // this method should be present in your component
  render() {
    return (
      <div>
        {this.props.name}
      </div>
    );
  }
}
```

我们继承了 React 库的 `React.Component` 类以在 React 中创建基于类的组件。在[这里][5]了解更多有关 JavaScript 类的东西。

`render()` 方法必须存在于你的类中，因为 React 会查找此方法，用以了解它应在屏幕上渲染的 UI。为了使用这种内部状态，我们首先要在组件

要使用这种内部状态，我们首先必须按以下方式初始化组件类的构造函数中的状态对象。

```
class Counter extends React.Component {
  constructor() {
    super();
    
    // define the internal state of the component
    this.state = {name: 'rajat'}
  }
  
  render() {
    return (
      <div>
        {this.state.name}
      </div>
    );
  }
}

// Usage:
// In your react app: <Counter />
```

类似地，可以使用 `this.props` 对象在我们基于类的组件内访问 `props`。

要设置 `state`，请使用 `React.Component` 的 `setState()`。 在本教程的最后一部分中，我们将看到一个这样的例子。

> 提示：永远不要在 `render()` 函数中调用 `setState()`，因为 `setState` 会导致组件重新渲染，这将导致无限循环。

![](https://cdn-images-1.medium.com/max/1000/1*rPUhERO1Bnr5XdyzEwNOwg.png)

*基于类的组件具有可选属性 “state”。*

除了 `state` 以外，基于类的组件有一些声明周期方法比如 `componentWillMount()`。你可以利用这些去做初始化 `state`这样的事， 可是那将超出这篇文章的范畴。

### JSX

JSX 是 JavaScript Extended 的缩写，它是一种编写 React 组件的方法。使用 JSX，你可以在类 XML 标签中获得 JavaScript 的全部力量。

你把 JavaScript 表达式放在 `{}` 里。下面是一些有效的 JSX 例子。

 ```
 <button disabled={true}>Press me!</button>
 <button disabled={true}>Press me {3+1} times!</button>;
 <div className='container'><Hello /></div>
 ```

它的工作方式是你编写 JSX 来描述你的 UI 应该是什么样子。像 Babel 这样的转码器将这些代码转换为一堆 `React.createElement()` 调用。然后，React 库使用这些 `React.createElement()` 调用来构造 DOM 元素的树状结构。对于 React 的网页视图或 React Native 的 Native 视图，它将保存在内存中。

React 接着会计算它如何在展示给用户的 UI 的内存中有效地模仿这个树。此过程称为 [reconciliation][7]。完成计算后，React 会对屏幕上的真正 UI 进行更改。

![](https://cdn-images-1.medium.com/max/1000/1*ighKXxBnnSdDlaOr5-ZOPg.png)

*React 如何将你的 JSX 转化为描述应用 UI 的树。*

你可以使用 [Babel 的在线 REPL][8] 查看当你写一些 JSX 的时候，React 的真正输出。

![](https://cdn-images-1.medium.com/max/1000/1*NRuBKgzNh1nHwXn0JKHafg.png)

*使用Babel REPL 转换 JSX 为普通 JavaScript*

> 由于 JSX 只是 `React.createElement()` 调用的语法糖，因此可以在没有 JSX 的情况下使用 React。

现在我们了解了所有的概念，所以我们已经准备好编写我们之前看到之前的 GIF 图中的计数器组件。

代码如下，我希望你已经知道了如何在我们的 playground 上渲染它。

```
class Counter extends React.Component {
  constructor(props) {
    super(props);
    
    this.state = {count: this.props.start || 0}
    
    // the following bindings are necessary to make `this` work in the callback
    this.inc = this.inc.bind(this);
    this.dec = this.dec.bind(this);
  }
  
  inc() {
    this.setState({
      count: this.state.count + 1
    });
  }
  
  dec() {
    this.setState({
      count: this.state.count - 1
    });
  }
  
  render() {
    return (
      <div>
        <button onClick={this.inc}>+</button>
        <button onClick={this.dec}>-</button>
        <div>{this.state.count}</div>
      </div>
    );
  }
}
```

以下是关于上述代码的一些重点。

1.  JSX 使用 `驼峰命名` ，所以 `button` 的 属性是 `onClick`，不是我们在HTML中用的 `onclick`。
2.  绑定 `this` 是必要的，以便在回调时工作。 请参阅上面代码中的第8行和第9行。

最终的交互式代码位于[此处][9]。

有了这个，我们已经到了 React 速成课程的结束。我希望我已经阐明了 React 如何工作，以及如何使用 React 来构建更大的应用程序，使用更小和可重用的组件。

--------------------------------------------------------------------------------

via: https://medium.freecodecamp.org/rock-solid-react-js-foundations-a-beginners-guide-c45c93f5a923

作者：[Rajat Saxena][a]
译者：[GraveAccent](https://github.com/GraveAccent)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.freecodecamp.org/@rajat1saxena
[1]:https://kivenaa.com/
[2]:https://play.google.com/store/apps/details?id=com.pollenchat.android
[3]:https://facebook.github.io/react-native/
[4]:https://codepen.io/raynesax/pen/MrNmBM
[5]:https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes
[6]:https://en.wikipedia.org/wiki/Source-to-source_compiler
[7]:https://reactjs.org/docs/reconciliation.html
[8]:https://babeljs.io/repl
[9]:https://codepen.io/raynesax/pen/QaROqK
[10]:https://twitter.com/rajat1saxena
[11]:mailto:rajat@raynstudios.com
[12]:https://www.youtube.com/channel/UCUmQhjjF9bsIaVDJUHSIIKw
