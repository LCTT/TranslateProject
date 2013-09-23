Weather App refines its visuals
================================================================================
Weather App is an [Ubuntu SDK][2] application, designed in mind with gathering, managing and exposing relevant weather informations into a classy good-looking interface.

Multiple cities, monochrome icons, date, ability to scroll through and observe hour-bound weather informations, additional weather details housed in flipped views, are among the features already implemented in the handy weather tool.

[Weather App][2] has been updated to yet-another interesting release, bringing visual refinements for its text-based notifications.

Hitting now the bottom-bar's `Refresh` button, exposes the data-refresh activity with an enriched activity indicator, a box containing the spinning circle into a white-ish container, while adding the `Loading` text to the spinner, generating user-friendliness and more clarity into the weather application.

![](http://iloveubuntu.net/pictures_me/weather%20app%20new%20activity%20indicator%20sep22.png)

Weeks ago, Weather App received support for notifications related to faulty situations, meaning, in cases like unavailable Internet connectivity, Weather App transmits to the user its inactive state.

The mentioned faulty-cases notification has adopted the same white-ish rounded subtly-shadowed look, containing `Couldn't load weather data, please try again later` description, as opposed to the old behavior when the notification was exposed on a dark-ish transparent overlay featuring a dedicated view (the full window).

![](http://iloveubuntu.net/pictures_me/weather%20app%20internet%20notification.png)

How do we **install** Weather App 0.3?
Add the following **official** PPA (Ubuntu 13.04, Ubuntu 13.10)

    sudo add-apt-repository ppa:ubuntu-sdk-team/ppa && sudo add-apt-repository ppa:ubuntu-touch-coreapps-drivers/daily
    
    sudo apt-get update
    sudo apt-get install ubuntu-sdk ubuntu-weather-app


via:http://iloveubuntu.net/weather-app-refines-its-visuals 

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[译者ID][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://developer.ubuntu.com/get-started/
[2]:https://launchpad.net/ubuntu-weather-app