A beginner's guide to collecting and mapping Twitter data using R
============================================================

### Learn to use R's twitteR and leaflet packages, which allow you to map the location of tweets on any topic.

![A beginner's guide to collecting and mapping Twitter data using R](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/cloud-globe.png?itok=H4f-RAz_ "A beginner's guide to collecting and mapping Twitter data using R")
Image by : 

[Jason Baker][14]. [CC BY-SA 4.0][15]. Source: [Cloud][16], [Globe][17]. Both [CC0][18].

When I started learning R, I also needed to learn how to collect Twitter data and map it for research purposes. Despite the wealth of information on the internet about this topic, I found it difficult to understand what was involved in collecting and mapping Twitter data. Not only was I was a novice to R, but I was also unfamiliar with the technical terms in the various tutorials. Despite these barriers, I was successful! In this tutorial, I will break down how to collect Twitter data and display it on a map in a way that even novice coders can understand.

Programming and development

*   [New Python content][1]

*   [Our latest JavaScript articles][2]

*   [Recent Perl posts][3]

*   [Red Hat Developers Blog][4]

### Create the app

If you don't have a Twitter account, the first thing you need to do is to [create one][19]. After that, go to [apps.twitter.com][20] to create an app that allows you to collect Twitter data. Don't worry, creating the app is extremely easy. The app you create will connect to the Twitter application program interface (API). Think of an API as an electronic personal assistant of sorts. You will be using the API to ask another program to do something for you. In this case, you will be connecting to the Twitter API and asking it to collect data. Just make sure you don't ask too much, because there is a [limit][21] on how many times you can request Twitter data.

There are two APIs that you can use to collect tweets. If you want to do a one-time collection of tweets, then you'll use the **REST API**. If you want to do a continuous collection of tweets for a specific time period, you'll use the **streaming API**. In this tutorial, I'll focus on using the REST API.

After you create your app, go to the **Keys and Access Tokens** tab. You will need the Consumer Key (API key), Consumer Secret (API secret), Access Token, and Access Token Secret to access your app in R.

### Collect the Twitter data

The next step is to open R and get ready to write code. For beginners, I recommend using [RStudio][22], the integrated development environment (IDE) for R. I find using RStudio helpful when I am troubleshooting or testing code. R has a package to access the REST API called **[twitteR][8]**.

Open RStudio and create a new RScript. Once you have done this, you will need to install and load the **twitteR** package:

```
install.packages("twitteR") 
#installs TwitteR
library (twitteR) 
#loads TwitteR
```

Once you've installed and loaded the **twitteR** package, you will need to enter the your app's API information from the section above:

```
api_key <- "" 
 #in the quotes, put your API key 
api_secret <- "" 
 #in the quotes, put your API secret token 
token <- "" 
 #in the quotes, put your token
token_secret <- "" 
 #in the quotes, put your token secret
```

Next, connect to Twitter to access the API:

```
setup_twitter_oauth(api_key, api_secret, token, token_secret)
```

Let's try doing a Twitter search about community gardens and farmers markets:

```
tweets <- searchTwitter("community garden OR #communitygarden OR farmers market OR #farmersmarket", n = 200, lang = "en")
```

This code simply says to search for the first 200 tweets **(n = 200)** in English **(lang = "en")**, which contain the terms **community garden** or **farmers market**or any hashtag mentioning these terms.

After you have done your Twitter search, save your results in a data frame:

```
tweets.df <-twListToDF(tweets)
```

To create a map with your tweets, you will need to export what you collected into a **.csv** file:

```
write.csv(tweets.df, "C:\Users\YourName\Documents\ApptoMap\tweets.csv") 
 #an example of a file extension of the folder in which you want to save the .csv file.
```

Make sure you save your **R** code before running it and moving on to the next step.

### Create the map

Now that you have data, you can display it in a map. For this tutorial, we will make a basic app using the R package **[Leaflet][9]**, a popular JavaScript library for making interactive maps. Leaflet uses the [**magrittr**][23] pipe operator (**%>%**), which makes it easier to write code because the syntax is more natural. It might seem strange at first, but it does cut down on the amount of work you have to do when writing code.

For the sake of clarity, open a new R script in RStudio and install these packages:

```
install.packages("leaflet")
install.packages("maps") 
library(leaflet)
library(maps)
```

Now you need a way for Leaflet to access your data:

```
read.csv("C:\Users\YourName\Documents\ApptoMap\tweets.csv", stringsAsFactors = FALSE)
```

**stringAsFactors = FALSE** means to keep the information as it is and not convert it into factors. (For information about factors, read the article ["stringsAsFactors: An unauthorized biography"][24], by Roger Peng.)

It's time to make your Leaflet map. You are going to use the **OpenStreetMap**base map for your map:

```
m <- leaflet(mymap) %>% addTiles()
```

Let's add circles to the base map. For **lng** and **lat**, enter the name of the columns that contain the latitude and longitude of your tweets followed by **~**. The **~longitude** and **~latitude** refer to the name of the columns in your **.csv** file:

```
m %>% addCircles(lng = ~longitude, lat = ~latitude, popup = mymap$type, weight = 8, radius = 40, color = "#fb3004", stroke = TRUE, fillOpacity = 0.8)
```

Run your code. A web browser should pop up and display your map. Here is a map of the tweets that I collected in the previous section:

### [leafletmap.jpg][6]

![Map of tweets by location](https://opensource.com/sites/default/files/leafletmap.jpg "Map of tweets by location")

Map of tweets by location, Leaflet and OpenStreetMap, [CC-BY-SA][5]

<add here="" leafletmap.jpg=""></add>

Although you might be surprised with the small number of tweets on the map, typically only 1% of tweets are geocoded. I collected a total of 366 tweets, but only 10 (around 3% of total tweets) were geocoded. If you are having trouble getting geocoded tweets, change your search terms to see if you get a better result.

### Wrapping up

For beginners, putting all the pieces together to create a Leaflet map from Twitter data can be overwhelming. This tutorial is based on my experiences doing this task, and I hope it makes the learning process easier for you.

 _Dorris Scott will present this topic in a workshop, [From App to Map: Collecting and Mapping Social Media Data using R][10], at the [We Rise][11] Women in Tech Conference ([#WeRiseTech][12]) June 23-24 in Atlanta._

--------------------------------------------------------------------------------

作者简介：

Dorris Scott - Dorris Scott is a PhD student in geography at the University of Georgia. Her research emphases are in Geographic Information Systems (GIS), geographic data science, visualization, and public health. Her dissertation is on combining traditional and non-traditional data about Veteran’s Affairs hospitals in a GIS interface to help patients make more informed decisions regarding their healthcare.


-----------------
via: https://opensource.com/article/17/6/collecting-and-mapping-twitter-data-using-r

作者：[Dorris Scott ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/dorrisscott
[1]:https://opensource.com/tags/python?src=programming_resource_menu
[2]:https://opensource.com/tags/javascript?src=programming_resource_menu
[3]:https://opensource.com/tags/perl?src=programming_resource_menu
[4]:https://developers.redhat.com/?intcmp=7016000000127cYAAQ&src=programming_resource_menu
[5]:https://creativecommons.org/licenses/by-sa/2.0/
[6]:https://opensource.com/file/356071
[7]:https://opensource.com/article/17/6/collecting-and-mapping-twitter-data-using-r?rate=Rnu6Lf0Eqvepznw75VioNPWIaJQH39pZETBfu2ZI3P0
[8]:https://cran.r-project.org/web/packages/twitteR/twitteR.pdf
[9]:https://rstudio.github.io/leaflet
[10]:https://werise.tech/sessions/2017/4/16/from-app-to-map-collecting-and-mapping-social-media-data-using-r?rq=social%20mapping
[11]:https://werise.tech/
[12]:https://twitter.com/search?q=%23WeRiseTech&src=typd
[13]:https://opensource.com/user/145006/feed
[14]:https://opensource.com/users/jason-baker
[15]:https://creativecommons.org/licenses/by-sa/4.0/
[16]:https://pixabay.com/en/clouds-sky-cloud-dark-clouds-1473311/
[17]:https://pixabay.com/en/globe-planet-earth-world-1015311/
[18]:https://creativecommons.org/publicdomain/zero/1.0/
[19]:https://twitter.com/signup
[20]:https://apps.twitter.com/
[21]:https://dev.twitter.com/rest/public/rate-limiting
[22]:https://www.rstudio.com/
[23]:https://github.com/smbache/magrittr
[24]:http://simplystatistics.org/2015/07/24/stringsasfactors-an-unauthorized-biography/
[25]:https://opensource.com/users/dorrisscott
