[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How I stream video with OBS and WebSockets)
[#]: via: (https://opensource.com/article/20/6/obs-websockets-streaming)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

How I stream video with OBS and WebSockets
======
Take control of your streaming with these open source supporting tools
that simplify WebSockets.
![An old-fashioned video camera][1]

[OBS][2] is one of the staples of live streaming videos now. It is the preferred software for streaming to Twitch, one of the most popular live video sites around. There are some really nice add-ons to allow a streamer to control things from their phone or another screen without disrupting the running video. It turns out, it is really easy to build your own control panel using [Node-RED][3] and the [obs-websockets][4] plugin.

![My OBS Control Dashboard][5]

My OBS control dashboard

I know what many of you are thinking—"He said WebSockets and easy in the same sentence?" Many people have had difficulty setting up and using WebSockets, which allow for bi-directional communication over a single connection via a web server. Node-RED has built-in support for WebSockets and is the part that makes this easy, at least compared to writing your own client/server.

Before starting, make sure you have OBS installed and configured. Start by downloading and installing the [latest stable release of the obs-websockets][6] plugin. For this article, the default settings are fine, but I strongly recommend following the instructions for securing obs-websockets in the future.

Next, [download and install Node-RED][7], either on the same system or on a different one (like a Raspberry Pi). Again, the default installation is fine for our purposes, but it would be wise to secure the installation following the directions on their site.

Now for the fun parts. Start Node-RED and open up the web interface (by default at <http://localhost:1880>), and you have a blank canvas. Open up the "hamburger" menu on the right and select "Manage Palate." Then click on the "Install" tab and search for the "node-red-contrib-dashboard" and "node-red-contrib-rbe" modules.

Once those are installed, click on the right-hand list and drag-and-drop the following blocks to the canvas:

  * 1 Websocket Out
  * 1 Websocket In
  * 1 Debug
  * 1 Inject
  * 1 Switch
  * 1 Change
  * 2 JSON
  * 1 Catch



Connect them in the following orders:


```
Inject-&gt;Button-&gt;Change-&gt;JSON-&gt;Websocket Out

Websocket In-&gt;JSON-&gt;Switch-&gt;RBE-&gt;Debug

Catch-&gt;Debug
```

![The basic flows][8]

The basic flows

When the button is pushed (or the Inject node sends a timestamp), a payload is sent through the change node, converted from a JSON object to a string, then sent to the WebSocket Out node. When a message is received by the WebSocket In node, it is converted to a JSON object, and if it is not a duplicate, sent to the Debug node for output. And the Catch node will catch any errors and put them into the debug panel.

What is in that payload? Let's set everything up and find out.

First, double click the `button` to open the settings dialog. Start by changing the payload to "JSON" using the drop-down menu. In the field, add the following:


```
{"request-type":"GetVersion"}
```

Enable the checkbox for "If msg arrives on input, emulate a button click" and click Done to close the button config. When a message comes from the Inject node, or if the button is pressed in the UI, it will send the JSON payload to the next node.

![Setting up the button][9]

Setting up the button

Now open up the Change node. We want to set `msg.payload.message-id` to `msg._msgid` by changing the first field from `payload` to `payload.message-id` and then using the drop-down on the second field to change the type from `String` to `msg.,` then we will put `_msgid` in the field. This copies the unique message ID to the JSON object payload so that each request has a unique ID for tracking.

This is then sent to the JSON node to convert from a JSON object to a string, and then passed to the Websocket Out node. Open up the Websocket Out node to configure the connection to OBS. First, change the `Type` to `Connect to` and then click the pencil icon to create a new connection URL. Set that to `ws://OBSMachine:4444/` and close the dialog to save. `OBSMachine` is the name of the machine OBS and obs-websocket are running on. For example, if Node-RED is running on the same machine, this would be `ws://localhost:4444`, and if it is on a machine named "luxuria.local" then it would be `ws://luxuria.local:4444`. Close and update the Websocket Out node. This sends the payload text string to the WebSocket in OBS.

![Websocket Out Node configuration][10]

Websocket Out Node configuration

On to the WebSocket In flow! Open the WebSocket In node, and set it to a `Type` of `Connect to` and the URL to the connection we defined before (it should auto-fill). Next in line is the second JSON node, which we can leave alone. This accepts output from OBS and converts it into a payload object.

Next, we will filter the regular heartbeat and status updates from everything else. Open up the switch and set the "Property" value to `payload["update-type"]`. Now select `Is Not Null` from the drop-down below it. Click `+` to add a second option and select `otherwise` from the drop-down.

![Switch Node configuration][11]

Switch Node configuration

Connect the new output on the switch directly to the Debug node input.

The RBE node, which will filter out duplicates, needs to be told what field to watch for. Since it should be connected to the output from the switch that sends nothing but status updates, this is important, as obs-websocket is sending updates every few seconds. By default, the RBE compares the entire payload object, which will constantly be changing. Open up the RBE Node, and change the `Property` from `payload` to `payload.streaming`. If the `streaming` value of the payload changes, then pass the message through; otherwise, discard it.

The final step is to change the Debug node output from `msg.payload` to the complete msg object. This allows us to see the entire object, which sometimes has useful information outside the `payload`.

Now, click `Deploy` to activate the changes. Hopefully, the WebSocket nodes will have a green "Connected" message underneath them. If they are red or yellow, the connection URL is likely incorrect and needs to be updated, or the connection is being blocked. Make sure that port 4444 on the remote machine is open and available, and that OBS is running!

Without the RBE node filtering on the `streaming` value, the debug panel (the bug icon on the right of the canvas) would be filling with Heartbeat messages about now. Click the button to the left of the Inject node to send a signal that will simulate a button click. If all is well, you should see an object arrive that has a listing of all the things `obs-websocket` can do.

![The response to "GetVersion"][12]

The response to "GetVersion"

Now open up `http://localhost:1880/ui` in another tab or window. It should show a single button. Press it! The debug panel should show the same information as before.

Congrats! You have sent your first (and hopefully not last) WebSocket message to OBS!

This is just the beginning of what can be done with `obs-websockets` and Node-RED. The complete documentation of what is supported is documented in the protocol.md file in the GitHub repository for obs-websockets. With a little experimentation, you can create a full-featured control panel to start and stop streaming, change scenes, and a whole lot more. If you are like me, you'll have all kinds of controls set up before you know it.

![OBS Websocket][13]

I may have gotten a little mad with power.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/obs-websockets-streaming

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LIFE_film.png?itok=aElrLLrw (An old-fashioned video camera)
[2]: https://obsproject.com/
[3]: https://nodered.org/
[4]: https://github.com/Palakis/obs-websocket
[5]: https://opensource.com/sites/default/files/uploads/obscontrol-img1.png.jpg (My OBS Control Dashboard)
[6]: https://github.com/palakis/obs-websocket/releases
[7]: https://nodered.org/docs/getting-started/
[8]: https://opensource.com/sites/default/files/uploads/obscontrol-img2.png.jpg (The basic flows)
[9]: https://opensource.com/sites/default/files/uploads/obscontrol-img3.png.jpg (Setting up the button)
[10]: https://opensource.com/sites/default/files/uploads/obscontrol-img4.png.jpg (Websocket Out Node configuration)
[11]: https://opensource.com/sites/default/files/uploads/obscontrol-img5.png.jpg (Switch Node configuration)
[12]: https://opensource.com/sites/default/files/uploads/obscontrol-img6.png.jpg (The response to "GetVersion")
[13]: https://opensource.com/sites/default/files/uploads/obscontrol-img7.png.jpg (OBS Websocket)
