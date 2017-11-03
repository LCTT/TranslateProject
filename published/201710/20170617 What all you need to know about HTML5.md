关于 HTML5 你需要了解的基础知识
============================================================

![](https://i0.wp.com/opensourceforu.com/wp-content/uploads/2017/05/handwritten-html5-peter-booth-e-plus-getty-images-56a6faec5f9b58b7d0e5d1cf.jpg?resize=700%2C467) 

> HTML5 是第五个且是当前的 HTML 版本，它是用于在万维网上构建和呈现内容的标记语言。本文将帮助读者了解它。

HTML5 通过 W3C 和<ruby>Web 超文本应用技术工作组<rt>Web Hypertext Application Technology Working Group</rt></ruby>之间的合作发展起来。它是一个更高版本的 HTML，它的许多新元素可以使你的页面更加语义化和动态。它是为所有人提供更好的 Web 体验而开发的。HTML5 提供了很多的功能，使 Web 更加动态和交互。

HTML5 的新功能是：

*   新标签，如 `<header>` 和 `<section>`
*   用于 2D 绘图的 `<canvas>` 元素
*   本地存储
*   新的表单控件，如日历、日期和时间
*   新媒体功能
*   地理位置

HTML5 还不是正式标准（LCTT 译注：HTML5 已于 2014 年成为“推荐标准”），因此，并不是所有的浏览器都支持它或其中一些功能。开发 HTML5 背后最重要的原因之一是防止用户下载并安装像 Silverlight 和 Flash 这样的多个插件。

**新标签和元素**

- **语义化元素：** 图 1 展示了一些有用的语义化元素。
- **表单元素：** HTML5 中的表单元素如图 2 所示。
- **图形元素：** HTML5 中的图形元素如图 3 所示。
- **媒体元素：** HTML5 中的新媒体元素如图 4 所示。


[![](https://i0.wp.com/opensourceforu.com/wp-content/uploads/2017/05/Figure-1-7.jpg?resize=350%2C277)][3] 

*图 1：语义化元素*

[![](https://i1.wp.com/opensourceforu.com/wp-content/uploads/2017/05/Figure-2-5.jpg?resize=350%2C108)][4] 

*图 2：表单元素*

[![](https://i0.wp.com/opensourceforu.com/wp-content/uploads/2017/05/Figure-3-2.jpg?resize=350%2C72)][5] 

*图 3：图形元素*

[![](https://i0.wp.com/opensourceforu.com/wp-content/uploads/2017/05/Figure-4-2.jpg?resize=350%2C144)][6] 

*图 4：媒体元素*

### HTML5 的高级功能

#### 地理位置

这是一个 HTML5 API，用于获取网站用户的地理位置，用户必须首先允许网站获取他或她的位置。这通常通过按钮和/或浏览器弹出窗口来实现。所有最新版本的 Chrome、Firefox、IE、Safari 和 Opera 都可以使用 HTML5 的地理位置功能。

地理位置的一些用途是：

*   公共交通网站
*   出租车及其他运输网站
*   电子商务网站计算运费
*   旅行社网站
*   房地产网站
*   在附近播放的电影的电影院网站
*   在线游戏
*   网站首页提供本地标题和天气
*   工作职位可以自动计算通勤时间

**工作原理：** 地理位置通过扫描位置信息的常见源进行工作，其中包括以下：

*   全球定位系统（GPS）是最准确的
*   网络信号 - IP地址、RFID、Wi-Fi 和蓝牙 MAC地址
*   GSM/CDMA 蜂窝 ID
*   用户输入

该 API 提供了非常方便的函数来检测浏览器中的地理位置支持：

```
if (navigator.geolocation) {
// do stuff
}
```
`getCurrentPosition` API 是使用地理位置的主要方法。它检索用户设备的当前地理位置。该位置被描述为一组地理坐标以及航向和速度。位置信息作为位置对象返回。

语法是：

```
getCurrentPosition(showLocation, ErrorHandler, options);
``` 

*   `showLocation`：定义了检索位置信息的回调方法。
*   `ErrorHandler`（可选）：定义了在处理异步调用时发生错误时调用的回调方法。
*   `options` （可选）： 定义了一组用于检索位置信息的选项。

我们可以通过两种方式向用户提供位置信息：测地和民用。

1. 描述位置的测地方式直接指向纬度和经度。
2. 位置信息的民用表示法是人类可读的且容易理解。

如下表 1 所示，每个属性/参数都具有测地和民用表示。

 [![](https://i0.wp.com/opensourceforu.com/wp-content/uploads/2017/05/table-1.jpg?resize=350%2C132)][7] 

图 5 包含了一个位置对象返回的属性集。

[![](https://i0.wp.com/opensourceforu.com/wp-content/uploads/2017/05/Figure5-1.jpg?resize=350%2C202)][8] 

*图5：位置对象属性*

#### 网络存储

在 HTML 中，为了在本机存储用户数据，我们需要使用 JavaScript cookie。为了避免这种情况，HTML5 已经引入了 Web 存储，网站利用它在本机上存储用户数据。

与 Cookie 相比，Web 存储的优点是：

*   更安全
*   更快
*   存储更多的数据
*   存储的数据不会随每个服务器请求一起发送。只有在被要求时才包括在内。这是 HTML5 Web 存储超过 Cookie 的一大优势。

有两种类型的 Web 存储对象：

1. 本地 - 存储没有到期日期的数据。
2. 会话 - 仅存储一个会话的数据。

**如何工作：** `localStorage` 和 `sessionStorage` 对象创建一个 `key=value` 对。比如： `key="Name"`，`   value="Palak"`。

这些存储为字符串，但如果需要，可以使用 JavaScript 函数（如  `parseInt()` 和 `parseFloat()`）进行转换。

下面给出了使用 Web 存储对象的语法：

- 存储一个值：
	- `localStorage.setItem("key1", "value1");`
	- `localStorage["key1"] = "value1";`
- 得到一个值：
	- `alert(localStorage.getItem("key1"));`
	- `alert(localStorage["key1"]);`
- 删除一个值：
	-`removeItem("key1");`
- 删除所有值：
	- `localStorage.clear();`
 
#### 应用缓存（AppCache）

使用 HTML5 AppCache，我们可以使 Web 应用程序在没有 Internet 连接的情况下脱机工作。除 IE 之外，所有浏览器都可以使用 AppCache（截止至此时）。

应用缓存的优点是：

*   网页浏览可以脱机
*   页面加载速度更快
*   服务器负载更小

`cache manifest` 是一个简单的文本文件，其中列出了浏览器应缓存的资源以进行脱机访问。 `manifest` 属性可以包含在文档的 HTML 标签中，如下所示：

```
<html manifest="test.appcache"> 
... 
</html>
```

它应该在你要缓存的所有页面上。

缓存的应用程序页面将一直保留，除非：

1. 用户清除它们
2. `manifest` 被修改
3. 缓存更新

#### 视频

在 HTML5 发布之前，没有统一的标准来显示网页上的视频。大多数视频都是通过 Flash 等不同的插件显示的。但 HTML5 规定了使用 video 元素在网页上显示视频的标准方式。

目前，video 元素支持三种视频格式，如表 2 所示。

 [![](https://i0.wp.com/opensourceforu.com/wp-content/uploads/2017/05/table-2.jpg?resize=350%2C115)][9] 

下面的例子展示了 video 元素的使用：

```
<! DOCTYPE HTML>
<html>
<body>

<video src=" vdeo.ogg" width="320" height="240" controls="controls">

This browser does not support the video element.

</video>

</body>
</html>
```

例子使用了 Ogg 文件，并且可以在 Firefox、Opera 和 Chrome 中使用。要使视频在 Safari 和未来版本的 Chrome 中工作，我们必须添加一个 MPEG4 和 WebM 文件。

`video` 元素允许多个 `source` 元素。`source` 元素可以链接到不同的视频文件。浏览器将使用第一个识别的格式，如下所示：

```
<video width="320" height="240" controls="controls">
<source src="vdeo.ogg" type="video/ogg" />
<source src=" vdeo.mp4" type="video/mp4" />
<source src=" vdeo.webm" type="video/webm" />
This browser does not support the video element.
</video>
```

[![](https://i0.wp.com/opensourceforu.com/wp-content/uploads/2017/05/Figure6-1.jpg?resize=350%2C253)][10] 

*图6：Canvas 的输出*

#### 音频

对于音频，情况类似于视频。在 HTML5 发布之前，在网页上播放音频没有统一的标准。大多数音频也通过 Flash 等不同的插件播放。但 HTML5 规定了通过使用音频元素在网页上播放音频的标准方式。音频元素用于播放声音文件和音频流。

目前，HTML5 `audio` 元素支持三种音频格式，如表 3 所示。

 [![](https://i1.wp.com/opensourceforu.com/wp-content/uploads/2017/05/table-3.jpg?resize=350%2C123)][11] 

`audio` 元素的使用如下所示：

```
<! DOCTYPE HTML>
<html>
<body>

<audio src=" song.ogg" controls="controls">

This browser does not support the audio element.

</video>

</body>
</html>
```

此例使用 Ogg 文件，并且可以在 Firefox、Opera 和 Chrome 中使用。要在 Safari 和 Chrome 的未来版本中使 audio 工作，我们必须添加一个 MP3 和 Wav 文件。

`audio` 元素允许多个 `source` 元素，它可以链接到不同的音频文件。浏览器将使用第一个识别的格式，如下所示：

```
<audio controls="controls">
<source src="song.ogg" type="audio/ogg" />
<source src="song.mp3" type="audio/mpeg" />

This browser does not support the audio element.

</audio>
```

#### 画布（Canvas）

要在网页上创建图形，HTML5 使用 画布 API。我们可以用它绘制任何东西，并且它使用 JavaScript。它通过避免从网络下载图像而提高网站性能。使用画布，我们可以绘制形状和线条、弧线和文本、渐变和图案。此外，画布可以让我们操作图像中甚至视频中的像素。你可以将 `canvas` 元素添加到 HTML 页面，如下所示：

```
<canvas id="myCanvas" width="200" height="100"></canvas>
```

画布元素不具有绘制元素的功能。我们可以通过使用 JavaScript 来实现绘制。所有绘画应在 JavaScript 中。

```
<script type="text/javascript">
var c=document.getElementById("myCanvas");
var cxt=c.getContext("2d");
cxt.fillStyle="blue";
cxt.storkeStyle = "red";
cxt.fillRect(10,10,100,100);
cxt.storkeRect(10,10,100,100);
</script>
```

以上脚本的输出如图 6 所示。

你可以绘制许多对象，如弧、圆、线/垂直梯度等。

### HTML5 工具

为了有效操作，所有熟练的或业余的 Web 开发人员/设计人员都应该使用 HTML5 工具，当需要设置工作流/网站或执行重复任务时，这些工具非常有帮助。它们提高了网页设计的可用性。

以下是一些帮助创建很棒的网站的必要工具。

- **HTML5 Maker：**  用来在 HTML、JavaScript 和 CSS 的帮助下与网站内容交互。非常容易使用。它还允许我们开发幻灯片、滑块、HTML5 动画等。
- **Liveweave：** 用来测试代码。它减少了保存代码并将其加载到屏幕上所花费的时间。在编辑器中粘贴代码即可得到结果。它非常易于使用，并为一些代码提供自动完成功能，这使得开发和测试更快更容易。
- **Font dragr：**  在浏览器中预览定制的 Web 字体。它会直接载入该字体，以便你可以知道看起来是否正确。也提供了拖放界面，允许你拖动字形、Web 开放字体和矢量图形来马上测试。
- **HTML5 Please：**  可以让我们找到与 HTML5 相关的任何内容。如果你想知道如何使用任何一个功能，你可以在 HTML Please 中搜索。它提供了支持的浏览器和设备的有用资源的列表，语法，以及如何使用元素的一般建议等。
- **Modernizr：** 这是一个开源工具，用于给访问者浏览器提供最佳体验。使用此工具，你可以检测访问者的浏览器是否支持 HTML5 功能，并加载相应的脚本。
- **Adobe Edge Animate：**  这是必须处理交互式 HTML 动画的 HTML5 开发人员的有用工具。它用于数字出版、网络和广告领域。此工具允许用户创建无瑕疵的动画，可以跨多个设备运行。
- **Video.js：**  这是一款基于 JavaScript 的 HTML5 视频播放器。如果要将视频添加到你的网站，你应该使用此工具。它使视频看起来不错，并且是网站的一部分。
- **The W3 Validator：**  W3 验证工具测试 HTML、XHTML、SMIL、MathML 等中的网站标记的有效性。要测试任何网站的标记有效性，你必须选择文档类型为 HTML5 并输入你网页的 URL。这样做之后，你的代码将被检查，并将提供所有错误和警告。
- **HTML5 Reset：**  此工具允许开发人员在 HTML5 中重写旧网站的代码。你可以使用这些工具为你网站的访问者提供一个良好的网络体验。

--------------------------------------------------------------------------------

Palak Shah

作者是高级软件工程师。她喜欢探索新技术，学习创新概念。她也喜欢哲学。你可以通过 palak311@gmail.com 联系她。

--------------------
via: http://opensourceforu.com/2017/06/introduction-to-html5/

作者：[Palak Shah][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://opensourceforu.com/author/palak-shah/
[1]:http://opensourceforu.com/2017/06/introduction-to-html5/#disqus_thread
[2]:http://opensourceforu.com/author/palak-shah/
[3]:http://opensourceforu.com/wp-content/uploads/2017/05/Figure-1-7.jpg
[4]:http://opensourceforu.com/wp-content/uploads/2017/05/Figure-2-5.jpg
[5]:http://opensourceforu.com/wp-content/uploads/2017/05/Figure-3-2.jpg
[6]:http://opensourceforu.com/wp-content/uploads/2017/05/Figure-4-2.jpg
[7]:http://opensourceforu.com/wp-content/uploads/2017/05/table-1.jpg
[8]:http://opensourceforu.com/wp-content/uploads/2017/05/Figure5-1.jpg
[9]:http://opensourceforu.com/wp-content/uploads/2017/05/table-2.jpg
[10]:http://opensourceforu.com/wp-content/uploads/2017/05/Figure6-1.jpg
[11]:http://opensourceforu.com/wp-content/uploads/2017/05/table-3.jpg
