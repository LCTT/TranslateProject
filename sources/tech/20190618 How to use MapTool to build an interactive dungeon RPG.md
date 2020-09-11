[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to use MapTool to build an interactive dungeon RPG)
[#]: via: (https://opensource.com/article/19/6/how-use-maptools)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

How to use MapTool to build an interactive dungeon RPG
======
By using MapTool, most of a game master's work is done well before a
role-playing game begins.
![][1]

In my previous article on MapTool, I explained how to download, install, and configure your own private, [open source virtual tabletop][2] so you and your friends can play a role-playing game (RPG) together. [MapTool][3] is a complex application with lots of features, and this article demonstrates how a game master (GM) can make the most of it.

### Update JavaFX

MapTool requires JavaFX, but Java maintainers recently stopped bundling it in Java downloads. This means that, even if you have Java installed, you might not have JavaFX installed.

Some Linux distributions have a JavaFX package available, so if you try to run MapTool and get an error about JavaFX, download the latest self-contained version:

  * For [Ubuntu and other Debian-based systems][4]
  * For [Fedora and Red Hat-based systems][5]



### Build a campaign

The top-level file in MapTool is a campaign (.cmpgn) file. A campaign can contain all of the maps required by the game you're running. As your players progress through the campaign, everyone changes to the appropriate map and plays.

For that to go smoothly, you must do a little prep work.

First, you need the digital equivalents of miniatures: _tokens_ in MapTool terminology. Tokens are available from various sites, but the most prolific is [immortalnights.com/tokensite][6]. If you're still just trying out virtual tabletops and aren't ready to invest in digital art yet, you can get a stunning collection of starter tokens from immortalnights.com for $0.

You can add starter content to MapTool quickly and easily using its built-in resource importer. Go to the **File** menu and select **Add Resource to Library**.

In the **Add Resource to Library** dialogue box, select the RPTools tab, located at the bottom-left. This lists all the free art packs available from the RPTools server, tokens and maps alike. Click to download and import.

![Add Resource to Library dialogue][7]

You can import assets you already have on your computer by selecting files from the file system, using the same dialogue box.

MapTool resources appear in the Library panel. If your MapTool window has no Library panel, select **Library** in the **Window** menu to add one.

### Gather your maps

The next step in preparing for your game is to gather maps. Depending on what you're playing, that might mean you need to draw your maps, purchase a map pack, or just open a map bundled with a game module. If all you need is a generic dungeon, you can also download free maps from within MapTool's **Add Resource to Library**.

If you have a set of maps you intend to use often, you can import them as resources. If you are building a campaign you intend to use just once, you can quickly add any PNG or JPEG file as a **New Map** in the **Map** menu.

![Creating a new map][8]

Set the **Background** to a texture that roughly matches your map or to a neutral color.

Set the **Map** to your map graphics file.

Give your new map a unique **Name**. The map name is visible to your players, so keep it free of spoilers.

To switch between maps, click the **Select Map** button in the top-right corner of the MapTool window, and choose the map name in the drop-down menu that appears.

![Select a map][9]

Before you let your players loose on your map, you still have some important prep work to do.

### Adjust the grid size

Since most RPGs govern how far players can move during their turn, especially during combat, game maps are designed to a specific scale. The most common scale is one map square for every five feet. Most maps you download already have a grid drawn on them; if you're designing a map, you should draw on graph paper to keep your scale consistent. Whether your map graphic has a grid or not, MapTool doesn't know about it, but you can adjust the digital grid overlay so that your player tokens are constrained into squares along the grid.

MapTool doesn't show the grid by default, so go to the **Map** menu and select **Adjust grid**. This displays MapTool's grid lines, and your goal is to make MapTool's grid line up with the grid drawn onto your map graphic. If your map graphic doesn't have a grid, it may indicate its scale; a common scale is one inch per five feet, and you can usually assume 72 pixels is one inch (on a 72 DPI screen). While adjusting the grid, you can change the color of the grid lines for your own reference. Set the cell size in pixels. Click and drag to align MapTool's grid to your map's grid.

![Adjusting the grid][10]

If your map has no grid and you want the grid to remain visible after you adjust it, go to the **View** menu and select **Show Grid**.

### Add players and NPCs

To add a player character (PC), non-player character (NPC), or monster to your map, find an appropriate token in your **Library** panel, then drag and drop one onto your map. In the **New Token** dialogue box that appears, give the token a name and set it as an NPC or a PC, then click the OK button.

![Adding a player character to the map][11]

Once a token is on the map, try moving it to see how its movements are constrained to the grid you've designated. Make sure **Interaction Tools** , located in the toolbar just under the **File** menu, is selected.

![A token moving within the grid][12]

Each token added to a map has its own set of properties, including the direction it's facing, a light source, player ownership, conditions (such as incapacitated, prone, dead, and so on), and even class attributes. You can set as many or as few of these as you want, but at the very least you should right-click on each token and assign it ownership. Your players must be logged into your MapTool server for tokens to be assigned to them, but you can assign yourself NPCs and monsters in advance.

The right-click menu provides access to all important token-related functions, including setting which direction it's facing, setting a health bar and health value, a copy and paste function (enabling you and your players to move tokens from map to map), and much more.

![The token menu unlocks great, arcane power][13]

### Activate fog-of-war effects

If you're using maps exclusively to coordinate combat, you may not need a fog-of-war effect. But if you're using maps to help your players visualize a dungeon they're exploring, you probably don't want them to see the whole map before they've made significant moves, like opening locked doors or braving a decaying bridge over a pit of hot lava.

The fog-of-war effect is an invaluable tool for the GM, and it's essential to set it up early so that your players don't accidentally get a sneak peek at all the horrors your dungeon holds for them.

To activate fog-of-war on a map, go to the **Map** and select **Fog-of-War**. This blackens the entire screen for your players, so your next step is to reveal some portion of the map so that your players aren't faced with total darkness when they switch to the map. Fog-of-war is a subtractive process; it starts 100% dark, and as the players progress, you reveal new portions of the map using fog-of-war drawing tools available in the **FOG** toolbar, just under the **View** menu.

You can reveal sections of the map in rectangle blocks, ovals, polygons, diamonds, and freehand shapes. Once you've selected the shape, click and release on the map, drag to define an area to reveal, and then click again.

![Fog-of-war as experienced by a playe][14]

If you're accidentally overzealous with what you reveal, you have two ways to reverse what you've done: You can manually draw new fog, or you can reset all fog. The quicker method is to reset all fog with **Ctrl+Shift+A**. The more elegant solution is to press **Shift** , then click and release, draw an area of fog, and then click again. Instead of exposing an area of the map, it restores fog.

### Add lighting effects

Fog-of-war mimics the natural phenomenon of not being able to see areas of the world other than where you are, but lighting effects mimic the visibility player characters might experience in light and dark. For games like Pathfinder and Dungeons and Dragons 5e, visibility is governed by light sources matched against light conditions.

First, activate lighting by clicking on the **Map** menu, selecting **Vision** , and then choosing either Daylight or Night. Now lighting effects are active, but none of your players have light sources, so they have no visibility.

To assign light sources to players, right-click on the appropriate token and choose **Light Source**. Definitions exist for the D20 system (candle, lantern, torch, and so on) and in generic measurements.

With lighting effects active, players can expose portions of fog-of-war as their light sources get closer to unexposed fog. That's a great effect, but it doesn't make much sense when players can illuminate the next room right through a solid wall. To prevent that, you have to help MapTool differentiate between empty space and solid objects.

#### Define solid objects

Defining walls and other solid objects through which light should not pass is easier than it sounds. MapTool's **Vision Blocking Layer** (VBL) tools are basic and built to minimize prep time. There are several basic shapes available, including a basic rectangle and an oval. Draw these shapes over all the solid walls, doors, pillars, and other obstructions, and you have instant rudimentary physics.

![Setting up obstructions][15]

Now your players can move around the map with light sources without seeing what lurks in the shadows of a nearby pillar or behind an innocent-looking door… until it's too late!

![Lighting effects][16]

### Track initiative

Eventually, your players are going to stumble on something that wants to kill them, and that means combat. In most RPG systems, combat is played in rounds, with the order of turns decided by an _initiative_ roll. During combat, each player (in order of their initiative roll, from greatest to lowest) tries to defeat their foe, ideally dealing enough damage until their foe is left with no health points (HP). It's usually the most paperwork a GM has to do during a game because it involves tracking whose turn it is, how much damage each monster has taken, what amount of damage each monster's attack deals, what special abilities each monster has, and more. Luckily, MapTool can help with that—and better yet, you can extend it with a custom macro to do even more.

MapTool's basic initiative panel helps you keep track of whose turn it is and how many rounds have transpired so far. To view the initiative panel, go to the **Window** menu and select **Initiative**.

To add characters to the initiative order, right-click a token and select **Add To Initiative**. As you add each, the token and its label appear in the initiative panel in the order that you add them. If you make a mistake or someone holds their action and changes the initiative order, click and drag the tokens in the initiative panel to reorder them.

During combat, click the **Next** button in the top-left of the initiative panel to progress to the next character. As long as you use the **Next** button, the **Round** counter increments, helping you track how many rounds the combat has lasted (which is helpful when you have spells or effects that last only for a specific number of rounds).

Tracking combat order is helpful, but it's even better to track health points. Your players should be tracking their own health, but since everyone's staring at the same screen, it doesn't hurt to track it publicly in one place. An HP property and a graphical health bar (which you can activate) are assigned to each token, so that's all the infrastructure you need to track HP in MapTool, but doing it manually takes a lot of clicking around. Since MapTool can be extended with macros, it's trivial to bring all these components together for a smooth GM experience.

The first step is to activate graphical health bars for your tokens. To do this, right-click on each token and select **Edit**. In the **Edit Token** dialog box, click on the **State** tab and deselect the radio button next to **Hide**.

![Don't hide the health bar][17]

Do this for each token whose health you want to expose.

#### Write a macro

Macros have access to all token properties, so each token's HP can be tracked by reading and writing whatever value exists in the token's HP property. The graphical health bar, however, bases its state on a percentage, so for the health bars to be meaningful, your tokens also must have some value that represents 100% of its HP.

Go to the **Edit** menu and select **Campaign Properties** to globally add properties to tokens. In the **Campaign Properties** window, select the **Token Properties** tab and then click the **Basic** category in the left column. Under ***@HP** , add ***@MaxHP** and click the **Update** button. Click the **OK** button to close the window.

![Adding a property to all tokens][18]

Now right-click a token and select **Edit**. In the **Edit Token** window, select the **State** tab and enter a value for the token's maximum HP (from the player's character sheet).

To create a new macro, reveal the **Campaign** panel in the **Window** menu.

In the **Campaign** panel, right-click and select **Add New Macro**. A button labeled **New** appears in the panel. Right-click on the **New** button and select **Edit**.

Enter this code in the macro editor window:


```
[h:status = input(
"hpAmount|0|Points",
"hpType|Damage,Healing|Damage or heal?|RADIO|SELECT=0")]
[h:abort(status)]

[if(hpType == 0),CODE: {
[h:HP = HP - hpAmount]
[h:bar.Health = HP / MaxHP]
[r:token.name] takes [r:hpAmount] damage.};
{
[h:diff = MaxHP - HP]
[h:HP = min(HP+hpAmount, MaxHP)]
[h:bar.Health = HP / MaxHP]
[r:token.name] gains [r:min(diff,hpAmount)] HP. };]
```

You can find full documentation of functions available in MapTool macros and their syntax from the [RPTools wiki][19].

In the **Details** tab, enable **Include Label** and **Apply to Selected Tokens** , and leave all other values at their default. Give your macro a better name than **New** , such as **HPTracker** , then click **Apply** and **OK**.

![Macro editing][20]

Your campaign now has a new ability!

Select a token and click your **HPTracker** button. Enter the number of points to deduct from the token, click **OK** , and watch the health bar change to reflect the token's new state.

It may seem like a simple change, but in the heat of battle, this is a GM's greatest weapon.

### During the game

There's obviously a lot you can do with MapTool, but with a little prep work, most of your work is done well before you start playing. You can even create a template campaign by creating an empty campaign with only the macros and settings you want, so all you have to do is import maps and stat out tokens.

During the game, your workflow is mostly about revealing areas from fog-of-war and managing combat. The players can manage their own tokens, and your prep work takes care of everything else.

MapTool makes digital gaming easy and fun, and most importantly, it keeps it open source and self-contained. Level-up today by learning MapTool and using it for your games.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/how-use-maptools

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/dice-keys_0.jpg?itok=PGEs3ZXa
[2]: https://opensource.com/article/18/5/maptool
[3]: https://github.com/RPTools/maptool
[4]: https://github.com/RPTools/maptool/releases
[5]: https://klaatu.fedorapeople.org/RPTools/maptool/
[6]: https://immortalnights.com/tokensite/
[7]: https://opensource.com/sites/default/files/uploads/maptool-resources.png (Add Resource to Library dialogue)
[8]: https://opensource.com/sites/default/files/uploads/map-properties.png (Creating a new map)
[9]: https://opensource.com/sites/default/files/uploads/map-select.jpg (Select a map)
[10]: https://opensource.com/sites/default/files/uploads/grid-adjust.jpg (Adjusting the grid)
[11]: https://opensource.com/sites/default/files/uploads/token-new.png (Adding a player character to the map)
[12]: https://opensource.com/sites/default/files/uploads/token-move.jpg (A token moving within the grid)
[13]: https://opensource.com/sites/default/files/uploads/token-menu.jpg (The token menu unlocks great, arcane power)
[14]: https://opensource.com/sites/default/files/uploads/fog-of-war.jpg (Fog-of-war as experienced by a playe)
[15]: https://opensource.com/sites/default/files/uploads/vbl.jpg (Setting up obstructions)
[16]: https://opensource.com/sites/default/files/uploads/map-light.jpg (Lighting effects)
[17]: https://opensource.com/sites/default/files/uploads/token-edit.jpg (Don't hide the health bar)
[18]: https://opensource.com/sites/default/files/uploads/campaign-properties.jpg (Adding a property to all tokens)
[19]: https://lmwcs.com/rptools/wiki/Main_Page
[20]: https://opensource.com/sites/default/files/uploads/macro-detail.jpg (Macro editing)
