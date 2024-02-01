[#]: subject: "Crash Course On Using Textual"
[#]: via: "https://fedoramagazine.org/crash-course-on-using-textual/"
[#]: author: "Jose Nunez https://fedoramagazine.org/author/josevnz/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16557-1.html"

Textual：为 Python 增加漂亮的文本用户界面（TUI）
======

![][0]

### 快速入门使用 Textual

Python 在 Linux 上有像 [TkInter][4] 这样的优秀 GUI（图形用户界面）开发库，但如果你不能运行图形应用程序怎么办？

文本终端，并非只在 Linux 上有，而且 BSD 和其它的出色的类 Unix 操作系统上也有。如果你的代码是用 Python 编写的，你应该使用 [Textual][5] 来帮助你编写 TUI（文本用户界面）。在这个快速介绍中，我将向你展示两个你可以用 Textual 做的示例，并且介绍它未来可能的应用方向。

所以 Textual 是什么？

> Textual 是一个为 Python 构建的快速应用程序开发框架，由 Textualize.io 构建。它可以让你用简单的 Python API 构建复杂的用户界面，并运行在终端或网络浏览器上！

#### 你需要的跟进这个教程的工具

你需要有以下条件：

  1. 具备基础的编程经验，最好熟练使用 Python。
  2. 理解基础的面向对象概念，比如类和继承。
  3. 一台安装了 Linux 与 Python 3.9+ 的机器
  4. 一款好的编辑器（Vim 或者 PyCharm 是不错的选择）

我尽可能简单化代码，以便你能轻松理解。此外，我强烈建议你下载代码，或至少按照接下来的说明安装相关程序。

#### 安装步骤

首先创建一个虚拟环境：

```
python3 -m venv ~/virtualenv/Textualize
```

现在，你可以克隆 Git 仓库并创建一个可以编辑的发布版本：

```
. ~/virtualenv/Textualize/bin/activate
pip install --upgrade pip
pip install --upgrade wheel
pip install --upgrade build
pip install --editable .
```

或者直接从 Pypi.org 安装：

```
. ~/virtualenv/Textualize/bin/activate
pip install --upgrade KodegeekTextualize
```

### 我们的首个程序：日志浏览器

![][6]

这个 _日志浏览器_ 就是一款简单的应用，能执行用户 _[PATH][7]_ 路径上的一系列 UNIX 命令，并在任务执行完毕后捕获输出。

以下是该应用的代码：

```
import shutil
from textual import on
from textual.app import ComposeResult, App
from textual.widgets import Footer, Header, Button, SelectionList
from textual.widgets.selection_list import Selection
from textual.screen import ModalScreen
# Operating system commands are hardcoded
OS_COMMANDS = {
    "LSHW": ["lshw", "-json", "-sanitize", "-notime", "-quiet"],
    "LSCPU": ["lscpu", "--all", "--extended", "--json"],
    "LSMEM": ["lsmem", "--json", "--all", "--output-all"],
    "NUMASTAT": ["numastat", "-z"]
}

class LogScreen(ModalScreen):
    # ... Code of the full separate screen omitted, will be explained next
    def __init__(self, name = None, ident = None, classes = None, selections = None):
        super().__init__(name, ident, classes)
        pass

class OsApp(App):
    BINDINGS = [
        ("q", "quit_app", "Quit"),
    ]
    CSS_PATH = "os_app.tcss"
    ENABLE_COMMAND_PALETTE = False  # Do not need the command palette

    def action_quit_app(self):
        self.exit(0)

    def compose(self) -> ComposeResult:
        # Create a list of commands, valid commands are assumed to be on the PATH variable.
        selections = [Selection(name.title(), ' '.join(cmd), True) for name, cmd in OS_COMMANDS.items() if shutil.which(cmd[0].strip())]
        yield Header(show_clock=False)
        sel_list = SelectionList(*selections, id='cmds')
        sel_list.tooltip = "Select one more more command to execute"
        yield sel_list
        yield Button(f"Execute {len(selections)} commands", id="exec", variant="primary")
        yield Footer()

    @on(SelectionList.SelectedChanged)
    def on_selection(self, event: SelectionList.SelectedChanged) -> None:
        button = self.query_one("#exec", Button)
        selections = len(event.selection_list.selected)
        if selections:
            button.disabled = False
        else:
            button.disabled = True
        button.label = f"Execute {selections} commands"

    @on(Button.Pressed)
    def on_button_click(self):
        selection_list = self.query_one('#cmds', SelectionList)
        selections = selection_list.selected
        log_screen = LogScreen(selections=selections)
        self.push_screen(log_screen)

def main():
    app = OsApp()
    app.title = f"Output of multiple well known UNIX commands".title()
    app.sub_title = f"{len(OS_COMMANDS)} commands available"
    app.run()

if __name__ == "__main__":
    main()
```

现在我们逐条梳理一下程序的代码：

  1. 每个应用都扩展自 `App` 类。其中最重要的有 `compose` 与 `mount` 等方法。但在当前应用中，我们只实现了 [compose][8]。
  2. 在 `compose` 方法中，你会返回一系列 <ruby>[组件][9]<rt>Widget</rt></ruby>，并按顺序添加到主屏幕中。每一个组件都有定制自身外观的选项。
  3. 你可以设定单字母的 <ruby>[绑定][10]<rt>binding</rt></ruby>，比如此处我们设定了 `q` 键来退出应用（参见 `action_quit_app` 函数和 `BINDINGS` 列表）。
  4. 利用 `SelectionList` 组件，我们展示了待运行的命令列表。然后，你可以通过 `@on(SelectionList.SelectedChanged)` 注解以及 `on_selection` 方法告知应用获取所选的内容。
  5. 对于无选定元素的应对很重要，我们会根据运行的命令数量来决定是否禁用 “exec” 按钮。
  6. 我们使用类似的监听器（ `@on(Button.Pressed)` ）来执行命令。我们做的就是将我们的选择送到一个新的屏幕，该屏幕会负责执行命令并收集结果。

你注意到 `CSS_PATH = "os_app.tcss"` 这个变量了吗？Textual 允许你使用 CSS 来控制单个或多个组件的外观（色彩、位置、尺寸）：

```
Screen {
        layout: vertical;
}

Header {
        dock: top;
}

Footer {
        dock: bottom;
}

SelectionList {
        padding: 1;
        border: solid $accent;
        width: 1fr;
        height: 80%;
}

Button {
        width: 1fr
}
```

引自 Textual 官方网站：

> Textual 中使用的 CSS 是互联网上常见 CSS 的简化版本，容易上手。

_这真是太棒了_，只需要用一哥独立的 [样式表][12]，就可以轻松调整应用的样式。

好，我们现在来看看如何在新屏幕上展示结果。

#### 在新屏幕上展示结果

![][13]

以下是在新屏幕上处理输出的代码：

```
import asyncio
from typing import List
from textual import on, work
from textual.reactive import reactive
from textual.screen import ModalScreen
from textual.widgets import Button, Label, Log
from textual.worker import Worker
from textual.app import ComposeResult

class LogScreen(ModalScreen):
    count = reactive(0)
    MAX_LINES = 10_000
    ENABLE_COMMAND_PALETTE = False
    CSS_PATH = "log_screen.tcss"

    def __init__(
            self,
            name: str | None = None,
            ident: str | None = None,
            classes: str | None = None,
            selections: List = None
    ):
        super().__init__(name, ident, classes)
        self.selections = selections

    def compose(self) -> ComposeResult:
        yield Label(f"Running {len(self.selections)} commands")
        event_log = Log(
            id='event_log',
            max_lines=LogScreen.MAX_LINES,
            highlight=True
        )
        event_log.loading = True
        yield event_log
        button = Button("Close", id="close", variant="success")
        button.disabled = True
        yield button

    async def on_mount(self) -> None:
        event_log = self.query_one('#event_log', Log)
        event_log.loading = False
        event_log.clear()
        lst = '\n'.join(self.selections)
        event_log.write(f"Preparing:\n{lst}")
        event_log.write("\n")

        for command in self.selections:
            self.count += 1
            self.run_process(cmd=command)

    def on_worker_state_changed(self, event: Worker.StateChanged) -> None:
        if self.count == 0:
            button = self.query_one('#close', Button)
            button.disabled = False
        self.log(event)

    @work(exclusive=False)
    async def run_process(self, cmd: str) -> None:
        event_log = self.query_one('#event_log', Log)
        event_log.write_line(f"Running: {cmd}")
        # Combine STDOUT and STDERR output
        proc = await asyncio.create_subprocess_shell(
            cmd,
            stdout=asyncio.subprocess.PIPE,
            stderr=asyncio.subprocess.STDOUT
        )
        stdout, _ = await proc.communicate()
        if proc.returncode != 0:
            raise ValueError(f"'{cmd}' finished with errors ({proc.returncode})")
        stdout = stdout.decode(encoding='utf-8', errors='replace')
        if stdout:
            event_log.write(f'\nOutput of "{cmd}":\n')
            event_log.write(stdout)
        self.count -= 1

    @on(Button.Pressed, "#close")
    def on_button_pressed(self, _) -> None:
        self.app.pop_screen()

```

你会注意到：

  1. `LogScreen` 类扩展自 `ModalScreen` 类， 该类负责处理模态模式的屏幕。
  2. 这个屏幕同样有一个 `compose` 方法，我们在这里添加了组件以展示 Unix 命令的内容。
  3. 我们创建了一个叫做 `mount` 的新方法。一旦你用 `compose` 编排好组件，你就可以运行代码来获取数据，并再进一步定制它们的外观。
  4. 我们使用 [asyncio][14] 运行命令，这样我们就能让 TUI 主工作线程在每个命令的结果出来时就及时更新内容。
  5. 对于“工作线程”，请注意 `run_process` 方法上的 `@work(exclusive=False)` 注解，该方法用于运行命令并捕获 STDOUT + STDERR 输出。使用 [工作线程][15] 来管理并发并不复杂，尽管它们在手册中确实有专门的章节。这主要是因为运行的外部命令可能会执行很长时间。
  6. 在 `run_process` 中，我们通过调用 `write` 以命令的输出内容来更新 `event_log`。
  7. 最后，`on_button_pressed` 把我们带回到前一屏幕（从堆栈中移除屏幕）。

这个小应用向你展示了如何一份不到 200 行的代码来编写一个简单的前端，用来运行非 Python 代码。

现在我们来看一个更复杂的例子，这个例子用到了我们还未探索过的 Textual 的新特性。

### 示例二：展示赛事成绩的表格

![通过 Textual 创建的表格应用][16]

本示例将展示如何使用 `DataTable` 组件在表格中展示赛事成绩。你能通过这个应用实现：

  * 通过列来排序表格
  * 选择表格中的行，完整窗口展示赛事细节，我们将使用我们在日志浏览器中看到的 “推送屏幕” 技巧。
  * 能进行表格搜索，查看选手详情，或执行其他操作如退出应用。

下面，我们来看看应用代码：

```

#!/usr/bin/env python
"""
Author: Jose Vicente Nunez
"""
from typing import Any, List

from rich.style import Style
from textual import on
from textual.app import ComposeResult, App
from textual.command import Provider
from textual.screen import ModalScreen, Screen
from textual.widgets import DataTable, Footer, Header

MY_DATA = [
    ("level", "name", "gender", "country", "age"),
    ("Green", "Wai", "M", "MYS", 22),
    ("Red", "Ryoji", "M", "JPN", 30),
    ("Purple", "Fabio", "M", "ITA", 99),
    ("Blue", "Manuela", "F", "VEN", 25)
]

class DetailScreen(ModalScreen):
    ENABLE_COMMAND_PALETTE = False
    CSS_PATH = "details_screen.tcss"

    def __init__(
            self,
            name: str | None = None,
            ident: str | None = None,
            classes: str | None = None,
            row: List[Any] | None = None,
    ):
        super().__init__(name, ident, classes)
        # Rest of screen code will be show later

class CustomCommand(Provider):

    def __init__(self, screen: Screen[Any], match_style: Style | None = None):
        super().__init__(screen, match_style)
        self.table = None
        # Rest of provider code will be show later

class CompetitorsApp(App):
    BINDINGS = [
        ("q", "quit_app", "Quit"),
    ]
    CSS_PATH = "competitors_app.tcss"
    # Enable the command palette, to add our custom filter commands
    ENABLE_COMMAND_PALETTE = True
    # Add the default commands and the TablePopulateProvider to get a row directly by name
    COMMANDS = App.COMMANDS | {CustomCommand}

    def action_quit_app(self):
        self.exit(0)

    def compose(self) -> ComposeResult:
        yield Header(show_clock=True)

        table = DataTable(id=f'competitors_table')
        table.cursor_type = 'row'
        table.zebra_stripes = True
        table.loading = True
        yield table
        yield Footer()

    def on_mount(self) -> None:
        table = self.get_widget_by_id(f'competitors_table', expect_type=DataTable)
        columns = [x.title() for x in MY_DATA[0]]
        table.add_columns(*columns)
        table.add_rows(MY_DATA[1:])
        table.loading = False
        table.tooltip = "Select a row to get more details"

    @on(DataTable.HeaderSelected)
    def on_header_clicked(self, event: DataTable.HeaderSelected):
        table = event.data_table
        table.sort(event.column_key)

    @on(DataTable.RowSelected)
    def on_row_clicked(self, event: DataTable.RowSelected) -> None:
        table = event.data_table
        row = table.get_row(event.row_key)
        runner_detail = DetailScreen(row=row)
        self.show_detail(runner_detail)

    def show_detail(self, detailScreen: DetailScreen):
        self.push_screen(detailScreen)

def main():
    app = CompetitorsApp()
    app.title = f"Summary".title()
    app.sub_title = f"{len(MY_DATA)} users"
    app.run()

if __name__ == "__main__":
    main()
```

有哪些部分值得我们关注呢？

  1. `compose` 方法中添加了 [表头][17]，“命令面板” 就位于此处，我们的表格（[DataTable][18]）也在这里。表格数据在 `mount` 方法中填充。
  2. 我们设定了预期的绑定（`BINDINGS`），并指定了外部的 CSS 文件来设置样式（`CSS_PATH`）。
  3. 默认情况下，我们无需任何设置便能使用 [命令面板][19]，但在此我们显式启用了它（`ENABLE_COMMAND_PALETTE = True`）。
  4. 我们的应用有一个自定义表格搜索功能。当用户输入一名选手的名字后，应用会显示可能的匹配项，用户可以点击匹配项查看该选手的详细信息。这需要告诉应用我们有一个定制的命令提供者（`COMMANDS = App.COMMANDS | {CustomCo_ mmand}`），即类 `CustomCommand(Provider)`。
  5. 如果用户点击了表头，表格内容会按照该列进行排序。这是通过 `on_header_clicked` 方法实现的，该方法上具有 `@on(DataTable.HeaderSelected)` 注解。
  6. 类似地，当选中表格中的一行时， `on_row_clicked` 方法会被调用，这得益于它拥有 `@on(DataTable.RowSelected)` 注解。当方法接受选中的行后，它会推送一个新的屏幕，显示选中行的详细信息（`class DetailScreen(ModalScreen)`）。

现在，我们详细地探讨一下如何显示选手的详细信息。

#### 利用多屏展示复杂视图

![][20]

当用户选择表格中的一行，`on_row_clicked` 方法就会被调用。它收到的是一个 `DataTable.RowSelected` 类型的事件。从这里我们会用选中的行的内容构建一个 `DetailScreen(ModalScreen)` 类的实例：

```
from typing import Any, List
from textual import on
from textual.app import ComposeResult
from textual.screen import ModalScreen
from textual.widgets import Button, MarkdownViewer

MY_DATA = [
    ("level", "name", "gender", "country", "age"),
    ("Green", "Wai", "M", "MYS", 22),
    ("Red", "Ryoji", "M", "JPN", 30),
    ("Purple", "Fabio", "M", "ITA", 99),
    ("Blue", "Manuela", "F", "VEN", 25)
]

class DetailScreen(ModalScreen):
    ENABLE_COMMAND_PALETTE = False
    CSS_PATH = "details_screen.tcss"

    def __init__(
            self,
            name: str | None = None,
            ident: str | None = None,
            classes: str | None = None,
            row: List[Any] | None = None,
    ):
        super().__init__(name, ident, classes)
        self.row: List[Any] = row

    def compose(self) -> ComposeResult:
        self.log.info(f"Details: {self.row}")
        columns = MY_DATA[0]
        row_markdown = "\n"
        for i in range(0, len(columns)):
            row_markdown += f"* **{columns[i].title()}:** {self.row[i]}\n"
        yield MarkdownViewer(f"""## User details:
        {row_markdown}
        """)
        button = Button("Close", variant="primary", id="close")
        button.tooltip = "Go back to main screen"
        yield button

    @on(Button.Pressed, "#close")
    def on_button_pressed(self, _) -> None:
        self.app.pop_screen()
```

这个类的职责很直接：

  1. `compose` 方法取得此行数据，并利用一个 [支持 Markdown 渲染的组件][21] 来展示内容。它的便利之处在于，它会为我们自动生成一个内容目录。
  2. 当用户点击 “close” 后，方法 `on_button_pressed` 会引导应用回到原始屏幕。注解 `@on(Button.Pressed, "#close")` 用来接收按键被点击的事件。

最后，我们来详细讲解一下那个多功能的搜索栏（也叫做命令面板）。

#### 命令面板的搜索功能

![][22]

任何使用了表头的 Textual 应用都默认开启了 [命令面板][19]。有意思的是，你可以在 `CompetitorsApp` 类中添加自定义的命令，这会增加到默认命令集之上：

```
COMMANDS = App.COMMANDS | {CustomCommand}
```

然后是执行大部分任务的 `CustomCommand(Provider)` 类：

```
from functools import partial
from typing import Any, List
from rich.style import Style
from textual.command import Provider, Hit
from textual.screen import ModalScreen, Screen
from textual.widgets import DataTable
from textual.app import App

class CustomCommand(Provider):

    def __init__(self, screen: Screen[Any], match_style: Style | None = None):
        super().__init__(screen, match_style)
        self.table = None

    async def startup(self) -> None:
        my_app = self.app
        my_app.log.info(f"Loaded provider: CustomCommand")
        self.table = my_app.query(DataTable).first()

    async def search(self, query: str) -> Hit:
        matcher = self.matcher(query)

        my_app = self.screen.app
        assert isinstance(my_app, CompetitorsApp)

        my_app.log.info(f"Got query: {query}")
        for row_key in self.table.rows:
            row = self.table.get_row(row_key)
            my_app.log.info(f"Searching {row}")
            searchable = row[1]
            score = matcher.match(searchable)
            if score > 0:
                runner_detail = DetailScreen(row=row)
                yield Hit(
                    score,
                    matcher.highlight(f"{searchable}"),
                    partial(my_app.show_detail, runner_detail),
                    help=f"Show details about {searchable}"
                )

class DetailScreen(ModalScreen):
        def __init__(
            self,
            name: str | None = None,
            ident: str | None = None,
            classes: str | None = None,
            row: List[Any] | None = None,
    ):
        super().__init__(name, ident, classes)
        # Code of this class explained on the previous section

class CompetitorsApp(App):
    # Add the default commands and the TablePopulateProvider to get a row directly by name
    COMMANDS = App.COMMANDS | {CustomCommand}
    # Most of the code shown before, only displaying relevant code
    def show_detail(self, detailScreen: DetailScreen):
        self.push_screen(detailScreen)
```

  1. 所有继承自 `Provider` 的类需实现 `search` 方法。在我们的例子中，我们还覆盖了 `startup` 方法，为了获取到我们应用表格（和其内容）的引用，这里使用到了 `App.query(DataTable).first()`。在类的生命周期中， `startup` 方法只会被调用一次。
  2. 在 `search` 方法内，我们使用 `Provider.matcher` 对每个表格行的第二列（即名字）进行模糊搜索，以与用户在 TUI 中输入的词条进行比较。`matcher.match(searchable)` 返回一个整型的评分，大于零说明匹配成功。
  3. 在 `search` 方法中，如果评分大于零，则返回一个 `Hit` 对象，以告知命令面板搜索查询是否成功。
  4. 每个 `Hit` 都有以下信息：评分（用于在命令面板中对匹配项排序）、高亮显示的搜索词、一个可调用对象的引用（在我们的案例中，它是一个可以将表格行推送到新屏幕的函数）。
  5. `Provider` 类的所有方法都是异步的。这使你能释放主线程，只有当响应准备好后才返回结果，这个过程不会冻结用户界面。

理解了这些信息，我们就可以现在展示赛手的详细信息了。

尽管这个架构的追踪功能相对直观，但是组件间传递的消息复杂性不可忽视。幸运的是，Textual 提供了有效的调试工具帮助我们理解背后的工作原理。

### Textual 应用的问题排查

对于 Python 的 Textual 应用进行 [调试][23] 相较而言更具挑战性。这是因为其中有一些操作可能是异步的，而在解决组件问题时设置断点可能颇为复杂。

根据具体情况，你可以使用一些工具。但首先，确保你已经安装了 textual 的开发工具：

```
pip install textual-dev==1.3.0
```

#### 确保你能捕捉到正确的按键

不确定 Textual 应用是否能捕捉到你的按键操作？运行 keys 应用：

```
textual keys
```

这让你能够验证一下你的按键组合，并确认在 Textual 中产生了哪些事件。

#### 图片比千言万语更直观

如果说你在布局设计上遇到了问题，想向他人展示你当前的困境，Textual 为你的运行应用提供了截图功能：

```
textual run --screenshot 5 ./kodegeek_textualize/log_scroller.py
```

就像你所看到的，我是通过这种方式为这篇教程创建了插图。

#### 捕获事件并输出定制消息

在 Textual 中，每一个应用实例都有一个日志记录器，可以使用如下方式访问：

```
my_app = self.screen.app
my_app.log.info(f"Loaded provider: CustomCommand")
```

想要查看这些消息，首先需要开启一个控制台：

```
. ~/virtualenv/Textualize/bin/activate
textual console
```

然后在另一个终端运行你的应用程序：

```
. ~/virtualenv/Textualize/bin/activate
textual run --dev ./kodegeek_textualize/log_scroller.py
```

在运行控制台的终端中，你可以看到实时的事件和消息输出：

```

▌Textual Development Console v0.46.0
▌Run a Textual app with textual run --dev my_app.py to connect.
▌Press Ctrl+C to quit.
─────────────────────────────────────────────────────────────────────────────── Client '127.0.0.1' connected ────────────────────────────────────────────────────────────────────────────────
[20:29:43] SYSTEM                                                                                                                                                                 app.py:2188
Connected to devtools ( ws://127.0.0.1:8081 )
[20:29:43] SYSTEM                                                                                                                                                                 app.py:2192
---
[20:29:43] SYSTEM                                                                                                                                                                 app.py:2194
driver=<class 'textual.drivers.linux_driver.LinuxDriver'>
[20:29:43] SYSTEM                                                                                                                                                                 app.py:2195
loop=<_UnixSelectorEventLoop running=True closed=False debug=False>
[20:29:43] SYSTEM                                                                                                                                                                 app.py:2196
features=frozenset({'debug', 'devtools'})
[20:29:43] SYSTEM                                                                                                                                                                 app.py:2228
STARTED FileMonitor({PosixPath('/home/josevnz/TextualizeTutorial/docs/Textualize/kodegeek_textualize/os_app.tcss')})
[20:29:43] EVENT
```

此外，以开发者模式运行的另一大好处是，如果你更改了 CSS，应用会尝试重新渲染，而无需重启程序。

### 如何编写单元测试

为你全新开发的 Textual 应用编写 [单元测试][24]，应该如何操作呢？

在 [官方文档][25] 展示了几种用于测试我们应用的方式。

我将采用 [unittest][24] 进行测试。为了处理异步例程，我们会需要特别的类 `unittest.IsolatedAsyncioTestCase` ：

```
import unittest
from textual.widgets import Log, Button
from kodegeek_textualize.log_scroller import OsApp

class LogScrollerTestCase(unittest.IsolatedAsyncioTestCase):
    async def test_log_scroller(self):
        app = OsApp()
        self.assertIsNotNone(app)
        async with app.run_test() as pilot:
            # Execute the default commands
            await pilot.click(Button)
            await pilot.pause()
            event_log = app.screen.query(Log).first()  # We pushed the screen, query nodes from there
            self.assertTrue(event_log.lines)
            await pilot.click("#close")  # Close the new screen, pop the original one
            await pilot.press("q")  # Quit the app by pressing q


if __name__ == '__main__':
    unittest.main()
```

现在让我们详细看看 `test_log_scroller` 方法中的操作步骤：

  1. 通过 `app.run_test()` 获取一个 `Pilot` 实例。然后点击主按钮，运行包含默认指令的查询，随后等待所有事件的处理。
  2. 从我们新推送出的屏幕中获取 `Log`，确保我们已获得几行返回的内容，即它并非空的。
  3. 关闭新屏幕并重新呈现旧屏幕。
  4. 最后，按下 `q`，退出应用。

可以测试表格吗？

```
import unittest
from textual.widgets import DataTable, MarkdownViewer
from kodegeek_textualize.table_with_detail_screen import CompetitorsApp


class TableWithDetailTestCase(unittest.IsolatedAsyncioTestCase):
    async def test_app(self):
        app = CompetitorsApp()
        self.assertIsNotNone(app)
        async with app.run_test() as pilot:

            """
            Test the command palette
            """
            await pilot.press("ctrl+\\")
            for char in "manuela".split():
                await pilot.press(char)
            await pilot.press("enter")
            markdown_viewer = app.screen.query(MarkdownViewer).first()
            self.assertTrue(markdown_viewer.document)
            await pilot.click("#close")  # Close the new screen, pop the original one

            """
            Test the table
            """
            table = app.screen.query(DataTable).first()
            coordinate = table.cursor_coordinate
            self.assertTrue(table.is_valid_coordinate(coordinate))
            await pilot.press("enter")
            await pilot.pause()
            markdown_viewer = app.screen.query(MarkdownViewer).first()
            self.assertTrue(markdown_viewer)
            # Quit the app by pressing q
            await pilot.press("q")


if __name__ == '__main__':
    unittest.main()
```

如果你运行所有的测试，你将看到如下类似的输出：

```
(Textualize) [josevnz@dmaf5 Textualize]$ python -m unittest tests/*.py
..
----------------------------------------------------------------------
Ran 2 tests in 2.065s

OK
```

这是测试 TUI 的一个不错的方式，对吧？

### 打包 Textual 应用

打包 Textual 应用与打包常规 Python 应用并没有太大区别。你需要记住，需要包含那些控制应用外观的 CSS 文件：

```
. ~/virtualenv/Textualize/bin/activate
python -m build
pip install dist/KodegeekTextualize-*-py3-none-any.whl
```

这个教程的 [pyproject.toml][26] 文件是一个打包应用的良好起点，告诉你需要做什么。

```
[build-system]
requires = [
    "setuptools >= 67.8.0",
    "wheel>=0.42.0",
    "build>=1.0.3",
    "twine>=4.0.2",
    "textual-dev>=1.2.1"
]
build-backend = "setuptools.build_meta"

[project]
name = "KodegeekTextualize"
version = "0.0.3"
authors = [
    {name = "Jose Vicente Nunez", email = "kodegeek.com@protonmail.com"},
]
description = "Collection of scripts that show how to use several features of textualize"
readme = "README.md"
requires-python = ">=3.9"
keywords = ["running", "race"]
classifiers = [
    "Environment :: Console",
    "Development Status :: 4 - Beta",
    "Programming Language :: Python :: 3",
    "Intended Audience :: End Users/Desktop",
    "Topic :: Utilities"
]
dynamic = ["dependencies"]

[project.scripts]
log_scroller = "kodegeek_textualize.log_scroller:main"
table_detail = "kodegeek_textualize.table_with_detail_screen:main"

[tool.setuptools]
include-package-data = true

[tool.setuptools.packages.find]
where = ["."]
exclude = ["test*"]

[tool.setuptools.package-data]
kodegeek_textualize = ["*.txt", "*.tcss", "*.csv"]
img = ["*.svg"]

[tool.setuptools.dynamic]
dependencies = {file = ["requirements.txt"]}
```

### 未来计划

这个简短的教程只覆盖了 Textual 的部分方面。还有很多需要探索和学习的内容：

  * 强烈建议你查看 [官方教程][27]。有大量的示例和指向参考 [API][28] 的链接。
  * Textual 可以使用来自 [Rich][29] 项目的组件，这个项目是一切的起源。我认为其中一些甚至可能所有这些组件在某些时候都会合并到 Textual 中。Textual 框架对于使用高级 API 的复杂应用更能胜任，但 Rich 也有很多漂亮的功能。
  * 创建你自己的组件！同样，在设计 TUI 时，[拿一张纸，画出你希望这些组件如何布局的][30]，这会为你后期省去很多时间和麻烦。
  * 调试 Python 应用可能会有点复杂。有时你可能需要 [混合使用不同的工具][31] 来找出应用的问题所在。
  * 异步 IO 是一个复杂的话题，你应该 [阅读开发者文档][32] 来了解更多可能的选择。
  * Textual 被其他项目所使用。其中一个非常易于使用的项目是 [Trogon][33]。[它会让你的 CLI 可以自我发现][34]。
  * [Textual-web][35] 是个很有前景的项目，能让你在浏览器上运行 Textual 应用。尽管它不如 Textual 成熟，但它的进化速度非常快。
  * 最后，[查看这些外部项目][36]。在项目组合中有许多有用的开源应用。

*（题图：DA/f11b0eb0-8e16-4cbe-986a-0fe978f6732a）*

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/crash-course-on-using-textual/

作者：[Jose Nunez][a]
选题：[lujun9972][b]
译者：[ChatGPT](https://linux.cn/lctt/ChatGPT)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/josevnz/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2024/01/textual_course-816x345.jpg
[2]: https://unsplash.com/@bernardhermant?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash
[3]: https://unsplash.com/photos/gray-and-clear-digital-wallpaper-VUBAE-Bmugk?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash
[4]: https://docs.python.org/3/library/tkinter.html
[5]: https://textual.textualize.io/
[6]: https://tutorials.kodegeek.com/Textualize/img/output_of_multiple_well_known_unix_commands_2023-12-28T19_13_32_605621.svg
[7]: https://manpages.org/bash
[8]: https://textual.textualize.io/tutorial/#composing-the-widgets
[9]: https://textual.textualize.io/widget_gallery/
[10]: https://textual.textualize.io/api/binding/
[11]: https://textual.textualize.io/guide/screens/
[12]: https://textual.textualize.io/guide/styles/
[13]: https://tutorials.kodegeek.com/Textualize/img/output_of_multiple_well_known_unix_commands_2023-12-28T19_13_40_503695.svg
[14]: https://docs.python.org/3/library/asyncio.html
[15]: https://textual.textualize.io/guide/workers/
[16]: https://tutorials.kodegeek.com/Textualize/img/summary_2023-12-28T19_05_20_213933.svg
[17]: https://textual.textualize.io/widgets/header/
[18]: https://textual.textualize.io/widgets/data_table/#guide
[19]: https://textual.textualize.io/guide/command_palette/
[20]: https://tutorials.kodegeek.com/Textualize/img/summary_2023-12-28T19_05_44_404837.svg
[21]: https://textual.textualize.io/widget_gallery/#markdownviewer
[22]: https://tutorials.kodegeek.com/Textualize/img/summary_2023-12-28T19_05_55_822030.svg
[23]: https://github.com/josevnz/tutorials/blob/main/docs/PythonDebugger/README.md
[24]: https://docs.python.org/3/library/unittest.html
[25]: https://textual.textualize.io/guide/testing/
[26]: https://tutorials.kodegeek.com/Textualize/pyproject.toml
[27]: https://textual.textualize.io/tutorial/
[28]: https://textual.textualize.io/api/
[29]: https://github.com/Textualize/rich
[30]: https://textual.textualize.io/how-to/design-a-layout/
[31]: https://github.com/josevnz/DebuggingApplications/blob/main/StracePythonWireshark/README.md
[32]: https://docs.python.org/3/library/asyncio-dev.html
[33]: https://github.com/Textualize/trogon
[34]: https://github.com/josevnz/CLIWithClickAndTrogon/blob/main/README.md
[35]: https://github.com/Textualize/textual-web
[36]: https://www.textualize.io/projects/
[37]: https://github.com/josevnz
[0]: https://img.linux.net.cn/data/attachment/album/202401/15/110359fptrxpqffztniz45.jpg