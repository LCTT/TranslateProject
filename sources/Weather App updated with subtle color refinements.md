Weather App updated with subtle color refinements
================================================================================
Gradually, as seen in the latest months, Ubuntu converged is gaining a massive amount of software, software including under-the-hood services, modern Unity 8, Ubuntu developers-only applications, as well as the [core applications][1], latter being produced by a meaningful collaboration between talented third-party developers, Ubuntu developers and Ubuntu designers.

During the latest weeks, [Weather App][2] has seen numerous optimizations and refinements, polish effort aimed at delivering a stable version of the weather application in the near future.

Weather App comes with support for multiple cities and a rich range of weather values, values (like for example, Celsius degrees) expressed in relation to predefined colors; for example, the value 20 degrees Celsius is rendered with an orange-to-red color, while lower temperatures are expressed with green-to-gray color tones.

Weather App has been updated to a minor-yet-interesting release, bringing, along with bug fixes, more dark colors for the vividly-rendered color tones on its views.

Meaning, high temperatures (such as 20 degrees Celsius) retain the same orange-to-red color, yet, their color vitality has been decreased by eliminating percentages of light, while adding subtle-yet-noticeable dark tones.

The result: the weather's colors are now more pleasant to the eye featuring more calm colors.

![](http://iloveubuntu.net/pictures_me/ols%20vs%20new%20weather%20app.png)

![](http://iloveubuntu.net/pictures_me/old%20vs%20new%202%20weather%20beijing.png)

How do we **install** Weather App 0.3?
Add the following **official** PPA (Ubuntu 13.04, Ubuntu 13.10)

    sudo add-apt-repository ppa:ubuntu-sdk-team/ppa && sudo add-apt-repository ppa:ubuntu-touch-coreapps-drivers/daily

    sudo apt-get update
    sudo apt-get install ubuntu-sdk ubuntu-weather-app

--------------------------------------------------------------------------------

via: http://iloveubuntu.net/weather-app-updated-subtle-color-refinements

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[译者ID][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID

[1]:https://launchpad.net/ubuntu-phone-coreapps
[2]:https://launchpad.net/ubuntu-weather-app