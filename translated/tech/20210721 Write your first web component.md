[#]: subject: (Write your first web component)
[#]: via: (https://opensource.com/article/21/7/web-components)
[#]: author: (Ramakrishna Pattnaik https://opensource.com/users/rkpattnaik780)
[#]: collector: (lujun9972)
[#]: translator: (cool-summer-021)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

开发第一个 Web 组件
======
不要做重复的工作;
基于浏览器开发 Web App 时，需要制作一些可重用的模块。
![Digital creative of a browser on the internet][1]

Web 组件是一系列开源技术（例如 JavaScript 和 HTML），你可以用它创建一些 Web App 中可重用的自定义元素。你创建的组件是独立于其他代码的，所以这些组件可以方便地在多个项目中重用。

首先，它是一个平台标准，所有主流的浏览器都支持它。

### Web 组件中包含什么？

  * **定制元素:** 支持定义HTML元素的新类别。
  * **Shadow DOM:** 提供一种将一个隐藏的、独立的[文档对象模型][2] (DOM) 附加到一个元素的方法。它通过保留从页面的其他代码分离出来的样式、标记结构和行为特征对 Web 组件进行封装。它确保 Web 组件内样式不会被外部样式覆盖，反之亦然，Web 组件内样式也不会“泄露”到页面的其他部分。
  * **HTML 模板:** 支持定义可重用的 DOM 元素。可重用 DOM 元素和它的内容不会呈现在 DOM 内，但仍然可以通过 JavaScript 被引用。



### 开发你的第一个 Web 组件

你可以借助你最喜欢的文本编辑器和 JavaScript 写一个简单的 Web 组件。本指南使用引导程序生成简单的样式，并创建一个简易的卡片式的 Web 组件，给定了位置信息，该组件就能显示该位置的温度。组件使用了 [Open Weather API][3]，你需要先注册，然后创建 APPID/APIKey，才能正常使用。

调用该组件，需要给出位置的经度和纬度：


```
`<weather-card longitude='85.8245' latitude='20.296' />`
```

创建一个名为 **weather-card.js** 的文件，这个文件包含 Web 组件的所有代码。首先，需要定义你的组件，创建一个模板元素，并在其中加入一些简单的 HTML 标签：


```
const template = document.createElement('template');

template.innerHTML = `
  <div class="card">
    <div class="card-body"></div>
  </div>
`
```

定义 WebComponent 类及其构造函数：


```
class WeatherCard extends HTMLElement {
  constructor() {
    super();
    this._shadowRoot = this.attachShadow({ 'mode': 'open' });
    this._shadowRoot.appendChild(template.content.cloneNode(true));
  }
  ….
}
```

构造函数中，附加了 shadowRoot 属性，并将它设置为开启模式。然后这个模板就包含了 shadowRoot 属性。

接着，写获取属性的函数。对于经度和纬度，你需要向 Open Weather API 发送 GET 请求。这些功能需要在 `connectedCallback` 函数中完成。你可以使用 `getAttribute` 方法访问相应的属性，或定义读取属性的方法，把他们绑定到本对象中。


```
get longitude() {
  return this.getAttribute('longitude');
}

get latitude() {
  return this.getAttribute('latitude');
}
```

现在定义 `connectedCallBack` 方法，它的功能是在需要时获取天气数据：


```
connectedCallback() {
  var xmlHttp = new XMLHttpRequest();
  const url = `[http://api.openweathermap.org/data/2.5/weather?lat=${this.latitude}\&amp;lon=${this.longitude}\&amp;appid=API\\_KEY\\`][4]
  xmlHttp.open("GET", url, false);
  xmlHttp.send(null);
  this.$card = this._shadowRoot.querySelector('.card-body');
  let responseObj = JSON.parse(xmlHttp.responseText);
  let $townName = document.createElement('p');
  $townName.innerHTML = `Town: ${responseObj.name}`;
  this._shadowRoot.appendChild($townName);
  let $temperature = document.createElement('p');
  $temperature.innerHTML = `${parseInt(responseObj.main.temp - 273)} &amp;deg;C`
  this._shadowRoot.appendChild($temperature);
}
```

一旦获取到天气数据，附加的 HTML 元素就添加进了模板。至此，完成了类的定义。

最后，使用 `window.customElements.define` 方法定义并注册一个新的自定义元素：


```
`window.customElements.define('weather-card', WeatherCard);`
```

其中，第一个参数是自定义元素的名称，第二个参数是所定义的类。这里是[整个组件的链接][5]。

你的第一个 Web 组件的代码已完成！现在应该把它放入 DOM。为了把它放入 DOM，你需要在 HTML 文件（**index.html**）中载入指向 Web 组件的 JavaScript 脚本。


```
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
</head>

<body>
  <weather-card longitude='85.8245' latitude='20.296'/>
  <script src='./weather-card.js'></script>
</body>

</html>
```

这就是显示在浏览器中的 Web 组件：

![Web component displayed in a browser][6]

(Ramakrishna Pattnaik, [CC BY-SA 4.0][7])

由于 Web 组件中只包含 HTML、CSS 和 JavaScript，它们本来就是浏览器所支持的，并且可以无瑕疵地跟前端框架（例如 React 和 Vue）一同使用。下面这段简单的代码展现的是它跟一个由 [Create React App] 引导的一个简单的 React App 的整合方法。如果你需要，可以引入前面定义的 **weather-card.js**，把它作为一个组件使用：


```
import './App.css';
import './weather-card';

function App() {
  return (
  <weather-card longitude='85.8245' latitude='20.296'></weather-card>
  );
}

export default App;
```

### Web 组件的生命周期

一切组件都遵循从初始化到移除的生命周期法则。每个生命周期事件都有相应的方法，你可以借助这些方法令组件更好地工作。Web 组件的生命周期事件包括：

  * **Constructor:** Web 组件的构造函数在它被挂载前调用，意味着在元素附加到文档对象前被创建。它用于初始化本地状态、绑定事件处理器以及创建 Shadow DOM。在构造函数中，必须调用 `super()`，执行父类的构造函数。
  * **ConnectedCallBack:** 当一个元素被挂载（插入 DOM 树）时调用。该函数处理创建 DOM 节点的初始化过程中的相关事宜，大多数情况下用于类似于网络请求的操作。React 开发者可以将它与 `componentDidMount` 相关联。
  * **attributeChangedCallback:** 这个方法接收三个参数：`name`, `oldValue` 和 `newValue`。组件的任一属性发生变化，就会执行这个方法。属性由静态 `observedAttributes` 方法声明：
```
static get observedAttributes() {
  return ['name', '_id'];
} 
```
一旦属性名或 `_id` 改变，就会调用 `attributeChangedCallback` 方法。
  * **DisconnectedCallBack:**当一个元素从 DOM 树移除，会执行这个方法。它相当于 React 中的 `componentWillUnmount`。它可以用于释放不能由垃圾回收机制自动清除的资源，比如 DOM 事件的取消订阅、停用计时器或取消所有已注册的回调方法。
  * **AdoptedCallback:** 每次自定义元素移动到一个新文档时调用。只有在处理 IFrame 时会发生这种情况。



### 模块化开源

Web 组件对于开发 Web App 很有用。无论你是熟练使用 JavaScript 的老手，还是初学者，无论你的目标客户使用哪种浏览器，借助这种开源标准创建可重用的代码都是一件可以轻松完成的事。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/web-components

作者：[Ramakrishna Pattnaik][a]
选题：[lujun9972][b]
译者：[cool-summer-021](https://github.com/cool-summer-021)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rkpattnaik780
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_web_internet_website.png?itok=g5B_Bw62 (Digital creative of a browser on the internet)
[2]: https://en.wikipedia.org/wiki/Document_Object_Model
[3]: https://openweathermap.org/api
[4]: http://api.openweathermap.org/data/2.5/weather?lat=${this.latitude}\&lon=${this.longitude}\&appid=API\_KEY\`
[5]: https://gist.github.com/rkpattnaik780/acc683d3796102c26c1abb03369e31f8
[6]: https://opensource.com/sites/default/files/uploads/webcomponent.png (Web component displayed in a browser)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://create-react-app.dev/docs/getting-started/
