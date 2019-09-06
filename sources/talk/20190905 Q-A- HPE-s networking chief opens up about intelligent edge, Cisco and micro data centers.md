[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Q&A: HPE's networking chief opens up about intelligent edge, Cisco and micro data centers)
[#]: via: (https://www.networkworld.com/article/3435206/qa-hpes-networking-chief-opens-up-about-intelligent-edge-cisco-and-micro-data-centers.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Q&A: HPE's networking chief opens up about intelligent edge, Cisco and micro data centers
======
HPE’s Keerti Melkote talks about networking challenges at the edge, network-based security, micro data centers and his company's strategies as he negotiates one of the most technologically and competitively challenging markets.
HPE

Since founding Aruba Networks in 2002 and then staying on when Hewlett Packard bought the firm in 2015,  Keerti Melkote has seen firsthand the evolution of the wireless industry.

From the initial rush to bring laptops using Wi-Fi to the enterprise and the advent of Apple iPad – which Melkote says was a defining moment for enterprise mobility because of the device’s popularity and its need for pervasive enterprise Wi-Fi connectivity – the wireless world has changed dramatically.

**More about edge networking**

  * [How edge networking and IoT will reshape data centers][1]
  * [Edge computing best practices][2]
  * [How edge computing can help secure the IoT][3]



And as HPE's President, Intelligent Edge, Melkote is in a position to set the future course for the company’s wired and wireless strategy.  He recently talked with Network World Senior Editor Michael Cooney to lay out HPE’s networking challenges and strategies as it negotiates one of the most technologically and competitively challenging markets.

**[For a quick look at what networking technologies Melkote thinks are ripe for innovation go here.]**

**COONEY: In the past five years or so what do you think some of the more significant changes have been in the mobile world?**

**MELKOTE:** The last five years of mobility has been really around the integration of applications like unified communications with mobile devices. Now your mobile device is not only providing you a telephone number on the cell network but your office number is delivered to you through a UC application like Skype for Business or games or Zoom, like we are on right now, on any number of unified-communications applications. The big upshot of this evolution was that finally enterprises are able to now unplug their telephone cables from people’s desks and go totally wireless, and that has been a significant, I would say, shift in the posture of how networks are being deployed in the enterprise to Mobile First. 

Building on top of that, there is a whole tier of location-based services that are emerging where with mobile-first all your devices are wirelessly connected. I can not only deliver network services to you, but I can also detect their assorted devices. Based off that we can bring up a whole bunch of services, things like wayfinding, navigating you from Point A to Point B or providing you location based notifications or location based workflows like checking into a hotel without having to stand at the reception desk, going to your hotel room and opening the door, etc. 

The next stage I see of mobility is really [IoT][4], a whole bunch of IoT devices entering the enterprise and really causing a big headache from a security perspective but also huge opportunities in terms of new integrating ideas as well as business-optimization ideas.

**COONEY: Do you think the notion of Mobile First has** **already** **arrived?  Are you seeing that in your customer base at this point?**

**MELKOTE:** Yes, absolutely.  As I said, the value to that was getting rid of the phone line. By phone line I don’t mean the analog. I think most people went with voice-over-IP phone lines, but the fact is now you don’t need a phone at your desk nor do you need a wired connection at your desk. People are embracing Mobile First in a big way because it makes a user where they are on their device but also it’s a big cost savings for the enterprise because you’re not pulling cabling everywhere.

**COONEY:  Where does the notion of intelligent edge stand these days? **

**MELKOTE:** If you look at everything I said so far, networks have been in the business of connecting users to applications until now. The application typically is a [data-center][5] application that sat on-premises, increasingly now in the cloud. The job of the network was transporting bits from Point A to Point B. We’ve done it wirelessly now, and that’s Mobile First.  But with IoT, that paradigm changes a little bit, where there is a ton of data being generated with IoT devices that are sensing the world around us. This data in its raw form, if you start to transport that to the cloud there is not enough bandwidth to go around, first of all, and a lot of times the use cases for the data tend to be real-time in nature. In other words, you need to turn around and make a real-time decision based on the data that is being emitted from sensors.  For real-time use cases and for that compression of that vast amount of data being generated at the edge, you need intelligence and compute capabilities at the edge. 

The role of the network has changed from being purely a conduit from Point A to Point B to now providing intelligence that provides true application and business value right at the point where the data is born. That is why we see the emergence of intelligent edge, a very, very big opportunity for us and really the next evolution of the architecture of the enterprise itself.

**COONEY: Can you expand further on the importance of gathering and using this intelligence? Why is that important?**

**MELKOTE:** The network is already collecting a lot of data based on what endpoint you already use. Location is a good source of data which gives you context to your data about where a thing or a person is, and that is very valuable. Finally, the IoT devices themselves, which are basically sensors, they are sensing environmental conditions, they can be sensing things like vibrations, they can be sensing images, they could be sensing motion. There are all kinds of sensors which are generating this kind of data.

Another example of a sensor is noise detection – glass break for windows for security reasons. You can imagine tons of sensors that are converting analog information into digital data streams, and that is sitting right at the edge and the connectivity for these sensors happens over wired and wireless. But the reality is this data then comes into the network, and as I said, there is not enough bandwidth to ship the data in its raw form all the way to the cloud where intelligent algorithms can make sense of the data.  So what you have to do is basically collect the data right at that point where it’s born, do some analysis on the data, generate insights or actions that are taken right at the edge and then carry the data – what we call metadata, which is digested data – and reduce the bandwidth needed to send that digested data back to the cloud for deep storage, for deep analytics, then send it back.

**COONEY: I’m wondering what your view of the data center is these days and how it has changed. What’s HPE's positioning on the data center at this point?**

**MELKOTE:** I think data center, to me, I think that in the edge context, the framework that we are evolving to is an edge-to-cloud framework. If you think of the past, we used to have edges called campuses or branch offices or outdoor locations that would connect over a wide area network to an on-premises data center. That was the world we built, but as you look to the future, that application which used to be in the data center is getting increasingly disaggregated and being deployed not only inside the data center but also increasingly from the cloud. In that context, what’s happening is the traditional, I would say historical, legacy applications will remain in the on-prem data center for a very long time to come. I don’t see a huge growth in that data-center world of a traditional, centralized on-prem data center. 

The next set of applications are coming directly from the cloud, whether it is SaaS applications like Office 365 and Salesforce.com or whether it’s enterprise apps like SAP being delivered from the cloud. The third evolution we see is an edge data center, which is a result of the increased amount of IoT deployment and the amount of data being generated at the edge. The intelligent-edge vision that we have in this edge-to-cloud framework will include a data-center capability that will we call a micro data center that will be deployed at that point where the data gets created. This is the world we are designing for. That’s not to say that the on-prem data center goes away or the cloud data center goes away.  Those two will continue to be served, and we will continue to serve those through our switching/networking products as well as our traditional compute and storage products from HPE. 

**COONEY: Could you talk about what’s the positioning and strategy of Aruba and HPE these days? **

**MELKOTE:**  Aruba was started as a wireless company, and we made our differentiation with security. Since the integration with HPE, for the last four years Aruba has evolved to become the networking division for HPE so we have obviously now evolved from wireless to doing wired and wireless. As I just recently described, we’ve added cloud, [SD-WAN][6] and security capabilities on top of it. You can think of Aruba now as a full-service, full-stack networking player that provides an end-to-end solution for customers across campus, branch, data center and cloud networks.

**COONEY: Could talk a little bit about how your networking strategy, with the edge and some of the other pieces we’ve talked about here, is different from Cisco's or other competitors'?**

**MELKOTE:** I think there are actually several different things that I want to touch on there. The first is our commitment to the edge and the edge-to-cloud architecture. I think there’s a bigger picture perspective that we are driving our architecture to that is beyond any vendor. There’s a world that we see that is going to be edge-to-cloud and our value proposition is who we are in that world. We believe we’ll be the best player to offer an intelligent edge-to-cloud architecture that is built from the ground up and integrated into a single cohesive solution. How is that different from Cisco? At Cisco you have, if you want cloud-based solutions, you go to Meraki. If you want to do a traditional thing, then you go to Cisco DNA or whatever else. It’s not a very cohesive integrated architecture. It depends on which lane you want to take what solution you get. With Aruba it is one architecture no matter how you want to deploy it, whether you want to manage it from the cloud or manage it in an on-prem data center. 

The second thing is our commitment to [an] open, multivendor market. We are going to offer the full-stack solution, but we don’t want to lock our customers in with proprietary technology. HPE historically has been very committed to open standards and open source software  open movements in general, and that commitment continues in the marketplace. We want to give customers a choice even as we offer full-stack solutions so they disaggregate layers and consume layers as they like through wired and wireless. [They] can be disagregated if that’s what customers want. We don’t want to lock our customers into any given endpoint framework.

The third, I would say, difference in the architecture is the way we approach security, which is from the ground up, built into the architecture with a commitment to not only traditional networking but secure networking with Layer 4-7 visibility that gives us deep understanding of the user, the device, the application, the location, and gives them very comprehensive security views as to what’s happening on the network itself.  Those three I see as significant deviations technologically, but I think probably the most powerful one is our commitment to a culture of customer first, customer last and who we are as an organization and how we serve our customers.

Join the Network World communities on [Facebook][7] and [LinkedIn][8] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3435206/qa-hpes-networking-chief-opens-up-about-intelligent-edge-cisco-and-micro-data-centers.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3291790/data-center/how-edge-networking-and-iot-will-reshape-data-centers.html
[2]: https://www.networkworld.com/article/3331978/lan-wan/edge-computing-best-practices.html
[3]: https://www.networkworld.com/article/3331905/internet-of-things/how-edge-computing-can-help-secure-the-iot.html
[4]: https://www.networkworld.com/article/3207535/what-is-iot-how-the-internet-of-things-works.html
[5]: https://www.networkworld.com/article/3223692/what-is-a-data-centerhow-its-changed-and-what-you-need-to-know.html
[6]: https://www.networkworld.com/article/3031279/sd-wan-what-it-is-and-why-you-ll-use-it-one-day.html
[7]: https://www.facebook.com/NetworkWorld/
[8]: https://www.linkedin.com/company/network-world
