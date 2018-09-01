使用 MQTT 在项目中实现数据收发
======

> 从开源数据到开源事件流，了解一下 MQTT 发布/订阅（pubsub）线路协议。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/toolbox-learn-draw-container-yearbook.png?itok=xDbwz1pP)

去年 11 月我们购买了一辆电动汽车，同时也引发了有趣的思考：我们应该什么时候为电动汽车充电？对于电动汽车充电所用的电，我希望能够对应最小的二氧化碳排放，归结为一个特定的问题：对于任意给定时刻，每千瓦时对应的二氧化碳排放量是多少，一天中什么时间这个值最低？

### 寻找数据

我住在纽约州，大约 80% 的电力消耗可以自给自足，主要来自天然气、水坝（大部分来自于<ruby>尼亚加拉<rt>Niagara</rt></ruby>大瀑布）、核能发电，少部分来自风力、太阳能和其它化石燃料发电。非盈利性组织 [<ruby>纽约独立电网运营商<rt>New York Independent System Operator</rt></ruby>][1] （NYISO）负责整个系统的运作，实现发电机组发电与用电之间的平衡，同时也是纽约路灯系统的监管部门。

尽管没有为公众提供公开 API，NYISO 还是尽责提供了[不少公开数据][2]供公众使用。每隔 5 分钟汇报全州各个发电机组消耗的燃料数据。数据以 CSV 文件的形式发布于公开的档案库中，全天更新。如果你了解不同燃料对发电瓦数的贡献比例，你可以比较准确的估计任意时刻的二氧化碳排放情况。

在构建收集处理公开数据的工具时，我们应该时刻避免过度使用这些资源。相比将这些数据打包并发送给所有人，我们有更好的方案。我们可以创建一个低开销的<ruby>事件流<rt>event stream</rt></ruby>，人们可以订阅并第一时间得到消息。我们可以使用 [MQTT][3] 实现该方案。我的项目（[ny-power.org][4]）目标是收录到 [Home Assistant][5] 项目中；后者是一个开源的<ruby>家庭自动化<rt>home automation</rt></ruby>平台，拥有数十万用户。如果所有用户同时访问 CSV 文件服务器，估计 NYISO 不得不增加访问限制。

### MQTT 是什么？

MQTT 是一个<ruby>发布订阅线路协议<rt>publish/subscription wire protocol</rt></ruby>，为小规模设备设计。发布订阅系统工作原理类似于消息总线。你将一条消息发布到一个<ruby>主题<rt>topic</rt></ruby>上，那么所有订阅了该主题的客户端都可以获得该消息的一份拷贝。对于消息发送者而言，无需知道哪些人在订阅消息；你只需将消息发布到一系列主题，并订阅一些你感兴趣的主题。就像参加了一场聚会，你选取并加入感兴趣的对话。

MQTT 能够构建极为高效的应用。客户端订阅有限的几个主题，也只收到它们感兴趣的内容。不仅节省了处理时间，还降低了网络带宽使用。

作为一个开放标准，MQTT 有很多开源的客户端和服务端实现。对于你能想到的每种编程语言，都有对应的客户端库；甚至有嵌入到 Arduino 的库，可以构建传感器网络。服务端可供选择的也很多，我的选择是 Eclipse 项目提供的 [Mosquitto][6] 服务端，这是因为它体积小、用 C 编写，可以承载数以万计的订阅者。

### 为何我喜爱 MQTT

在过去二十年间，我们为软件应用设计了可靠且准确的模型，用于解决服务遇到的问题。我还有其它邮件吗？当前的天气情况如何？我应该此刻购买这种产品吗？在绝大多数情况下，这种<ruby>问答式<rt>ask/receive</rt></ruby>的模型工作良好；但对于一个数据爆炸的世界，我们需要其它的模型。MQTT 的发布订阅模型十分强大，可以将大量数据发送到系统中。客户可以订阅数据中的一小部分并在订阅数据发布的第一时间收到更新。

MQTT 还有一些有趣的特性，其中之一是<ruby>遗嘱<rt>last-will-and-testament</rt></ruby>消息，可以用于区分两种不同的静默，一种是没有主题相关数据推送，另一种是你的数据接收器出现故障。MQTT 还包括<ruby>保留消息<rt>retained message</rt></ruby>，当客户端初次连接时会提供相关主题的最后一条消息。这对那些更新缓慢的主题来说很有必要。

我在 Home Assistant 项目开发过程中，发现这种消息总线模型对<ruby>异构系统<rt>heterogeneous systems</rt></ruby>尤为适合。如果你深入<ruby>物联网<rt>Internet of Things</rt></ruby>领域，你会发现 MQTT 无处不在。

### 我们的第一个 MQTT 流

NYSO 公布的 CSV 文件中有一个是实时的燃料混合使用情况。每 5 分钟，NYSO 发布这 5 分钟内发电使用的燃料类型和相应的发电量（以兆瓦为单位）。

这个 CSV 文件看起来像这样：

| 时间戳         | 时区 | 燃料类型     | 兆瓦为单位的发电量 |
| --- | --- | --- | --- |
| 05/09/2018 00:05:00 | EDT       | 混合燃料          |   1400 |
| 05/09/2018 00:05:00 | EDT       | 天然气        |   2144 |
| 05/09/2018 00:05:00 | EDT       | 核能            |   4114 |
| 05/09/2018 00:05:00 | EDT       | 其它化石燃料 |      4 |
| 05/09/2018 00:05:00 | EDT       | 其它可再生资源   |    226 |
| 05/09/2018 00:05:00 | EDT       | 风力               |      1 |
| 05/09/2018 00:05:00 | EDT       | 水力              |   3229 |
| 05/09/2018 00:10:00 | EDT       | 混合燃料          |   1307 |
| 05/09/2018 00:10:00 | EDT       | 天然气        |   2092 |
| 05/09/2018 00:10:00 | EDT       | 核能            |   4115 |
| 05/09/2018 00:10:00 | EDT       | 其它化石燃料 |      4 |
| 05/09/2018 00:10:00 | EDT       | 其它可再生资源   |    224 |
| 05/09/2018 00:10:00 | EDT       | 风力               |     40 |
| 05/09/2018 00:10:00 | EDT       | 水力              |   3166 |

表中唯一令人不解就是燃料类别中的混合燃料。纽约的大多数天然气工厂也通过燃烧其它类型的化石燃料发电。在冬季寒潮到来之际，家庭供暖的优先级高于发电；但这种情况出现的次数不多，（在我们计算中）可以将混合燃料类型看作天然气类型。

CSV 文件全天更新。我编写了一个简单的数据泵，每隔 1 分钟检查是否有数据更新，并将新条目发布到 MQTT 服务器的一系列主题上，主题名称基本与 CSV 文件有一定的对应关系。数据内容被转换为 JSON 对象，方便各种编程语言处理。

```
ny-power/upstream/fuel-mix/Hydro {"units": "MW", "value": 3229, "ts": "05/09/2018 00:05:00"}
ny-power/upstream/fuel-mix/Dual Fuel {"units": "MW", "value": 1400, "ts": "05/09/2018 00:05:00"}
ny-power/upstream/fuel-mix/Natural Gas {"units": "MW", "value": 2144, "ts": "05/09/2018 00:05:00"}
ny-power/upstream/fuel-mix/Other Fossil Fuels {"units": "MW", "value": 4, "ts": "05/09/2018 00:05:00"}
ny-power/upstream/fuel-mix/Wind {"units": "MW", "value": 41, "ts": "05/09/2018 00:05:00"}
ny-power/upstream/fuel-mix/Other Renewables {"units": "MW", "value": 226, "ts": "05/09/2018 00:05:00"}
ny-power/upstream/fuel-mix/Nuclear {"units": "MW", "value": 4114, "ts": "05/09/2018 00:05:00"}
```

这种直接的转换是种不错的尝试，可将公开数据转换为公开事件。我们后续会继续将数据转换为二氧化碳排放强度，但这些原始数据还可被其它应用使用，用于其它计算用途。

### MQTT 主题

主题和<ruby>主题结构<rt>topic structure</rt></ruby>是 MQTT 的一个主要特色。与其它标准的企业级消息总线不同，MQTT 的主题无需事先注册。发送者可以凭空创建主题，唯一的限制是主题的长度，不超过 220 字符。其中 `/` 字符有特殊含义，用于创建主题的层次结构。我们即将看到，你可以订阅这些层次中的一些分片。

基于开箱即用的 Mosquitto，任何一个客户端都可以向任何主题发布消息。在原型设计过程中，这种方式十分便利；但一旦部署到生产环境，你需要增加<ruby>访问控制列表<rt>access control list</rt></ruby>（ACL）只允许授权的应用发布消息。例如，任何人都能以只读的方式访问我的应用的主题层级，但只有那些具有特定<ruby>凭证<rt>credentials</rt></ruby>的客户端可以发布内容。

主题中不包含<ruby>自动样式<rt>automatic schema</rt></ruby>，也没有方法查找客户端可以发布的全部主题。因此，对于那些从 MQTT 总线消费数据的应用，你需要让其直接使用已知的主题和消息格式样式。

那么应该如何设计主题呢？最佳实践包括使用应用相关的根名称，例如在我的应用中使用 `ny-power`。接着，为提高订阅效率，构建足够深的层次结构。`upstream` 层次结构包含了直接从数据源获取的、不经处理的原始数据，而 `fuel-mix` 层次结构包含特定类型的数据；我们后续还可以增加其它的层次结构。

### 订阅主题

在 MQTT 中，订阅仅仅是简单的字符串匹配。为提高处理效率，只允许如下两种通配符：

  * `#` 以递归方式匹配，直到字符串结束
  * `+` 匹配下一个 `/` 之前的内容

为便于理解，下面给出几个例子：

```
ny-power/#  - 匹配 ny-power 应用发布的全部主题
ny-power/upstream/#  - 匹配全部原始数据的主题
ny-power/upstream/fuel-mix/+  - 匹配全部燃料类型的主题
ny-power/+/+/Hydro - 匹配全部两次层级之后为 Hydro 类型的主题（即使不位于 upstream 层次结构下）
```

类似 `ny-power/#` 的大范围订阅适用于<ruby>低数据量<rt>low-volume</rt></ruby>的应用，应用从网络获取全部数据并处理。但对<ruby>高数据量<rt>high-volume</rt></ruby>应用而言则是一个灾难，由于绝大多数消息并不会被使用，大部分的网络带宽被白白浪费了。

在大数据量情况下，为确保性能，应用需要使用恰当的主题筛选（如 `ny-power/+/+/Hydro`）尽量准确获取业务所需的数据。

### 增加我们自己的数据层次

接下来，应用中的一切都依赖于已有的 MQTT 流并构建新流。第一个额外的数据层用于计算发电对应的二氧化碳排放。

利用[<ruby>美国能源情报署<rt>U.S. Energy Information Administration</rt></ruby>][7] 给出的 2016 年纽约各类燃料发电及排放情况，我们可以给出各类燃料的[平均排放率][8]，单位为克/兆瓦时。

上述结果被封装到一个专用的微服务中。该微服务订阅 `ny-power/upstream/fuel-mix/+`，即数据泵中燃料组成情况的原始数据，接着完成计算并将结果（单位为克/千瓦时）发布到新的主题层次结构上：

```
ny-power/computed/co2 {"units": "g / kWh", "value": 152.9486, "ts": "05/09/2018 00:05:00"}
```

接着，另一个服务会订阅该主题层次结构并将数据打包到 [InfluxDB][9] 进程中；同时，发布 24 小时内的时间序列数据到 `ny-power/archive/co2/24h` 主题，这样可以大大简化当前变化数据的绘制。

这种层次结构的主题模型效果不错，可以将上述程序之间的逻辑解耦合。在复杂系统中，各个组件可能使用不同的编程语言，但这并不重要，因为交换格式都是 MQTT 消息，即主题和 JSON 格式的消息内容。

### 从终端消费数据

为了更好的了解 MQTT 完成了什么工作，将其绑定到一个消息总线并查看消息流是个不错的方法。`mosquitto-clients` 包中的 `mosquitto_sub` 可以让我们轻松实现该目标。

安装程序后，你需要提供服务器名称以及你要订阅的主题。如果有需要，使用参数 `-v` 可以让你看到有新消息发布的那些主题；否则，你只能看到主题内的消息数据。

```
mosquitto_sub -h mqtt.ny-power.org -t ny-power/# -v
```

只要我编写或调试 MQTT 应用，我总会在一个终端中运行 `mosquitto_sub`。

### 从网页直接访问 MQTT

到目前为止，我们已经有提供公开事件流的应用，可以用微服务或命令行工具访问该应用。但考虑到互联网仍占据主导地位，因此让用户可以从浏览器直接获取事件流是很重要。

MQTT 的设计者已经考虑到了这一点。协议标准支持三种不同的传输协议：[TCP][10]、[UDP][11] 和 [WebSockets][12]。主流浏览器都支持 WebSockets，可以维持持久连接，用于实时应用。

Eclipse 项目提供了 MQTT 的一个 JavaScript 实现，叫做 [Paho][13]，可包含在你的应用中。工作模式为与服务器建立连接、建立一些订阅，然后根据接收到的消息进行响应。

```
// ny-power web console application

var client = new Paho.MQTT.Client(mqttHost, Number("80"), "client-" + Math.random());

// set callback handlers
client.onMessageArrived = onMessageArrived;

// connect the client
client.reconnect = true;
client.connect({onSuccess: onConnect});

// called when the client connects
function onConnect() {
    // Once a connection has been made, make a subscription and send a message.
    console.log("onConnect");
    client.subscribe("ny-power/computed/co2");
    client.subscribe("ny-power/archive/co2/24h");
    client.subscribe("ny-power/upstream/fuel-mix/#");
}

// called when a message arrives
function onMessageArrived(message) {
    console.log("onMessageArrived:"+message.destinationName + message.payloadString);
    if (message.destinationName == "ny-power/computed/co2") {
        var data = JSON.parse(message.payloadString);
        $("#co2-per-kwh").html(Math.round(data.value));
        $("#co2-units").html(data.units);
        $("#co2-updated").html(data.ts);
    }

    if (message.destinationName.startsWith("ny-power/upstream/fuel-mix")) {
        fuel_mix_graph(message);
    }

    if (message.destinationName == "ny-power/archive/co2/24h") {
        var data = JSON.parse(message.payloadString);
        var plot = [
            {
                x: data.ts,
                y: data.values,
                type: 'scatter'
            }
        ];
        var layout = {
            yaxis: {
                title: "g CO2 / kWh",
            }
        };
        Plotly.newPlot('co2_graph', plot, layout);
    }
```

上述应用订阅了不少主题，因为我们将要呈现若干种不同类型的数据；其中 `ny-power/computed/co2` 主题为我们提供当前二氧化碳排放的参考值。一旦收到该主题的新消息，网站上的相应内容会被相应替换。

![NYISO 二氧化碳排放图][15]

*[ny-power.org][4] 网站提供的 NYISO 二氧化碳排放图。*

`ny-power/archive/co2/24h` 主题提供了时间序列数据，用于为 [Plotly][16] 线表提供数据。`ny-power/upstream/fuel-mix` 主题提供当前燃料组成情况，为漂亮的柱状图提供数据。

![NYISO 燃料组成情况][18]

*[ny-power.org][4] 网站提供的燃料组成情况。*

这是一个动态网站，数据不从服务器拉取，而是结合 MQTT 消息总线，监听对外开放的 WebSocket。就像数据泵和打包器程序那样，网站页面也是一个发布订阅客户端，只不过是在你的浏览器中执行，而不是在公有云的微服务上。

你可以在 <http://ny-power.org> 站点点看到动态变更，包括图像和可以看到消息到达的实时 MQTT 终端。

### 继续深入

ny-power.org 应用的完整内容开源在 [GitHub][19] 中。你也可以查阅 [架构简介][20]，学习如何使用 [Helm][21] 部署一系列 Kubernetes 微服务构建应用。另一个有趣的 MQTT 示例使用 MQTT 和 OpenWhisk 进行实时文本消息翻译，<ruby>代码模式<rt>code pattern</rt></ruby>参考[链接][22]。

MQTT 被广泛应用于物联网领域，更多关于 MQTT 用途的例子可以在 [Home Assistant][23] 项目中找到。

如果你希望深入了解协议内容，可以从 [mqtt.org][3] 获得该公开标准的全部细节。

想了解更多，可以参加 Sean Dague 在 [OSCON][25] 上的演讲，主题为 [将 MQTT 加入到你的工具箱][24]，会议将于 7 月 16-19 日在奥尔良州波特兰举办。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/mqtt

作者：[Sean Dague][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[pinewall](https://github.com/pinewall)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/sdague
[1]:http://www.nyiso.com/public/index.jsp
[2]:http://www.nyiso.com/public/markets_operations/market_data/reports_info/index.jsp
[3]:http://mqtt.org/
[4]:http://ny-power.org/#
[5]:https://www.home-assistant.io
[6]:https://mosquitto.org/
[7]:https://www.eia.gov/
[8]:https://github.com/IBM/ny-power/blob/master/src/nypower/calc.py#L1-L60
[9]:https://www.influxdata.com/
[10]:https://en.wikipedia.org/wiki/Transmission_Control_Protocol
[11]:https://en.wikipedia.org/wiki/User_Datagram_Protocol
[12]:https://en.wikipedia.org/wiki/WebSocket
[13]:https://www.eclipse.org/paho/
[14]:/file/400041
[15]:https://opensource.com/sites/default/files/uploads/mqtt_nyiso-co2intensity.png (NY ISO Grid CO2 Intensity)
[16]:https://plot.ly/
[17]:/file/400046
[18]:https://opensource.com/sites/default/files/uploads/mqtt_nyiso_fuel-mix.png (Fuel mix on NYISO grid)
[19]:https://github.com/IBM/ny-power
[20]:https://developer.ibm.com/code/patterns/use-mqtt-stream-real-time-data/
[21]:https://helm.sh/
[22]:https://developer.ibm.com/code/patterns/deploy-serverless-multilingual-conference-room/
[23]:https://www.home-assistant.io/
[24]:https://conferences.oreilly.com/oscon/oscon-or/public/schedule/speaker/77317
[25]:https://conferences.oreilly.com/oscon/oscon-or
