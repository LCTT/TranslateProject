[#]: subject: "Learn Java by building a classic arcade game"
[#]: via: "https://opensource.com/article/21/3/java-object-orientation"
[#]: author: "Vaneska Sousa https://opensource.com/users/vaneska"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Learn Java by building a classic arcade game
======
Practice how to structure a project and write Java code while having fun building a fun game.

![Learning and studying technology is the key to success][1]

Image by: [WOCinTech Chat][2], [CC BY 2.0][3]

As a second-semester student in systems and digital media at the Federal University of Ceará in Brazil, I was given the assignment to remake the classic Atari 2600 [Breakout game][4] from 1978. I am still in my infancy in learning software development, and this was a challenging experience. It was also a gainful one because I learned a lot, especially about applying object-oriented concepts.

![Breakout game][5]

I'll explain how I accomplished this challenge, and if you follow the step-by-step instructions, at the end of this article, you will have the first pieces of your own classic Breakout game.

### Choosing Java and TotalCross

Several of my courses use [Processing][6], a software engine that uses [Java][7]. Java is a great language for learning programming concepts, in part because it's a strongly typed language.

Despite being free to choose any language or framework for my Breakout project, I chose to continue in Java to apply what I've learned in my coursework. I also wanted to use a framework so that I did not need to do everything from scratch. I considered using Godot, but that would mean I would hardly need to program at all.

Instead, I chose [TotalCross][8]. It is an open source software development kit (SDK) and framework with a simple game engine that generates code for [Linux Arm][9] devices (like the Raspberry Pi) and smartphones. Also, because I work for TotalCross, I have access to developers with much more experience than I have and know the platform very well. It seemed to be the safest way and, despite some strife, I don't regret it one bit. It was very cool to develop the whole project and see it running on the phone and the [Raspberry Pi][10].

![Breakout remake][11]

### Define the project mechanics and structure

When starting to develop any application, and especially a game, you need to consider the main features or mechanics that will be implemented. I watched the original Breakout gameplay a few times and played some versions on the internet. Then I defined the game mechanics and project structure based on what I learned.

#### Game mechanics

1. The platform moves left or right, according to the user's command. When it reaches an end, it hits the "wall" (edge).
2. When the ball hits the platform, it returns in the opposite direction it came from.
3. Each time the ball hits a "brick" (blue, green, yellow, orange, or red), the brick disappears.
4. When all the bricks in level 01 have been destroyed, new ones appear (in the same position as the previous one), and the ball's speed increases.
5. When all the bricks in level 02 have been destroyed, the game continues without obstacles on the screen.
6. The game ends when the ball falls.

#### Project structure

* RunBreakoutApplication.java is the class responsible for calling the class that inherits the `GameEngine` and runs the simulator.
* Breakout.java is the main class, which inherits from the `GameEngine` class and "assembles" the game, where it will call objects, define positions, etc.
* The `sprites` package is where all the classes responsible for the sprites (e.g., the image and behavior of the blocks, platform, and ball) go.
* The `util` packages contain classes used to facilitate project maintenance, such as constants, image initialization, and colors.

### Get hands-on with code

First, install the [TotalCross plugin from VSCode][12]. If you are using another [integrated development environment][13] (IDE), check TotalCross's documentation for installation instructions.

If you're using the plugin, just press `Ctrl` +`P`, type `totalcross`, and click `Create new project`. Fill in the requested information:

* Folder name: gameTC
* ArtifactId: com.totalcross
* Project name: Breakout
* TotalCross version: 6.1.1 (or the most recent one)
* Build platforms: -Android and -Linux_arm (select the platforms you want)

When filling in the fields above and generating the project, if you are in the `RunBreakoutApplication.java` class, right-clicking on it and clicking "run" will open the simulator, and "Hello World!" will appear on your screen if you have created your Java project with TotalCross properly.

![HelloWorld project structure][14]

If you have a problem, check the [documentation][15] or ask the [TotalCross community][16] on Telegram for help.

After the project is configured, the next step is to add the project's images in `Resources` > `Sprites`. Create two packages named `util` and `sprites` to work on later.

The structure of your project will be:

![Project structure][17]

### Go behind the scenes

To make it easier to maintain the code and change the images to the colors you want to use, it's a good practice to [centralize everything by creating classes][18]. Place all of the classes for this function inside the `util` package.

#### Constants.java

First, create the `constants.java` class, which is where placement patterns (such as the edge between the screen and where the platform starts), speed, number of blocks, etc., reside. This is good for playing, changing numbers, and understanding where things change and why. It is a great exercise for those just starting with Java.

```
package com.totacross.util;

import totalcross.sys.Settings;
import totalcross.ui.Control;
import totalcross.util.UnitsConverter;

public class Constants {
    //Position
    public static final int BOTTOM_EDGE = UnitsConverter.toPixels(430 + Control.DP);
    public static final int DP_23 = UnitsConverter.toPixels(23 + Control.DP);
    public static final int DP_50 = UnitsConverter.toPixels(50 + Control.DP);
    public static final int DP_100 = UnitsConverter.toPixels(100 + Control.DP);

    //Sprites
    public static final int EDGE_RACKET = UnitsConverter.toPixels(20 + Control.DP);
    public static final int WIDTH_BALL =  UnitsConverter.toPixels(15 + Control.DP);
    public static final int HEIGHT_BALL =  UnitsConverter.toPixels(15 + Control.DP);

    //Bricks
    public static final int NUM_BRICKS = 10;
    public static final int WIDTH_BRICKS = Settings.screenWidth / NUM_BRICKS;
    public static final int HEIGHT_BRICKS = Settings.screenHeight / 32;

    //Brick Points
    public static final int BLUE_POINT = 1;
    public static final int GREEN_POINT = 2;
    public static final int YELLOW_POINT = 3;
    public static final int DARK_ORANGE_POINT = 4;
    public static final int ORANGE_POINT = 5;
    public static final int RED_POINT = 6;
}
```

If you want to know more about the pixel density (DP) unit, I recommend reading the [Material Design description][19].

#### Colors.java

As the name suggests, this class is where you define the colors used in the game. I recommend naming things according to the color's purpose, such as background, font color, etc. This will make it easier to update your project's color palette in a single class.

```
package com.totacross.util;

public class Colors {
    public static int PRIMARY = 0x161616;
    public static int P_FONT = 0xFFFFFF;
    public static int SECONDARY = 0xE63936;
    public static int SECONDARY_DARK = 0xCE3737;
}
```

#### Images.java

The `images.java` class is undoubtedly the most frequently used.

```
package com.totacross.util;

import static com.totacross.util.Constants.*;
import totalcross.ui.dialog.MessageBox;
import totalcross.ui.image.Image;


public class Images {

    public static Image paddle, ball;
    public static Image red, orange, dark_orange, yellow, green, blue;

    public static void loadImages() {
        try {
            // general
            paddle = new Image("sprites/paddle.png");
            ball = new Image("sprites/ball.png").getScaledInstance(WIDTH_BALL, HEIGHT_BALL);

            // Bricks
            red = new Image("sprites/red_brick.png").getScaledInstance(WIDTH_BRICKS, HEIGHT_BRICKS);
            orange = new Image("sprites/orange_brick.png").getScaledInstance(WIDTH_BRICKS, HEIGHT_BRICKS);
            dark_orange = new Image("sprites/orange2_brick.png").getScaledInstance(WIDTH_BRICKS, HEIGHT_BRICKS);
            yellow = new Image("sprites/yellow_brick.png").getScaledInstance(WIDTH_BRICKS, HEIGHT_BRICKS);
            green = new Image("sprites/green_brick.png").getScaledInstance(WIDTH_BRICKS, HEIGHT_BRICKS);
            blue = new Image("sprites/blue_brick.png").getScaledInstance(WIDTH_BRICKS, HEIGHT_BRICKS);

        } catch (Exception e) {
            MessageBox.showException(e, true);
        }
    }
}
```

The `getScaledInstance()` method will manipulate the image to match the values passed through the constant. Try to change these values and observe the impact on the game.

#### Recap

At this point, your project should look like this:

![Project structure][20]

### Create your first sprite

Now that the project is structured properly, you're ready to create your first class in the sprite package: `paddle.java`, which is the platform—the user's object of interaction.

#### Paddle.java

The `paddle.java` class must inherit from `sprite`, which is the class responsible for objects in games. This is a fundamental concept in game engine development, so when inheriting from sprites, the TotalCross framework will already be concerned with delimiting movement within the screen, detecting collisions between sprites, and other important functions. You can check all the details in [Javadoc][21].

In Breakout, the paddle moves on the X-axis at a speed determined by the user's command (by touch screen or mouse movement). The `paddle.java` class is responsible for defining this movement and the sprite's image (the "face"):

```
package com.totacross.sprites;

import com.totacross.util.Images;

import totalcross.game.Sprite;
import totalcross.ui.image.ImageException;

public class Paddle extends Sprite {
  private static final int SPEED = 4;

  public Paddle() throws IllegalArgumentException, IllegalStateException, ImageException {
    super(Images.paddle, -1, true, null);
  }

  //Move the platform according the speed and the direction
  public final void move(boolean left, int speed) {
    if (left) {
      centerX -= SPEED;
    } else {
      centerX += SPEED;
    }

    setPos(centerX, centerY, true);
  }
}
```

You indicate the image (`Images.paddle` ) within the constructor, and the `move` method (a TotalCross feature) receives the speed defined at the beginning of the class. Experiment with other values and observe what happens with the movement.

When the paddle is moving to the left, the center of the paddle at any moment is defined as itself minus the speed, and when it's moving to the right, it's itself plus the speed. Ultimately, you define the position of the sprite on the screen.

Now your sprite is ready, so you need to add it on the screen and include the user's movement to call the `move` method and create movement. Do this in your main class, `Breakout.java`.

#### Add onscreen and user interaction

When building your game engine, you need to focus on some standard points. For the sake of brevity, I'll add comments in the code.

Basically, you will delete the automatically generated `initUI()` method and, instead of inheriting from `MainWindow`, you will inherit it from `GameEngine`. A "red" will appear in the name of your class, so just click on the lamp or the suggestion symbol for your IDE and click `Add unimplemented methods`. This will automatically generate the `onGameInit()` method, which is responsible for the moment when the game starts, i.e., the moment the `breakout` class is called.

Inside the constructor, you must add the style type (`MaterialUI` ) and the refresh time on the screen (`70` ), and signal that the game has an interface (`gameHasUI = true;` ).

Last but not least, you have to start the game through `this.start()` on `onGameInit()` and focus on some other methods:

* onGameInit() is the first method called. In it, you must initialize the sprites and images (Images.loadImages), and tell the game that it can start.
* onGameStart()is called when the game starts. It sets the platform's initial position (in the center of the screen on the X-axis and below the center with a border on the Y-axis).
* onPaint() is where you say what will be drawn for each frame. First, it paints the background black (to not leave traces of the sprites), then it displays the sprites with `.show()`.
* The `onPenDrag` and `onPenDown` methods identify when the user `move`s the paddle (by dragging a finger on a touch screen or moving the mouse while pressing the left button). These methods change the paddle movement through the `setPos()` method, which triggers the move method in the `Paddle.java` class. Note that the last parameter of the `racket.setPos` method is `true` to precisely limit the paddle's movement within the screen so that it never disappears from the user's field of view.

```
package com.totacross;

import com.totacross.sprites.Paddle;
import com.totacross.util.Colors;
import com.totacross.util.Constants;
import com.totacross.util.Images;

import totalcross.game.GameEngine;
import totalcross.sys.Settings;
import totalcross.ui.MainWindow;
import totalcross.ui.dialog.MessageBox;
import totalcross.ui.event.PenEvent;
import totalcross.ui.gfx.Graphics;

public class Breakout extends GameEngine {

    private Paddle racket;

    public Breakout() {
        setUIStyle(Settings.MATERIAL_UI);
        gameName = "Breakout";
        gameVersion = 100;
        gameHasUI = true;
        gameRefreshPeriod = 70;

    }

    @Override
    public void onGameInit() {
        setBackColor(Colors.PRIMARY);
        Images.loadImages();

        try {
            racket = new Paddle();

        } catch (Exception e) {
            MessageBox.showException(e, true);
            MainWindow.exit(0);
        }
        this.start();
    }
    public void onGameStart() {
        racket.setPos(Settings.screenWidth / 2, (Settings.screenHeight - racket.height) - Constants.EDGE_RACKET, true);
    }

     //to draw the interface
     @Override
     public void onPaint(Graphics g) {
         super.onPaint(g);
         if (gameIsRunning) {
             g.backColor = Colors.PRIMARY;
             g.fillRect(0, 0, this.width, this.height);

             if (racket != null) {
                 racket.show();
             }
         }
     }
     //To make the paddle moving with the mouse/press moviment
     @Override
     public final void onPenDown(PenEvent evt) {
         if (gameIsRunning) {
             racket.setPos(evt.x, racket.centerY, true);
         }
     }

     @Override
     public final void onPenDrag(PenEvent evt) {
         if (gameIsRunning) {
             racket.setPos(evt.x, racket.centerY, true);
         }
     }
}
```

### Run the game

To run the game, just click `RunBreakoutApplication.java` with the right mouse button, then click `run` to see how it looks.

![Breakout game remake][22]

If you want to run it on a Raspberry Pi, change the parameters in the `RunBreakoutApplication.java` class to:

```
TotalCrossApplication.run(Breakout.class, "/scr", "848x480");
```

This sets the screen size to match the Raspberry Pi.

![Breakout on Raspberry Pi][23]

The first sprite and game mechanics are ready!

### Next steps

In the next article, I'll show how to add the ball sprite and make collisions. If you need help, call me in the [community group][24] on Telegram or post in the TotalCross [forum][25], where I'm available to help.

If you put this article into practice, share your experience in the comments. All feedback is important! If you wish, favorite [TotalCross on GitHub][26], as it improves the project's relevance on the platform.

Image by: (Vaneska Karen, CC BY-SA 4.0)

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/java-object-orientation

作者：[Vaneska Sousa][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/vaneska
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/studying-books-java-couch-education.png
[2]: https://www.wocintechchat.com/
[3]: https://creativecommons.org/licenses/by/2.0/
[4]: https://www.youtube.com/watch?v=Cr6z3AyhRr8
[5]: https://opensource.com/sites/default/files/uploads/originalbreakout.gif
[6]: https://processing.org/
[7]: https://opensource.com/resources/java
[8]: https://opensource.com/article/20/7/totalcross-cross-platform-development
[9]: https://www.arm.linux.org.uk/docs/whatis.php
[10]: https://opensource.com/resources/raspberry-pi
[11]: https://opensource.com/sites/default/files/uploads/breakoutremake.gif
[12]: https://marketplace.visualstudio.com/items?itemName=totalcross.vscode-totalcross
[13]: https://www.redhat.com/en/topics/middleware/what-is-ide
[14]: https://opensource.com/sites/default/files/uploads/helloworld.png
[15]: https://learn.totalcross.com/
[16]: https://t.me/guiforembedded
[17]: https://opensource.com/sites/default/files/uploads/projectstructure.png
[18]: https://learn.totalcross.com/documentation/guides/app-architecture/colors-fonts-and-images
[19]: https://material.io/design/layout/pixel-density.html
[20]: https://opensource.com/sites/default/files/uploads/projectstructure2.png
[21]: https://en.wikipedia.org/wiki/Javadoc
[22]: https://opensource.com/sites/default/files/uploads/runbreakout.gif
[23]: https://opensource.com/sites/default/files/uploads/runbreakout2.gif
[24]: https://t.me/guiforembedded
[25]: http://forum.totalcross.com
[26]: https://github.com/totalcross/totalcross
