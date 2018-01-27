translating---geekpi

The World Map In Your Terminal
======
I just stumbled upon an interesting utility. The World map in the Terminal! Yes, It is so cool. Say hello to **MapSCII** , a Braille and ASCII world map renderer for your xterm-compatible terminals. It supports GNU/Linux, Mac OS, and Windows. I thought it is a just another project hosted on GitHub. But I was wrong! It is really impressive what they did there. We can use our mouse pointer to drag and zoom in and out a location anywhere in the world map. The other notable features are;

  * Discover Point-of-Interests around any given location
  * Highly customizable layer styling with [Mapbox Styles][1] support
  * Connect to any public or private vector tile server
  * Or just use the supplied and optimized [OSM2VectorTiles][2] based one
  * Work offline and discover local [VectorTile][3]/[MBTiles][4]
  * Compatible with most Linux and OSX terminals
  * Highly optimizied algorithms for a smooth experience



### Displaying the World Map in your Terminal using MapSCII

To open the map, just run the following command from your Terminal:
```
telnet mapscii.me
```

Here is the World map from my Terminal.

[![][5]][6]

Cool, yeah?

To switch to Braille view, press **c**.

[![][5]][7]

Type **c** again to switch back to the previous format **.**

To scroll around the map, use arrow keys **up** , **down** , **left** , **right**. To zoom in/out a location, use **a** and **z** keys. Also, you can use the scroll wheel of your mouse to zoom in or out. To quit the map, press **q**.

Like I already said, don't think it is a simple project. Click on any location on the map and press **" a"** to zoom in.

Here are some the sample screenshots after I zoomed it.

[![][5]][8]

I can be able to zoom to view the states in my country (India).

[![][5]][9]

And the districts in a state (Tamilnadu):

[![][5]][10]

Even the [Taluks][11] and the towns in a district:

[![][5]][12]

And, the place where I completed my schooling:

[![][5]][13]

Even though it is just a smallest town, MapSCII displayed it accurately. MapSCII uses [**OpenStreetMap**][14] to collect the data.

### Install MapSCII locally

Liked it? Great! You can host it on your own system.

Make sure you have installed Node.js on your system. If not, refer the following link.

[Install NodeJS on Linux][15]

Then, run the following command to install it.
```
sudo npm install -g mapscii

```

To launch MapSCII, run:
```
mapscii
```

Have fun! More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/mapscii-world-map-terminal/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.mapbox.com/mapbox-gl-style-spec/
[2]:https://github.com/osm2vectortiles
[3]:https://github.com/mapbox/vector-tile-spec
[4]:https://github.com/mapbox/mbtiles-spec
[5]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[6]:http://www.ostechnix.com/wp-content/uploads/2018/01/MapSCII-1-2.png ()
[7]:http://www.ostechnix.com/wp-content/uploads/2018/01/MapSCII-2.png ()
[8]:http://www.ostechnix.com/wp-content/uploads/2018/01/MapSCII-3.png ()
[9]:http://www.ostechnix.com/wp-content/uploads/2018/01/MapSCII-4.png ()
[10]:http://www.ostechnix.com/wp-content/uploads/2018/01/MapSCII-5.png ()
[11]:https://en.wikipedia.org/wiki/Tehsils_of_India
[12]:http://www.ostechnix.com/wp-content/uploads/2018/01/MapSCII-6.png ()
[13]:http://www.ostechnix.com/wp-content/uploads/2018/01/MapSCII-7.png ()
[14]:https://www.openstreetmap.org/
[15]:https://www.ostechnix.com/install-node-js-linux/
