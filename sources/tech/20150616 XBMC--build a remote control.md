XBMC: build a remote control
================================================================================
**Take control of your home media player with a custom remote control running on your Android phone.**

**XBMC** is a great piece of software, and can turn almost can computer into a media centre. It can play music and videos, display pictures, and even fetch a weather forecast. To make it easy to use in a home theatre setup, you can control it via mobile phone apps that access a server running on the XBMC machine via Wi-Fi. There are loads of these available for almost all smartphone systems.

> ### Kodi ###
> 
> By the time you read this, **XBMC** may be no more. The project team have decided to rename it **Kodi** for legal reasons (and because **XBMC**, or X**-Box Media Centre**, refers to older hardware that is no longer supported). Other than the name, though, nothing has changed. Or at least nothing other than the usual raft of improvements you’d expect from a new release. This shouldn’t affect the remote software though, and it should work on both existing **XBMC** systems, and newer Kodi systems.

We’ve recently set up an **XBMC** system for playing music, and none of the XBMC remotes we found really excel at this task, especially when the TV attached to the media centre is turned off. They were all a bit too complex, as they packed too much functionality into small screens. We wanted a system designed from the ground up to just access a music library and a radio addon, so we decided to build one ourselves. It didn’t need to be able to access the full capabilities of XBMC, because for tasks other than music, we’d simply switch back to a general-purpose XBMC remote control. Our test system was a Raspberry Pi running the RaspBMC distribution, but nothing here is specific to either the Pi or that distro, and it should work on any Linux-based XBMC system provided the appropriate packages are available.

The first thing a remote control needs is a user interface. Many XBMC remote controls are written as standalone apps. However, this is just for our music, and we want to be accessible to guests without them having to install anything. The obvious solution is to make a web interface. XBMC does have a built-in web server, but to give us more control, we decided to use a separate web framework. There’s no problem running more than one web server on a computer at a time, but they can’t run on the same port.

There are quite a few web frameworks available. We’ve used Bottle because it’s a simple, fast framework, and we don’t need any complex functions. Bottle is a Python module, so that’s the language in which we’ll write the server.

You’ll probably find Bottle in your package manager. In Debian-based systems (including Raspbmc), you can grab it with:

    sudo apt-get install python-bottle

A remote control is really just a layer that connects the user to a system. Bottle provides what we need to interact with the user, and we’ll interact with **XBMC** using its JSON API. This enables us to control the media player by sending JSON-encoded information.

We’re going to use a simple wrapper around the XBMC JSON API called xbmcjson. It’s just enough to allow you send requests without having to worry about the actual JSON formatting or any of the banalities of communicating with a server. It’s not included in the PIP package manager, so you need to install it straight from **GitHub**:

    git clone https://github.com/jcsaaddupuy/python-xbmc.git
    cd python-xbmc
    sudo python setup.py install

This is everything you need, so let’s get coding.

#### Get started with Bottle ####

The basic structure of our program is:

    from xbmcjson import XBMC
    from bottle import route, run, template, redirect, static_file, request
    import os
    xbmc = XBMC(“http://192.168.0.5/jsonrpc”, “xbmc”, “xbmc”)
    @route(‘/hello/<name>’)
    def index(name):
    return template(‘<h1>Hello {{name}}!</h1>’, name=name)
    run(host=”0.0.0.0”, port=8000)

This connects to **XBMC** (though doesn’t actually use it); then Bottle starts serving up the website. In this case, it listens on host 0.0.0.0 (which is every hostname), and port 8000. It only has one site, which is /hello/XXXX where XXXX can be anything. Whatever XXXX is gets passed to index() as the parameter name. This then passes it to the template, which substitutes it into the HTML.

You can try this out by entering the above into a file (we’ve called it remote.py), and starting it with:

    python remote.py

You can then point your browser to localhost:8000/hello/world to see the template in action.

@route() sets up a path in the web server, and the function index() returns the data for that path. Usually, this means returning HTML that’s generated via a template, but it doesn’t have to be (as we’ll see later).

As we go on, we’ll add more routes to the application to make it a fully-featured XBMC remote control, but it will still be structured in the same way.

The XBMC JSON API can be accessed by any computer on the same network as the XBMC machine. This means that you can develop it on your desktop, then deploy it to your media centre rather than fiddle round uploading every change to your home theatre PC.

Templates – like the simple one in the previous example – are a way of combining Python and HTML to control the output. In principal, they can do quite a bit of processing, but they can get messy. We’ll use them just to format the data correctly. Before we can do that, though, we have to have some data.

> ### Paste ###
> 
> Bottle includes its own web server, which is what we’ve been using for testing the remote control. However, we found that it didn’t always perform well. When we put the remote into action, we wanted something that could deliver pages a bit quicker. Bottle can work with quite a few different web servers, and we found Paste worked quite well. In order to use this, just install it (in the package python-paste on Debian), and change the run call to:
> 
>     run(host=hostname, port=hostport, server=”paste”)
> 
> You can see details of how to use other servers at [http://bottlepy.org/docs/dev/deployment.html][1].

#### Getting data from XBMC ####

The XBMC JSON API is split up into 14 namespaces: JSONRPC, Player, Playlist, Files, AudioLibrary, VideoLibrary, Input, Application, System, Favourites, Profiles, Settings, Textures and XBMC. Each of these is available from an XBMC object in Python (apart from Favourites, in an apparent oversight). In each of these namespaces there are methods that you can use to control the application. For example, Playlist.GetItems() can be used to get the items on a particular playlist. The server returns data to us in JSON, but the xbmcjson module converts it to a Python dictionary for us.

There are two items in XBMC that we need to use to control playback: players and playlists. Players hold a playlist and move through it item by item as each song finishes. In order to see what’s currently playing, we need to get the ID of the active player, and through that find out the ID of the current playlist. We’ve done this with the following function:

    def get_playlistid():
    player = xbmc.Player.GetActivePlayers()
    if len(player[‘result’]) > 0:
    playlist_data = xbmc.Player.GetProperties({“playerid”:0, “properties”:[“playlistid”]})
    if len(playlist_data[‘result’]) > 0 and “playlistid” in playlist_data[‘result’].keys():
    return playlist_data[‘result’][‘playlistid’]
    return -1

If there isn’t a currently active player (that is, if the length of the results section in the returned data is 0), or if the current player has no playlist, this will return -1. Otherwise, it will return the numeric ID of the current playlist.

Once we’ve got the ID of the current playlist, we can get the details of it. For our purposes, two things are important: the list of items in the playlist, and the position we are in the playlist (items aren’t removed from the playlist after they’ve been played; the current position just marches on).

    def get_playlist():
    playlistid = get_playlistid()
    if playlistid >= 0:
    data = xbmc.Playlist.GetItems({“playlistid”:playlistid, “properties”: [“title”, “album”, “artist”, “file”]})
    position_data = xbmc.Player.GetProperties({“playerid”:0, ‘properties’:[“position”]})
    position = int(position_data[‘result’][‘position’])
    return data[‘result’][‘items’][position:], position
    return [], -1

This returns the current playlist starting with the item that’s currently playing (since we don’t care about stuff that’s finished), and it also includes the position as this is needed for removing items from the playlist.

![Image](http://www.linuxvoice.com/wp-content/uploads/2015/04/xbmc2-large.jpg)

The API is documented at [http://wiki.xbmc.org/?title=JSON-RPC_API/v6][2]. It lists all the available functions, but it a little short on details of how to use them.

> ### JSON ###
> 
> JSON stands for JavaScript Object Notation, and was originally designed as a way of serialising JavaScript Objects. It still is used for that, but it’s also a useful way of encoding all sorts of data.
> 
> JSON objects always have the form:
> 
>     {property1:value1, property2:value2, property3:value3}
> 
> For an arbitrary number of property/value pairs. To Python programmers, this all looks suspiciously similar to dictionaries, and the two are very similar.
> 
> As with dictionaries, the value can itself be another JSON object, or a list, so the following is perfectly valid:
> 
>     {“name”:“Ben”, “jobs”:[“cook”, “bottle-washer”], “appearance”: {“height”:195, “skin”:“fair”}}
> 
> JSON is often used in web services to send data back and fourth, and it’s well supported by most programming languages, so if Python’s not your thing, you should easily be able to use the same functions to control XBMC from software written in the language of your choice.

#### Bringing them together ####

The code to link the previous functions to a HTML page is simply:

    @route(‘/juke’)
    def index():
    current_playlist, position = get_playlist()
    return template(‘list’, playlist=current_playlist, offset = position)

This only has to grab the playlist (using the function we defined above), and pass it to a template that handles the display.

The main part of the template that handles the display of this data is:

    <h2>Currently Playing:</h2>
    % if playlist is not None:
    % position = offset
    % for song in playlist:
    <strong> {{song[‘title’]}} </strong>
    % if song[‘type’] == ‘unknown’:
    Radio
    % else:
    {{song[‘artist’][0]}}
    % end
    % if position != offset:
    <a href=”/remove/{{position}}”>remove</a>
    % else:
    <a href=”/skip/{{position}}”>skip</a>
    % end
    <br>
    % position += 1
    % end

As you can see, templates are mostly written in HTML, but with a few extra bits to control output. Variables enclosed by double parenthesise are output in place (as we saw in the first ‘hello world’ example). You can also include Python code on lines starting with a percentage sign. Since indents aren’t used, you need a % end to close any code block (such as a loop or if statement).

This template first checks that the playlist isn’t empty, then loops through every item on the playlist. Each item is displayed as the song title in bold, then the name of the artist, then a link to either skip it (if it’s the currently playing song), or remove it from the playlist. All songs have a type of ‘song’, so if the type is ‘unknown’, then it isn’t a song, but a radio station.

The /remove/ and /skip/ routes are simple wrappers around XBMC controls that reload /juke after the change has taken effect:

    @route(‘/skip/<position>’)
    def index(position):
    print xbmc.Player.GoTo({‘playerid’:0, ‘to’:’next’})
    redirect(“/juke”)
    @route(‘/remove/<position>’)
    def index(position):
    playlistid = get_playlistid()
    if playlistid >= 0:
    xbmc.Playlist.Remove({‘playlistid’:int(playlistid), ‘position’:int(position)})
    redirect(“/juke”)

Of course, it’s no good being able to manage your playlist if you can’t add music to it.

This is complicated slightly by the fact that once a playlist finishes, it disappears, so you need to create a new one. Rather confusingly, playlists are created by calling the Playlist.Clear() method. This can also be used to kill a playlist that is currently playing a radio station (where the type is unknown). The other complication is that radio streams sit in the playlist and never leave, so if there’s currently a radio station playing, we need to clear the playlist as well.

These pages include a link to play the songs, which points to /play/<songid>. This page is handled by:

    @route(‘/play/<id>’)
    def index(id):
    playlistid = get_playlistid()
    playlist, not_needed= get_playlist()
    if playlistid < 0 or playlist[0][‘type’] == ‘unknown’:
    xbmc.Playlist.Clear({“playlistid”:0})
    xbmc.Playlist.Add({“playlistid”:0, “item”:{“songid”:int(id)}})
    xbmc.Player.open({“item”:{“playlistid”:0}})
    playlistid = 0
    else:
    xbmc.Playlist.Add({“playlistid”:playlistid, “item”:{“songid”:int(id)}})
    remove_duplicates(playlistid)
    redirect(“/juke”)

The final thing here is a call to remove_duplicates. This isn’t essential – and some people may not like it – but it makes sure that no song appears in the playlist more than once.

We also have pages that list all the artists in the collection, and list the songs and albums by particular artists. These are quite straightforward, and work in the same basic way as /juke.

![Image](http://www.linuxvoice.com/wp-content/uploads/2015/04/xbmc1-large.jpg)

The UI still needs a bit of attention, but it’s working.

> ### Logging ###
> 
> It’s not always clear how to do something using the XBMC JSON API, and the documentation is sometimes a little opaque. One way of finding out how to do something is seeing how other remote controls do it. If you turn on logging, you can see what API calls are being performed as you use another remote control, then incorporate these into your code.
> 
> To turn on logging, hook your XBMC media centre up to a display and go to Settings > System > Debugging, and turn on Enable Debug Logging. With logging turned on, you need to access the XBMC machine (eg via SSH), then you can view the log. Its location should be displayed in the top-left corner of the XBMC display. In RaspBMC, it’s at /home/pi/.xbmc/temp/xbmc.log. You can then keep an eye on what API calls are being performed in real time using:
> 
>     cd /home/pi/.xbmc/temp
>     tail -f xbmc.log | grep “JSON”

#### Adding functionality ####

The above code all works with songs in the XBMC library, but we also wanted to be able to play radio stations. Addons each have their own plugin URL that can be used to pull information out of them using the usual XBMC JSON commands. For example, to get the selected stations from the radio plugin, we use:

    @route(‘/radio/’)
    def index():
    my_stations = xbmc.Files.GetDirectory({“directory”:”plugin://plugin.audio.radio_de/stations/my/”, “properties”:
    [“title”,”thumbnail”,”playcount”,”artist”,”album”,”episode”,”season”,”showtitle”]})
    if ‘result’ in my_stations.keys():
    return template(‘radio’, stations=my_stations[‘result’][‘files’])
    else:
    return template(‘error’, error=’radio’)

This includes a file that can be added to a playlist just as any song can be. However, these files never finish playing, so (as we saw before) you need to recreate the playlist before adding any songs to it.

#### Sharing songs ####

As well as serving up templates, Bottle can serve static files. These are useful whenever you need things that don’t change based on the user input. That could be a CSS file, an image or an MP3. In our simple controller there’s not (yet) any CSS or images to make things look pretty, but we have added a way to download the songs. This lets the media centre act as a sort of NAS box for songs. If you’re transferring large amounts of data, it’s probably best to use something like Samba, but serving static files is a good way of grabbing a couple of tunes on your phone.

The Bottle code to download a song by its ID is :

    @route(‘/download/<id>’)
    def index(id):
    data = xbmc.AudioLibrary.GetSongDetails({“songid”:int(id), “properties”:[“file”]})
    full_filename = data[‘result’][‘songdetails’][‘file’]
    path, filename = os.path.split(full_filename)
    return static_file(filename, root=path, download=True)

To use this, we just put a link to the appropriate ID in the /songsby/ page.

We’ve gone through all the mechanics of the code, but there are a few more bits that just tie it all together. You can see for yourself at the GitHub page:[https://github.com/ben-ev/xbmc-remote][3].

> ### Setting up ###
> 
> Once you’ve developed your remote control, you’ll need a way of ensuring that it starts every time you turn on your media centre. There are a few ways of doing this, but the easiest is just to add a command launching it to /etc/rc.local. We installed our file to /opt/xbmc-remote/remote.py with all the other files alongside it. We then added the following line to /etc/rc.local before the final exit 0 line.
> 
>     cd /opt/xbmc-remote && python remote.py &

> ### GitHub ###
> 
> This project is quite bare-bones at the moment, but – the business of running a magazine means we don’t have as much time as we’d like to program. However, we’ve set up a GitHub project where we hope to keep working on it, and if you think you’d benefit from the project as well, we’d love your input.
> 
> To see what’s going on, head over to [https://github.com/ben-ev/xbmc-remote][4] and take a look at what state it’s in. You can get a copy of the latest code from that web page, or clone it from the command line.
> 
> If you want to improve it, you can fork the project to develop in your own branch, and then send a pull request when your features are working. For more information on working with GitHub, head to [https://github.com/features][5].

--------------------------------------------------------------------------------

via: http://www.linuxvoice.com/xbmc-build-a-remote-control/

作者：[Ben Everard][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxvoice.com/author/ben_everard/
[1]:http://bottlepy.org/docs/dev/deployment.html
[2]:http://wiki.xbmc.org/?title=JSON-RPC_API/v6
[3]:https://github.com/ben-ev/xbmc-remote
[4]:https://github.com/ben-ev/xbmc-remote
[5]:https://github.com/features