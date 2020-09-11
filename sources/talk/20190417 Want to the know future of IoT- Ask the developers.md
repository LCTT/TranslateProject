[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Want to the know future of IoT? Ask the developers!)
[#]: via: (https://www.networkworld.com/article/3389877/want-to-the-know-future-of-iot-ask-the-developers.html#tk.rss_all)
[#]: author: (Fredric Paul https://www.networkworld.com/author/Fredric-Paul/)

Want to the know future of IoT? Ask the developers!
======
A new survey of IoT developers reveals that connectivity, performance, and standards are growing areas of concern as IoT projects hit production.
![Avgust01 / Getty Images][1]

It may be a cliché that software developers rule the world, but if you want to know the future of an important technology, it pays to look at what the developers are doing. With that in mind, there are some real, on-the-ground insights for the entire internet of things (IoT) community to be gained in a new [survey of more than 1,700 IoT developers][2] (pdf) conducted by the [Eclipse Foundation][3].

### IoT connectivity concerns

Perhaps not surprisingly, security topped the list of concerns, easily outpacing other IoT worries. But that's where things begin to get interesting. More than a fifth (21%) of IoT developers cited connectivity as a challenge, followed by data collection and analysis (19%), performance (18%), privacy (18%), and standards (16%).

Connectivity rose to second place after being the number three IoT concern for developers last year. Worries over security and data collection and analysis, meanwhile, actually declined slightly year over year. (Concerns over performance, privacy, and standards also increased significantly from last year.)

**[ Learn more:[Download a PDF bundle of five essential articles about IoT in the enterprise][4] ]**

“If you look at the list of developers’ top concerns with IoT in the survey,” said [Mike Milinkovich][5], executive director of the Eclipse Foundation via email, “I think connectivity, performance, and standards stand out — those are speaking to the fact that the IoT projects are getting real, that they’re getting out of sandboxes and into production.”

“With connectivity in IoT,” Milinkovich continued, “everything seems straightforward until you have a sensor in a corner somewhere — narrowband or broadband — and physical constraints make it hard to connect."

He also cited a proliferation of incompatible technologies that is driving developer concerns over connectivity.

![][6]

### IoT standards and interoperability

Milinkovich also addressed one of [my personal IoT bugaboos: interoperability][7]. “Standards is a proxy for interoperability” among products from different vendors, he explained, which is an “elusive goal” in industrial IoT (IIoT).

**[[Learn Java from beginning concepts to advanced design patterns in this comprehensive 12-part course!][8] ]**

“IIoT is about breaking down the proprietary silos and re-tooling the infrastructure that’s been in our factories and logistics for many years using OSS standards and implementations — standard sets of protocols as opposed to vendor-specific protocols,” he said.

That becomes a big issue when you’re deploying applications in the field and different manufacturers are using different protocols or non-standard extensions to existing protocols and the machines can’t talk to each other.

**[ Also read:[Interoperability is the key to IoT success][7] ]**

“This ties back to the requirement of not just having open standards, but more robust implementations of those standards in open source stacks,” Milinkovich said. “To keep maturing, the market needs not just standards, but out-of-the-box interoperability between devices.”

“Performance is another production-grade concern,” he said. “When you’re in development, you think you know the bottlenecks, but then you discover the real-world issues when you push to production.”

### Cloudy developments for IoT

The survey also revealed that in some ways, IoT is very much aligned with the larger technology community. For example, IoT use of public and hybrid cloud architectures continues to grow. Amazon Web Services (AWS) (34%), Microsoft Azure (23%), and Google Cloud Platform (20%) are the leading IoT cloud providers, just as they are throughout the industry. If anything, AWS’ lead may be smaller in the IoT space than it is in other areas, though reliable cloud-provider market share figures are notoriously hard to come by.

But Milinkovich sees industrial IoT as “a massive opportunity for hybrid cloud” because many industrial IoT users are very concerned about minimizing latency with their factory data, what he calls “their gold.” He sees factories moving towards hybrid cloud environments, leveraging “modern infrastructure technology like Kubernetes, and building around open protocols like HTTP and MQTT while getting rid of the older proprietary protocols.”

### How IoT development is different

In some ways, the IoT development world doesn’t seem much different than wider software development. For example, the top IoT programming languages mirror [the popularity of those languages][9] over all, with C and Java ruling the roost. (C led the way on constrained devices, while Java was the top choice for gateway and edge nodes, as well as the IoT cloud.)

![][10]

But Milinkovich noted that when developing for embedded or constrained devices, the programmer’s interface to a device could be through any number of esoteric hardware connectors.

“You’re doing development using emulators and simulators, and it’s an inherently different and more complex interaction between your dev environment and the target for your application,” he said. “Sometimes hardware and software are developed in tandem, which makes it even more complicated.”

For example, he explained, building an IoT solution may bring in web developers working on front ends using JavaScript and Angular, while backend cloud developers control cloud infrastructure and embedded developers focus on building software to run on constrained devices.

No wonder IoT developers have so many things to worry about.

**More about IoT:**

  * [What is the IoT? How the internet of things works][11]
  * [What is edge computing and how it’s changing the network][12]
  * [Most powerful Internet of Things companies][13]
  * [10 Hot IoT startups to watch][14]
  * [The 6 ways to make money in IoT][15]
  * [What is digital twin technology? [and why it matters]][16]
  * [Blockchain, service-centric networking key to IoT success][17]
  * [Getting grounded in IoT networking and security][4]
  * [Building IoT-ready networks must become a priority][18]
  * [What is the Industrial IoT? [And why the stakes are so high]][19]



Join the Network World communities on [Facebook][20] and [LinkedIn][21] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3389877/want-to-the-know-future-of-iot-ask-the-developers.html#tk.rss_all

作者：[Fredric Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Fredric-Paul/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/02/iot_internet_of_things_mobile_connections_by_avgust01_gettyimages-1055659210_2400x1600-100788447-large.jpg
[2]: https://drive.google.com/file/d/17WEobD5Etfw5JnoKC1g4IME_XCtPNGGc/view
[3]: https://www.eclipse.org/
[4]: https://www.networkworld.com/article/3269736/internet-of-things/getting-grounded-in-iot-networking-and-security.html
[5]: https://blogs.eclipse.org/post/mike-milinkovich/measuring-industrial-iot%E2%80%99s-evolution
[6]: https://images.idgesg.net/images/article/2019/04/top-developer-concerns-2019-eclipse-foundation-100793974-large.jpg
[7]: https://www.networkworld.com/article/3204529/interoperability-is-the-key-to-iot-success.html
[8]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fjava
[9]: https://blog.newrelic.com/technology/popular-programming-languages-2018/
[10]: https://images.idgesg.net/images/article/2019/04/top-iot-programming-languages-eclipse-foundation-100793973-large.jpg
[11]: https://www.networkworld.com/article/3207535/internet-of-things/what-is-the-iot-how-the-internet-of-things-works.html
[12]: https://www.networkworld.com/article/3224893/internet-of-things/what-is-edge-computing-and-how-it-s-changing-the-network.html
[13]: https://www.networkworld.com/article/2287045/internet-of-things/wireless-153629-10-most-powerful-internet-of-things-companies.html
[14]: https://www.networkworld.com/article/3270961/internet-of-things/10-hot-iot-startups-to-watch.html
[15]: https://www.networkworld.com/article/3279346/internet-of-things/the-6-ways-to-make-money-in-iot.html
[16]: https://www.networkworld.com/article/3280225/internet-of-things/what-is-digital-twin-technology-and-why-it-matters.html
[17]: https://www.networkworld.com/article/3276313/internet-of-things/blockchain-service-centric-networking-key-to-iot-success.html
[18]: https://www.networkworld.com/article/3276304/internet-of-things/building-iot-ready-networks-must-become-a-priority.html
[19]: https://www.networkworld.com/article/3243928/internet-of-things/what-is-the-industrial-iot-and-why-the-stakes-are-so-high.html
[20]: https://www.facebook.com/NetworkWorld/
[21]: https://www.linkedin.com/company/network-world
