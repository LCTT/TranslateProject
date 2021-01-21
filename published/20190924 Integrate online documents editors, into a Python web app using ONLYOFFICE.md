[#]: collector: (lujun9972)
[#]: translator: (stevenzdg988)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13037-1.html)
[#]: subject: (Integrate online documents editors, into a Python web app using ONLYOFFICE)
[#]: via: (https://opensourceforu.com/2019/09/integrate-online-documents-editors-into-a-python-web-app-using-onlyoffice/)
[#]: author: (Aashima Sharma https://opensourceforu.com/author/aashima-sharma/)

利用 ONLYOFFICE 将在线文档编辑器集成到 Python Web 应用程序中
======

![][1]

[ONLYOFFICE][3] 是根据 GNU AGPL v.3 许可证条款分发的开源协作办公套件。它包含三个用于文本文档、电子表格和演示文稿的编辑器，并具有以下功能:

  * 查看，编辑和协同编辑 `.docx`、`.xlsx`、`.pptx` 文件。OOXML 作为一种核心格式，可确保与 Microsoft Word、Excel 和 PowerPoint 文件的高度兼容性。
  * 通过内部转换为 OOXML，编辑其他流行格式（`.odt`、`.rtf`、`.txt`、`.html`、`.ods`、`.csv`、`.odp`）。
  * 熟悉的选项卡式界面。
  * 协作工具：两种协同编辑模式（快速和严谨），跟踪更改，评论和集成聊天。
  * 灵活的访问权限管理：完全访问权限、只读、审阅、表单填写和评论。
  * 使用 API 构建附加组件。
  * 250 种可用语言和象形字母表。

通过 API，开发人员可以将 ONLYOFFICE 编辑器集成到网站和利用程序设计语言编写的应用程序中，并能配置和管理编辑器。

要集成 ONLYOFFICE 编辑器，我们需要一个集成应用程序来连接编辑器（ONLYOFFICE 文档服务器）和服务。 要在你的界面中使用编辑器，因该授予 ONLYOFFICE 以下权限：

  * 添加并执行自定义代码。
  * 用于下载和保存文件的匿名访问权限。这意味着编辑器仅与服务器端的服务通信，而不包括客户端的任何用户授权数据（浏览器 cookies）。
  * 在用户界面添加新按钮（例如，“在 ONLYOFFICE 中打开”、“在 ONLYOFFICE 中编辑”）。
  * 开启一个新页面，ONLYOFFICE 可以在其中执行脚本以添加编辑器。
  * 能够指定文档服务器连接设置。

流行的协作解决方案的成功集成案例有很多，如 Nextcloud、ownCloud、Alfresco、Confluence 和 SharePoint，都是通过 ONLYOFFICE 提供的官方即用型连接器实现的。

实际的集成案例之一是 ONLYOFFICE 编辑器与以 C＃ 编写的开源协作平台的集成。该平台具有文档和项目管理、CRM、电子邮件聚合器、日历、用户数据库、博客、论坛、调查、Wiki 和即时通讯程序的功能。

将在线编辑器与 CRM 和项目模块集成，你可以：

  * 文档关联到 CRM 时机和容器、项目任务和讨论，甚至创建一个单独的文件夹，其中包含与项目相关的文档、电子表格和演示文稿。
  * 直接在 CRM 或项目模块中创建新的文档、工作表和演示文稿。
  * 打开和编辑关联的文档，或者下载和删除。
  * 将联系人从 CSV 文件批量导入到 CRM 中，并将客户数据库导出为 CSV 文件。

在“邮件”模块中，你可以关联存储在“文档模块”中的文件，或者将指向所需文档的链接插入到邮件正文中。 当 ONLYOFFICE 用户收到带有附件的文档的消息时，他们可以：下载附件、在浏览器中查看文件、打开文件进行编辑或将其保存到“文档模块”。 如上所述，如果格式不同于 OOXML ，则文件将自动转换为 `.docx`、`.xlsx`、`.pptx`，并且其副本也将以原始格式保存。

在本文中，你将看到 ONLYOFFICE 与最流行的编程语言之一的 Python 编写的文档管理系统的集成过程。 以下步骤将向你展示如何创建所有必要的部分，以使在 DMS（<ruby>文档管理系统<rt>Document Management System</rt></ruby>）界面内的文档中可以进行协同工作成为可能：查看、编辑、协同编辑、保存文件和用户访问管理，并可以作为服务的示例集成到 Python 应用程序中。

### 1、前置需求

首先，创建集成过程的关键组件：[ONLYOFFICE 文档服务器][4] 和用 Python 编写的文件管理系统。

#### 1.1、ONLYOFFICE 文档服务器

要安装 ONLYOFFICE 文档服务器，你可以从多个安装选项中进行选择：编译 GitHub 上可用的源代码，使用 `.deb` 或 `.rpm` 软件包亦或 Docker 镜像。

我们推荐使用下面这条命令利用 Docker 映像安装文档服务器和所有必需的依赖。请注意，选择此方法，你需要安装最新的 Docker 版本。

```
docker run -itd -p 80:80 onlyoffice/documentserver-de
```

#### 1.2、利用 Python 开发 DMS

如果已经拥有一个，请检查它是否满足以下条件：

  * 包含需要打开以查看/编辑的保留文件
  * 允许下载文件

对于该应用程序，我们将使用 Bottle 框架。我们将使用以下命令将其安装在工作目录中：

```
pip install bottle
```

然后我们创建应用程序代码 `main.py` 和模板 `index.tpl`。

我们将以下代码添加到 `main.py` 文件中：

```
from bottle import route, run, template, get, static_file # connecting the framework and the necessary components
@route('/') # setting up routing for requests for /
def index():
    return template('index.tpl') # showing template in response to request

run(host="localhost", port=8080) # running the application on port 8080
```

一旦我们运行该应用程序，点击 <http://localhost:8080> 就会在浏览器上呈现一个空白页面 。
为了使文档服务器能够创建新文档，添加默认文件并在模板中生成其名称列表，我们应该创建一个文件夹 `files` 并将3种类型文件（`.docx`、`.xlsx` 和 `.pptx`）放入其中。

要读取这些文件的名称，我们使用 `listdir` 组件（模块）：

```
from os import listdir
```

现在让我们为文件夹中的所有文件名创建一个变量：

```
sample_files = [f for f in listdir('files')]
```

要在模板中使用此变量，我们需要通过 `template` 方法传递它：

```
def index():
    return template('index.tpl', sample_files=sample_files)
```

这是模板中的这个变量：

```
% for file in sample_files:
  <div>
    <span>{{file}}</span>
  </div>
% end
```

我们重新启动应用程序以查看页面上的文件名列表。

使这些文件可用于所有应用程序用户的方法如下：

```
@get("/files/<filepath:re:.*\.*>")
def show_sample_files(filepath):
    return static_file(filepath, root="files")
```

### 2、查看文档

所有组件准备就绪后，让我们添加函数以使编辑者可以利用应用接口操作。

第一个选项使用户可以打开和查看文档。连接模板中的文档编辑器 API ：

```
<script type="text/javascript" src="editor_url/web-apps/apps/api/documents/api.js"></script>
```

`editor_url` 是文档编辑器的链接接口。

打开每个文件以供查看的按钮：

```
<button onclick="view('files/{{file}}')">view</button>
```

现在我们需要添加带有 `id` 的 `div` 标签，打开文档编辑器：

```
<div id="editor"></div>
```

要打开编辑器，必须调用调用一个函数：

```
<script>
function view(filename) {
    if (/docx$/.exec(filename)) {
        filetype = "text"
    }
    if (/xlsx$/.exec(filename)) {
        filetype = "spreadsheet"
    }
    if (/pptx$/.exec(filename)) {
        filetype = "presentation",
        title: filename
    }
​
    new DocsAPI.DocEditor("editor",
        {
            documentType: filetype,
            document: {
                url: "host_url" + '/' + filename,
                title: filename
            },
            editorConfig: {mode: 'view'}
        });
  }
</script>
```

DocEditor 函数有两个参数：将在其中打开编辑器的元素 `id` 和带有编辑器设置的 `JSON`。
在此示例中，使用了以下必需参数：

  * `documentType` 由其格式标识（`.docx`、`.xlsx`、`.pptx` 用于相应的文本、电子表格和演示文稿）
  * `document.url` 是你要打开的文件链接。
  * `editorConfig.mode`。

我们还可以添加将在编辑器中显示的 `title`。

接下来，我们可以在 Python 应用程序中查看文档。

### 3、编辑文档

首先，添加 “Edit”（编辑）按钮：

```
<button onclick="edit('files/{{file}}')">edit</button>
```

然后创建一个新功能，打开文件进行编辑。类似于查看功能。

现在创建 3 个函数：

```
<script>
    var editor;
    function view(filename) {
        if (editor) {
            editor.destroyEditor()
        }
        editor = new DocsAPI.DocEditor("editor",
            {
                documentType: get_file_type(filename),
                document: {
                    url: "host_url" + '/' + filename,
                    title: filename
                },
                editorConfig: {mode: 'view'}
            });
    }

    function edit(filename) {
        if (editor) {
            editor.destroyEditor()
        }
        editor = new DocsAPI.DocEditor("editor",
            {
                documentType: get_file_type(filename),
                document: {
                    url: "host_url" + '/' + filename,
                    title: filename
                }
            });
    }

    function get_file_type(filename) {
        if (/docx$/.exec(filename)) {
            return "text"
        }
        if (/xlsx$/.exec(filename)) {
            return "spreadsheet"
        }
        if (/pptx$/.exec(filename)) {
            return "presentation"
        }
    }
</script>
```

`destroyEditor` 被调用以关闭一个打开的编辑器。

你可能会注意到，`edit()` 函数中缺少 `editorConfig` 参数，因为默认情况下它的值是：`{"mode":"edit"}`。

现在，我们拥有了打开文档以在 Python 应用程序中进行协同编辑的所有功能。

### 4、如何在 Python 应用中利用 ONLYOFFICE 协同编辑文档

通过在编辑器中设置对同一文档使用相同的 `document.key` 来实现协同编辑。 如果没有此键值，则每次打开文件时，编辑器都会创建编辑会话。

为每个文档设置唯一键，以使用户连接到同一编辑会话时进行协同编辑。 密钥格式应为以下格式：`filename +"_key"`。下一步是将其添加到当前文档的所有配置中。

```
document: {
    url: "host_url" + '/' + filepath,
    title: filename,
    key: filename + '_key'
},
```

### 5、如何在 Python 应用中利用 ONLYOFFICE 保存文档

每次我们更改并保存文件时，ONLYOFFICE 都会存储其所有版本。 让我们仔细看看它是如何工作的。 关闭编辑器后，文档服务器将构建要保存的文件版本并将请求发送到 `callbackUrl` 地址。 该请求包含 `document.key`和指向刚刚构建的文件的链接。

`document.key` 用于查找文件的旧版本并将其替换为新版本。 由于这里没有任何数据库，因此仅使用 `callbackUrl` 发送文件名。

在 `editorConfig.callbackUrl` 的设置中指定 `callbackUrl` 参数并将其添加到 `edit()` 方法中：

```
 function edit(filename) {
        const filepath = 'files/' + filename;
        if (editor) {
            editor.destroyEditor()
        }
        editor = new DocsAPI.DocEditor("editor",
            {
                documentType: get_file_type(filepath),
                document: {
                    url: "host_url" + '/' + filepath,
                    title: filename, 
                    key: filename + '_key'
                }
                ,
                editorConfig: {
                    mode: 'edit',
                    callbackUrl: "host_url" + '/callback' + '&amp;filename=' + filename  // add file name as a request parameter
                }
            });
    }
```

编写一种方法，在获取到 POST 请求发送到 `/callback` 地址后将保存文件：

```
@post("/callback") # processing post requests for /callback
def callback():
    if request.json['status'] == 2:
        file = requests.get(request.json['url']).content
        with open('files/' + request.query['filename'], 'wb') as f:
            f.write(file)
    return "{\"error\":0}"
​
```

`# status 2` 是已生成的文件，当我们关闭编辑器时，新版本的文件将保存到存储器中。

### 6、管理用户

如果应用中有用户，并且你需要查看谁在编辑文档，请在编辑器的配置中输入其标识符（`id`和`name`）。

在界面中添加选择用户的功能：

```
<select id="user_selector" onchange="pick_user()">
    <option value="1" selected="selected">JD</option>
    <option value="2">Turk</option>
    <option value="3">Elliot</option>
    <option value="4">Carla</option>
</select>
```

如果在标记 `<script>` 的开头添加对函数 `pick_user()` 的调用，负责初始化函数自身 `id` 和 `name` 变量。

```
function pick_user() {
    const user_selector = document.getElementById("user_selector");
    this.current_user_name = user_selector.options[user_selector.selectedIndex].text;
    this.current_user_id = user_selector.options[user_selector.selectedIndex].value;
}
```

使用 `editorConfig.user.id` 和 `editorConfig.user.name` 来配置用户设置。将这些参数添加到文件编辑函数中的编辑器配置中。

```
function edit(filename) {
    const filepath = 'files/' + filename;
    if (editor) {
        editor.destroyEditor()
    }
    editor = new DocsAPI.DocEditor("editor",
        {
            documentType: get_file_type(filepath),
            document: {
                url: "host_url" + '/' + filepath,
                title: filename
            },
            editorConfig: {
                mode: 'edit',
                callbackUrl: "host_url" + '/callback' + '?filename=' + filename,
                user: {
                    id: this.current_user_id,
                    name: this.current_user_name
                }
            }
        });
}
```

使用这种方法，你可以将 ONLYOFFICE 编辑器集成到用 Python 编写的应用程序中，并获得用于在文档上进行协同工作的所有必要工具。有关更多集成示例（Java、Node.js、PHP、Ruby），请参考官方的 [API 文档][5]。

--------------------------------------------------------------------------------

via: https://opensourceforu.com/2019/09/integrate-online-documents-editors-into-a-python-web-app-using-onlyoffice/

作者：[Aashima Sharma][a]
选题：[lujun9972][b]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensourceforu.com/author/aashima-sharma/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2016/09/Typist-composing-text-in-laptop.jpg?resize=696%2C420&ssl=1 (Typist composing text in laptop)
[2]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2016/09/Typist-composing-text-in-laptop.jpg?fit=900%2C543&ssl=1
[3]: https://www.onlyoffice.com/en/
[4]: https://www.onlyoffice.com/en/developer-edition.aspx
[5]: https://api.onlyoffice.com/editors/basic
