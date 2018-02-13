Evolving Your Own Life: Introducing Biogenesis
======

Biogenesis provides a platform where you can create entire ecosystems of lifeforms and see how they interact and how the system as a whole evolves over time.

You always can get the latest version from the project's main [website][1], but it also should be available in the package management systems for most distributions. For Debian-based distributions, install Biogenesis with the following command:

```

sudo apt-get install biogenesis

```

If you do download it directly from the project website, you also need to have a Java virtual machine installed in order to run it.

To start it, you either can find the appropriate entry in the menu of your desktop environment, or you simply can type biogenesis in a terminal window. When it first starts, you will get an empty window within which to create your world.

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/imagecache/large-550px-centered/u1000009/12224biof1.png)

Figure 1\. When you first start Biogenesis, you get a blank canvas so you can start creating your world.

The first step is to create a world. If you have a previous instance that you want to continue with, click the Game→Open menu item and select the appropriate file. If you want to start fresh, click Game→New to get a new world with a random selection of organisms.

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/imagecache/large-550px-centered/u1000009/12224biof2.png)

Figure 2\. When you launch a new world, you get a random selection of organisms to start your ecosystem.

The world starts right away, with organisms moving and potentially interacting immediately. However, you can pause the world by clicking on the icon that is second from the right in the toolbar. Alternatively, you also can just press the p key to pause and resume the evolution of the world.

At the bottom of the window, you'll find details about the world as it currently exists. There is a display of the frames per second, along with the current time within the world. Next, there is a count of the current population of organisms. And finally, there is a display of the current levels of oxygen and carbon dioxide. You can adjust the amount of carbon dioxide within the world either by clicking the relevant icon in the toolbar or selecting the World menu item and then clicking either Increase CO2 or Decrease CO2.

There also are several parameters that govern how the world works and how your organisms will fare. If you select World→Parameters, you'll see a new window where you can play with those values.

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/imagecache/large-550px-centered/u1000009/12224biof3.png)

Figure 3\. The parameter configuration window allows you to set parameters on the physical characteristics of the world, along with parameters that control the evolution of your organisms.

The General tab sets the amount of time per frame and whether hardware acceleration is used for display purposes. The World tab lets you set the physical characteristics of the world, such as the size and the initial oxygen and carbon dioxide levels. The Organisms tab allows you to set the initial number of organisms and their initial energy levels. You also can set their life span and mutation rate, among other items. The Metabolism tab lets you set the parameters around photosynthetic metabolism. And, the Genes tab allows you to set the probabilities and costs for the various genes that can be used to define your organisms.

What about the organisms within your world though? If you click on one of the organisms, it will be highlighted and the display will change.

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/imagecache/large-550px-centered/u1000009/12224biof4.png)

Figure 4\. You can select individual organisms to find information about them, as well as apply different types of actions.

The icon toolbar at the top of the window will change to provide actions that apply to organisms. At the bottom of the window is an information bar describing the selected organism. It shows physical characteristics of the organism, such as age, energy and mass. It also describes its relationships to other organisms. It does this by displaying the number of its children and the number of its victims, as well as which generation it is.

If you want even more detail about an organism, click the Examine genes button in the bottom bar. This pops up a new window called the Genetic Laboratory that allows you to look at and alter the genes making up this organism. You can add or delete genes, as well as change the parameters of existing genes.

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/imagecache/large-550px-centered/u1000009/12224biof5.png)

Figure 5\. The Genetic Laboratory allows you to play with the individual genes that make up an organism.

Right-clicking on a particular organism displays a drop-down menu that provides even more tools to work with. The first one allows you to track the selected organism as the world evolves. The next two entries allow you either to feed your organism extra food or weaken it. Normally, organisms need a certain amount of energy before they can reproduce. Selecting the fourth entry forces the selected organism to reproduce immediately, regardless of the energy level. You also can choose either to rejuvenate or outright kill the selected organism. If you want to increase the population of a particular organism quickly, simply copy and paste a number of a given organism.

Once you have a particularly interesting organism, you likely will want to be able to save it so you can work with it further. When you right-click an organism, one of the options is to export the organism to a file. This pops up a standard save dialog box where you can select the location and filename. The standard file ending for Biogenesis genetic code files is .bgg. Once you start to have a collection of organisms you want to work with, you can use them within a given world by right-clicking a blank location on the canvas and selecting the import option. This allows you to pull those saved organisms back into a world that you are working with.

Once you have allowed your world to evolve for a while, you probably will want to see how things are going. Clicking World→Statistics will pop up a new window where you can see what's happening within your world.

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/imagecache/large-550px-centered/u1000009/12224biof6.png)

Figure 6\. The statistics window gives you a breakdown of what's happening within the world you have created.

The top of the window gives you the current statistics, including the time, the number of organisms, how many are dead, and the oxygen and carbon dioxide levels. It also provides a bar with the relative proportions of the genes.

Below this pane is a list of some remarkable organisms within your world. These are organisms that have had the most children, the most victims or those that are the most infected. This way, you can focus on organisms that are good at the traits you're interested in.

On the right-hand side of the window is a display of the world history to date. The top portion displays the history of the population, and the bottom portion displays the history of the atmosphere. As your world continues evolving, click the update button to get the latest statistics.

This software package could be a great teaching tool for learning about genetics, the environment and how the two interact. If you find a particularly interesting organism, be sure to share it with the community at the project website. It might be worth a look there for starting organisms too, allowing you to jump-start your explorations.


--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/evolving-your-own-life-introducing-biogenesis

作者：[Joey Bernard][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxjournal.com/users/joey-bernard
[1]:http://biogenesis.sourceforge.net
