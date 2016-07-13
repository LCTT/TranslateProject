chunyang-wen translating
Writing online multiplayer game with python and asyncio - Part 3
=================================================================

![](https://7webpages.com/media/cache/17/81/178135a6db5074c72a1394d31774c658.gif)

In this series, we are making an asynchronous Python app on the example of a multiplayer [Snake game][1]. The previous article focused on [Writing Game Loop][2] and Part 1 was covering how to [Get Asynchronous][3].

You can find the code [here][4].

### 4. Making a complete game

![](https://7webpages.com/static/img/14chs7.gif)

#### 4.1 Project's overview

In this part, we will review a design of a complete online game. It is a classic snake game with added multiplayer. You can try it yourself at (<http://snakepit-game.com>). A source code is located [in github repository][5]. The game consists of the following files:

- [server.py][6] - a server handling main game loop and connections.
- [game.py][7] - a main Game class, which implements game's logic and most of the game's network protocol.
- [player.py][8] - Player class, containing individual player's data and snake's representation. This one is responsible for getting player's input and moving the snake accordingly.
- [datatypes.py][9] - basic data structures.
- [settings.py][10] - game settings, and it has descriptions in commentaries.
- [index.html][11] - all html and javascript client part in one file.

#### 4.2 Inside a game loop

Multiplayer snake game is a good example to learn because of its simplicity. All snakes move to one position every single frame, and frames are changing at a very slow rate, allowing you to watch how game engine is working actually. There is no instant reaction to player's keypresses because of the slow speed. A pressed key is remembered and then taken into account while calculating the next frame at the end of game loop's iteration.

> Modern action games are running at much higher frame rates and often frame rates of server and client are not equal. Client frame rate usually depends on the client hardware performance, while server frame rate is fixed. A client may render several frames after getting the data corresponding to one "game tick". This allows to create smooth animations, which are only limited by client's performance. In this case, a server should pass not only current positions of the objects but also their moving directions, speeds and velocities. And while client frame rate is called FPS (frames per second), sever frame rate is called TPS (ticks per second). In this snake game example both values are equal, and one frame displayed by a client is calculated within one server's tick.

We will use textmode-like play field, which is, in fact, a html table with one-char cells. All objects of the game are displayed with characters of different colors placed in table's cells. Most of the time client passes pressed keys' codes to the server and gets back play field updates with every "tick". An update from server consists of messages representing characters to render along with their coordinates and colors. So we are keeping all game logic on the server and we are sending to client only rendering data. In addition, we minimize the possibilities to hack the game by substituting its information sent over the network.

#### 4.3 How does it work?

The server in this game is close to Example 3.2 for simplicity. But instead of having a global list of connected websockets, we have one server-wide Game object. A Game instance contains a list of Player objects (inside self._players attribute) which represents players connected to this game, their personal data and websocket objects. Having all game-related data in a Game object also allows us to have multiple game rooms if we want to add such feature. In this case, we need to maintain multiple Game objects, one per game started.

All interactions between server and clients are done with messages encoded in json. Message from the client containing only a number is interpreted as a code of the key pressed by the player. Other messages from client are sent in the following format:

```
[command, arg1, arg2, ... argN ]
```

Messages from server are sent as a list because there is often a bunch of messages to send at once (rendering data mostly):

```
[[command, arg1, arg2, ... argN ], ... ]
```

At the end of every game loop iteration, the next frame is calculated and sent to all the clients. Of course, we are not sending complete frame every time, but only a list of changes for the next frame.

Note that players are not joining the game immediately after connecting to the server. The connection starts in "spectator" mode, so one can watch how others are playing. if the game is already started, or a "game over" screen from the previous game session. Then a player may press "Join" button to join the existing game or to create a new game if the game is not currently running (no other active players). In the later case, the play field is cleared before the start.

The play field is stored in Game._world attribute, which is a 2d array made of nested lists. It is used to keep game field's state internally. Each element of an array represents a field's cell which is then rendered to a html table cell. It has a type of Char, which is a namedtuple consisting of a character and color. It is important to keep play field in sync with all the connected clients, so all updates to the play field should be made only along with sending corresponding messages to the clients. This is performed by Game.apply_render() method. It receives a list of Draw objects, which is then used to update play field internally and also to send render message to clients.

We are using namedtuple not only because it is a good way to represent simple data structures, but also because it takes less space comparing to dict when sending in a json message. If you are sending complex data structures in a real game app, it is recommended to serialize them into a plain and shorter format or even pack in a binary format (such as bson instead of json) to minimize network traffic.

ThePlayer object contains snake's representation in a deque object. This data type is similar to a list but is more effective for adding and removing elements on its sides, so it is ideal to represent a moving snake. The main method of the class is Player.render_move(), it returns rendering data to move player's snake to the next position. Basically, it renders snake's head in the new position and removes the last element where the tail was in the previous frame. In case the snake has eaten a digit and has to grow, a tail is not moving for a corresponding number of frames. The snake rendering data is used in Game.next_frame() method of the main class, which implements all game logic. This method renders all snake moves and checks for obstacles in front of every snake and also spawns digits and "stones". It is called directly from game_loop() to generate the next frame at every "tick".

In case there is an obstacle in front of snake's head, a Game.game_over() method is called from Game.next_frame(). It notifies all connected clients about the dead snake (which is turned into stones by player.render_game_over() method) and updates top scores table. Player object's alive flag is set to False, so this player will be skipped when rendering the next frames, until joining the game once again. In case there are no more snakes alive, a "game over" message is rendered at the game field. Also, the main game loop will stop and set game.running flag to False, which will cause a game field to be cleared when some player will press "Join" button next time.

Spawning of digits and stones is also happening while rendering every next frame, and it is determined by random values. A chance to spawn a digit or a stone can be changed in settings.py along with some other values. Note that digit spawning is happening for every live snake in the play field, so the more snakes are there, the more digits will appear, and they all will have enough food to consume.

#### 4.4 Network protocol
List of messages sent from client

Command	    | Parameters	|Description
:--         |:--          |:--
new_player  |	[name]	    |Setting player's nickname
join		    |             |Player is joining the game


List of messages sent from server

Command	    | Parameters	                  |Description
:--         |:--                            |:--
handshake	  |[id]	                          |Assign id to a player
world	      |[[(char, color), ...], ...]	  |Initial play field (world) map
reset_world	|	                              |Clean up world map, replacing all characters with spaces
render	    |[x, y, char, color]	          |Display character at position
p_joined	  |[id, name, color, score]	      |New player joined the game
p_gameover	|[id]	                          |Game ended for a player
p_score	    |[id, score]	                  |Setting score for a player
top_scores	|[[name, score, color], ...]	  |Update top scores table

Typical messages exchange order

Client -> Server	|Server -> Client     |Server -> All clients	  |Commentaries
:--               |:--                  |:--                       |:--
new_player			  |                     |                         |Name passed to server
                  |handshake		        |                         |ID assigned
                  |world		            |                         |Initial world map passed
                  |top_scores		        |                         |Recent top scores table passed
join			        |                     |                         |Player pressed "Join", game loop started
                  |                     |reset_world	            |Command clients to clean up play field
                  |                     |render, render, ...	    |First game tick, first frame rendered
(key code)			  |                     |                         |Player pressed a key
                  |                     |render, render, ...	    |Second frame rendered
                  |                     |p_score	                |Snake has eaten a digit
                  |                     |render, render, ...	    |Third frame rendered
                  |                     |                         |... Repeat for a number of frames ...
                  |                     |p_gameover	              |Snake died when trying to eat an obstacle
                  |                     |top_scores	              |Updated top scores table (if updated)

### 5. Conclusion

To tell the truth, I really enjoy using the latest asynchronous capabilities of Python. The new syntax really makes a difference, so async code is now easily readable. It is obvious which calls are non-blocking and when the green thread switching is happening. So now I can claim with confidence that Python is a good tool for asynchronous programming.

SnakePit has become very popular at 7WebPages team, and if you decide to take a break at your company, please, don’t forget to leave a feedback for us, say, on [Twitter][12] or [Facebook][13] .

Get to know more from:



--------------------------------------------------------------------------------

via: https://7webpages.com/blog/writing-online-multiplayer-game-with-python-and-asyncio-part-3/

作者：[Saheetha Shameer][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://7webpages.com/blog/writing-online-multiplayer-game-with-python-and-asyncio-part-3/
[1]: http://snakepit-game.com/
[2]: https://7webpages.com/blog/writing-online-multiplayer-game-with-python-and-asyncio-writing-game-loop/
[3]: https://7webpages.com/blog/writing-online-multiplayer-game-with-python-asyncio-getting-asynchronous/
[4]: https://github.com/7WebPages/snakepit-game
[5]: https://github.com/7WebPages/snakepit-game
[6]: https://github.com/7WebPages/snakepit-game/blob/master/server.py
[7]: https://github.com/7WebPages/snakepit-game/blob/master/game.py
[8]: https://github.com/7WebPages/snakepit-game/blob/master/player.py
[9]: https://github.com/7WebPages/snakepit-game/blob/master/datatypes.py
[10]: https://github.com/7WebPages/snakepit-game/blob/master/settings.py
[11]: https://github.com/7WebPages/snakepit-game/blob/master/index.html
[12]: https://twitter.com/7WebPages
[13]: https://www.facebook.com/7WebPages/
