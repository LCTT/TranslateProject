translating---geekpi

[How to deploy multi-cloud serverless and Cloud Foundry APIs at scale][2]
============================================================

“Micro-services and APIs are products and we need to think about them that way,” says IBM’s Ken Parmelee.

![](https://1.gravatar.com/avatar/df4717dffc99e14633358825d9e4f7f2?s=45&d=http%3A%2F%2Fsuperuser.openstack.org%2Fwp-content%2Fthemes%2Fsuperuser%2Fimages%2Fsocial-icon-bracket.png&r=g)

Ken Parmelee, who leads the API gateway for IBM and Big Blue’s open source projects, has a few ideas about open-source methods for “attacking” the API and how to create micro-services and make them scale.

“Micro-services and APIs are products and we need to be thinking about them that way,” Parmelee says. “As you start to put them up people rely on them as part of their business. That’s a key aspect of what you’re doing in this space.”

![](http://superuser.openstack.org/wp-content/uploads/2017/10/Screen-Shot-2017-10-16-at-10.49.26-595x277.png)

He took the stage at the recent [Nordic APIs 2017 Platform Summit][3] and challenged a few popular notions.

“Fail fast is not really a good concept. You want to get something out there that’s fantastic on the first run. That doesn’t mean you need to take tons of time, but make it fantastic then keep evolving and improving. If it’s really bad in the beginning, people aren’t going to want to stick with you.”

He runs through IBM’s modern serverless architectures including [OpenWhisk][4], an open source partnership between IBM and Apache. The cloud-first distributed event-based programming service is result of focusing on this space for over two years; IBM is a leading contributor and it serves as the foundation of IBM cloud functions. It offers infrastructure-as-a-service, automatically scales, offers support for multiple languages and users pay only for what they actually use. Challenges were also a part of this journey, as they discovered that servers actions need securing and require ease — anonymous access, missing usage trails, fixed URL schemes etc.

Anyone can try out these serverless APIs in just 30 seconds at [https://console.bluemix.net/openwhisk/][5] “This sounds very gimmicky, but it is that easy to do…We’re combining the [work we’ve done with Cloud Foundry ][6]and released them in Bluemix under the OpenWhisk to provide security and scalability.”

“Flexibility is also hugely important for micro-services,” he says. “When you’re working in the real world with APIs, you start to have to scale across clouds.” That means from your on-premise cloud to the public cloud and “having an honest concept of how you’re going to do that is important.

![](http://superuser.openstack.org/wp-content/uploads/2017/10/Screen-Shot-2017-10-16-at-14.51.06-595x274.png)

And when thinking about the “any cloud concept” he warns that it’s not “throw it into any Docker container and it runs anywhere. That’s great but it needs to run effectively in those environments. Docker and Kubernetes help a lot, but you want to operationalize how you’re going to do it.” Think ahead on the consumption of your API – whether it’s running only internally or will expand to a public cloud and be publicly consumable – you need have that “architectural view,” he adds.

“We all hope that what we create has value and gets consumed a lot,” Parmelee says. The more successful the API, the bigger the challenge of taking it to the next level.
![](http://superuser.openstack.org/wp-content/uploads/2017/10/Screen-Shot-2017-10-16-at-15.01.00-595x299.png)
APIs are building blocks for micro-services or “inter-services.”

The future of APIs is cloud native — regardless of where you start, he says. Key factors are scalability, simplifying back-end management, cost and avoiding vendor lock-in.

You can catch his entire 23-minute talk below or on [YouTube][7].

--------------------------------------------------------------------------------

via: http://superuser.openstack.org/articles/deploy-multi-cloud-serverless-cloud-foundry-apis-scale/

作者：[Superuser ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://superuser.openstack.org/articles/author/superuser/
[1]:http://superuser.openstack.org/articles/author/superuser/
[2]:http://superuser.openstack.org/articles/deploy-multi-cloud-serverless-cloud-foundry-apis-scale/
[3]:https://nordicapis.com/events/the-2017-api-platform-summit/
[4]:https://developer.ibm.com/openwhisk/
[5]:https://console.bluemix.net/openwhisk/
[6]:https://cloudfoundry.org/the-foundry/ibm-cloud/
[7]:https://www.youtube.com/jA25Kmxr6fU
