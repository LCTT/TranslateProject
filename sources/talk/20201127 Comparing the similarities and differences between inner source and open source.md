[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Comparing the similarities and differences between inner source and open source)
[#]: via: (https://opensource.com/article/20/11/inner-source)
[#]: author: (Nithya Ruff https://opensource.com/users/nithyaruff)

Comparing the similarities and differences between inner source and open source
======
Open source principles can be applied within a company to access the
benefits of collaborative development. Here's how.
![two women kanban brainstorming and brainmapping with post-it notes on a whiteboard ][1]

Open source software (OSS) has been around since the 1990s and has thrived, quickly growing to become mainstream. It is now more well understood around the world than it has ever been before. Some refer to it as FOSS to highlight the Freedom part of open source (Free and Open Source Software). And in 2014, at OSCON, the term "inner source" was debuted, and people started talking about how to use the principles of open source, but inside of a company. It raised several questions for those unfamiliar with the term, which I hope to answer with this article. For example, what is similar about the two, what is different, the company roles involved in the two, is inner source taking the energy away from open source, etc. These are all fair questions, and as my organization practices both and is involved in both movements, I want to take some time to share insight with this audience as a developer, as a company, and as an open source enthusiast.

There are two principal elements that make open source successful. The first is that it is licensed under OSS licenses that promote and support free distribution of the source with the binaries for people to use any way they want. When GPL (General Public License) was introduced in the 1990s, it was revolutionary—no charge, source included, and no restriction on use. That helped proliferate open source projects like Linux and allowed rapid innovation.

The other particularly essential element is the way open source software grows and develops. It happens through a community of people who are most often not in the same organization or geographic location. They come together because they believe in the solution or mission of the project. Because these people came from different development cultures but needed to work on common projects, they evolved norms for working together, such as how they communicate with each other, how decisions are made, and how to review new submissions. This codification of how disparate teams work without being in the same organization is unique and powerful. This type of development is known as "collaborative development."

Not all communities are effective, but the ones who figure out how to work together often have some common elements:

  * Governance: They work out how the project will govern itself—decisions, roles, reviews, meetings, mission, budgets, organization structures, etc.

  * Communication: They figure out how to work with people across time zones, across cultures, and organizations. For example, documenting decisions on a mailing list vs. live discussions. Providing people with 24 to 48 hours to review and respond to a question or decision is another good practice established to allow people in different zones and different work situations to collaborate.

  * Common tools: Review and communication are imperative to development. Tools such as GitLab and GitHub build in collaborative practices to enable working across teams.

  * Architecture: Projects are often architected for maximum engagement into components, API (Application Programming Interface), sub-systems so that not everyone needs to know everything, or they don’t change the whole project when they make changes.




Both in response to digital challenges as well as changing customer expectations, enterprises outside of the tech vendor space, in particular, have been transforming how they build products and services as well as how they engage with their customers. And with the 2020 COVID-19 pandemic, many companies and organizations have gone virtual and fast-tracked their digital transformation plans to meet changing customer and market needs. And some accelerated their plans to capture new opportunities and support changes in how customers consumed their services. Teams that relied on physical proximity, hallway conversations, and other elements of development were faced with a need to change how they worked. Many of them realized that they could turn to the collaborative development model of open source for examples of how to work remotely and effectively.

Even before the COVID-19 pandemic, because of early digital transformation plans, companies had already begun adopting and working with open source and had realized the benefits of open innovation. The need to go faster, reduce costs, breakdown silos across the company, and reuse vs. reinvent has created a spur to do more collaborative development or open source-style community development inside the company walls.

The benefits of collaborative development can be applied in many ways:

  * Collaboration among remote and geographically distributed organizations

  * Creating a more open and collaborative culture inside a company

  * Creating communities around common interests and common problems




The traditional way companies develop software inside companies is quite different from the open source collaborative model. Because of how budgets, organization structures, and incentives work, teams work in silos, are top-driven, and have no incentive to share and collaborate across the organization. Teams often report to the same organization, resulting in low documentation of decisions and low leverage of experts across the company.

Many organizations have been experimenting with collaborative development for some time. At Comcast, for example, teams called it enterprise source. But then the term "inner source" was created by Tim O’Reilly, founder, CEO, and publisher at O’Reilly publishing in 2001. (This [interview][2] with Tim is a remarkable story of how he came to coin this term). He talks about how the modularity of code and the access to source was a huge driver for collaboration, even more than the license itself. He calls it the "Architecture of Participation." Soon after, in 2015, Danese Cooper, who was running the OSPO (Open Source Program Office) at PayPal at that time, [introduced this term][3] at OSCON. She also shared what PayPal had been doing inside the company to break down silos and to create collaboration. The [InnerSource Commons][4] non-profit foundation was also established to allow people to collaborate on their experiences, patterns, and best practices. Here is a more formal definition of inner source:

> "Inner source is an adaptation of open source practices to code that remains proprietary and can be seen only within a single organization, or a small set of collaborating organizations. Thus, inner source is a historical development drawing on the open source movement along with other trends in software."
>
> —From [_Adopting InnerSource_][5], O’Reilly Publications

The biggest similarities between open source and inner source involve the collaborative development model. Working across teams inside an organization on common source code is a culture change for a traditional enterprise. Both versions of it need sponsorship and support from the top to thrive inside an organization.

The biggest differences are what motivates one to start an inner source project over an open source project. The often-repeated wisdom of open source communities is that people get into it because they have an "itch to scratch." Often, trying to solve a technical issue is the reason that they start a new project. With inner source, there may be more of an organization-wide reason to start opening their code and collaborating with other teams. One main reason is to enable another team to work more effectively with the platform or to reduce a duplicate effort. Some organizations have chosen a default approach of opening all repositories for anyone in the company to see and use or collaborate on. One huge driver has been to stage it as an inner source project before fully open sourcing it. This allows the team to hone a good collaboration strategy and practice before open sourcing.

I like the model that PayPal used—having inner source and open source be a part of the same organization. There are shared practices, skills, and tools that can be used across the two. At Comcast, both practices live in the Open Source Program Office. The inner source team has built a guild with members of architecture, security, and leadership to develop the practice and governance of our inner source projects. You can listen to Comcast Open Source Program Manager and InnerSource leader Brittany Istenes [talk][6] to hear more about what we did with the guild and scaling inner source back from the InnerSource Commons Fall 2020 Summit.

While some people criticize the inner source movement and say that it has distracted from the open source movement, it has actually accelerated open source collaborative practices inside organizations. While most companies use open source, few were deeply engaged in communities or understood how open collaboration works. The fact that the collaborative development model can be used inside a company to do product or organizational work has led to a deeper understanding and better development practices at Comcast. I see a natural growth from this to more contributions and more engagement with open source communities as teams feel more confident in engaging through their inner source work.

No matter what you call it—inner source, enterprise source, collaborative development—more collaboration inside the company is a particularly good thing. Better development practices, documentation, onboarding, and mentoring are often direct results. If you are interested in more information, check out [innersourcecommons.org][7] for great talks from several companies practicing inner source, including Comcast. I believe that inner source is the next phase of open source development.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/inner-source

作者：[Nithya Ruff][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/nithyaruff
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/whiteboard-brainstorming-brainmapping-design-thinking-postits-kanban.png?itok=Is2Tg1Jk (Brainstorming with post-it notes on a whiteboard)
[2]: https://www.youtube.com/watch?v=2HR0D8_tKoA&t=573s
[3]: https://www.youtube.com/watch?v=r4QU1WJn9f8
[4]: https://innersourcecommons.org/
[5]: https://www.oreilly.com/library/view/adopting-innersource/9781492041863/ch01.html
[6]: https://www.youtube.com/watch?v=RenQ8B7aX84
[7]: http://innersourcecommons.org
