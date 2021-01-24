[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How open source is helping solve the plastic pollution problem)
[#]: via: (https://opensource.com/article/21/1/openlittermap)
[#]: author: (Chris Hermansen https://opensource.com/users/clhermansen)

How open source is helping solve the plastic pollution problem
======
OpenLitterMap enables citizen scientists to use GIS to tag litter
problems in their communities.
![Empty plastic water bottle on sand pollution trash][1]

In my work life, I often deal with [geospatial data][2]. This data not only carries the customary sorts of attributes we see every day but also geographic attributes, like points, lines, enclosed areas, polygons, and surfaces. This data is typically projected from latitude, longitude, and sea-level-elevation data to other coordinate systems to facilitate analysis and viewing.

One of the things I find odd about dealing with geospatial data is how much it is monetized and bound up in restrictive license agreements. If you search for "geospatial data" using your favorite search engine, you'll probably see several pages of links to organizations that sell data or create and sell geospatial analysis and visualization software, all under restrictive licensing. But if you dig deeper, you'll find some wonderful open data and open source software.

Most people interested in open data, open source, and the world around them have heard of [OpenStreetMap][3]. OpenStreetMap incorporates data from "citizen mappers" and provides it to all under the [Open Data Commons Open Database License][4] (ODbL).

When I deal with geospatial data at work, I am primarily interested in analyzing the interactions between different data items. For example, I might want to see where a proposed electrical transmission line crosses or passes nearby small rural settlements. I mainly use two open tools: [QGIS][5], an open source geographic information system (GIS), and [PostGIS][6], a spatial extension to the PostgreSQL object-relational database. A few weeks ago, I spotted a post on the [QGIS users' mailing list][7] from Seán Lynch, who runs a new-to-me open database that tracks global litter.

Seán was soliciting interest from anyone who thinks litter could be a problem that citizen science could tackle. I interviewed Seán to learn more about his work.

**Chris Hermansen: In a nutshell, what is OpenLitterMap?**

**Seán Lynch:** [OpenLitterMap][8] is an open source, interactive, and accessible database of the world's litter and plastic pollution. We are developing a data-collection experience to harness the unprecedented potential of data collectors (citizen scientists) around the world.

Nearly everyone is equipped with a smartphone, a powerful device that can collect data, but we are not yet harnessing this unprecedented human potential. Litter mapping is an important catalyst for the development of crowd-powered science, as not only is plastic pollution globally ubiquitous, but litter is easily identifiable.

Due to its abundance and notoriety, litter has become a topic that people increasingly recognize as an environmental problem. These factors give litter mapping a remarkably low barrier to entry that can bring many people into data collection and the scientific process for the first time. OpenLitterMap is not just a map or open database of the world's plastic pollution. It's an important catalyst to help build up society's capacity to collect data.

Inspired by OpenStreetMap, we apply the same principles of crowdsourcing and open data to plastic pollution. We want everyone, everywhere and anywhere, to be able to share data on litter and plastic pollution on the streets, beaches, and anywhere else where plastic can be found. These maps tell powerful stories about plastic pollution in a very local and global context, and anyone can use our open data to help improve government policy and extend producer responsibility. Once this is developed, we want to integrate chemical pollution mapping and develop an increased capacity for biodiversity monitoring. But to achieve this, the world needs an introduction to citizen science, which we aspire to deliver.

**CH: In what ways is OpenLitterMap "open"?**

**SL:** Since we launched in 2017, our data has been openly available via the Open Database License. This includes GPS, timestamp, 120 predefined types of litter, 60+ corporate brands, the litter's presence (picked up, still there), and the full OpenStreetMap address at every location a photo was taken. Anyone can download our data for free and use it for any purpose, without restriction.

More recently, we launched the web app (Laravel + Vue) and mobile app (React Native) as open source under [GPLv3][9]. There was a delay in launching the code open source, as this was my first coding project, and I needed some time to develop the skills to manage an open source project. Since then, I have worked a few jobs as a web or full-stack developer, launched v2 of the mobile app, and scratched the surface of object detection. Soon, we will release all image file paths and the OpenLitterAI under the same GPL license. We are currently building a tool in the browser to label our images with bounding boxes, all of which will be released open source.

We also have an open Slack channel, and we try to run a weekly Zoom call for an hour, where we discuss a different aspect of the app that is topical that week. We also just launched GitHub discussions, where we will discuss all aspects of the platform. We would love to hear your thoughts and ideas about it!

**CH: When was OpenLitterMap first available?**

**SL:** The research for OpenLitterMap began in 2008 when I was introduced to GIS while studying geography at university. I wanted to use GIS to map, communicate, and fix problems of illegal dumping in my community. In 2013, during a Master's in GIS, I was introduced to OpenStreetMap and decided to apply the same principles of crowdsourcing and open data to plastic pollution. After doing a second Master's in coastal and marine environments, I developed the OpenLitterMap FOSS4G methodology and then began teaching myself how to code.

OpenLitterMap.com finally launched as a web app on the 15th of April 2017, and the mobile apps followed in 2019 (v1.0) and 2020 (v2.0). However, although we are in production, we have a lot of work to do.

**CH: Who are OpenLitterMap's users?**

**SL:** Although I have not profiled our users, I have spoken with a broad spectrum of different types of people using our app. Primarily, these include university students, people volunteering after work, older retirees, young educators, and people who are just concerned about the precarious state of the environment.

More recently, our first corporate sponsor joined the movement by giving their global workforce a half day with their families to pick up litter and record their positive environmental impact. We had a team of engineers meticulously scrape through hedgerows and bushes and carefully tag each photo with 100% accuracy.

We have recently launched our first campaign video that introduces OpenLitterMap, which will hopefully open the door to many people who are new to data collection, our shared open values, and citizen science. Next year, we would love to introduce OpenLitterMap to schools and start growing a global army of open data collectors, but citizen science is not currently anywhere near ready to achieve that.

**CH: How did you get started in mapping?**

**SL:** My interest in mapping became official the day I was introduced to GIS. Simulating and being able to control real-world data in a computer was a powerful technology and a career I wanted to become proficient in. It looked like a video game using real-world data, and I had a lot of experience with games. "Maybe I could somehow combine my interest in gaming with GIS? I might have a competitive advantage here," I thought. Although the day I was introduced to GIS, my interest shifted from digital games to digital science, my experience with digital maps started long before. In fact, the first non-TV screen I ever saw was a map of Super Mario Bros World-1 when I was four, and I have been hooked since!

After doing a Master of Science in GIS and remote sensing at University College Cork, here in my native Cork City in Ireland, I expressed my interest to join a training school in citizen science with the Vespucci Institute (COST ENERGIC Action IC1203), where I met leading practitioners and facilitators in citizen science and software developers for the first time. This was a remarkable experience, as my interest in citizen science was nurtured, and I got the inspiration to make an app. In my second Master's, I reviewed all available litter-mapping frameworks and found them to be completely inadequate. So, I turned on the GPS of my Android device and started taking geotagged photos of litter to collect the pre-marine data that I was interested in. I made my first litter maps with a plugin called Photo2Shape on QGIS, which extracted GPS coordinates from the geotagged images and converted them into a shapefile, which I was comfortable manipulating before I learned how to write PHP and JavaScript.

**CH: How did you become interested in mapping litter?**

**SL:** In my first year at university, while studying geography, our cohort was introduced to GIS. We were encouraged to think about ways to use it and about a project for the final year. Walking and cycling into college every day, I saw this area near where I lived that was plagued by dumping, littering, burned-out cars, and antisocial behavior. I wanted to use GIS to put this data on a map, as I believed there would be significant educational material with the maps and powerful problem solving with the data. The local community had been ringing up the council for years, and absolutely nothing was being done about it. I wanted to give people a voice and the ability to create geographic information about local issues and increase their voice and ability to advocate for change about how resources are allocated in society.

Once I started thinking about mapping dumping, I quickly realized there is "micro-litter" everywhere. After college, I went traveling and trained as a scuba diver in Thailand. I developed a strong personal relationship with the ocean and heard from more experienced divers about how the reefs were changing over time. Using my knowledge in geography, I extrapolated into the future and saw a bleak picture. Although plastic pollution was not a topical issue back then, the diving community was well-aware that this was a huge problem. Regularly, huge piles of garbage would wash up on the beach out of nowhere, and we would do weekly and sometimes daily cleanups above and below water.

I returned home to do a Master's in GIS to get the mapping skills, which is when I started reading about citizen science and plastic pollution. Absolutely horrified by the scale of pollution that was exacerbated by the lack of public awareness back then, I started reading more into global pollution.

The day I was introduced to OpenStreetMap, I was walking home with my phone in my hand and saw a piece of litter. I couldn't believe there wasn't a simple and effective way for me to put this data on a map and share it in the same manner as OpenStreetMap. Just like that, OpenLitterMap was born.

**CH: Are there other groups focusing on litter monitoring?**

**SL:** Yes, there are many, and someone should really write an independent review on the openness, interoperability, and tradeoffs between the various platforms. Traditionally, citizen science has been done by institutions. Although institutions will be a great help with the research, I do not believe that institutions will ever develop a data-collection experience that will enable citizen science to achieve its full potential. If they could, it would already be developed, but institutions did not build the Xbox, Snapchat, or social media, so why would anyone think they are well-positioned to develop citizen science? Although institutions typically share the same open values, partly because the researchers are already comfortably funded, they do not have the same drive or ambition that those outside institutions can bring.

A variety of privately developed litter apps are coming on the market. Since they do not have the same level of continuous funding, many are looking at ways to monetize and exploit their data. Unfortunately, this usually means they restrict access to data on pollution, which has a major disadvantage of protecting polluting industries and the status quo. As litter mapping has a low barrier to entry, many people are completely new to data collection and do not question the efficacy of who is allowed to access this data and the implications of restricting access to data on pollution.

This has been a surprisingly huge barrier for me. [We] not only have to educate people that your device is really powerful and can be used to create a paradigmatic shift in how society can create geographic knowledge, but we need to go an extra mile and educate newcomers to data collection about open principles and why data on pollution should be available to everyone, not just governments and corporations. I believe that the more polluted something is, the more open the data should be. We should absolutely want to avoid a scenario where data on pollution is locked away in silos limited exclusively to the world's major polluting industries. Sadly, this has been the trend for the last few years, as closed platforms are supported and celebrated, and open ones are not.

Another major problem with institutional research is that 99% of the funding is available for microplastics and marine litter only. Basically, nothing is being done to create knowledge about the average of 900 tons of pre-marine plastic that flows into the oceans every hour.

**CH: What could make your community more successful?**

**SL:** We need more data, more developers, and most importantly, we need more people in our community! We need a lot more data to improve how we model the OpenLitterAI, which will make our app significantly easier to use and lower the barrier to entry much further. We need more developers to help improve our software. It would be really nice to find some funding to have someone working even part time to review and merge pull requests and work on some other elements, like graphic design, videography, and social media.

The most important of all is to build up our community and increase society's capacity to collect data. As well as data collectors, we need people doing their thing on social media. We need to run more data-collection events in a post-COVID world, and we need better integration with universities, schools, and local governments. We would love it if people could download our app, lower their expectations, and give it a try! If you share the same values of open source software and its ability to democratize science on plastic pollution, we would love if you could take a look at our code or join us on Slack or Twitter or GitHub discussions for a chat.

Just as OpenStreetMap created a global community of volunteers mapping the world's streets and urban infrastructure with shared open values, we want to achieve a similar result and map the litter and plastic pollution on those streets in an open and accessible way. Litter mapping has a remarkably low barrier to entry that will continue to decrease and open the door of data collection and scientific participation to potentially huge numbers of people, making it an important catalyst for the development of crowd-powered science. To make this geographic renaissance more equitable, democratic, and transparent, we urgently need people who share our values of openness to help educate those large numbers of people who are completely new to data collection about why we not only need to map but why we need to share data (on pollution) and support the development of open source software and open communities. I hope you can join us and help us map the world's plastic pollution and guide the future direction of OpenLitterMap.

**CH: What kinds of impacts do you hope OpenLitterMap.com will make?**

**SL:** Not even one city or even a university campus has had its litter mapped. If many people worked together, it could take a couple of minutes. Once the app is much more user-friendly, and people are incentivized to and enjoy participating, we could quickly build up local, regional, and international capacities to collect huge datasets very quickly.

Building up society's ability to collect data is one important impact. Another is to increase the voice of local people who need better access to services. The original motivator for me was to increase the visibility of illegal dumping in my community. Local people had been trying to contact the city for years, and nothing was being done about it. I want to give people the ability to create geographic information and improve how resources are allocated in society. This can increase the range of producer responsibility too. If a new shop opens, or if there is a change in policy like a smoking ban or consumer preferences change overnight—or suddenly billions of people are using disposable face masks on a daily basis, how do we advocate and successfully find more important ways to manage changing types of waste? I think there is significant room for improvement here, which can only be achieved by empowering society to collect and share data.

In a few years, I believe producing huge global datasets will become the new normal. I am trying to make sure that open principles are central to this paradigm shift. This data can have profound local but also international implications. Currently, some of the best science on plastic pollution characterizes this global epidemic as a largely ocean or marine problem. Some authors suggest that nine to 10 rivers in Asia are responsible for about 90% of plastic waste entering the oceans. While these figures may be correct, even though the authors recognize there are large uncertainties with these inferences because of a lack of data (which is never reported in the media), I do not believe these results appropriately characterize contemporary anthropologic litter, which is everywhere.

We need to build a new model of how we understand and draw comparisons of plastic pollution, which has important but much less well-understood local contexts. In particular, we need to find out how plastic originates on land and how it ends up in the ocean. To achieve this, we need to improve the visibility of the pre-marine, terrestrial characteristics of plastic pollution.

For most people, litter has become normal and invisible. It has blended into the backgrounds of our lives. But global pollution should not be normal, and it is far from acceptable. Ultimately, I want to make sure that nobody ever looks at the streets the same way ever again. If you consider when Google Earth was first released, everyone could zoom in on their own home from space for the first time. If we can map the litter around people's homes and communities, this tells a very powerful story about plastic pollution in our backyards, and a powerful story has the potential to change our perception of plastic pollution from an "away" problem to an extremely local one. Just walk outside or, in many cases, just open the window. It is everywhere.

**CH: Where can interested readers find out more?**

**SL:** You can follow our updates and newsfeed on social media @openlittermap, and we have a few videos on YouTube; search for OpenLitterMap. We recently launched our first campaign video and a new demo [video about how to use our app][10]. I hope you can take an interest in this work and become a part of our open source community. We would absolutely love to have you join us.

### Get involved

Check out these resources to learn more about this interesting citizen-science project:

  * *[OpenLitterMap.com – Open data on plastic pollution with blockchain rewards][11] *is a published paper about the tech stack
  * Seán's presentation at [State of the Map in Heidelberg][12] in 2019
  * Sean's presentation on [why litter mapping is an important catalyst for the development of citizen science][13] at ESA PhiWeek 2020
  * OpenLitterMap's [fundraising campaign][14] to support this work
  * Mobile apps for [Android][15] or [iOS][15]
  * [Code on GitHub][16]
  * [Slack channel][17] and OpenLitterMap's subreddit are good places to discuss topics and plans



--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/openlittermap

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/pictures/brian-yurasits-empty-plastic-water-bottle.jpg?itok=06QoRPqe (Empty plastic water bottle)
[2]: https://en.wikipedia.org/wiki/Geographic_data_and_information
[3]: https://www.openstreetmap.org/#map=3/71.34/-96.82
[4]: https://opendatacommons.org/licenses/odbl/
[5]: https://www.qgis.org/en/site/
[6]: https://postgis.net/
[7]: https://www.qgis.org/en/site/getinvolved/mailinglists.html
[8]: https://openlittermap.com/
[9]: https://www.gnu.org/licenses/gpl-3.0.en.html
[10]: https://youtu.be/TIzhC0hRBaM
[11]: https://opengeospatialdata.springeropen.com/articles/10.1186/s40965-018-0050-y
[12]: https://www.youtube.com/watch?v=E_qhEhHwUGM
[13]: https://www.youtube.com/watch?v=5HuaQNeHuZ8
[14]: https://www.gofundme.com/f/openlittermap
[15]: https://apps.apple.com/us/app/openlittermap/id1475982147
[16]: https://github.com/openlittermap
[17]: https://openlittermap.slack.com/join/shared_invite/zt-fdctasud-mu~OBQKReRdC9Ai9KgGROw#/
