Dedicated engineering team in South Africa deploys open source tools, save lives
============================================================

 ![Dedicated engineering team in South Africa deploys open source tools, save lives](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/world_hands_diversity.png?itok=LMT5xbxJ "Dedicated engineering team in South Africa deploys open source tools, save lives") 
Image by : opensource.com

In 2006, a groundbreaking TED talk used statistics to reveal surprising [insights about the developing world][2], including how many people in South Africa have HIV despite free and available anti-retroviral drugs.

[Gustav Praekelt][3], founder of [Praekelt.org][4], heard this TED talk and began tenaciously calling a local hospital to convince them to start an SMS program that would promote anti-retrovirals. The program that resulted from those calls became [txtAlert][5]—a successful and widely recognized mobile health program that dramatically improves medical appointment adherence and creates a free channel for patients to communicate with the hospital. 

Today, nearly a decade later, the organization that Gustav founded in 2007, Praekelt.org, continues to harness the power of mobile technology.

The global nonprofit organization uses open source technologies to deliver essential information and vital services to millions of people around the world, particularly in Africa. We are deeply committed to the idea that our software innovations should be shared with the development community that made delivering our products possible. By participating and giving back to this community we support and sustain the rich ecosystem of tools and products that they have developed to improve the lives of people around the world.

Praekelt.org is a supporter of the [Principles for Digital Development][6] and in particular [Cause 6][7], which states:

*   Adopt and expand existing open standards.
*   Open data and functionalities and expose them in documented Application Programming Interfaces (APIs) where use by a larger community is possible.
*   Invest in software as a public good.
*   Develop software to be open source by default with the code made available in public repositories and supported through developer communities.

A great example of this can be found in our original work to make population-scale messaging possible in the majority world. We had and continue to have success with txtAlert in South Africa, but despite considerable interest, replicating this success in other places has been very challenging. The necessary integration work required for each new messaging service provider requires too much customization.

To solve this, we created [Vumi][8], a software library that provides a single point of integration for messaging communication channel integrations. It abstracts away all of the differences that require the customized integrations and provided a single consistent API to speak to all of them. The result is a dramatic increase in the re-use of both integrations and applications because they were only needing to be written once and could be used widely.

Vumi provides the means of integrations, and this past year in collaboration with UNICEF we have launched [Junebug][9], an application server that provides APIs to launch Vumi integrations, enabling direct messaging system integrations in both cloud- and on-premise-based scenarios. Junebug now powers national-scale, maternal health programs in South Africa, Nigeria, and Uganda, delivering essential information for expecting women and mothers. It also provides SMS and [Unstructured Supplementary Service Data][10] (USSD) access to vital services, such as national helpdesks and FAQ services.

These systems have processed over 375 million real-time messages in the last year.

We are a relatively small engineering team based out of South Africa. We could not fathom developing these services were we not standing on the shoulders of giants. All of the services we provide or build on are available as open source software.

Our language of choice is [Python][11], which enables us to express our ideas in code succinctly and in a way that is both readable and maintainable. Our messaging systems are built using [Twisted][12], an excellent event-driven network programming framework built using Python. [Molo][13], our web publishing platform, is built using [Django][14], and the wonderful open source [Wagtail CMS][15] is built by our friends at [Torchbox][16].

Our three-person site reliability engineering team is able to run over a thousand applications in production by relying on Mesosphere's [Marathon][17] for [Apache Mesos][18]. We have recently released [Marathon Acme][19], which enables automatic SSL/TLS certificate provisioning via [LetsEncrypt][20] for Marathon's load balancer, ensuring our services are secure.

Our engineering team is distributed, and the workflow enabled by [Git][21] allows us to develop software in a reliable fashion. For example, by using test-driven development we are able to automate our deploys. Using these open source tools and systems we've averaged 21 automated deploys a day over the course of 2016. Developing software in an open environment is easier and more effective. Our work would have been significantly more difficult had there not been such an active and vibrant community on which to build.

We are excited to be part of these developments in open source technology integration. As a mission-driven organization we are deeply committed to continue [sharing ][22][what we learn][23] and develop. If you are interested in joining our team, [apply here][24]. Our open source repositories have documented OS licenses and contributions guidelines. We welcome any community contributions. Please email us at [dev@praekelt.org][25].

--------------------------------------------------------------------------------

作者简介：

Simon de Haan - Simon de Haan is the Chief Engineer at Praekelt Foundation and has the rare talent to demystify software systems and platforms for non­​engineers. He was the team lead on Praekelt Foundation’s Vumi platform, an open source messaging platform that allows for interactive conversations over SMS, USSD, Gt​alk and other basic technologies at low cost and at population scale in the majority world. Vumi is the technology that powers various groundbreaking initiatives such as Wikipedia Text, PeaceTXT,

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/2/open-source-tools-south-africa

作者：[Simon de Haan][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/praekelt
[1]:https://opensource.com/article/17/2/open-source-tools-south-africa?rate=XZZ1Mtc79KokPszccwi_HiEkWMJyoJZghkUumJTwIiI
[2]:https://www.ted.com/talks/hans_rosling_shows_the_best_stats_you_ve_ever_seen
[3]:http://www.praekelt.org/
[4]:http://www.praekelt.org/
[5]:http://txtalert.praekeltfoundation.org/bookings/about-txtalert/
[6]:http://digitalprinciples.org/
[7]:http://digitalprinciples.org/use-open-standards-open-data-open-source-and-open-innovation/
[8]:https://github.com/praekelt/vumi
[9]:http://junebug.praekelt.org/
[10]:https://en.wikipedia.org/wiki/Unstructured_Supplementary_Service_Data
[11]:https://www.python.org/
[12]:https://en.wikipedia.org/wiki/Twisted_(software)
[13]:http://molo.readthedocs.io/
[14]:http://www.djangoproject.com/
[15]:https://wagtail.io/
[16]:https://torchbox.com/work/wagtail/
[17]:https://mesosphere.github.io/marathon/
[18]:http://mesos.apache.org/
[19]:https://github.com/praekeltfoundation/marathon-acme
[20]:https://letsencrypt.org/
[21]:http://git-scm.org/
[22]:https://medium.com/@praekeltorg
[23]:https://medium.com/@praekeltorg
[24]:http://www.praekelt.org/careers/
[25]:https://opensource.com/article/17/2/mail%20to:%20dev@praekelt.org
[26]:https://opensource.com/user/108011/feed
[27]:https://opensource.com/users/praekelt
