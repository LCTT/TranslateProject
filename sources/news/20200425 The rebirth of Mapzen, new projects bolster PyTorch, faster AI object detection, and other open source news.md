[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The rebirth of Mapzen, new projects bolster PyTorch, faster AI object detection, and other open source news)
[#]: via: (https://opensource.com/article/20/4/news-march-25)
[#]: author: (Scott Nesbitt https://opensource.com/users/scottnesbitt)

The rebirth of Mapzen, new projects bolster PyTorch, faster AI object detection, and other open source news
======
Catch up on the biggest open source headlines from the past two weeks.
![][1]

In this edition of our open source news roundup, we take a look at the rebirth of Mapzen, two new projects to bolster PyTorch, new open source object detection software, and more!

### Mapzen makes a comeback

While its technology is used by open source projects like OpenStreetMap and by firms like Foursquare, open source mapping company Mapzen couldn't sustain itself as a business.  Mapzen initially closed its doors in 2018, but it has [a new lease on life][2] with the support of the Linux Foundation.

As a project under the Urban Computing Foundation (UCF), Mapzen "encompasses six independent projects and communities involved in developing a truly open platform for mapping, search, navigation and transit data." Being under the UCF's umbrella enables Mapzen's developers to "collaborate on and build a common set of open-source tools connecting cities, autonomous vehicles, and smart infrastructure." They can also tap such UCF members as Google, IBM, and the University of California San Diego for support. Mapzen projects are available under their [GitHub organization][3].

### New open source projects to bolster PyTorch

PyTorch, the open source machine learning framework originating out of Facebook, has been getting a lot of love lately from both its creator and from AWS. The two firms have [released open source projects to bolster PyTorch][4].

Facebook is sharing TorchServe, "a model-serving framework for PyTorch that will make it easier for developers to put their models into production." AWS's contribution is TorchElastic, "a library that makes it easier for developers to build fault-tolerant training jobs on Kubernetes clusters." PyTorch's product manager Joe Spisak [told VentureBeat][5] that by using the two projects developers can run "training over a number of nodes without the training job actually failing; it will just continue gracefully, and once those nodes come back online, it can basically restart the training."

You can find the code for [TorchServe][6] and [TorchElastic][7] on GitHub.

### Microsoft and Huazhong University release object detection AI

One of the more difficult tasks facing artificial intelligence systems is to accurately detect and identify objects in photos and videos. Researchers from Microsoft and China's Huazhong University have [released an open source tool][8] that does the job quickly and efficiently.

Called Fair Multi-Object Tracking (FairMOT for short), the tool "outperforms state-of-the-art models on public data sets at 30 frames per second" (almost normal video speed). It took researches about 30 hours to train the software using data from the MOT Challenge, which is "a framework for validating people-tracking algorithms." The team behind FairMOT believe that the tool can be used in "industries ranging from elder care to security, and perhaps be used to track the spread of illnesses like COVID-19."

You can view the source code and training models for FairMOT in [this GitHub repository][9].

#### In other news

  * [Will a small open-source effort from Japan disrupt the autonomous space?][10]
  * [Google open-sources data set to train and benchmark AI sound separation models][11]
  * [Docker builds open source community around Compose Specification][12]
  * [Sophos Sandboxie is now available as an open-source tool][13]
  * [PyCon has moved to an online-only event and is available now][14]



Thanks, as always, to Opensource.com staff members and [Correspondents][15] for their help this week.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/news-march-25

作者：[Scott Nesbitt][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/weekly_news_roundup_tv.png?itok=tibLvjBd
[2]: https://www.zdnet.com/article/mapzen-open-source-mapping-project-revived-under-the-urban-computing-foundation/
[3]: https://github.com/mapzen/
[4]: https://techcrunch.com/2020/04/21/aws-and-facebook-launch-an-open-source-model-server-for-pytorch/
[5]: https://venturebeat.com/2020/04/21/facebook-partners-with-aws-on-pytorch-1-5-upgrades-like-torchserve-for-model-serving/
[6]: https://github.com/pytorch/serve
[7]: https://github.com/pytorch/elastic
[8]: https://venturebeat.com/2020/04/08/researchers-open-source-state-of-the-art-object-tracking-ai/
[9]: https://github.com/ifzhang/FairMOT
[10]: https://www.forbes.com/sites/rahulrazdan/2020/04/04/will-a-small-open-source-effort-from-japan-disrupt-the--autonomous-space-/#6e6819f01cc5
[11]: https://venturebeat.com/2020/04/09/google-open-sources-data-set-to-train-and-benchmark-ai-sound-separation-models/
[12]: https://sdtimes.com/softwaredev/docker-builds-open-source-community-around-compose-specification/
[13]: https://securityaffairs.co/wordpress/101397/malware/sandboxie-sandbox-open-source.html
[14]: https://us.pycon.org/2020/online/
[15]: https://opensource.com/correspondent-program
