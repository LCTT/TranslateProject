[#]: subject: (Identify flowers and trees with this open source mobile app)
[#]: via: (https://opensource.com/article/21/7/open-source-plantnet)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Identify flowers and trees with this open source mobile app
======
PlantNet combines open source technology with crowdsourced knowledge to
help you become an amateur botanist.
![Fire pink flower in Maggie Valley, NC][1]

Where I live, there are lots of trails and roads lined with flowers and trees. My community is famous for its annual maple festival, and maple trees are easy for me to identify. However, there are many other trees I cannot identify by name. Flowers are the same: dandelions are easy to spot, but I don't know the names of the wildflowers that line my walking path.

Recently my wife told me about PlantNet, a mobile application that can identify these flowers and trees. It's available on iOS and Android, and it's free, so I decided to try it out.

### Identifying plants the open source way

I downloaded the app on my phone and began using it to identify some of the flowers and trees on my walks around the village. As I became familiar with the app, I noticed that the pictures I took (and those taken by other users) are shared with a Creative Commons Attribution-ShareAlike (CC-BY-SA) license. Further investigation revealed that PlantNet is [open source][2]. You can use the application anonymously if you like or become a registered member of the community.

According to the [Cos4Cloud][3] citizen science project, "PlantNet is a participatory citizen science platform for collecting, sharing, and reviewing plant observations based on automated identification. Its objective is to monitor plant biodiversity and facilitate access to plant knowledge by the general public." It uses image-recognition techniques to inventory biodiversity.

The project's development began in 2009 by botanists and computer scientists in France. It started out as a [web application][4], and the smartphone app launched in 2013. The project is part of the [Floris'Tic][5] initiative, another French project that aims to promote scientific, technical, and industrial culture in plant sciences.

PlantNet allows users to utilize a smartphone's camera to collect visual specimens, which are identified by software and the community. These photos are then shared with millions of people worldwide who are part of the PlantNet network.

The project says, "The PlantNet system works by comparing visual patterns transmitted by users via photos of plant organs (flowers, fruits, leaves …) that they seek to determine. These images are analyzed and compared to an image bank produced collaboratively and enriched daily. The system then offers a possible list of species with its illustrations."

### Using PlantNet

The mobile application is easy to use. Launch it from the app's icon on your smartphone.

![PlantNet smartphone icon][6]

(Don Watkins, [CC BY-SA 4.0][7])

When the application opens, you see the specimens you've already collected in your library. The Camera icon at the bottom of the display allows you to use your camera to add pictures to your photo library.

![Pl@ntnet homescreen][8]

(Don Watkins, [CC BY-SA 4.0][7])

Choose the Camera option, and point your phone's camera at a tree or flower you want to identify. After you take the picture, click on the option (leaf, flower, bark, fruit, and so on) that matches the specimen you want to identify.

![Selecting plant type to identify][9]

(Don Watkins, [CC BY-SA 4.0][7])

For example, if you're trying to identify a specimen by its leaf characteristics, choose **leaf**. PlantNet assigns a degree of certainty about its identification, ranging from a high to a low percentage. You can also use your smartphone's GPS function to add location information to your data collection automatically, and you can also add a note.

![Identified plant][10]

(Don Watkins, [CC BY-SA 4.0][7])

You can access all the observations you have uploaded and keep track of whether the community has approved them either on your smartphone or by logging into the website with your user ID (if you create an account). From the web interface, you can also download a record of your observations in CSV or spreadsheet formats.

![Pl@ntnet provides user stats][11]

(Don Watkins, [CC BY-SA 4.0][7])

### The great outdoors

I particularly enjoy that PlantNet links to Wikipedia so that I can read more information about the plant data I collect.

There are currently approximately 12 million PlantNet users worldwide, so the data set is growing all the time. The application is free to use for up to 500 requests per day. It also features an API that delivers data in JSON format, so you can even use Pl antNet's visual identification engine as a web service.

One very nice thing about PlantNet is that it combines crowdsourced knowledge and open source technology to connect users to each other and with the great outdoors. There's no better reason to support open source software than this.

A complete description of the application and its developers is available on [YouTube][12] (in French with English subtitles). You can also learn more about the project on [PlantNet][13]'s website.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/open-source-plantnet

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/fire-pink-flower-maggie-valley.jpg?itok=q6Ev7TSr (Fire pink flower in Maggie Valley, NC)
[2]: https://github.com/plantnet
[3]: https://cos4cloud-eosc.eu/citizen-science-innovation/cos4cloud-citizen-observatories/plntnet/
[4]: https://identify.plantnet.org/
[5]: http://floristic.org/
[6]: https://opensource.com/sites/default/files/uploads/plantnet-icon.jpg (PlantNet smartphone icon)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://opensource.com/sites/default/files/uploads/plantnet_camera.jpg (Pl@ntnet homescreen)
[9]: https://opensource.com/sites/default/files/uploads/plantnet_plant-type.jpg (Selecting plant type to identify)
[10]: https://opensource.com/sites/default/files/uploads/plantnet-identification.jpg (Identified plant)
[11]: https://opensource.com/sites/default/files/uploads/plantnet_user-stats.jpg (Pl@ntnet provides user stats)
[12]: https://www.youtube.com/watch?v=W_cBqaPfRFE
[13]: https://plantnet.org/
