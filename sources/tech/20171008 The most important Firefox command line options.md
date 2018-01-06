translating by lujun9972
The most important Firefox command line options
======
The Firefox web browser supports a number of command line options that it can be run with to customize startup of the web browser.

You may have come upon some of them in the past, for instance the command -P "profile name" to start the browser with the specified profile, or -private to start a new private browsing session.

The following guide lists important command line options for Firefox. It is not a complete list of all available options, as many are used only for specific purposes that have little to no value to users of the browser.

You find the [complete][1] listing of command line options on the Firefox Developer website. Note that many of the command line options work in other Mozilla-based products, even third-party programs, as well.

### Important Firefox command line options

![firefox command line][2]

 **Profile specific options**

  *  **-CreateProfile profile name** -- This creates a new user profile, but won't start it right away.
  *  **-CreateProfile "profile name profile dir"** -- Same as above, but will specify a custom profile directory on top of that.
  *  **-ProfileManager** , or **-P** -- Opens the built-in profile manager.
  * - **P "profile name"** -- Starts Firefox with the specified profile. Profile manager is opened if the specified profile does not exist. Works only if no other instance of Firefox is running.
  *  **-no-remote** -- Add this to the -P commands to create a new instance of the browser. This lets you run multiple profiles at the same time.



 **Browser specific options**

  *  **-headless** -- Start Firefox in headless mode. Requires Firefox 55 on Linux, Firefox 56 on Windows and Mac OS X.
  *  **-new-tab URL** -- loads the specified URL in a new tab in Firefox.
  *  **-new-window URL** -- loads the specified URL in a new Firefox window.
  *  **-private** -- Launches Firefox in private browsing mode. Can be used to run Firefox in private browsing mode all the time.
  *  **-private-window** -- Open a private window.
  *  **-private-window URL** -- Open the URL in a new private window. If a private browsing window is open already, open the URL in that window instead.
  *  **-search term** -- Run the search using the default Firefox search engine.
  * - **url URL** -- Load the URL in a new tab or window. Can be run without -url, and multiple URLs separated by space can be opened using the command.



Other options

  *  **-safe-mode** -- Starts Firefox in Safe Mode. You may also hold down the Shift-key while opening Firefox to start the browser in Safe Mode.
  *  **-devtools** -- Start Firefox with Developer Tools loaded and open.
  *  **-inspector URL** -- Inspect the specified address in the DOM Inspector.
  *  **-jsconsole** -- Start Firefox with the Browser Console.
  *  **-tray** -- Start Firefox minimized.




--------------------------------------------------------------------------------

via: https://www.ghacks.net/2017/10/08/the-most-important-firefox-command-line-options/

作者：[Martin Brinkmann][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ghacks.net/author/martin/
[1]:https://developer.mozilla.org/en-US/docs/Mozilla/Command_Line_Options
