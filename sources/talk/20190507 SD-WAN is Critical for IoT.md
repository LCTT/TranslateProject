[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (SD-WAN is Critical for IoT)
[#]: via: (https://www.networkworld.com/article/3393445/sd-wan-is-critical-for-iot.html#tk.rss_all)
[#]: author: (Rami Rammaha https://www.networkworld.com/author/Rami-Rammaha/)

SD-WAN is Critical for IoT
======

![istock][1]

The Internet of Things (IoT) is everywhere and its use is growing fast. IoT is used by local governments to build smart cities. It’s used to build smart businesses. And, consumers are benefitting as it’s built into smart homes and smart cars. Industry analyst first estimates that over 20 billion IoT devices will be connected by 2020. That’s a 2.5x increase from the more than 8 billion connected devices in 2017*.

Manufacturing companies have the highest IoT spend to date of industries while the health care market is experiencing the highest IoT growth. By 2020, 50 percent of IoT spending will be driven by manufacturing, transportation and logistics, and utilities.

IoT growth is being fueled by the promise of analytical data insights that will ultimately yield greater efficiencies and enhanced customer satisfaction. The top use cases driving IoT growth are self-optimizing production, predictive maintenance and automated inventory management.

From a high-level view, the IoT architecture includes sensors that collect and transmit data (i.e. temperature, speed, humidity, video feed, pressure, IR, proximity, etc.) from “things” like cars, trucks, machines, etc. that are connected over the internet. Data collected is then analyzed, translating raw data into actionable information. Businesses can then act on this information. And at more advanced levels, machine learning and AI algorithms learn and adapt to this information and automatically respond at a system level.

IDC estimates that by 2025, over 75 billion IoT devices* will be connected. By that time, nearly a quarter of the world’s projected 163 zettabytes* (163 trillion gigabytes) of data will have been created in real-time, and the vast majority of that data will have been created by IoT devices. This massive amount of data will drive an exponential increase in traffic on the network infrastructure requiring massive scalability. Also, this increasing amount of data will require tremendous processing power to mine it and transform it into actionable intelligence. In parallel, security risks will continue to increase as there will be many more potential entry points onto the network. Lastly, management of the overall infrastructure will require better orchestration of policies as well as the means to streamline on-going operations.

### **How does SD-WAN enable IoT business initiatives?**

There are three key elements that an [SD-WAN][2] platform must include:

  1. **Visibility** : Real-time visibility into the network is key. It takes the guesswork out of rapid problem resolution, enabling organizations to run more efficiently by accelerating troubleshooting and applying preventive measures. Furthermore, a CIO is able to pull metrics and see bandwidth consumed by any IoT application.
  2. **Security** : IoT traffic must be isolated from other application traffic. IT must prevent – or at least reduce – the possible attack surface that may be exposed to IoT device traffic. Also, the network must continue delivering other application traffic in the event of a melt down on a WAN link caused by a DDoS attack.
  3. **Agility** : With the increased number of connected devices, applications and users, a comprehensive, intelligent and centralized orchestration approach that continuously adapts to deliver the best experience to the business and users is critical to success.



### Key Silver Peak EdgeConnect SD-WAN capabilities for IoT

1\. Silver Peak has an [embedded real-time visibility engine][3] allowing IT to gain complete observability into the performance attributes of the network and applications in real-time. The [EdgeConnect][4] SD-WAN appliances deployed in branch offices send information to the centralized [Unity Orchestrator™][5]. Orchestrator collects the data and presents it in a comprehensive management dashboard via customizable widgets. These widgets provide a wealth of operational data including a health heatmap for every SD-WAN appliance deployed, flow counts, active tunnels, logical topologies, top talkers, alarms, bandwidth consumed by each application and location, latency and jitter and much more. Furthermore, the platform maintains weeks’ worth of data with context allowing IT to playback and see what has transpired at a specific time and location, similar to a DVR.

![Click to read Solution Brief][6]

2\. The second set of key capabilities center around security and end-to-end zone-based segmentation. An IoT traffic zone may be created on the LAN or branch side. IoT traffic is then mapped all the way across the WAN to the data center or cloud where the data will be processed. Zone-based segmentation is accomplished in a simplified and automated way within the Orchestrator GUI. In cases where further traffic inspection is required, IT can simply service chain to another security service. There are several key benefits realized by this approach. IT can easily and quickly apply segmentation policies; segmentation mitigates the attack surface; and IT can save on additional security investments.

![***Click to read Solution Brief ***][7]

3\. EdgeConnect employs machine learning at the global level where with internet sensors and third-party sensors feed into the cloud portal software. The software tracks the geolocation of all IP addresses and IP reputation, distributing signals down to the Unity Orchestrator running in each individual customer’s enterprise. In turn, it is speaking to the edge devices sitting in the branch offices. There, distributed learning is done by looking at the first packet, making an inference based on the first packet what the application is. So, if seeing that 100 times now, every time packets come from that particular IP address and turns out to be an IoT, we can make an inference that IP belongs to IoT application. In parallel, we’re using a mix of traditional techniques to validate the identification of the application. All this combined other multi-level intelligence enables simple and automated policy orchestration across a large number of devices and applications.

![***Click to read Solution Brief ***][8]

SD-WAN plays a foundational role as businesses continue to embrace IoT, but choosing the right SD-WAN platform is even more critical to ensuring businesses are ultimately able to fully optimize their operations.

* Source: [IDC][9]

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3393445/sd-wan-is-critical-for-iot.html#tk.rss_all

作者：[Rami Rammaha][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Rami-Rammaha/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/05/istock-1019172426-100795551-large.jpg
[2]: https://www.silver-peak.com/sd-wan/sd-wan-explained
[3]: https://www.silver-peak.com/resource-center/simplify-sd-wan-operations-greater-visibility
[4]: https://www.silver-peak.com/products/unity-edge-connect
[5]: https://www.silver-peak.com/products/unity-orchestrator
[6]: https://images.idgesg.net/images/article/2019/05/1_simplify-100795554-large.jpg
[7]: https://images.idgesg.net/images/article/2019/05/2_centralize-100795555-large.jpg
[8]: https://images.idgesg.net/images/article/2019/05/3_increase-100795558-large.jpg
[9]: https://www.information-age.com/data-forecast-grow-10-fold-2025-123465538/
