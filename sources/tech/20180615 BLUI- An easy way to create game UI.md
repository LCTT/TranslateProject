BLUI: An easy way to create game UI
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/gaming_plugin_blui_screenshot.jpg?itok=91nnYCt_)

Game development engines have become increasingly accessible in the last few years. Engines like Unity, which has always been free to use, and Unreal, which recently switched from a subscription-based service to a free service, allow independent developers access to the same industry-standard tools used by AAA publishers. While neither of these engines is open source, each has enabled the growth of open source ecosystems around it.

Within these engines are plugins that allow developers to enhance the base capabilities of the engine by adding specific applications. These apps can range from simple asset packs to more complicated things, like artificial intelligence (AI) integrations. These plugins widely vary across creators. Some are offered by the engine development studios and others by individuals. Many of the latter are open source plugins.

### What is BLUI?

As part of an indie game development studio, I've experienced the perks of using open source plugins on proprietary game engines. One open source plugin, [BLUI][1] by Aaron Shea, has been instrumental in our team's development process. It allows us to create user interface (UI) components using web-based programming like HTML/CSS and JavaScript. We chose to use this open source plugin, even though Unreal Engine (our engine of choice) has a built-in UI editor that achieves a similar purpose. We chose to use open source alternatives for three main reasons: their accessibility, their ease of implementation, and the active, supportive online communities that accompany open source programs.

In Unreal Engine's earliest versions, the only means we had of creating UI in the game was either through the engine's native UI integration, by using Autodesk's Scaleform application, or via a few select subscription-based Unreal integrations spread throughout the Unreal community. In all those cases, the solutions were either incapable of providing a competitive UI solution for indie developers, too expensive for small teams, or exclusively for large-scale teams and AAA developers.

After commercial products and Unreal's native integration failed us, we looked to the indie community for solutions. There we discovered BLUI. It not only integrates with Unreal Engine seamlessly but also maintains a robust and active community that frequently pushes updates and ensures the documentation is easily accessible for indie developers. BLUI gives developers the ability to import HTML files into the Unreal Engine and program them even further while inside the program. This allows UI created through web languages to integrate with the game's code, assets, and other elements with the full power of HTML, CSS, JavaScript, and other web languages. It also provides full support for the open source [Chromium Embedded Framework][2].

### Installing and using BLUI

The basic process for using BLUI involves first creating the UI via HTML. Developers may use any tool at their disposal to achieve this, including bootstrapped JavaScript code, external APIs, or any database code. Once this HTML page is ready, you can install the plugin the same way you would install any Unreal plugin and load or create a project. Once the project is loaded, you can place a BLUI function anywhere within an Unreal UI blueprint or hardcoded via C++. Developers can call functions from within their HTML page or change variables easily using BLUI's internal functions.

![Integrating BLUI into Unreal Engine 4 blueprints][4]

Integrating BLUI into Unreal Engine 4 blueprints.

In our current project, we use BLUI to sync UI elements with the in-game soundtrack to provide visual feedback to the rhythm aspects of the game mechanics. It's easy to integrate custom engine programming with the BLUI plugin.

![Using BLUI to sync UI elements with the soundtrack.][6]

Using BLUI to sync UI elements with the soundtrack.

Implementing BLUI into Unreal Engine 4 is a trivial process thanks to the [documentation][7] on the BLUI GitHub page. There is also [a forum][8] populated with supportive Unreal Engine developers eager to both ask and answer questions regarding the plugin and any issues that appear when implementing the tool.

### Open source advantages

Open source plugins enable expanded creativity within the confines of proprietary game engines. They continue to lower the barrier of entry into game development and can produce in-game mechanics and assets no one has seen before. As access to proprietary game development engines continues to grow, the open source plugin community will become more important. Rising creativity will inevitably outpace proprietary software, and open source will be there to fill the gaps and facilitate the development of truly unique games. And that novelty is exactly what makes indie games so great!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/blui-game-development-plugin

作者：[Uwana lkaiddi][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/uwikaiddi
[1]:https://github.com/AaronShea/BLUI
[2]:https://bitbucket.org/chromiumembedded/cef
[3]:/file/400616
[4]:https://opensource.com/sites/default/files/uploads/blui_gaming_plugin-integratingblui.png (Integrating BLUI into Unreal Engine 4 blueprints)
[5]:/file/400621
[6]:https://opensource.com/sites/default/files/uploads/blui_gaming_plugin-syncui.png (Using BLUI to sync UI elements with the soundtrack.)
[7]:https://github.com/AaronShea/BLUI/wiki
[8]:https://forums.unrealengine.com/community/released-projects/29036-blui-open-source-html5-js-css-hud-ui
