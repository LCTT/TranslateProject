[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use this open source tool to get your local weather forecast)
[#]: via: (https://opensource.com/article/20/1/open-source-weather-forecast)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

Use this open source tool to get your local weather forecast
======
Know whether you need a coat, an umbrella, or sunscreen before you go
out with wego in the thirteenth in our series on 20 ways to be more
productive with open source in 2020.
![Sky with clouds and grass][1]

Last year, I brought you 19 days of new (to you) productivity tools for 2019. This year, I'm taking a different approach: building an environment that will allow you to be more productive in the new year, using tools you may or may not already be using.

### Check the weather with wego

One of the things I love about the past decade of my employment is that it mostly has been remote. I can work anywhere I happen to be in the world, although the reality is that I spend a lot of time in my home office. The downside is that when I leave the house, I base a lot of decisions on what the conditions look like outside my window. And where I live, "sunny and clear" can mean anything from "scorchingly hot" to "below freezing" to "it will rain in an hour." Being able to check the actual conditions and forecast quickly is pretty useful.

![Wego][2]

[Wego][3] is a program written in Go that will fetch and display your local weather. It even renders it in shiny ASCII art if you wish.

To install wego, you need to make sure [Go][4] is installed on your system. After that, you can fetch the latest version with the **go get** command. You'll probably want to add the **~/go/bin** directory to your path as well:


```
go get -u github.com/schachmat/wego
export PATH=~/go/bin:$PATH
wego
```

On its first run, wego will complain about missing API keys. Now you need to decide on a backend. The default backend is for [Forecast.io][5], which is part of [Dark Sky][6]. Wego also supports [OpenWeatherMap][7] and [WorldWeatherOnline][8]. I prefer OpenWeatherMap, so that's what I'll show you how to set up here.

You'll need to [register for an API key][9] with OpenWeatherMap. Registration is free, although the free API key has a limit on how many queries you can make in a day; this should be fine for an average user. Once you have your API key, put it into the **~/.wegorc** file. Now is also a good time to fill in your location, language, and whether you use metric, imperial (US/UK), metric-ms, or International System of Units (SI). OpenWeatherMap supports locations by name, postal code, coordinates, and ID, which is one of the reasons I like it.


```
# wego configuration for OEM
aat-coords=false
aat-monochrome=false
backend=openweathermap
days=3
forecast-lang=en
frontend=ascii-art-table
jsn-no-indent=false
location=Pittsboro
owm-api-key=XXXXXXXXXXXXXXXXXXXXX
owm-debug=false
owm-lang=en
units=imperial
```

Now, running **wego** at the command line will show the local weather for the next three days.

Wego can also show data as JSON output for consumption by programs and with emoji. You can choose a frontend with the **-f** command-line parameter or in the **.wegorc** file.

![Wego at login][10]

If you want to see the weather every time you open a new shell or log into a host, simply add wego to your **~/.bashrc** (or **~/.zshrc** in my case).

The [wttr.in][11] project is a web-based wrapper around wego. It provides some additional display options and is available on the website of the same name. One cool thing about wttr.in is that you can fetch one-line information about the weather with **curl**. I have a little shell function called **get_wttr** that fetches the current forecast in a shortened form.


```
get_wttr() {
  curl -s "wttr.in/Pittsboro?format=3"    
}
```

![weather tool for productivity][12]

Now, before I leave the house, I have a quick and easy way to find out if I need a coat, an umbrella, or sunscreen—directly from the command line where I spend most of my time.

I began paragliding a few years ago. It’s maybe the most weather-dependent sport in the world. We...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/open-source-weather-forecast

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus-cloud.png?itok=vz0PIDDS (Sky with clouds and grass)
[2]: https://opensource.com/sites/default/files/uploads/productivity_13-1.png (Wego)
[3]: https://github.com/schachmat/wego
[4]: https://golang.org/doc/install
[5]: https://forecast.io
[6]: https://darksky.net
[7]: https://openweathermap.org/
[8]: https://www.worldweatheronline.com/
[9]: https://openweathermap.org/api
[10]: https://opensource.com/sites/default/files/uploads/productivity_13-2.png (Wego at login)
[11]: https://github.com/chubin/wttr.in
[12]: https://opensource.com/sites/default/files/uploads/day13-image3.png (weather tool for productivity)
