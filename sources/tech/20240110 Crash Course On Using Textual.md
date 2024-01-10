[#]: subject: "Crash Course On Using Textual"
[#]: via: "https://fedoramagazine.org/crash-course-on-using-textual/"
[#]: author: "Jose Nunez https://fedoramagazine.org/author/josevnz/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Crash Course On Using Textual
======

![][1]

Photo by [Bernard Hermant][2] on [Unsplash][3]

### Crash course on using Textual

Python on Linux has nice GUI (Graphic User Interface) development libraries like [TkInter][4], but what if you cannot run graphical applications?

Text terminals, are available on not just Linux but BSD and other great Unix-like operating systems. If you write code in Python, you should be using [Textual][5] to help you write TUI ( _Text User Interfaces_ ). In this quick introduction, I will show you two examples of what you can do with Textual and where you can go after that.

So what is Textual?

> Textual is a Rapid Application Development framework for Python, built by Textualize.io. Build sophisticated user interfaces with a simple Python API. Run your apps in the terminal or a web browser!

#### What you need to follow this tutorial

You will need the following:

  1. Basic programming experience, preferable in Python.
  2. Understanding basic object oriented concepts like classes and inheritance
  3. A machine with Linux and Python 3.9+ installed
  4. A good editor (Vim or PyCharm are good choices)



I tried to keep the code simple, so you can follow it. Also, I strongly recommend you download the code or at least install the programs as explained next.

#### Installation

First create a virtual environment:

```

    python3 -m venv ~/virtualenv/Textualize

```

Now you can either clone the Git repository and make an editable distribution:

```

    . ~/virtualenv/Textualize/bin/activate
    pip install --upgrade pip
    pip install --upgrade wheel
    pip install --upgrade build
    pip install --editable .

```

Or just Install from Pypi.org:

```

    . ~/virtualenv/Textualize/bin/activate
    pip install --upgrade KodegeekTextualize

```

#### Our first application: A log scroller

![][6]

The _log scroller_ is a simple application that executes a list of UNIX commands that are on the _[PATH][7]_ and captures the output as they finish.

The resulting application code:

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

Let’s quickly dissect the code for the application:

  1. An application extends the class _App_. It has several methods but the most important are _compose_ and _mount_. Only [compose][8] is implemented in this app.
  2. In _compose_ , you yield back Widgets, and they get added in the same order to the main screen. Each [Widget][9] has options to customize their appearance.
  3. You can define single letter [bindings][10], in this case the letter ‘q’ allows you to exit the application (see the function _action_quit_app_ and the BINDINGS list)
  4. We display the list of commands to run using a _SelectionList widget_. You can then tell your application to capture what was selected by using the annotation *@on(SelectionList.SelectedChanged) *and the method _on_selection_.
  5. It is important to react to a lack of selected elements, we disable or enable the ‘exec’ button depending on how many commands were selected to run.
  6. A similar listener ( _@on(Button.Pressed)_ ) is used to execute the commands. We do that by pushing our selection to a [new screen][11] that handles the execution and collection of results.



Notice the _CSS_PATH = “os_app.tcss”_ variable? Textual allows you to control the appearance (colors, position, size) of individual or classes of widgets using CSS:

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

Quoting from the Textual website:

> The dialect of CSS used in Textual is greatly simplified over web based CSS and much easier to learn.

_This is great_ , as you can customize the appearance of your application using a separate [stylesheet][12] without too much effort.

Let’s now look at how to display the results on a separate screen.

##### Display results on a separate screen

![][13]

The code that handles the output on a separate screen is here:

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

You will notice the following:

  1. The _LogScreen_ class extends _ModalScreen_ which handles screens in modal mode.
  2. The screen also has a compose method where we add widgets to show the contents of the Unix commands.
  3. We have a new method called _mount_. Once you ‘ _compose_ ’ the widgets then you can run code to retrieve data and customize their appearance even further
  4. To run the commands we use [asyncio][14], so we give the TUI main worker thread a chance to update the contents as soon as results for each command are known.
  5. On the ‘ _workers_ ’ topic, please note the _@work(exclusive=False)_ annotation on the _run_process_ method used to run the commands and capture the STDOUT + STDERR output. Using [workers][15] to manage concurrency is not complicated, but they do have a dedicated section in the manual. This extra complexity arises because we are running external commands that may or may not take a long time to complete.
  6. In _run_proces_ s we update the _event_log_ by calling _write_ with the contents of the command output.
  7. Finally, the _on_button_pressed_ takes us back to the previous screen (pop the screen from the stack).



This little app shows you how to write a simple front end to run non-python code, in less than 200 lines of code.

Now let’s move to a more complex example that uses new features of Textual we haven’t explored yet.

#### Second example: A table with race results

![Table application created via Textual][16]

This example shows you how to display race results in a table (Using a _DataTable_ widget). The application allows you to:

  * Sort a table by column
  * Select a row to show race details in a full window, using the same ‘ _push screen_ ’ technique we saw in the log scroll application.
  * Search the table and show racer details or run other commands like exit the application.



Let’s see the application code then:

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

What is interesting here?:

  1. compose adds the [header][17] where the ‘ _command palette_ ’ will live, as well our table ([DataTable][18]). The table gets populated in the mount method.
  2. We have the expected bindings (BINDINGS) and external CSS for appearance (CSS_PATH)
  3. By default, if we want to have the [command palette][19] we do nothing, but it is explicitly enabled here ( _ENABLE_COMMAND_PALETTE = True_ )
  4. Our application has a custom search in the table contents. When the user types a name, a possible match is shown and the user clicks it to display the details for that racer. This requires telling the application that we have a custom provider ( _COMMANDS = App.COMMANDS | {CustomCo_ mmand}), which is the class _CustomCommand(Provider)_
  5. If the user clicks a table header, the contents are sorted by that header. This is done using _on_header_clicked_ which is annotated with *@on(DataTable.HeaderSelected) *
  6. Similarly, when a row is selected, the method _on_row_clicked_ is called thanks to the annotation _@on(DataTable.RowSelected)_. The method receives the selected row that is then used to push a new screen with details ( _class DetailScreen(ModalScreen)_ )



Now let’s explore in detail how the racer details are shown

##### Using screens to show more complex views

![][20]

When the user selects a row, the method _on_row_clicked_ gets called. It receives an event of type _DataTable.RowSelected_. From there we construct an instance of class *DetailScreen(ModalScreen) *with the contents of the selected row:

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

The responsibility of this class is very simple:

  1. Method _compose_ takes the row and displays the content using a [widget that knows how to render Markdown][21]. Pretty neat as it creates a table of contents for us.
  2. The method _on_button_pressed_ pops back the original screen once the user clicks ‘close’. (Annotation _@on(Button.Pressed, “#close”)_ takes care of receiving pressed events)



Now the last bit of the puzzle, which requires more explanation, the multipurpose search bar (known as command palette).

##### You can search too, using the command palette

![][22]

The [command palette][19] is enabled by default on every Textual application that uses a header. The fun part is that you can add your own commands in addition to the default commands, on class _CompetitorsApp_ :

```

    COMMANDS = App.COMMANDS | {CustomCommand}

```

And now the class that does all the heavy lifting, _CustomCommand(Provider)_ :

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

  1. Any class extending _Provider_ only needs to implement the method _search_. In our case we do also override the method _startup_ to get a reference to our application table (and its contents), using the _App.query(DataTable).first()_. _startup_ gets called only once in the lifetime of the instantiated class.
  2. Inside the _search_ method we use the _Provider.matcher_ to do a fuzzy search on the second column (name) of each table row comparing with the query (which is the term passed by the user on the TUI). The _matcher.match(searchable)_ returns an integer score, where greater than zero indicates a match.
  3. Inside _search_ if the score is greater than zero then it returns a _Hit_ object that tell the command palette if the search query was successful or not.
  4. Each _Hit_ has the following information: score (used for sorting matches on the palette command), a highlighted search term, a reference to a callable (that’s it in our case a function that will push our table row to a new screen)
  5. All the methods of the Provider class are async. This allows you to free the main worker thread and only return once the response is ready to be used (no frozen UI).



With all that information we can now display the racer details.

While the framework is simple enough to follow there is also a lot of complexity on the messages passed back and forth between the components. Luckily for us Textual has a nice debugging framework that will help us understand what is going on behind scenes.

#### Troubleshooting a Textual application

[Debugging][23] a Python Textual application is a little bit more challenging. This is because some operations can be asynchronous and setting breakpoints may be cumbersome when troubleshooting widgets.

Depending on the situation, there are some tools you can use. But first make sure you have the textual dev tools:

```

    pip install textual-dev==1.3.0

```

##### Make sure you are capturing the right keys

You are not sure what keys are being captured by a Textual application? Run the key app:

```

    textual keys

```

This lets you can press your key combinations and confirm what events are generated in Textual.

##### A picture is worth more than a thousand words

Say that you have a problem placing components on a layout, and you want to show others where you are stuck. Textual allows you to take a screenshot of your running application:

```

    textual run --screenshot 5 ./kodegeek_textualize/log_scroller.py

```

That’s how I created the images for this tutorial.

##### Capturing events and printing custom messages

Textual has a logger that is part of every instance of an Application:

```

    my_app = self.screen.app
    my_app.log.info(f"Loaded provider: CustomCommand")

```

In order to see the messages, you first need to start a console:

```

    . ~/virtualenv/Textualize/bin/activate
    textual console

```

Then in another terminal run your application

```

    . ~/virtualenv/Textualize/bin/activate
    textual run --dev ./kodegeek_textualize/log_scroller.py

```

You will see now events and messages flowing into the terminal where the console is running:

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

Another advantage of running your application in developer mode is that if you change your CSS, the application will try to render again without a restart.

#### Writing unit tests

What if you want to write [unit tests][24] for your brand new Textual application?

The documentation [shows there are several ways][25] to test our application.

I will be using [unittest][24] for that. We will need the special class, class _unittest.IsolatedAsyncioTestCase_ , to handle our asyncio routines:

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

What is happening in the method _test_log_scroller_ :

  1. Get a Pilot instance using _app.run_test()_. Then click the main button to run the query with the default commands, and then wait until all the events are processes.
  2. Next get the Log from the new screen we pushed and make sure we got some lines back, it is not empty
  3. Then close the new screen and pop the old one back
  4. Finally, press ‘q’ and exit the application



What about the test table, can it be tested?:

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

If you run all the tests you will see something like this:

```

    (Textualize) [josevnz@dmaf5 Textualize]$ python -m unittest tests/*.py
    ..
    ----------------------------------------------------------------------
    Ran 2 tests in 2.065s

    OK

```

Not a bad way to test a TUI, is it?

#### Packaging a Textual application

Packaging is not much different than packaging a regular Python application. You need to remember that you need to include the CSS files that control the appearance of your application:

```

    . ~/virtualenv/Textualize/bin/activate
    python -m build
    pip install dist/KodegeekTextualize-*-py3-none-any.whl

```

This tutorial [pyproject.toml][26] file is a good start that shows you what to do to package your application.

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

#### What is next

This short tutorial only covers a few aspects of Textual. There is so much more to discover and learn:

  * You should definitely take a look at the [official tutorial][27]. Lots of examples and pointers to the reference [API][28].
  * Textual can use _widgets_ from the project that started it all, [Rich][29]. I think some, if not any of these components will get merged into Textual at some point. Textual framework is more capable for complex applications using a high level API, but Rich has lots of nice features.
  * Make your own widgets! Also while designing the TUI, [grab a piece of paper and draw how you picture the components][30] should align together. It will save you time and headaches later.
  * Debugging applications in Python can get complicated. Sometimes you may have to [mix different tools][31] to figure out what is wrong with an application.
  * _Asyncio_ is a complex topic, you should [read the developer documentation][32] to see your alternatives.
  * _Textual_ is used by other projects. One that is super easy to use is [Trogon][33]. It will [make your CLI self discoverable][34].
  * [Textual-web][35] is a promising project that will allow you to run Textual applications on a browser. It is less mature than Textual but is evolving really fast.
  * Finally, [check the external projects][36]. There are a lot of useful Open Source applications in the portfolio.



[][37]

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/crash-course-on-using-textual/

作者：[Jose Nunez][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
