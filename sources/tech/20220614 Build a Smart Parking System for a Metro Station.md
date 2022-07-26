[#]: subject: "Build a Smart Parking System for a Metro Station"
[#]: via: "https://www.opensourceforu.com/2022/06/build-a-smart-parking-system-for-a-metro-station/"
[#]: author: "Dr Maheswari R. https://www.opensourceforu.com/author/dr-maheswari-r/"
[#]: collector: "lkxed"
[#]: translator: "Maisie-x "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

为地铁站构建智能停车系统
======
本文将帮助你设计一个基于 Web 的应用程序，该应用程序使用 Node-RED 为地铁站的汽车自动实现智能停车系统。

![Smart car parking][1]

Web应用程序是在Web服务器上运行的软件。终端用户通过Web浏览器访问每个Web应用程序。Web应用程序使用客户端—服务器架构进行编程，该架构是用户（客户端）通过可能由第三方托管的远程服务器提供服务。Web API(应用程序编程接口)在Web上可用，用户可以通过HTTP协议访问该接口，如图1所示。

本文将演示如何为地铁设计一个基于Web的汽车自动智能停车系统。 它是使用开源的Node-RED设计。该系统使用模板节点创建了一个互动式且时尚的用户登录表单，该模板用HTML和CSS编码以获取车主详细，从而实现停车系统的自动化。我们可以在图2和图3看到登录表单和提交表单的流程图。

使用的节点如下：

![table function][3]

**地铁智能停车节点流程设计**

Node-RED是使用’node-red‘命令激活。通过网址http://127.0.0.1:1880/ 可以访问Node-RED的用户界面流程图的浏览器。我们认为Node-RED设置已完成并且可以正常工作了。

![Figure 1: Web API][4]

按照下面给出的步骤创建登录表单和提交表单。

![Figure 2: Login form flow diagram][5]

![Figure 3: Submission form flow diagram][6]

**登录表单**

1) 在节点画布中，拖放http in节点，这会为创建Web服务创建一个HTTP访问点。
2) 将http in节点连接到<ruby>函数<rt>function</rt></ruby>节点。函数节点有助于编写JavaScripts函数处理节点接收到的消息。

![Figure 4: Login form for smart parking for cars][7]

3) 将<ruby>函数<rt>function</rt></ruby>节点连接到<ruby>模板<rt>template</rt></ruby>节点，模板节点基于提供的模板创建一个Web API。
4) 将<ruby>模板<rt>template</rt></ruby>节点连接到http <ruby>响应<rt>response</rt></ruby>节点，响应节点将响应http输入节点的请求。

![Figure 5: Submission form for smart parking for cars][8]

**提交表单**

1) 拖放http in节点并将其连接到json节点，json节点将数据转换为JSON字符串进行通信。
2) 将http in节点连接到<ruby>调试<rt>debug</rt></ruby>节点，调试节点的调试监控器会输出结果。
3) 将json节点放置并连接到<ruby>函数<rt>function</rt></ruby>节点，将函数节点连接到http响应节点。

创建完整流程后，单击Node-RED窗口右上角的<ruby>部署<rt>Deploy</rt></ruby>按钮。访问*127.0.0.1:1880/ui/*这个链接查看用户界面。

输入链接然后单击<ruby>提交<rt>Submit</rt></ruby>后，该链接会跳转到下一页，您可以在该页面阅读所有新闻。

**Node-RED工作流程**

在单个Node-RED流程中，您可以创建登录表单和提交表单，如图4和图5所示。

现在我们将配置节点属性。

**登录表单**：编辑http in属性：<ruby>方法<rt>method</rt></ruby>选择 ‘Get’，<ruby>网址<rt>URL</rt></ruby>设为‘/MetroStation’ ，<ruby>名称<rt>name</rt></ruby>配置为 “<ruby>智能停车系统<rt>Smart Parking</rt></ruby>”。（译注：下文http响应节点的名称为Smart parking，p字母小写，为了区分，此处中文翻译成智能停车系统。）

![Figure 6: Http in node property configurations][9]

| - |
| :- |
| 注意：任何用户可以定义<ruby>网址<rt>URL</rt></ruby>为本地变量。 |

现在选择函数节点，编辑函数节点属性：输入代码 ‘msg.url = project’ ，并配置代码<ruby>名称<rt>name</rt></ruby>字段为 “<ruby>项目提交<rt>Project Submission</rt></ruby>”。

![Figure 7: Function node property configurations][10]

在模板节点的属性窗口，为登录表单配置相应的HTML代码，并将代码<ruby>名称<rt>name</rt></ruby>命名为 “<ruby>显示面板<rt>Display panel</rt></ruby>”。猜此流程使用了Mustache（译注：Mustache是胡子的意思，因为它的嵌入标记{{ }}非常像胡子）模板格式。Mustache是一个简单的Web模板系统，被描述为无逻辑的模板引擎。Mustache没有任何显式的控制流语句，例如 ‘if’ 和 ‘else’条件和‘for’ 循环。可以通过使用块标签处理列表和lambdas来实现循环和条件评估。

![Figure 8: Template node property configurations][11]

配置编辑http<ruby>响应<rt>response</rt></ruby>节点的属性，<ruby>名称<rt>name</rt></ruby>设为 "<ruby>智能停车<rt>Smart parking</rt></ruby>"（图9） 。

![Figure 9: Http response node property configurations][12]

**提交表单**：在http in节点的编辑属性窗口，<ruby>方法<rt>method</rt></ruby>选择‘POST’ ，<ruby>网址<rt>URL</rt></ruby>设为 ‘/project’。

![Figure 10: Http in node property configurations][13]

在JSON节点的编辑窗口，<ruby>操作<rt>Action</rt></ruby>设为‘<ruby>JSON字符串与对象互转<rt>Convert between JSON String & Object</rt></ruby>’，参考图11。

![Figure 11: JSON node property configurations][14]

函数节点的配置如图12所示。

![Figure 12: Function node property configurations][15]

在http<ruby>响应<rt>response</rt></ruby>节点，编辑属性<ruby>名称<rt>name</rt></ruby>为“<ruby>已提交项目<rt>Project Submitted</rt></ruby>”。

![Figure 13: Http response node property configurations][16]

| - |
| :- |
| 注意：添加带有评论的评论节点作为 “登录表单” 和 “提交表单”。 |

![Figure 14: Debug node property configurations][17]

**用户界面的控制面板**

当用户单击<ruby>提交<rt>Submit</rt></ruby>，给出的数据将显示在用户界面和调试节点。如果单击<ruby>重置<rt>Reset</rt></ruby>，详细信息将被清除，允许用户输入新的详细信息（图15）。

![Figure 15: User login UI][18]

地铁停车费通过超链接提供，收费表在用户界面显示。因此，汽车智能停车系统通过适当的超链接实现自动化，展示地铁站的停车费。该自动化系统的最终输出可以在Node-RED控制面板的用户界面和调试监控器调取和展示。

![Figure 16: Metro parking tariff][19]

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/06/build-a-smart-parking-system-for-a-metro-station/

作者：[Dr Maheswari R.][a]
选题：[lkxed][b]
译者：[Maisie-x](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/dr-maheswari-r/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Smart-car-parking.jpg
[2]: https://www.opensourceforu.com/wp-content/uploads/2022/04/table-function-node-red.jpg
[3]: https://www.opensourceforu.com/wp-content/uploads/2022/04/table-function-node-red.jpg
[4]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-1-Web-Application-Programming-Interface300.jpg
[5]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-2-Login-Form-Flow-Diagram300.jpg
[6]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-3-Submission-Form-Flow-Diagram300.jpg
[7]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-4-Login-Form-of-Metro-Smart-Car-Parking300.jpg
[8]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-5-Submission-Form-of-Metro-Smart-Car-Parking300.jpg
[9]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-6-Http-in-Node-Property-Configurations300.jpg
[10]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-7-Function-Node-Property-Configurations300.jpg
[11]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-8-Template-Node-Property-Configurations300.jpg
[12]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-9-Template-Node-Property-Configurations300.jpg
[13]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-10-Http-in-Node-Property-Configurations300.jpg
[14]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-11-Json-Node-Property-Configurations300.jpg
[15]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-12-Function-Node-Property-Configurations300.jpg
[16]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-13-Http-Response-Node-Property-Configurations300.jpg
[17]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-14-Debug-Node-Property-Configurations300.jpg
[18]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-15-User-Login-UI300.jpg
[19]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-16-Parking-Tariff-Metro300.jpg
