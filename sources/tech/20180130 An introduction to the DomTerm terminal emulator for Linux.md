An introduction to the DomTerm terminal emulator for Linux
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_terminals.png?itok=CfBqYBah)

[DomTerm][1] is a modern terminal emulator that uses a browser engine as a "GUI toolkit." This enables some neat features, such as embeddable graphics and links, HTML rich text, and foldable (show/hide) commands. Otherwise it looks and feels like a feature-full, standalone terminal emulator, with excellent xterm compatibility (including mouse handling and 24-bit color), and appropriate "chrome" (menus). In addition, there is built-in support for session management and sub-windows (as in `tmux` and `GNU screen`), basic input editing (as in `readline`), and paging (as in `less`).

![](https://opensource.com/sites/default/files/u128651/domterm1.png)
Image 1: The DomTerminal terminal emulator. View larger image.

Below we'll look more at these features. We'll assume you have `domterm` installed (skip to the end of this article if you need to get and build DomTerm). First, though, here's a quick overview of the technology.

### Frontend vs. backend

Most of DomTerm is written in JavaScript and runs in a browser engine. This can be a desktop web browser, such as Chrome or Firefox (see image 3), or it can be an embedded browser. Using a general web browser works fine, but the user experience isn't as nice (as the menus are designed for general browsing, not for a terminal emulator), and the security model gets in the way, so using an embedded browser is nicer.

The following are currently supported:

  * `qtdomterm`, which uses the Qt toolkit and `QtWebEngine`
  * An `[Electron][2]` embedding (see image 1)
  * `atom-domterm` runs DomTerm as a package in the [Atom text editor][3] (which is also based on Electron) and integrates with the Atom pane system (see image 2)
  * A wrapper for JavaFX's `WebEngine`, which is useful for code written in Java (see image 4)
  * Previously, the preferred frontend used [Firefox-XUL][4], but Mozilla has since dropped XUL



![DomTerm terminal panes in Atom editor][6]

Image 2: DomTerm terminal panes in Atom editor. [View larger image.][7]

Currently, the Electron frontend is probably the nicest option, closely followed by the Qt frontend. If you use Atom, `atom-domterm` works pretty well.

The backend server is written in C. It manages pseudo terminals (PTYs) and sessions. It is also an HTTP server that provides the JavaScript and other files to the frontend. The `domterm` command starts terminal jobs and performs other requests. If there is no server running, `domterm` daemonizes itself. Communication between the backend and the server is normally done using WebSockets (with [libwebsockets][8] on the server). However, the JavaFX embedding uses neither WebSockets nor the DomTerm server; instead Java applications communicate directly using the Java-JavaScript bridge.

### A solid xterm-compatible terminal emulator

DomTerm looks and feels like a modern terminal emulator. It handles mouse events, 24-bit color, Unicode, double-width (CJK) characters, and input methods. DomTerm does a very good job on the [vttest testsuite][9].

Unusual features include:

**Show/hide buttons ("folding"):** The little triangles (seen in image 2 above) are buttons that hide/show the corresponding output. To create the buttons, just add certain [escape sequences][10] in the [prompt text][11].

**Mouse-click support for`readline` and similar input editors:** If you click in the (yellow) input area, DomTerm will send the right sequence of arrow-key keystrokes to the application. (This is enabled by escape sequences in the prompt; you can also force it using Alt+Click.)

**Style the terminal using CSS:** This is usually done in `~/.domterm/settings.ini`, which is automatically reloaded when saved. For example, in image 2, terminal-specific background colors were set.

### A better REPL console

A classic terminal emulator works on rectangular grids of character cells. This works for a REPL (command shell), but it is not ideal. Here are some DomTerm features useful for REPLs that are not typically found in terminal emulators:

**A command can "print" an image, a graph, a mathematical formula, or a set of clickable links:** An application can send an escape sequence containing almost any HTML. (The HTML is scrubbed to remove JavaScript and other dangerous features.)

The image 3 shows a fragment from a [`gnuplot`][12] session. Gnuplot (2.1 or later) supports `domterm` as a terminal type. Graphical output is converted to an [SVG image][13], which is then printed to the terminal. My blog post [Gnuplot display on DomTerm][14] provides more information on this.

![](https://opensource.com/sites/default/files/dt-gnuplot.png)
Image 3: Gnuplot screenshot. View larger image.

The [Kawa][15] language has a library for creating and transforming [geometric picture values][16]. If you print such a picture value to a DomTerm terminal, the picture is converted to SVG and embedded in the output.

![](https://opensource.com/sites/default/files/dt-kawa1.png)
Image 4: Computable geometry in Kawa. View larger image.

**Rich text in output:** Help messages are more readable and look nicer with HTML styling. The lower pane of image 1 shows the ouput from `domterm help`. (The output is plaintext if not running under DomTerm.) Note the `PAUSED` message from the built-in pager.

**Error messages can include clickable links:** DomTerm recognizes the syntax `filename:line:column:` and turns it into a link that opens the file and line in a configurable text editor. (This works for relative filenames if you use `PROMPT_COMMAND` or similar to track directories.)

A compiler can detect that it is running under DomTerm and directly emit file links in an escape sequence. This is more robust than depending on DomTerm's pattern matching, as it handles spaces and other special characters, and it does not depend on directory tracking. In image 4, you can see error messages from the [Kawa compiler][15]. Hovering over the file position causes it to be underlined, and the `file:` URL shows in the `atom-domterm` message area (bottom of the window). (When not using `atom-domterm`, such messages are shown in an overlay box, as seen for the `PAUSED` message in image 1.)

The action when clicking on a link is configurable. The default action for a `file:` link with a `#position` suffix is to open the file in a text editor.

**Structured internal representation:** The following are all represented in the internal node structure: Commands, prompts, input lines, normal and error output, tabs, and preserving the structure if you "Save as HTML." The HTML file is compatible with XML, so you can use XML tools to search or transform the output. The command `domterm view-saved` opens a saved HTML file in a way that enables command folding (show/hide buttons are active) and reflow on window resize.

**Built-in Lisp-style pretty-printing:** You can include pretty-printing directives (e.g., grouping) in the output such that line breaks are recalculated on window resize. See my article [Dynamic pretty-printing in DomTerm][17] for a deeper discussion.

**Basic built-in line editing** with history (like `GNU readline`): This uses the browser's built-in editor, so it has great mouse and selection handling. You can switch between normal character-mode (most characters typed are sent directly to the process); or line-mode (regular characters are inserted while control characters cause editing actions, with Enter sending the edited line to the process). The default is automatic mode, where DomTerm switches between character-mode and line-mode depending on whether the PTY is in raw or canonical mode.

**A built-in pager** (like a simplified `less`): Keyboard shortcuts will control scrolling. In "paging mode," the output pauses after each new screen (or single line, if you move forward line-by-line). The paging mode is unobtrusive and smart about user input, so you can (if you wish) run it without it interfering with interactive programs.

### Multiplexing and sessions

**Tabs and tiling:** Not only can you create multiple terminal tabs, you can also tile them. You can use either the mouse or a keyboard shortcut to move between panes and tabs as well as create new ones. They can be rearranged and resized with the mouse. This is implemented using the [GoldenLayout][18] JavaScript library. [Image 1][19] shows a window with two panes. The top one has two tabs, with one running [Midnight Commander][20]; the bottom pane shows `domterm help` output as HTML. However, on Atom we instead use its built-in draggable tiles and tabs; you can see this in image 2.

**Detaching and reattaching to sessions:** DomTerm supports sessions arrangement, similar to `tmux` and GNU `screen`. You can even attach multiple windows or panes to the same session. This supports multi-user session sharing and remote connections. (For security, all sessions of the same server need to be able to read a Unix domain socket and a local file containing a random key. This restriction will be lifted when we have a good, safe remote-access story.)

**The** **`domterm`** **command** is also like `tmux` or GNU `screen` in that has multiple options for controlling or starting a server that manages one or more sessions. The major difference is that, if it's not already running under DomTerm, the `domterm` command creates a new top-level window, rather than running in the existing terminal.

The `domterm` command has a number of sub-commands, similar to `tmux` or `git`. Some sub-commands create windows or sessions. Others (such as "printing" an image) only work within an existing DomTerm session.

The command `domterm browse` opens a window or pane for browsing a specified URL, such as when browsing documentation.

### Getting and installing DomTerm

DomTerm is available from its [GitHub repository][21]. Currently, there are no prebuilt packages, but there are [detailed instructions][22]. All prerequisites are available on Fedora 27, which makes it especially easy to build.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/introduction-domterm-terminal-emulator

作者：[Per Bothner][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/perbothner
[1]:http://domterm.org/
[2]:https://electronjs.org/
[3]:https://atom.io/
[4]:https://en.wikipedia.org/wiki/XUL
[5]:/file/385346
[6]:https://opensource.com/sites/default/files/images/dt-atom1.png (DomTerm terminal panes in Atom editor)
[7]:https://opensource.com/sites/default/files/images/dt-atom1.png
[8]:https://libwebsockets.org/
[9]:http://invisible-island.net/vttest/
[10]:http://domterm.org/Wire-byte-protocol.html
[11]:http://domterm.org/Shell-prompts.html
[12]:http://www.gnuplot.info/
[13]:https://developer.mozilla.org/en-US/docs/Web/SVG
[14]:http://per.bothner.com/blog/2016/gnuplot-in-domterm/
[15]:https://www.gnu.org/software/kawa/
[16]:https://www.gnu.org/software/kawa/Composable-pictures.html
[17]:http://per.bothner.com/blog/2017/dynamic-prettyprinting/
[18]:https://golden-layout.com/
[19]:https://opensource.com/sites/default/files/u128651/domterm1.png
[20]:https://midnight-commander.org/
[21]:https://github.com/PerBothner/DomTerm
[22]:http://domterm.org/Downloading-and-building.html
