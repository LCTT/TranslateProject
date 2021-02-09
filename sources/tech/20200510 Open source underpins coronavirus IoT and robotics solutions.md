[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Open source underpins coronavirus IoT and robotics solutions)
[#]: via: (https://opensource.com/article/20/5/robotics-covid19)
[#]: author: (Sam Bocetta https://opensource.com/users/sambocetta)

Open source underpins coronavirus IoT and robotics solutions
======
From sanitization of equipment and facilities to plotting the spread of
the virus, robots are playing an active role in combating COVID-19.
![Three giant robots and a person][1]

The tech sector is quietly having a boom during the COVID-19 pandemic. Open source developers are getting involved with many aspects of the fight against the coronavirus, [using Python to visualize its spread][2] and helping to repurpose data acquisition systems to perform contact tracing.

However, one of the most exciting areas of current research is the use of robotics to contain the spread of the coronavirus. In the last few weeks, robots have been deployed in critical environments—particularly in hospitals and on airplanes—to help staff sterilize surfaces and objects.

Most of these robots are produced by tech startups, who have seen an opportunity to prove the worth of their proprietary systems. Many of them, however, rely on [open source cloud and IoT tools][3] that have been developed by the open source community.

In this article, we'll take a look at how robotics are being used to fight the disease, the IoT infrastructure that underpins these systems, and finally, the security and privacy concerns that their increased use is highlighting.

### Robots and COVID-19

Around the world, robots are being deployed to help the fight against COVID-19. The most direct use of robots has been in healthcare facilities, and China has taken the lead when it comes to deploying robots in hospitals.

For example, a field hospital that recently opened in Wuhan—where the virus originated—is [making extensive use of robots][4] to help healthcare workers care for patients. Some of these robots provide food, drink, and medicine to patients, and others are used to clean parts of the hospital.

Other companies, such as the Texas startup Xenex Disinfection Services, are using robots and UV light to deactivate viruses, bacteria, and spores on surfaces in airports. Still others, like Dimer UVC Innovations, are focusing on making robots that can [improve aircraft hygiene][5].

Not all of the "robots" deployed against the disease are anthropomorphic, though. The same field hospital in Wuhan that is using human-like robots is also making extensive use of less obviously "robotic" IoT devices.

Patients entering the hospital are screened by networked 5G thermometers to alert staff for anyone showing a high fever, and patients wear smart bracelets and rings equipped with sensors. These are synced with CloudMinds' AI platform, and patients' vital signs, including temperature, heart rate, and blood oxygen levels, can be monitored.

### Robots and the IoT

Even when these robots appear to be independent entities, they make [extensive use of the IoT][6]. In other words, although patients may feel that they are being cared for by a robot that can make its own decisions, in reality, these robots are controlled by large, distributed sensing and data processing systems.

Although many of the robots being deployed are the proprietary property of the tech firms who produce their hardware, their functioning is based on an ecosystem of software that is largely open source.

This observation is an important one because it overturns one of the primary misconceptions about the [way that AI is used today][7][,][7] whether in a healthcare setting or elsewhere. Most research into robotics today does not seek to embed fully intelligent AI systems into robots themselves but, instead, uses centralized AI systems to control a wide variety of far less "smart" IoT devices.

This observation, in turn, highlights two key points about the robots currently being developed and used to fight COVID-19. One is that they rely on a software ecosystem—much of it open source—that has been developed in a truly collaborative process involving thousands of engineers. The second is that the networked nature of these robots makes them vulnerable to exploitation.

### Security and privacy

This vulnerability to cybersecurity threats has led some analysts to raise questions about the wisdom of widespread deployment of IoT-driven robotics, whether in the healthcare system or anywhere else. Spyware in the IoT [remains a huge problem][8], and some fear that by integrating IoT systems into healthcare, we may be exposing more data—and more sensitive data—to intruders.

Even where developers are careful to build security into these devices, the sheer number of components they rely on makes DevSecOps processes difficult to implement. Especially in this current time of crisis, many software engineers have been forced to accelerate the release of new components, and this could lead to them being vulnerable. If a company is rushing to bring a healthcare robot onto the market in response to COVID-19, it's unlikely that the open source code that these devices run on will be [properly audited][9].

And even if companies are able to maintain the integrity of their DevSecOps processes while still accelerating development, it's far from certain that patients themselves understand the privacy implications of delegating their care to IoT devices. Many lack the open source privacy tools [necessary to keep their data private][10] when browsing the internet, let alone those that should be deployed to protect sensitive healthcare data.

### The future

In short, the deployment of robots in the fight against COVID-19 is highlighting long-standing concerns about the integrity, security, and privacy of IoT systems more generally. Professionals in this field have long argued that [IoT audits][11] and [embedded Linux systems][12] should be the standard for IoT development, but in the current crisis, their warnings are likely to be ignored.

This is worrying because it's likely that IoT systems will be increasingly used in healthcare in the coming decade. So whilst the COVID-19 pandemic will provide a proof of their utility in this sector, it should also not be used as an excuse to roll out poorly secured, poorly audited IoT software in highly sensitive environments.

Open source isn’t just changing the way we interact with the world, it’s changing the way the world...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/robotics-covid19

作者：[Sam Bocetta][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sambocetta
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUSINESS_robots.png?itok=TOZgajrd (Three giant robots and a person)
[2]: https://opensource.com/article/20/4/python-data-covid-19
[3]: https://opensource.com/article/18/7/digital-transformation-strategy-think-cloud
[4]: https://www.cnbc.com/2020/03/18/how-china-is-using-robots-and-telemedicine-to-combat-the-coronavirus.html
[5]: https://www.therobotreport.com/company-offers-germ-killing-robot-to-airports-to-address-coronavirus-outbreak/
[6]: https://www.cloudwards.net/what-is-the-internet-of-things/
[7]: https://opensource.com/article/17/3/5-big-ways-ai-rapidly-invading-our-lives
[8]: https://blog.eccouncil.org/spyware-in-the-iot-what-does-it-mean-for-your-online-privacy/
[9]: https://opensource.com/article/17/10/doc-audits
[10]: https://privacyaustralia.net/privacy-tools/
[11]: https://opensource.com/article/19/11/how-many-iot-devices
[12]: https://opensource.com/article/17/3/embedded-linux-iot-ecosystem
