translating by lujun9972
Get Your Weather Forecast From the Linux CLI
======

### Objective

Display the current weather forecast in the Linux command line.

### Distributions

This will work on any Linux distribution.

### Requirements

A working Linux install with an Internet connection.

### Difficulty

Easy

### Conventions

  * **#** \- requires given command to be executed with root privileges either directly as a root user or by use of `sudo` command
  * **$** \- given command to be executed as a regular non-privileged user



### Introduction

It's be convenient to be able to retrieve the latest weather forecast right from your terminal without opening up a web browser, wouldn't it? What about scripting it or setting a cron job? Well, you can.

`http://wttr.in` is a website that allows you to search for weather forecasts anywhere in the world, and it displays he results in ASCII characters. By using `cURL`, you can access `http://wttr.in`, you can get your results directly in the terminal.

### Get Your Local Weather



![Local weather from wttr.in][1]
It's really simple to grab your local weather. `wttr.in` will automatically try to detect your location based on your IP address. It's reasonably accurate, unless you're using a VPN, of course.
```

$ curl wttr.in

```

### Get Weather By City



![Weather by city from wttr.in][2]
Now, if you would like the weather in a different city, you can specify that with a slash at the end of `wttr.in`. Replace any spaces in the name with a `+`.
```

$ curl wttr.in/New+York

```

You can also specify cities the way they're written in Unix timezones.
```

$ curl wttr.in/New_York

```

Don't use spaces unless you like strange and inaccurate results.

### Get Weather By Airport



![Weather by airport from wttr.in][3]
If you're familiar with the three letter airport codes in your area, you can use those too. They might be closer to you and more accurate than the city in general.
```

$ curl wttr.in/JFK

```

### Best Guess



![Weather by landmark from wttr.in][4]
You can have `wttr.in` take a guess on the weather base on a landmark using the `~` character.
```

$ curl wttr.in/~Statue+Of+Liberty

```

### Weather From A Domain Name



![Weather by domain name from wttr.in][5]
Did you ever wonder what the weather is like where LinuxConfig is hosted? Now, now you can find out! `wttr.in` can check weather by domain name. Sure, it's probably not the most useful feature, but it's still interesting none the less.
```

$ curl wttr.in/@linuxconfig.org

```

### Changing The Temperature Units



![Change unit system in wttr.in][6]
By default, `wttr.in` will display temperatures in the units(C or F) used in your actual location. Basically, in States, you'll get Fahrenheit, and everyone else will see Celsius. You can change that by adding `?u` to see Fahrenheit or `?m` to see Celsius.
```

$ curl wttr.in/New_York?m

$ curl wttr.in/Toronto?u

```

There's an odd bug with ZSH that prevents this from working, so you need to use Bash if you want to convert the units.

### Closing Thoughts

You can easily incorporate a call to `wttr.in` into a script, cron job, or even your MOTD. Of course, you don't need to get that involved. You can just lazily type a call in to this awesome service whenever you want to check the forecast.


--------------------------------------------------------------------------------

via: https://linuxconfig.org/get-your-weather-forecast-from-the-linux-cli

作者：[Nick Congleton][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxconfig.org
[1]:https://linuxconfig.org/images/wttr-local.jpg
[2]:https://linuxconfig.org/images/wttr-city.jpg
[3]:https://linuxconfig.org/images/wttr-airport.jpg
[4]:https://linuxconfig.org/images/wttr-landmark.jpg
[5]:https://linuxconfig.org/images/wttr-url.jpg
[6]:https://linuxconfig.org/images/wttr-units.jpg
