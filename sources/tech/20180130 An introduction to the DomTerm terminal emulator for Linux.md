An introduction to the DomTerm terminal emulator for Linux
============================================================

### Learn about DomTerm, a terminal emulator and multiplexer with HTML graphics and other unusual features.

![Terminal](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_terminals.png?itok=CfBqYBah "Terminal")
Image by : 

[Jamie Cox][25]. Modified by Opensource.com. [CC BY 2.0.][26]

[DomTerm][27] is a modern terminal emulator that uses a browser engine as a "GUI toolkit." This enables some neat features, such as embeddable graphics and links, HTML rich text, and foldable (show/hide) commands. Otherwise it looks and feels like a feature-full, standalone terminal emulator, with excellent xterm compatibility (including mouse handling and 24-bit color), and appropriate "chrome" (menus). In addition, there is built-in support for session management and sub-windows (as in `tmux` and `GNU screen`), basic input editing (as in `readline`), and paging (as in `less`). 

### [domterm1.png][10]

![DomTerminal terminal emulator](https://opensource.com/sites/default/files/u128651/domterm1.png "DomTerminal terminal emulator")

Image 1: The DomTerminal terminal emulator.  _[View larger image.][1]_ 

Below we'll look more at these features. We'll assume you have `domterm` installed (skip to the end of this article if you need to get and build DomTerm). First, though, here's a quick overview of the technology.

### Frontend vs. backend

More Linux resources

*   [What is Linux?][2]

*   [What are Linux containers?][3]

*   [Download Now: Linux commands cheat sheet][4]

*   [Advanced Linux commands cheat sheet][5]

*   [Our latest Linux articles][6]

Most of DomTerm is written in JavaScript and runs in a browser engine. This can be a desktop web browser, such as Chrome or Firefox (see [image 3][28]), or it can be an embedded browser. Using a general web browser works fine, but the user experience isn't as nice (as the menus are designed for general browsing, not for a terminal emulator), and the security model gets in the way, so using an embedded browser is nicer.

The following are currently supported:

*   `qtdomterm`, which uses the Qt toolkit and `QtWebEngine`

*   An `[Electron][11]` embedding (see [image 1][16])

*   `atom-domterm` runs DomTerm as a package in the [Atom text editor][17] (which is also based on Electron) and integrates with the Atom pane system (see [image 2][18])

*   A wrapper for JavaFX's `WebEngine`, which is useful for code written in Java (see [image 4][19])

*   Previously, the preferred frontend used [Firefox-XUL][20], but Mozilla has since dropped XUL

### [dt-atom1.png][12]

![DomTerm terminal panes in Atom editor](https://opensource.com/sites/default/files/images/dt-atom1.png "DomTerm terminal panes in Atom editor")

Image 2: DomTerm terminal panes in Atom editor.  _[View larger image.][7]_ 

Currently, the Electron frontend is probably the nicest option, closely followed by the Qt frontend. If you use Atom, `atom-domterm` works pretty well.

The backend server is written in C. It manages pseudo terminals (PTYs) and sessions. It is also an HTTP server that provides the JavaScript and other files to the frontend. The `domterm` command starts terminal jobs and performs other requests. If there is no server running, `domterm` daemonizes itself. Communication between the backend and the server is normally done using WebSockets (with [libwebsockets][29] on the server). However, the JavaFX embedding uses neither WebSockets nor the DomTerm server; instead Java applications communicate directly using the Java–JavaScript bridge.

### A solid xterm-compatible terminal emulator

DomTerm looks and feels like a modern terminal emulator. It handles mouse events, 24-bit color, Unicode, double-width (CJK) characters, and input methods. DomTerm does a very good job on the [vttest testsuite][30].

Unusual features include:

**Show/hide buttons ("folding"):** The little triangles (seen in [image 2][31] above) are buttons that hide/show the corresponding output. To create the buttons, just add certain [escape sequences][32] in the [prompt text][33].

**Mouse-click support for `readline` and similar input editors:** If you click in the (yellow) input area, DomTerm will send the right sequence of arrow-key keystrokes to the application. (This is enabled by escape sequences in the prompt; you can also force it using Alt+Click.)

**Style the terminal using CSS:** This is usually done in `~/.domterm/settings.ini`, which is automatically reloaded when saved. For example, in [image 2][34], terminal-specific background colors were set.

### A better REPL console

A classic terminal emulator works on rectangular grids of character cells. This works for a REPL (command shell), but it is not ideal. Here are some DomTerm features useful for REPLs that are not typically found in terminal emulators:

**A command can "print" an image, a graph, a mathematical formula, or a set of clickable links:** An application can send an escape sequence containing almost any HTML. (The HTML is scrubbed to remove JavaScript and other dangerous features.) 

The [image 3][35] shows a fragment from a [`gnuplot`][36] session. Gnuplot (2.1 or later) supports `domterm` as a terminal type. Graphical output is converted to an [SVG image][37], which is then printed to the terminal. My blog post [Gnuplot display on DomTerm][38]provides more information on this.

### [dt-gnuplot.png][13]

![Image 3: Gnuplot screenshot](https://opensource.com/sites/default/files/dt-gnuplot.png "Image 3: Gnuplot screenshot")

Image 3: Gnuplot screenshot.  _[View larger image.][8]_ 

The [Kawa][39] language has a library for creating and transforming [geometric picture values][40]. If you print such a picture value to a DomTerm terminal, the picture is converted to SVG and embedded in the output.

### [dt-kawa1.png][14]

![Image 4: Computable geometry in Kawa](https://opensource.com/sites/default/files/dt-kawa1.png "Image 4: Computable geometry in Kawa")

Image 4: Computable geometry in Kawa.  _[View larger image.][9]_ 

**Rich text in output:** Help messages are more readable and look nicer with HTML styling. The lower pane of [image 1][41] shows the ouput from `domterm help`. (The output is plaintext if not running under DomTerm.) Note the `PAUSED` message from the built-in pager.

**Error messages can include clickable links:** DomTerm recognizes the syntax `<var style="font-size: 1em; line-height: 1.5em;">filename</var>:<var style="font-size: 1em; line-height: 1.5em;">line</var>:<var style="font-size: 1em; line-height: 1.5em;">column:</var>` and turns it into a link that opens the file and line in a configurable text editor. (This works for relative filenames if you use `PROMPT_COMMAND` or similar to track directories.)

A compiler can detect that it is running under DomTerm and directly emit file links in an escape sequence. This is more robust than depending on DomTerm's pattern matching, as it handles spaces and other special characters, and it does not depend on directory tracking. In [image 4][42], you can see error messages from the [Kawa compiler][43]. Hovering over the file position causes it to be underlined, and the `file:`URL shows in the `atom-domterm` message area (bottom of the window). (When not using `atom-domterm`, such messages are shown in an overlay box, as seen for the `PAUSED` message in [image 1][44].)

The action when clicking on a link is configurable. The default action for a `file:` link with a `#position` suffix is to open the file in a text editor.

**Structured internal representation:** The following are all represented in the internal node structure: Commands, prompts, input lines, normal and error output, tabs, and preserving the structure if you "Save as HTML." The HTML file is compatible with XML, so you can use XML tools to search or transform the output. The command `domterm view-saved` opens a saved HTML file in a way that enables command folding (show/hide buttons are active) and reflow on window resize.

**Built-in Lisp-style pretty-printing:** You can include pretty-printing directives (e.g., grouping) in the output such that line breaks are recalculated on window resize. See my article [Dynamic pretty-printing in DomTerm][45] for a deeper discussion.

**Basic built-in line editing** with history (like `GNU readline`): This uses the browser's built-in editor, so it has great mouse and selection handling. You can switch between normal character-mode (most characters typed are sent directly to the process); or line-mode (regular characters are inserted while control characters cause editing actions, with Enter sending the edited line to the process). The default is automatic mode, where DomTerm switches between character-mode and line-mode depending on whether the PTY is in <q style="quotes: &quot;“&quot; &quot;”&quot; &quot;‘&quot; &quot;’&quot;;">raw<q style="quotes: &quot;“&quot; &quot;”&quot; &quot;‘&quot; &quot;’&quot;;"> or <q style="quotes: &quot;“&quot; &quot;”&quot; &quot;‘&quot; &quot;’&quot;;">canonical</q> mode.</q></q>

**A built-in pager** (like a simplified `less`): Keyboard shortcuts will control scrolling. In "paging mode," the output pauses after each new screen (or single line, if you move forward line-by-line). The paging mode is unobtrusive and smart about user input, so you can (if you wish) run it without it interfering with interactive programs.

### Multiplexing and sessions

**Tabs and tiling:** Not only can you create multiple terminal tabs, you can also tile them. You can use either the mouse or a keyboard shortcut to move between panes and tabs as well as create new ones. They can be rearranged and resized with the mouse. This is implemented using the [GoldenLayout][46] JavaScript library. [Image 1][47]shows a window with two panes. The top one has two tabs, with one running [Midnight Commander][48]; the bottom pane shows `domterm help` output as HTML. However, on Atom we instead use its built-in draggable tiles and tabs; you can see this in [image 2][49].

**Detaching and reattaching to sessions:** DomTerm supports sessions arrangement, similar to `tmux` and GNU `screen`. You can even attach multiple windows or panes to the same session. This supports multi-user session sharing and remote connections. (For security, all sessions of the same server need to be able to read a Unix domain socket and a local file containing a random key. This restriction will be lifted when we have a good, safe remote-access story.)

**The ****`domterm`**** command** is also like `tmux` or GNU `screen` in that has multiple options for controlling or starting a server that manages one or more sessions. The major difference is that, if it's not already running under DomTerm, the `domterm` command creates a new top-level window, rather than running in the existing terminal.

The `domterm` command has a number of sub-commands, similar to `tmux` or `git`. Some sub-commands create windows or sessions. Others (such as "printing" an image) only work within an existing DomTerm session.

The command `domterm browse` opens a window or pane for browsing a specified URL, such as when browsing documentation.

### Getting and installing DomTerm

DomTerm is available from its [GitHub repository][50]. Currently, there are no prebuilt packages, but there are [detailed instructions][51]. All prerequisites are available on Fedora 27, which makes it especially easy to build.

### About the author

 [![Per Bothner](https://opensource.com/sites/default/files/styles/profile_pictures/public/pictures/per180116a.jpg?itok=dNNCOoqX)][52] Per Bothner - Per has been involved with Open Source since before the term existed. He was an early employee of Cygnus (later purchased by Red Hat), which was the first company commercializing Free Software. There he worked on gcc, g++, libio (the precursor to GNU/Linux stdio), gdb, Kawa, and more. Later he worked in the Java group at Sun and Oracle. Per wrote the Emacs term mode. Currently, Per spends too much time on [Kawa][21] (a Scheme compiler... [more about Per Bothner][22][More about me][23]

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/introduction-domterm-terminal-emulator

作者：[ Per Bothner][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/perbothner
[1]:https://opensource.com/sites/default/files/u128651/domterm1.png
[2]:https://opensource.com/resources/what-is-linux?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[3]:https://opensource.com/resources/what-are-linux-containers?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[4]:https://developers.redhat.com/promotions/linux-cheatsheet/?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[5]:https://developers.redhat.com/cheat-sheet/advanced-linux-commands-cheatsheet?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[6]:https://opensource.com/tags/linux?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[7]:https://opensource.com/sites/default/files/images/dt-atom1.png
[8]:https://opensource.com/sites/default/files/dt-gnuplot.png
[9]:https://opensource.com/sites/default/files/dt-kawa1.png
[10]:https://opensource.com/file/384931
[11]:https://electronjs.org/
[12]:https://opensource.com/file/385346
[13]:https://opensource.com/file/385326
[14]:https://opensource.com/file/385331
[15]:https://opensource.com/article/18/1/introduction-domterm-terminal-emulator?rate=9HfSplqf1e4NohKkTld_881cH1hXTlSwU_2XKrnpTJQ
[16]:https://opensource.com/article/18/1/introduction-domterm-terminal-emulator#image1
[17]:https://atom.io/
[18]:https://opensource.com/article/18/1/introduction-domterm-terminal-emulator#image2
[19]:https://opensource.com/article/18/1/introduction-domterm-terminal-emulator#image4
[20]:https://en.wikipedia.org/wiki/XUL
[21]:https://www.gnu.org/software/kawa/
[22]:https://opensource.com/users/perbothner
[23]:https://opensource.com/users/perbothner
[24]:https://opensource.com/user/205986/feed
[25]:https://www.flickr.com/photos/15587432@N02/3281139507/
[26]:http://creativecommons.org/licenses/by/2.0
[27]:http://domterm.org/
[28]:https://opensource.com/article/18/1/introduction-domterm-terminal-emulator#image3
[29]:https://libwebsockets.org/
[30]:http://invisible-island.net/vttest/
[31]:https://opensource.com/article/18/1/introduction-domterm-terminal-emulator#image2
[32]:http://domterm.org/Wire-byte-protocol.html
[33]:http://domterm.org/Shell-prompts.html
[34]:https://opensource.com/article/18/1/introduction-domterm-terminal-emulator#image2
[35]:https://opensource.com/article/18/1/introduction-domterm-terminal-emulator#image3
[36]:http://www.gnuplot.info/
[37]:https://developer.mozilla.org/en-US/docs/Web/SVG
[38]:http://per.bothner.com/blog/2016/gnuplot-in-domterm/
[39]:https://www.gnu.org/software/kawa/
[40]:https://www.gnu.org/software/kawa/Composable-pictures.html
[41]:https://opensource.com/article/18/1/introduction-domterm-terminal-emulator#image1
[42]:https://opensource.com/article/18/1/introduction-domterm-terminal-emulator#image4
[43]:https://www.gnu.org/software/kawa/
[44]:https://opensource.com/article/18/1/introduction-domterm-terminal-emulator#image1
[45]:http://per.bothner.com/blog/2017/dynamic-prettyprinting/
[46]:https://golden-layout.com/
[47]:https://opensource.com/sites/default/files/u128651/domterm1.png
[48]:https://midnight-commander.org/
[49]:https://opensource.com/article/18/1/introduction-domterm-terminal-emulator#image2
[50]:https://github.com/PerBothner/DomTerm
[51]:http://domterm.org/Downloading-and-building.html
[52]:https://opensource.com/users/perbothner
[53]:https://opensource.com/users/perbothner
[54]:https://opensource.com/users/perbothner
[55]:https://opensource.com/tags/linux