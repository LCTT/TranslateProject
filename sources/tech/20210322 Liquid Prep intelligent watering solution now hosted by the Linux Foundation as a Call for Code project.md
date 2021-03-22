[#]: subject: (Liquid Prep intelligent watering solution now hosted by the Linux Foundation as a Call for Code project)
[#]: via: (https://www.linux.com/news/liquid-prep-intelligent-watering-solution-now-hosted-by-the-linux-foundation-as-a-call-for-code-project/)
[#]: author: (Linux.com Editorial Staff https://www.linux.com/author/linuxdotcom/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Liquid Prep intelligent watering solution now hosted by the Linux Foundation as a Call for Code project
======

Over the past several decades farmers have been depending increasingly on groundwater to irrigate their crops due to climate change and reduced rainfall. Farmers, even in drought-prone areas, continue to need to grow water-intensive crops because these crops have a steady demand.

In 2019, as part of [Call for Code][1], a team of IBMers came together and brainstormed on ideas they were passionate about – problems faced by farmers in developing countries due to more frequent drought conditions. The team designed an end-to-end solution that focuses on helping farmers gain insight into when to water their crops and help them optimize their water usage to grow healthy crops. This team, Liquid Prep, went on to win the IBM employee Call for Code Global Challenge.

Liquid Prep provides a mobile application that can obtain soil moisture data from a portable soil moisture sensor, fetch weather information from The Weather Company, and access crop data through a service deployed on the IBM Cloud. Their solution brings all this data together, analyzes it, and computes watering guidance to help the farmer decide whether to water their crops right now or conserve it for a better time.

To validate the Liquid Prep prototype, in December 2019, one of the team members traveled to India and [interviewed][2] several farmers in the village Nuggehalli, which is near the town Hirisave in the Hassan district of Karnataka, India. The interviews taught the team that the farmers did not have detailed information on when they should water their specific crops and by how much, as they didn’t know the specific needs on a plant-by-plant basis. They also just let the water run freely if the water was available from a nearby source, like a river or stream, and some were entirely dependent on rainfall. The farmers expressed a great interest in the described Liquid Prep solution as it could empower them to make more informed decisions that could improve yields.

### A prototype is born

After winning the challenge the Liquid Prep team took on the opportunity to convert the concept to a more complete prototype through an [IBM Service Corps engagement][3]. The team was expanded with dedicated IBM volunteers from across the company and they were assigned to optimize Liquid Prep from August through October 2020. During this time the team developed the Minimum Viable Product (MVP) for the mobile solution.

The prototype consists of three primary components:

  * A hardware sensor to measure soil moisture
  * A highly visual and easy-to-use mobile web application, and
  * A back-end data service to power the app.



It works like this: the mobile web application gets soil moisture data from the soil moisture sensor. The app requests environmental conditions from The Weather Company and crop data from the plant database via the backend service deployed on the IBM Cloud. The app analyzes and computes a watering schedule to help the farmer decide if they should water their crops now or at a later time.

### Partners

Liquid Prep has a developed a great working relationship with partners SmartCone Technologies, Inc., and Central New Mexico Community College. Students in the Deep Dive Coding Internet of Things (IoT) Bootcamp at CNM are designing, developing, and producing a robust IoT sensor and housing it in the shape of a stick that can be inserted into the soil and transfer the soil moisture data to the Liquid Prep mobile app via Bluetooth. The collaboration gives students important real-world experience before they enter the workforce.

“SmartCone is honored to be part of this project.  This is a perfect example of technology teams working together to help make the world a better place, “ said Jason Lee, Founder &amp; CEO, SmartCone Technologies Inc.

Additionally, Liquid Prep will work together with J&amp;H Nixon Farms, who largely grow soybeans and corn crops on about 2800 acres of agricultural land in Ottawa, Canada. They have offered Liquid Prep the opportunity to pilot test the prototype on several plots of land that have different soil conditions, which in turn can expand the breadth of recommendation options to a larger number of potential users.

### Now available as open source

Liquid Prep is now available as an open source project hosted by the Linux Foundation. The goal of the project is to help farmers globally farm their crops with the least amount of water by taking advantage of real-time information that can help improve sustainability and build resiliency to climate change.

Participation is welcomed from software developers, designers, testers, agronomists/agri experts/soil experts, IoT engineers, researchers, students, farmers, and others that can help improve the quality and value of the solution for small farmers around the world. Key areas the team are interested in developing include localizing the mobile app, considering soil properties for the improvement of the watering advice, updating project documentation, software and hardware testing, more in-depth research, and adding more crop data to the database.

Get involved in Liquid Prep now at [Call For Code][4]

The post [Liquid Prep intelligent watering solution now hosted by the Linux Foundation as a Call for Code project][5] appeared first on [Linux Foundation][6].

--------------------------------------------------------------------------------

via: https://www.linux.com/news/liquid-prep-intelligent-watering-solution-now-hosted-by-the-linux-foundation-as-a-call-for-code-project/

作者：[Linux.com Editorial Staff][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/author/linuxdotcom/
[b]: https://github.com/lujun9972
[1]: http://developer.ibm.com/callforcode
[2]: https://www.liquidprep.org/post/liquidprep-solving-our-farmer-s-water-crisis-one-drop-at-a-time
[3]: https://www.ibm.org/initiatives/ibm-service-corps
[4]: https://www.linuxfoundation.org/projects/call-for-code/
[5]: https://www.linuxfoundation.org/en/blog/liquid-prep-intelligent-watering-solution-now-hosted-by-the-linux-foundation-as-a-call-for-code-project/
[6]: https://www.linuxfoundation.org/
