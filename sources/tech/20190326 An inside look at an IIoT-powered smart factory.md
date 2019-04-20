[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (An inside look at an IIoT-powered smart factory)
[#]: via: (https://www.networkworld.com/article/3384378/an-inside-look-at-tempo-automations-iiot-powered-smart-factory.html#tk.rss_all)
[#]: author: (Fredric Paul https://www.networkworld.com/author/Fredric-Paul/)

An inside look at an IIoT-powered smart factory
======

### Despite housing some 50 robots and 50 people, Tempo Automation’s gleaming connected factory relies on industrial IoT and looks more like a high-tech startup office than a manufacturing plant.

![Tempo Automation][1]

As someone who’s spent his whole career working in offices, not factories, I had very little idea what a modern “smart factory” powered by the industrial Internet of Things (IIoT) might look like. That’s why I was so interested in [Tempo Automation][2]’s new 42,000-square-foot facility in San Francisco’s trendy Design District.

Frankly, I pictured the company’s facility, which uses IIoT to automatically configure, operate, and monitor the prototyping and low-volume production of printed circuit board assemblies (PCBAs), as a cacophony of robots and conveyor belts attended to by a grizzled band of grease-stained technicians. You know, a 21stcentury update of Charlie Chaplin’s 1936 classic *Modern Times *making equipment for customers in the aerospace, medtech, industrial automation, consumer electronics, and automotive industries. (The company just inked a [new contract with Lockheed Martin][3].)

**[ Learn more about the[industrial Internet of Things][4]. | Get regularly scheduled insights by [signing up for Network World newsletters][5]. ]**

Not exactly. As you can see from the below pictures, despite housing some 50 robots and 50 people, this gleaming “connected factory” looks more like a high-tech startup office, with just as many computers and few more hard-to-identify machines, including Solder Jet and Stencil Printers, zone reflow ovens, 3D X-ray devices and many more.

![Tempo Automation office space][6]

![Tempo Automation factory floor][7]

## How Tempo Automation's 'smart factory' works

On the front end, Tempo’s customers upload CAD files with their board designs and Bills of Materials (BOM) listing the required parts to be used. After performing feature extraction on the design and developing a virtual model of the finished product, the Tempo system, the platform (called Tempocom) creates a manufacturing plan and automatically programs the factory’s machines. Tempocom also creates work plans for the factory employees, uploading them to the networked IIoT mobile devicesthey all carry. Updated in real time based on design and process changes, this“digital traveler” tells workers where to go and what to work on next.

While Tempocom is planning and organizing the internal work of production, the system is also connected to supplier databases, seeking and ordering the parts that will be used in assembly, optimizing for speed of delivery to the Tempo factory.

## Connecting the digital thread

“There could be up to 20 robots, 400 unique parts, and 25 people working on the factory floor to produce one order start to finish in a matter of hours,” explained [Shashank Samala][8], Tempo’s co-founder and vice president of product in an email. Tempo “employs IIoT to automatically configure, operate, and monitor” the entire process, coordinated by a “connected manufacturing system” that creates an “unbroken digital thread from design intent of the engineer captured on the website, to suppliers distributed across the country, to robots and people on the factory floor.”

Rather than the machines on the floor functioning as “isolated islands of technology,” Samala added, Tempo Automation uses [Amazon Web Services (AWS) GovCloud][9] to network everything in a bi-directional feedback loop.

“After customers upload their design to the Tempo platform, our software extracts the design features and then streams relevant data down to all the devices, processes, and robots on the factory floor,” he said. “This loop then works the other way: As the robots build the products, they collect data and feedback about the design during production. This data is then streamed back through the Tempo secure cloud architecture to the customer as a ‘Production Forensics’ report.”

Samala claimed the system has “streamlined operations, improved collaboration, and simplified remote management and control.”

## Traditional IoT, too

Of course, the Tempo factory isn’t all fancy, cutting-edge IIoT implementations. According to Ryan Saul, vice president of manufacturing,the plant also includes an array of IoT sensors that track temperature, humidity, equipment status, job progress, reported defects, and so on to help engineers and executives understand how the facility is operating.

Join the Network World communities on [Facebook][10] and [LinkedIn][11] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3384378/an-inside-look-at-tempo-automations-iiot-powered-smart-factory.html#tk.rss_all

作者：[Fredric Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Fredric-Paul/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/03/tempo-automation-iiot-factory-floor-100791923-large.jpg
[2]: http://www.tempoautomation.com/
[3]: https://www.businesswire.com/news/home/20190325005097/en/Tempo-Automation-Announces-Contract-Lockheed-Martin
[4]: https://www.networkworld.com/article/3243928/internet-of-things/what-is-the-industrial-iot-and-why-the-stakes-are-so-high.html#nww-fsb
[5]: https://www.networkworld.com/newsletters/signup.html#nww-fsb
[6]: https://images.idgesg.net/images/article/2019/03/tempo-automation-iiot-factory-2-100791921-large.jpg
[7]: https://images.idgesg.net/images/article/2019/03/tempo-automation-iiot-factory-100791922-large.jpg
[8]: https://www.linkedin.com/in/shashanksamala/
[9]: https://aws.amazon.com/govcloud-us/
[10]: https://www.facebook.com/NetworkWorld/
[11]: https://www.linkedin.com/company/network-world
