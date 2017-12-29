翻译中 by zky001
10 keys to quick game development
======
![配图](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_keyboard_laptop_development_code_woman.png?itok=vbYz6jjb)

In early October, the inaugural [Open Jam][1] sponsored by Opensource.com drew 45 entries from teams located around the world. The teams had just three days to create a game using open source software to enter into the competition, and [three teams came out on top][2].

We hosted our own Open Jam event at our university for anyone who wanted to participate. We reserved a computer lab for the weekend and taught people how to use open source software--[Godot][3] for the game engine, [LMMS][4] for music creation, [GIMP][5] for 2D art, and [Blender][6] for 3D art--to create games and game art assets. Three games were submitted from our event: [Loathsome][7], [Lost Artist][8], and [Paint Rider][9] (which I created).

From my experience with game jams and game development in general, here are 10 lessons I've learned about game engines, coding, and rapid game development.

## 1\. Narrow your scope

It's easy to get carried away with ideas to make an expansive adventure game or something that compares to your favorite game. Pursuing that outside of a game jam can be awesome, once you have some experience, but don't overestimate what you have time for. What I love about game jams is they force you to focus on getting a game from the conceptual stage to a final product quickly, since you have such a limited amount of time. This is why narrowing your scope is so important.

The theme for Open Jam was "Leave a Mark." As soon as it was announced, my friends and I started brainstorming games that could fit that theme. One idea was a 3D boxing game where the player left bruises on their enemy. I had very little experience making 3D games and, while I would have loved to get better at them, I probably would have spent too much time learning how to get all the textures situated and hit boxes working before I could even start to figure out what would make a fun game.

## 2\. Have something playable very early

This is my favorite advice for game jams. Try to come up with the core mechanics and code them to a working state quickly so you can test them and decide whether it's worthy of making a full game. You shouldn't be hours away from the deadline and still trying to get your game playable. For a three-day jam like Open Jam, it shouldn't take more than a few hours to have some sort of demo running.

## 3\. Keep it simple

Every feature that you want to include extends your total development time. You never know if committing to a feature will lead to a major time sink because you just can't quite get it to work. Arcade-style high-score games typically work well for game jams because they're usually simple by nature. Once you've finished the core, you can start adding features and polish without having to worry whether you'll have a functioning game in the end.

## 4\. Take inspiration from other games

You may be tempted to create something totally original, but having models to base your work on is extremely helpful. It will decrease the time it takes to come up with the mechanics, since you'll already have an idea of what is fun. Remind yourself that the more experience you have under your belt, the easier it is to create that massive game you have so many ideas for, so you might as well practice by trying to recreate things other people have done.

Considering Open Jam's "Leave a Mark" theme, I thought it would be fun to create a game where you leave a trail of paint as you played, so you could see the mark you left. I remembered the old Flash game [Line Rider 2 Beta][10] (hence the name Paint Rider), and about the secret feature where you could draw a track if you held the Control button down while you played. I simplified that concept even more by requiring only one button for vertical movement (much like old helicopter games). About an hour or two into the jam, I had a basic demo where you could move up or down with one button and leave a trail of little black circles.

## 5\. Don't overlook accessibility

Make sure as many people as possible can play your game. One of the games submitted to Open Jam was a virtual-reality game. As cool as that was, hardly anyone was able to play it, because not many people have a VR device. Luckily, its developer didn't expect it would do well in the ratings, and instead considered it practice. But, if you want to share your game with lots of people (or win game jams), it's important to pay attention to accessibility.

Godot (and most other game engines) allow you to export your game to all major platforms. When submitting a game specifically to [Itch.io][11], having an in-browser version will allow most people to play it. But always look into exporting to as many platforms and operating systems as you can. I even tried exporting Paint Rider to mobile, but technical difficulties got in the way.

## 6\. Don't make it too difficult

If your game takes too much effort to learn or play, you'll lose a portion of your audience. This aligns nicely with keeping your game simple and within scope, and it puts even more importance on the game planning phase. Again, it's easy to come up with an epic game idea you could spend weeks or months developing; it's harder to come up with a good, simple game.

I showed Paint Rider to my Mom and she was able to play it immediately. I don't think I need to say anything more about that.

## 7\. Don't be too neat

If you're used to taking your time applying design patterns everywhere and making sure that your code will be reusable and readable, try to loosen up a bit. If you spend too much time worrying about design, when you finally get to the point when you can play your game, you may find out it's not very fun. By then, it's too late to make changes.

This process is also used for prototyping more serious games: You quickly code up messy proof-of-concept demos until you find one that's worth making into a full game, then you dive into building a perfect code base to support it. Creating a game for a game jam is like quickly coding up a proof of concept.

## 8\. But don't be too messy, either

On the other hand, [spaghetti code][12] can easily get out of control, even if there's not a ton of code in a game. Luckily, most game engines are built with design patterns in mind. Take Godot's [Signals][13] functionality, which allows nodes to send messages with data to nodes they've been "connected" with--it's the [observer pattern][14] automatically baked into your design. As long as you know how to take advantage of the game engine's features, you should be able to code quickly without making your code too painful to look at.

## 9\. Get feedback

Show people what you're working on. Have them try it out and see what they say about it. Watch how they play your game and see if they find something you didn't expect. If the game jam has a [Discord][15] channel or something similar, post your game there, or bounce your ideas off people. One of Paint Rider's defining features is that the canvas loops, so you see the paint you left before. I hadn't even considered that mechanic until someone asked me why the game didn't have it.

Working on a team will ensure that there are other people built into the process who can pass feedback around.

And don't forget to help other people out in the same way; it's a win-win if you realize something that could help your game while you're playing someone else's game.

## 10\. Know where to find resources

Creating all your own assets can really slow you down. During Open Jam, I noticed that Loathsome's developer was spending multiple hours drawing the main character while I was busy incorporating new features and fixing bugs. You could simplify your art style for the game and still come up with something that looks and sounds good, but there are other options. Try looking for assets in [Creative Commons][16] or on free music sites like [Anttis Instrumentals][17]. Or, if possible, form a team with a dedicated artist, writer, or musician.

Other software you might find useful includes [Krita][18], an open source 2D image creator that's nice for digital painting, especially if you have a drawing tablet, and [sfxr][19], a game sound-effect creator that has a lot of parameters to play with, but as its creator says: "Basic usage involves hitting the randomize button." (All sound effects in Paint Rider were made with Sfxr.) You can also check out [Calinou][20]'s large and neatly organized list of open source game development software.

Have you participated in Open Jam or another a game jam and have other advice? Or do you have questions I didn't address? If so, please share them in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/12/10-keys-rapid-open-source-game-development

作者：[Ryan Estes][a]
译者：[zky001](https://github.com/zky001)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/figytuna
[1]:https://itch.io/jam/open-jam-1
[2]:https://opensource.com/article/17/11/open-jam
[3]:https://godotengine.org/
[4]:https://lmms.io/
[5]:https://www.gimp.org/
[6]:https://www.blender.org/
[7]:https://astropippin.itch.io/loathsome
[8]:https://masonraus.itch.io/lost-artist
[9]:https://figytuna.itch.io/paint-rider
[10]:http://www.andkon.com/arcade/racing/lineriderbeta2/
[11]:https://itch.io/
[12]:https://en.wikipedia.org/wiki/Spaghetti_code
[13]:http://kidscancode.org/blog/2017/03/godot_101_07/
[14]:https://en.wikipedia.org/wiki/Observer_pattern
[15]:https://discordapp.com/
[16]:https://creativecommons.org/
[17]:http://www.soundclick.com/bands/default.cfm?bandID=1277008
[18]:https://krita.org/en/
[19]:http://www.drpetter.se/project_sfxr.html
[20]:https://notabug.org/Calinou/awesome-gamedev/src/master/README.md
