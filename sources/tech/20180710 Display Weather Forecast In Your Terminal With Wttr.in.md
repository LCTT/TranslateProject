translating---geekpi

Display Weather Forecast In Your Terminal With Wttr.in
======
**[wttr.in][1] is a feature-packed weather forecast service that supports displaying the weather from the command line**. It can automatically detect your location (based on your IP address), supports specifying the location or searching for a geographical location (like a site in a city, a mountain and so on), and much more. Oh, and **you don't have to install it - all you need to use it is cURL or Wget** (see below).

wttr.in features include:

  * **displays the current weather as well as a 3-day weather forecast, split into morning, noon, evening and night** (includes temperature range, wind speed and direction, viewing distance, precipitation amount and probability)

  * **can display Moon phases**

  * **automatic location detection based on your IP address**

  * **allows specifying a location using the city name, 3-letter airport code, area code, GPS coordinates, IP address, or domain name**. You can also specify a geographical location like a lake, mountain, landmark, and so on)

  * **supports multilingual location names** (the query string must be specified in Unicode)

  * **supports specifying the language** in which the weather forecast should be displayed in (it supports more than 50 languages)

  * **it uses USCS units for queries from the USA and the metric system for the rest of the world** , but you can change this by appending `?u` for USCS, and `?m` for the metric system (SI)

  * **3 output formats: ANSI for the terminal, HTML for the browser, and PNG**.




Like I mentioned in the beginning of the article, to use wttr.in, all you need is cURL or Wget, but you can also

**Before using wttr.in, make sure cURL is installed.** In Debian, Ubuntu or Linux Mint (and other Debian or Ubuntu-based Linux distributions), install cURL using this command:
```
sudo apt install curl

```

### wttr.in command line examples

Get the weather for your location (wttr.in tries to guess your location based on your IP address):
```
curl wttr.in

```

Force cURL to resolve names to IPv4 addresses (in case you're having issues with IPv6 and wttr.in) by adding `-4` after `curl` :
```
curl -4 wttr.in

```

**Wget also works** (instead of cURL) if you want to retrieve the current weather and forecast as a png, or if you use it like this:
```
wget -O- -q wttr.in

```

You can replace `curl` with `wget -O- -q` in all the commands below if you prefer Wget over cURL.

Specify the location:
```
curl wttr.in/Dublin

```

Display weather information for a landmark (the Eiffel Tower in this example):
```
curl wttr.in/~Eiffel+Tower

```

Get the weather information for an IP address' location (the IP below belongs to GitHub):
```
curl wttr.in/@192.30.253.113

```

Retrieve the weather using USCS units:
```
curl wttr.in/Paris?u

```

Force wttr.in to use the metric system (SI) if you're in the USA:
```
curl wttr.in/New+York?m

```

Use Wget to download the current weather and 3-day forecast as a PNG image:
```
wget wttr.in/Istanbul.png

```

You can specify the PNG

**For many other examples, check out the wttr.in[project page][2] or type this in a terminal:**
```
curl wttr.in/:help

```


--------------------------------------------------------------------------------

via: https://www.linuxuprising.com/2018/07/display-weather-forecast-in-your.html

作者：[Logix][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/118280394805678839070
[1]:https://wttr.in/
[2]:https://github.com/chubin/wttr.in
[3]:https://github.com/chubin/wttr.in#installation
[4]:https://github.com/schachmat/wego
[5]:https://github.com/chubin/wttr.in#supported-formats
